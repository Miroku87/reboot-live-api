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
		$where  = $extra_where;
		$params = $extra_param;
		$order  = "";
		
		if( isset( $search ) && $search != "" )
		{
			$params[":search"] = "%$search%";
			$where[] = "(
						bj.nome_personaggio LIKE :search OR 
						bj.cognome_personaggio LIKE :search OR
						bj.lista_classi LIKE :search OR
						bj.lista_abilita LIKE :search OR
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

		$big_join = " SELECT pg.*, gi.*, cl.*, ab.* FROM personaggi AS pg
                            LEFT OUTER JOIN
                        giocatori AS gi ON gi.codice_fiscale_giocatore = pg.giocatori_codice_fiscale_giocatore
                            LEFT OUTER JOIN
                        personaggi_has_classi AS phc ON phc.personaggi_id_personaggio = pg.id_personaggio
                            LEFT OUTER JOIN
                        personaggi_has_abilita AS pha ON pha.personaggi_id_personaggio = pg.id_personaggio
                            LEFT OUTER JOIN
                        abilita AS ab ON ab.id_abilita = pha.abilita_id_abilita
                            LEFT OUTER JOIN
                        classi AS cl ON cl.id_classe = phc.classi_id_classe";
		
		$where_str = count( $where ) > 0 ? "WHERE ".implode( $where, " AND ") : "";
		$query     = "SELECT * FROM ( $big_join ) AS bj $where_str $order";
		
		$result = $this->db->doQuery( $query, $params, False );
		$arr    = array();
		$total  = 0;
		
		if( count( $result ) > 0 )
		{
            foreach( $result as $r )
            {
                foreach( $r as $k => $v )
                {
                    if( strpos( $k, "classe" ) != False )
                        $arr[ "id".$r["id_personaggio"] ]["classi"][ "id".$r["id_classe"] ][$k] = $v;
                    else if ( strpos( $k, "abilita" ) != False )
                        $arr[ "id".$r["id_personaggio"] ]["abilita"][ "id".$r["id_abilita"] ][$k] = $v;
                    else
                        $arr[ "id".$r["id_personaggio"] ][$k] = $v;
    ***REMOVED***
***REMOVED***

            $arr = array_values($arr);
            $total = count($arr);
			array_splice( $arr, $current, $row_count );

            for( $i = 0; $i < count($arr); $i++ )
            {
                $arr[$i]["classi"]  = array_values($arr[$i]["classi"]);
                $arr[$i]["abilita"] = array_values($arr[$i]["abilita"]);
***REMOVED***
		}
		
		return "{\"current\": $current, \"rowCount\": $row_count, \"total\": $total, \"rows\":".json_encode( $arr )."}";
	}
	
	//GET query: current=1&rowCount=10&sort[sender]=asc&searchPhrase=
	public function mostraMieiPersonaggi( $current = 1, $row_count = 10, $sort = NULL, $search = NULL )
	{
		if( !isset( $this->session->permessi_giocatore ) || !in_array( __FUNCTION__, $this->session->permessi_giocatore ) )
			throw new Exception( "Non hai i permessi per compiere questa operazione." );
		
		$where  = array( "bj.codice_fiscale_giocatore = :userid" );
		$params = array( ":userid" => $this->session->codice_fiscale_giocatore );
		
		return $this->recuperaPersonaggi( $current, $row_count, $sort, $search, $where, $params );
	}
	
	//GET query: current=1&rowCount=10&sort[sender]=asc&searchPhrase=
	public function mostraTuttiPersonaggi( $current = 1, $row_count = 10, $sort = NULL, $search = NULL )
	{
		if( !isset( $this->session->permessi_giocatore ) || !in_array( __FUNCTION__, $this->session->permessi_giocatore ) )
			throw new Exception( "Non hai i permessi per compiere questa operazione." );
		
		return $this->recuperaPersonaggi( $current, $row_count, $sort, $search );
	}
	
	public function recuperaInfoClassi( )
	{
        $params = array();

		$query_classi = "SELECT * FROM classi";
		$res_classi   = $this->db->doQuery( $query_classi, $params, False );
        $lista_classi = array();

        foreach( $res_classi as $l )
            $lista_classi[ $l["tipo_classe"] ][] = $l;

		$query_abilita = "SELECT * FROM abilita";
		$res_abilita   = $this->db->doQuery( $query_abilita, $params, False );
        $lista_abilita = array();

		foreach( $res_abilita as $l )
		{
		    $l["id_classe"] = $l["classi_id_classe"];
		    unset( $l["classi_id_classe"] );
            $lista_abilita[$l["id_classe"]][] = $l;
***REMOVED***

		$info_obj = "{\"classi\":".json_encode($lista_classi).", \"abilita\":".json_encode($lista_abilita)."}";
		
		return "{\"status\": \"ok\", \"info\": ".html_entity_decode( $info_obj )."}";
	}
	
	public function creaPG( $nome, $classi, $abilita )
	{
		global $PX_INIZIALI;
		global $PC_INIZIALI;

		if( !isset( $this->session->permessi_giocatore ) || !in_array( __FUNCTION__, $this->session->permessi_giocatore ) )
			throw new Exception( "Non hai i permessi per compiere questa operazione." );

        //Riordino classi e abilita in base alla presenza di prerequisiti. In questo modo ci pensera' il DB a dare errore se i
        //prerequisiti non coincidono
        usort( $classi, "Utils::ordinaArrayPerPrerequisito" );
        usort( $abilita, "Utils::ordinaArrayPerPrerequisito" );

        $classi_id  = array_map( "Utils::mappaId", $classi );
        $abilita_id = array_map( "Utils::mappaId", $abilita );

		$new_pg_query  = "INSERT INTO personaggi (nome_personaggio, px_personaggio, pc_personaggio, giocatori_codice_fiscale_giocatore) VALUES ( :nomepg, :initpx, :initpc, :cf )";
		$new_pg_params = array( 
			":nomepg"    => $nome,
			":initpx"    => $PX_INIZIALI,
			":initpc"    => $PC_INIZIALI,
			":cf"        => $this->session->codice_fiscale_giocatore
		);
		
		$new_pg_id = $this->db->doQuery( $new_pg_query, $new_pg_params );
		
		$this->aggiungiClassiAlPG( $new_pg_id, $classi_id );
		$this->aggiungiAbilitaAlPG( $new_pg_id, $abilita_id );
		
		//$this->mailer->sendMail( "creazionePG", $mail, $nome, $pass  );
		
		return "{\"status\": \"ok\",\"result\": \"true\"}";
	}
	
	public function aggiungiClassiAlPG( $pgid, $class_ids )
	{
		if( !isset( $this->session->permessi_giocatore ) || !in_array( __FUNCTION__, $this->session->permessi_giocatore ) )
			throw new Exception( "Non hai i permessi per compiere questa operazione." );
		
		$classi_query  = "INSERT INTO personaggi_has_classi VALUES ( :idpg, :idclasse )";
		$classi_params = array();
		
		foreach( $class_ids as $ci )
			$classi_params[] = array( ":idpg" => $pgid, ":idclasse" => $ci );
		
		$this->db->doMultipleInserts( $classi_query, $classi_params );
		
		return "{\"status\": \"ok\",\"result\": \"true\"}";
	}
	
	public function aggiungiAbilitaAlPG( $pgid, $ab_ids )
	{
		if( !isset( $this->session->permessi_giocatore ) || !in_array( __FUNCTION__, $this->session->permessi_giocatore ) )
			throw new Exception( "Non hai i permessi per compiere questa operazione." );
		
		$abilita_query  = "INSERT INTO personaggi_has_abilita VALUES ( :idpg, :idabilita )";
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