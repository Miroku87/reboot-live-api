<?php
$path = $_SERVER['DOCUMENT_ROOT']."/reboot-live-api/";
include_once($path."classes/DatabaseBridge.class.php");
include_once($path."classes/Mailer.class.php");
include_once($path."classes/SessionManager.class.php");
include_once($path."classes/Utils.class.php");
include_once($path."config/constants.php");

class CharactersManager
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
        return "[CharactersManager]";
    }
	
	private function recuperaPersonaggi( $current = 1, $row_count = 10, $sort = NULL, $search = NULL, $extra_where = array(), $extra_param = array() )
	{
		global $VEDI_TUTTI_PG;
		
		$where  = $extra_where;
		$params = $extra_param;
		
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
		
		$result = $this->db->doQuery( $query, $params, False );
		
		$arr = array();
		
		if( count( $result ) > 0 )
		{
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
		}
		
		return "{\"current\": $current, \"rowCount\": $row_count, \"total\": ".count($result).", \"rows\":".json_encode( $arr )."}";
	}
	
	/**
	 * GET query: current=1&rowCount=10&sort[sender]=asc&searchPhrase=
	 */
	public function mostraMieiPersonaggi( $current = 1, $row_count = 10, $sort = NULL, $search = NULL )
	{
		if( !isset( $this->session->permessi_giocatore ) || !in_array( __FUNCTION__, $this->session->permessi_giocatore ) )
			throw new Exception( "Non hai i permessi per compiere questa operazione." );
		
		$where  = array( "bj.codice_fiscale_giocatore = :userid" );
		$params = array( ":userid" => $this->session->codice_fiscale_giocatore );
		
		return $this->recuperaPersonaggi( $current, $row_count, $sort, $search, $where, $params );
	}
	
	/**
	 * GET query: current=1&rowCount=10&sort[sender]=asc&searchPhrase=
	 */
	public function mostraTuttiPersonaggi( $current = 1, $row_count = 10, $sort = NULL, $search = NULL )
	{
		if( !isset( $this->session->permessi_giocatore ) || !in_array( __FUNCTION__, $this->session->permessi_giocatore ) )
			throw new Exception( "Non hai i permessi per compiere questa operazione." );
		
		return $this->recuperaPersonaggi( $current, $row_count, $sort, $search );
	}
	
	public function creaPG( $cf, $nome, $cognome, $classi_civili_id, $abilita_civili_id, $classi_militari_id, $abilita_militari_id )
	{
		global $PX_INIZIALI;
		global $PC_INIZIALI;
		
		if( !isset( $this->session->permessi_giocatore ) || !in_array( __FUNCTION__, $this->session->permessi_giocatore ) )
			throw new Exception( "Non hai i permessi per compiere questa operazione." );
		
		$new_pg_query  = "INSERT INTO personaggi VALUES ( :idpg, :nomepg, :cognomepg, :bg, :initpx, :initpc, :note, :cf )";
		$new_pg_params = array( 
			":idpg"      => NULL,
			":nomepg"    => $nome,
			":cognomepg" => $cognome,
			":bg"        => NULL,
			":initpx"    => $PX_INIZIALI,
			":initpc"    => $PC_INIZIALI,
			":note"      => NULL,
			":cf"        => $cf
		);
		
		$new_pg_id = $this->db->doQuery( $new_pg_query, $new_pg_params );
		
		// CLASSI E ABILITA CIVILI
		$this->aggiungiClassi( $new_pg_id, "civili", $classi_civili_id );
		$this->aggiungiAbilita( $new_pg_id, "civili", $abilita_civili_id );
		
		// CLASSI E ABILITA MILITARI
		$this->aggiungiClassi( $new_pg_id, "militari", $classi_militari_id );
		$this->aggiungiAbilita( $new_pg_id, "militari", $abilita_militari_id );
		
		//$this->mailer->sendMail( "creazionePG", $mail, $nome, $pass  );
		
		return "{\"status\": \"ok\",\"result\": \"true\"}";
	}
	
	public function aggiungiClassi( $pgid, $tipo, $class_ids )
	{
		if( !isset( $this->session->permessi_giocatore ) || !in_array( __FUNCTION__, $this->session->permessi_giocatore ) )
			throw new Exception( "Non hai i permessi per compiere questa operazione." );
		
		$classi_query  = "INSERT INTO personaggi_has_classi_$tipo VALUES ( :idpg, :idclasse )";
		$classi_params = array();
		
		foreach( $class_ids as $ci )
			$classi_params[] = array( ":idpg" => $pgid, ":idclasse" => $ci );
		
		$this->db->doMultipleInserts( $classi_query, $classi_params );
		
		return "{\"status\": \"ok\",\"result\": \"true\"}";
	}
	
	public function aggiungiAbilita( $pgid, $tipo, $ab_ids )
	{
		if( !isset( $this->session->permessi_giocatore ) || !in_array( __FUNCTION__, $this->session->permessi_giocatore ) )
			throw new Exception( "Non hai i permessi per compiere questa operazione." );
		
		$abilita_query  = "INSERT INTO personaggi_has_abilita_$tipo VALUES ( :idpg, :idabilita )";
		$abilita_params = array();
		
		foreach( $ab_ids as $ai )
			$abilita_params[] = array( ":idpg" => $pgid, ":idabilita" => $ai );
		
		$this->db->doMultipleInserts( $abilita_query, $abilita_params );
		
		return "{\"status\": \"ok\",\"result\": \"true\"}";
	}
	
	public function modificaPG( $pgid, $modifiche )
	{
		foreach( $modifiche as $campo => $valore )
		{
			if( !isset( $this->session->permessi_giocatore ) || !in_array( __FUNCTION__.$campo, $this->session->permessi_giocatore ) )
				throw new Exception( "Non hai i permessi per compiere questa operazione: <code>".(__FUNCTION__.$campo)."</code>" );
		}
	}
	
	public function eliminaPG( $pgid )
	{
		
	}
}
?>