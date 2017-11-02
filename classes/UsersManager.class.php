<?php
$path = $_SERVER['DOCUMENT_ROOT']."/reboot-live-api";
include_once($path."/classes/DatabaseBridge.class.php");
include_once($path."/classes/GrantsManager.class.php");
include_once($path."/classes/Utils.class.php");
include_once($path."/config/constants.php");

class UsersManager
{
	protected $db;
	protected $grants;
	
	public function __construct()
	{
		$this->db = new DatabaseBridge();
		$this->grants = new GrantsManager();
	}
	
	public function __destruct()
	{
	}
	
	public function __toString()
    {
        return "[UsersManager]";
    }
	
	private function errorJSON( $msg )
	{
		return "{\"status\":\"error\", \"message\":\"".$msg."\"}";
	}
	
	/**
	current=1&rowCount=10&sort[sender]=asc&searchPhrase=
	*/
	public function mostraPersonaggi( $userid, $pass, $current = 1, $row_count = 10, $sort = NULL, $search = NULL )
	{
		global $VEDI_TUTTI_PG;
		
		$where       = array();
		$user_grants = $this->grants->getUserGrants( $userid, $pass );
		//return Utils::errorJSON( "Non hai i permessi per compiere questa operazione." );
		
		if( !in_array( $VEDI_TUTTI_PG, $user_grants ) )
			$where[] = "bj.codice_fiscale_giocatore = '$userid'";
		
		if( isset( $search ) && $search != "" )
			$where[] = "(
						bj.nome_personaggio LIKE '%$search%' OR 
						bj.cognome_personaggio LIKE '%$search%' OR
						bj.lista_classi_civili LIKE '%$search%' OR
						bj.lista_abilita_civili LIKE '%$search%' OR
						bj.lista_classi_militari LIKE '%$search%' OR
						bj.lista_abilita_militari LIKE '%$search%' OR
						bj.nome_giocatore LIKE '%$search%' OR
						bj.cognome_giocatore LIKE '%$search%' OR
						bj.email_giocatore LIKE '%$search%'
					  )";
		
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
			$ret = $this->db->doQuery( $query, False );
		}
		catch( Exception $e )
		{
			return Utils::errorJSON( $e->getMessage() );
		}
		
		$i   = 1;
		$arr = array();
		while( $row = $ret->fetch_assoc( ) )
		{
			if( $i >= $current && $i <= $row_count )
			{
				$row["lista_classi_civili"]    = explode( ";", $row["lista_classi_civili"] );
				$row["lista_classi_militari"]  = explode( ";", $row["lista_classi_militari"] );
				$row["lista_abilita_civili"]   = explode( ";", $row["lista_abilita_civili"] );
				$row["lista_abilita_militari"] = explode( ";", $row["lista_abilita_militari"] );
				$arr[] = $row;
			}
		
			$i++;
		}
		
		return "{\"current\": $current, \"rowCount\": $row_count, \"total\": ".$ret->num_rows.", \"rows\":".json_encode( $arr )."}";
	}
}
?>