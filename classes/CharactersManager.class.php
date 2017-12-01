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
		$order  = "";
		
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
                        CONCAT( '[', GROUP_CONCAT(DISTINCT CONCAT('{\"id_classe\":\"',cl.id_classe,'\",\"nome_classe\":\"',cl.nome_classe,'\"}') SEPARATOR ','), ']' ) AS lista_classi,
                        CONCAT( '[', GROUP_CONCAT(DISTINCT CONCAT('{\"id_abilita\":\"',ab.id_abilita,'\",\"nome_abilita\":\"',ab.nome_abilita,'\"}') SEPARATOR ','), ']' ) AS lista_abilita
                    FROM
                        personaggi AS pg
                            LEFT OUTER JOIN
                        giocatori AS gi ON gi.codice_fiscale_giocatore = pg.giocatori_codice_fiscale_giocatore
                            LEFT OUTER JOIN
                        personaggi_has_classi AS phc ON phc.personaggi_id_personaggio = pg.id_personaggio
                            LEFT OUTER JOIN
                        personaggi_has_abilita AS pha ON pha.personaggi_id_personaggio = pg.id_personaggio
                            LEFT OUTER JOIN
                        abilita AS ab ON ab.id_abilita = pha.abilita_id_abilita
                            LEFT OUTER JOIN
                        classi AS cl ON cl.id_classe = phc.classi_id_classe
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
					$v["lista_classi"]    = json_decode( $v["lista_classi"] );
					$v["lista_abilita"]   = json_decode( $v["lista_abilita"] );
					
					$arr[] = $v;
				}
			}
		}
		
		return "{\"current\": $current, \"rowCount\": $row_count, \"total\": ".count($result).", \"rows\":".json_encode( $arr )."}";
	}

    private function controllaPrerequisitiAbilitaCivili( $abilita_civili_id, $pg_id = NULL )
    {
        $punti_domanda = str_repeat('?,', count($abilita_civili_id) - 1) . '?';
        $query         = "SELECT nome_abilita_civile, prerequisito_abilita_civile, classi_civili_id_classe_civile FROM abilita_civili
                            WHERE id_abilita_civile IN ($punti_domanda)";
        $prerequisiti  = $this->db->doQuery( $query, $abilita_civili_id, False );

        if( isset( $pg_id ) )
        {
            $query             = "SELECT abilita_civili_id_abilita_civile FROM personaggi_has_abilita_civili
                                   WHERE personaggi_id_personaggio = :idpg";
            $altre_abilita_pg  = $this->db->doQuery( $query, $abilita_civili_id, False );
            $abilita_civili_id = array_merge( $abilita_civili_id, $altre_abilita_pg );
***REMOVED***

        foreach ( $prerequisiti as $p )
        {
            if( (int)$p->prerequisito_abilita_civile > 0 && !in_array( $p->prerequisito_abilita_civile, $abilita_civili_id ) )
                return $p->nome_abilita_civile;
            else if ( (int)$p->prerequisito_abilita_civile === -1 )
                echo "ciao";
            //TODO
***REMOVED***

        return true;
    }

    private function controllaPrerequisitiClassiMilitari( $classi_militari_id, $pg_id = NULL )
    {

    }

    private function controllaPrerequisitiAbilitaMilitari( $abilita_militari_id, $pg_id = NULL )
    {

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
	
	public function creaPG( $nome, $classi_civili_id, $abilita_civili_id, $classi_militari_id, $abilita_militari_id )
	{
		global $PX_INIZIALI;
		global $PC_INIZIALI;
		
		if( !isset( $this->session->permessi_giocatore ) || !in_array( __FUNCTION__, $this->session->permessi_giocatore ) )
			throw new Exception( "Non hai i permessi per compiere questa operazione." );

        $this->controllaPrerequisitiAbilitaCivili( $abilita_civili_id );
        $this->controllaPrerequisitiClassiMilitari( $classi_militari_id );
        $this->controllaPrerequisitiAbilitaMilitari( $abilita_militari_id );

		$new_pg_query  = "INSERT INTO personaggi (nome_personaggio, px_personaggio, pc_personaggio, giocatori_codice_fiscale_giocatore) VALUES ( :nomepg, :initpx, :initpc, :cf )";
		$new_pg_params = array( 
			":nomepg"    => $nome,
			":initpx"    => $PX_INIZIALI,
			":initpc"    => $PC_INIZIALI,
			":cf"        => $this->session->codice_fiscale_giocatore
		);
		
		$new_pg_id = $this->db->doQuery( $new_pg_query, $new_pg_params );
		
		// CLASSI E ABILITA CIVILI
		$this->aggiungiClassiAlPG( $new_pg_id, "civili", $classi_civili_id );
		$this->aggiungiAbilitaAlPG( $new_pg_id, "civili", $abilita_civili_id );
		
		// CLASSI E ABILITA MILITARI
		$this->aggiungiClassiAlPG( $new_pg_id, "militari", $classi_militari_id );
		$this->aggiungiAbilitaAlPG( $new_pg_id, "militari", $abilita_militari_id );
		
		//$this->mailer->sendMail( "creazionePG", $mail, $nome, $pass  );
		
		return "{\"status\": \"ok\",\"result\": \"true\"}";
	}
	
	public function aggiungiClassiAlPG( $pgid, $tipo, $class_ids )
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
	
	public function aggiungiAbilitaAlPG( $pgid, $tipo, $ab_ids )
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