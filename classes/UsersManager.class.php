<?php
$path = $_SERVER['DOCUMENT_ROOT']."/reboot-live-api/";
include_once($path."classes/DatabaseBridge.class.php");
include_once($path."classes/Mailer.class.php");
include_once($path."classes/SessionManager.class.php");
include_once($path."classes/Utils.class.php");
include_once($path."config/constants.php");

class UsersManager
{
	protected $db;
	protected $grants;
	protected $session;
	
	public function __construct()
	{
		$this->session = SessionManager::getInstance();
		$this->db      = new DatabaseBridge();
		$this->mailer  = new Mailer();
	}
	
	public function __destruct()
	{
	}
	
	public function __toString()
    {
        return "[UsersManager]";
    }
	
	public function login( $mail, $pass )
	{
		$query  = "SELECT gi.codice_fiscale_giocatore, gr.nome_grant AS permessi FROM giocatori AS gi
					JOIN ruoli_has_grants AS rhg ON gi.ruoli_id_ruolo = rhg.ruoli_id_ruolo
					JOIN reboot_live.grants AS gr ON gr.id_grant = rhg.grants_id_grant
					WHERE gi.email_giocatore = :mail AND 
					      gi.password_giocatore = :pass";
		$params = array( ":mail" => $mail, ":pass" => $pass );
		
		try 
		{
			$result = $this->db->doQuery( $query, $params, False );
		}
		catch( Exception $e )
		{
			return Utils::errorJSON( $e->getMessage() );
		}
		
		if( count( $result ) === 0 )
			return Utils::errorJSON( "Email utente o password sono errati. Per favore ritentare." );
		
		$this->session->codice_fiscale_giocatore = $result[0]["codice_fiscale_giocatore"];
		$this->session->permessi_giocatore       = array_map( "Utils::mappaPermessiUtente", $result );
		
		return "{\"status\": \"ok\", \"permessi\":".json_encode( $this->session->permessi_giocatore )."}";
	}
	
	public function registra( $cf, $nome, $cognome, $mail, $note )
	{
		$pass   = "";
		$query  = "INSERT INTO giocatori VALUES (:cf,:pass,:nome,:cognome,:mail,:note)";
		$params = array( 
			":cf"      => $cf, 
			":pass"    => $pass,
			":nome"    => $nome,
			":cognome" => $cognome,
			":mail"    => $mail,
			":note"    => $note
		);
		
		try 
		{
			$result = $this->db->doQuery( $query, $params );
		}
		catch( Exception $e )
		{
			return Utils::errorJSON( $e->getMessage() );
		}
		
		$this->mailer->sendMail( "registrazione", $mail, $nome, $pass  );
		
		return "{\"status\": \"ok\"}";
	}
	
	/**
	current=1&rowCount=10&sort[sender]=asc&searchPhrase=
	*/
	public function mostraPersonaggi( $userid, $pass, $current = 1, $row_count = 10, $sort = NULL, $search = NULL )
	{
		global $VEDI_TUTTI_PG;
		
		$where  = array();
		$params = array();
		
		if( !isset( $session->permessi_giocatore ) || !in_array( $VEDI_TUTTI_PG, $session->permessi_giocatore ) )
		{
			$params[":userid"] = $userid;
			$where[]           = "bj.codice_fiscale_giocatore = :userid";
		}
		
		if( isset( $search ) && $search != "" )
		{
			$params[":search"] = "%$search%";
			$where[] = "(
						bj.nome_personaggio LIKE :search OR 
						bj.cognome_personaggio LIKE :search OR
						bj.lista_classi_civili LIKE :search OR
						bj.lista_abilita_civili LIKE :search OR
						bj.lista_classi_militari LIKE :search OR
						bj.lista_abilita_militari LIKE :search OR
						bj.nome_giocatore LIKE :search OR
						bj.cognome_giocatore LIKE :search OR
						bj.email_giocatore LIKE :search
					  )";
		}
		
		if( isset( $sort ) )
		{
			$sorting = [];
			foreach ($sort as $col => $value) {
				$sorting[] = "$col $value";
			}			
			$order = "ORDER BY ".implode( $sorting, "," );
		}
		
		$big_join = " 
					SELECT 
						pg.*,
						gi.*,
						GROUP_CONCAT(DISTINCT cc.nome_classe_civile SEPARATOR ';') AS lista_classi_civili,
						GROUP_CONCAT(DISTINCT CONCAT(cm.nome_classe_militare,' ',cm.grado_classe_militare) SEPARATOR ';') AS lista_classi_militari,
						GROUP_CONCAT(DISTINCT ac.nome_abilita_civile SEPARATOR ';') AS lista_abilita_civili,
						GROUP_CONCAT(DISTINCT am.nome_abilita_militare SEPARATOR ';') AS lista_abilita_militari
					FROM
						personaggi AS pg
							LEFT OUTER JOIN
						giocatori AS gi ON gi.codice_fiscale_giocatore = pg.giocatori_codice_fiscale_giocatore
							LEFT OUTER JOIN
						personaggi_has_classi_civili AS phcc ON phcc.personaggi_id_personaggio = pg.id_personaggio
							LEFT OUTER JOIN
						classi_civili AS cc ON cc.id_classe_civile = phcc.classi_civili_id_classe_civile
							LEFT OUTER JOIN
						personaggi_has_abilita_civili AS phac ON phac.personaggi_id_personaggio = pg.id_personaggio
							LEFT OUTER JOIN
						abilita_civili AS ac ON ac.id_abilita_civile = phac.abilita_civili_id_abilita_civile
							LEFT OUTER JOIN
						personaggi_has_classi_militari AS phcm ON phcm.personaggi_id_personaggio = pg.id_personaggio
							LEFT OUTER JOIN
						classi_militari AS cm ON cm.id_classe_militare = phcm.classi_militari_id_classe_militare
							LEFT OUTER JOIN
						personaggi_has_abilita_militari AS pham ON pham.personaggi_id_personaggio = pg.id_personaggio
							LEFT OUTER JOIN
						abilita_militari AS am ON am.id_abilita_militare = pham.abilita_id_abilita_militare
					GROUP BY pg.id_personaggio";
		
		$where_str = count( $where ) > 0 ? "WHERE ".implode( $where, " AND ") : "";
		$query     = "SELECT * FROM ( $big_join ) AS bj $where_str $order";
		
		try 
		{
			$result = $this->db->doQuery( $query, $params, False );
		}
		catch( Exception $e )
		{
			return Utils::errorJSON( $e->getMessage() );
		}
		
		$arr = array();
		foreach( $result as $k => $v )
		{
			if( $k + 1 >= $current && $k + 1 <= $row_count )
			{
				$v["lista_classi_civili"]    = explode( ";", $v["lista_classi_civili"] );
				$v["lista_classi_militari"]  = explode( ";", $v["lista_classi_militari"] );
				$v["lista_abilita_civili"]   = explode( ";", $v["lista_abilita_civili"] );
				$v["lista_abilita_militari"] = explode( ";", $v["lista_abilita_militari"] );
				
				$arr[] = $v;
			}
		}
		
		return "{\"current\": $current, \"rowCount\": $row_count, \"total\": ".count($result).", \"rows\":".json_encode( $arr )."}";
	}
}
?>