<?php
$path = $_SERVER['DOCUMENT_ROOT']."/reboot-live-api/";
include_once($path."classes/UsersManager.class.php");
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
    
    private function registraAzione( $pgid, $azione, $tabella, $campo, $vecchio_valore, $nuovo_valore )
    {
        $vecchio = !isset($vecchio_valore) ? "NULL" : ":vecchio";
        $nuovo   = !isset($nuovo_valore) ? "NULL" : ":nuovo";
        
        $query_azione = "INSERT INTO storico_azioni ( id_personaggio_azione, giocatori_email_giocatore, tipo_azione, tabella_azione, campo_azione, valore_vecchio_azione, valore_nuovo_azione ) 
		                    VALUES ( :idpg, :email, :azione, :tabella, :campo, $vecchio, $nuovo )";
        $params       = array(
            ":idpg"    => $pgid,
            ":email"   => $this->session->email_giocatore,
            ":azione"  => $azione,
            ":tabella"  => $tabella,
            ":campo"  => $campo
        );
        
        if( isset($vecchio_valore) )
            $params[":vecchio"] = $vecchio_valore;
        
        if( isset($nuovo_valore) )
            $params[":nuovo"] = $nuovo_valore;
        
        $this->db->doQuery( $query_azione, $params, False );
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
***REMOVED***
        
        if( isset( $sort ) )
        {
            $sorting = [];
            foreach ($sort as $col => $value) {
                $sorting[] = "$col $value";
***REMOVED***
            $order = "ORDER BY ".implode( $sorting, "," );
***REMOVED***
        
        $big_join = " SELECT pg.*, gi.*, cl.*, ab.* FROM personaggi AS pg
                            LEFT OUTER JOIN
                        giocatori AS gi ON gi.email_giocatore = pg.giocatori_email_giocatore
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
        
        //echo var_dump($result);
        //die();
        
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
            //array_splice( $arr, $row_count );
            
            for( $i = 0; $i < count($arr); $i++ )
            {
                $arr[$i]["classi"]  = array_values($arr[$i]["classi"]);
                $arr[$i]["abilita"] = array_values($arr[$i]["abilita"]);
***REMOVED***
***REMOVED***
        
        return "{\"current\": $current, \"rowCount\": $row_count, \"total\": $total, \"rows\":".json_encode( $arr )."}";
    }
    
    private function controllaPossibilitaPunti( $id_classi, $id_abilita, $pg_id = NULL, $disponibilita_px = NULL, $disponibilita_pc = NULL )
    {
        global $MAPPA_COSTO_CLASSI_CIVILI;
        
        if( ( !isset( $disponibilita_px ) || !isset( $disponibilita_pc ) ) && isset( $pg_id ) )
        {
            $query_punti = "SELECT px_personaggio, pc_personaggio FROM personaggi WHERE id_personaggio = :pgid";
            $res_punti   = $this->db->doQuery( $query_punti, array( ":pgid" => $pg_id ), False );
            
            if( !isset( $disponibilita_px ) )
                $px = $res_punti[0]["px_personaggio"];
            
            if( !isset( $disponibilita_pc ) )
                $pc = $res_punti[0]["pc_personaggio"];
***REMOVED***
        else if ( isset( $disponibilita_px ) && isset( $disponibilita_pc ) )
        {
            $px = $disponibilita_px;
            $pc = $disponibilita_pc;
***REMOVED***
        
        $marker_abilita      = str_repeat("?,", count($id_abilita) - 1 )."?";
        $query_costo_abilita = "SELECT tipo_abilita, SUM(costo_abilita) AS costo FROM abilita WHERE id_abilita IN ($marker_abilita) GROUP BY tipo_abilita";
        $res_costo_abilita   = $this->db->doQuery( $query_costo_abilita, $id_abilita, False);
        
        $marker_classi    = str_repeat("?,", count($id_classi) - 1 )."?";
        $query_qta_classi = "SELECT tipo_classe, COUNT(id_classe) AS qta FROM classi WHERE id_classe IN ($marker_classi) GROUP BY tipo_classe";
        $res_qta_abilita  = $this->db->doQuery( $query_qta_classi, $id_classi, False);
        
        foreach ( $res_costo_abilita as $rca )
            $costo[ $rca["tipo_abilita"] ] = $rca["costo"];
        
        foreach ( $res_qta_abilita as $rca )
            $qta[ $rca["tipo_classe"] ] = $rca["qta"];
        
        for( $i = 0; $i < $qta["civile"]; $i++ )
            $costo["civile"] += $MAPPA_COSTO_CLASSI_CIVILI[$i];
        
        $costo["militare"] += $qta["militare"];
        
        if( $px < $costo["civile"] )
            throw new Exception( "Non hai abbastanza Punti Esperienza per effettuare questi acquisti." );
        
        if( $pc < $costo["militare"] )
            throw new Exception( "Non hai abbastanza Punti Combattimento per effettuare questi acquisti." );
    }
    
    private function controllaPrerequisitiPerEliminazioneAbilita( $pgid, $id_abilita, $lista_ab, $params = array() )
    {
        global $PREREQUISITO_TUTTE_ABILITA;
        global $PREREQUISITO_F_TERRA_T_SCELTO;
        global $PREREQUISITO_5_SUPPORTO_BASE;
        global $PREREQUISITO_3_CONTROLLER;
        global $PREREQUISITO_4_SPORTIVO;
        global $ID_ABILITA_F_TERRA;
        global $ID_ABILITA_T_SCELTO;
        
        $query_ab = "SELECT * FROM abilita WHERE id_abilita = :id";
        $abilita  = $this->db->doQuery( $query_ab, array( ":id" => $id_abilita ), False );
        $abilita  = $abilita[0];
        
        $ab_prereq  = array_filter( $lista_ab, "Utils::filtraAbilitaSenzaPrerequisito" );
        
        $new_params = array();
        
        if( count( $ab_prereq ) > 0 )
        {
            $qta_sportivo = count( array_filter( $lista_ab, "Utils::filtraAbilitaSportivo" ) );
            $qta_sup_base = count( array_filter( $lista_ab, "Utils::filtraAbilitaSupportoBase" ) );
            $qta_controll = count( array_filter( $lista_ab, "Utils::filtraAbilitaController" ) );
            
            foreach( $ab_prereq as $i => $ap )
            {
                if (
                    $ap["prerequisito_abilita"] === $id_abilita
                    || $ap["prerequisito_abilita"] === $PREREQUISITO_TUTTE_ABILITA && $abilita["classi_id_classe"] === $ap["classi_id_classe"]
                    || (
                        $ap["prerequisito_abilita"] === $PREREQUISITO_F_TERRA_T_SCELTO
                        && (
                            $id_abilita === $ID_ABILITA_F_TERRA
                            || $id_abilita === $ID_ABILITA_T_SCELTO
                        )
                    )
                    || $ap["prerequisito_abilita"] === $PREREQUISITO_5_SUPPORTO_BASE && $qta_sup_base < 5
                    || $ap["prerequisito_abilita"] === $PREREQUISITO_4_SPORTIVO && $qta_sportivo < 4
                    || $ap["prerequisito_abilita"] === $PREREQUISITO_3_CONTROLLER && $qta_controll < 3
                )
                {
                    $new_params[] = $ap["id_abilita"];
                    Utils::rimuoviElementoArrayMultidimensionale( $lista_ab, "id_abilita", $ap["id_abilita"] );
    ***REMOVED***
***REMOVED***
***REMOVED***
        
        if( count( $new_params ) > 0 )
        {
            foreach( $new_params as $p )
                $params = $this->controllaPrerequisitiPerEliminazioneAbilita( $pgid, $p, $lista_ab, $params );
***REMOVED***
        
        return array_merge( $new_params, $params );
    }
    
    //GET query: current=1&rowCount=10&sort[sender]=asc&searchPhrase=
    public function mostraPersonaggi( $current = 1, $row_count = 10, $sort = NULL, $search = NULL )
    {
        UsersManager::controllaLogin( $this->session );
        
        $tutti       = in_array( __FUNCTION__."_proprio", $this->session->permessi_giocatore ) && in_array( __FUNCTION__."_altri", $this->session->permessi_giocatore );
        $solo_propri = in_array( __FUNCTION__."_proprio", $this->session->permessi_giocatore ) && !in_array( __FUNCTION__."_altri", $this->session->permessi_giocatore );
        
        if( $solo_propri && !$tutti )
        {
            $where  = array( "bj.email_giocatore = :userid" );
            $params = array( ":userid" => $this->session->email_giocatore );
            $result = $this->recuperaPersonaggi( $current, $row_count, $sort, $search, $where, $params );
***REMOVED***
        else if ( $tutti && !$solo_propri )
            $result = $this->recuperaPersonaggi( $current, $row_count, $sort, $search );
        else
            throw new Exception( "Non hai i permessi per compiere questa operazione: <code>".__FUNCTION__."</code>" );
        
        
        return $result;
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
        global $DB_ERR_DELIMITATORE;
        
        UsersManager::operazionePossibile( $this->session, __FUNCTION__ );
        
        $this->controllaPossibilitaPunti( $classi, $abilita, NULL, $PX_INIZIALI, $PC_INIZIALI );
        
        $new_pg_query  = "INSERT INTO personaggi (nome_personaggio, px_personaggio, pc_personaggio, giocatori_email_giocatore) VALUES ( :nomepg, :initpx, :initpc, :email )";
        $new_pg_params = array(
            ":nomepg"    => $nome,
            ":initpx"    => $PX_INIZIALI,
            ":initpc"    => $PC_INIZIALI,
            ":email"     => $this->session->email_giocatore
        );
        
        $new_pg_id = $this->db->doQuery( $new_pg_query, $new_pg_params );
        
        try {
            $this->aggiungiClassiAlPG($new_pg_id, $classi);
            $this->aggiungiAbilitaAlPG($new_pg_id, $abilita);
***REMOVED***
        catch( Exception $e )
        {
            $this->eliminaPG( $new_pg_id, False );
            
            $err_mex = explode( $DB_ERR_DELIMITATORE, $e->getMessage() );
            throw new Exception( $err_mex[1] );
***REMOVED***
        //$this->mailer->sendMail( "creazionePG", $mail, $nome, $pass  );
        
        return "{\"status\": \"ok\",\"result\": \"true\"}";
    }
    
    public function aggiungiClassiAlPG( $pgid, $class_ids )
    {
        UsersManager::operazionePossibile( $this->session, __FUNCTION__, $pgid );
        
        $classi_query  = "INSERT INTO personaggi_has_classi VALUES ( :idpg, :idclasse )";
        $classi_params = array();
        
        foreach( $class_ids as $ci )
            $classi_params[] = array( ":idpg" => $pgid, ":idclasse" => $ci );
        
        $this->db->doMultipleInserts( $classi_query, $classi_params );
        
        return "{\"status\": \"ok\",\"result\": \"true\"}";
    }
    
    public function aggiungiAbilitaAlPG( $pgid, $ab_ids )
    {
        UsersManager::operazionePossibile( $this->session, __FUNCTION__, $pgid );
        
        $marcatori     = str_repeat("?,", count( $ab_ids ) - 1 )."?";
        $query_prereq  = "SELECT * FROM (
                            SELECT 1 AS rank, id_abilita, prerequisito_abilita FROM abilita WHERE id_abilita IN ( $marcatori ) AND prerequisito_abilita IS NULL
                             UNION ALL
                            SELECT 2 AS rank, id_abilita, prerequisito_abilita FROM abilita WHERE id_abilita IN ( $marcatori ) AND prerequisito_abilita > 0
                             UNION ALL
                            SELECT 3 AS rank, id_abilita, prerequisito_abilita FROM abilita WHERE id_abilita IN ( $marcatori ) AND prerequisito_abilita < 0
                          ) AS ab GROUP BY rank, prerequisito_abilita, id_abilita";
        $ordine_ab     = $this->db->doQuery( $query_prereq, array_merge($ab_ids, $ab_ids, $ab_ids), False );
        
        $abilita_query  = "INSERT INTO personaggi_has_abilita VALUES ( :idpg, :idabilita )";
        $abilita_params = array();
        
        foreach( $ordine_ab as $ab )
            $abilita_params[] = array( ":idpg" => $pgid, ":idabilita" => $ab["id_abilita"] );
        
        $this->db->doMultipleInserts( $abilita_query, $abilita_params );
        
        return "{\"status\": \"ok\",\"result\": \"true\"}";
    }
    
    public function rimuoviClassePG( $pgid, $id_classe )
    {
        UsersManager::operazionePossibile( $this->session, __FUNCTION__, $pgid );
        
        $query_info = "SELECT cl.id_classe, cl.nome_classe, cl.prerequisito_classe FROM personaggi_has_classi AS phc
						JOIN classi AS cl ON phc.abilita_id_abilita = cl.id_classe
						WHERE phc.personaggi_id_personaggio = :pgid AND phc.classi_id_classe != :id";
        $lista_cl   = $this->db->doQuery( $query_info, array( ":pgid" => $pgid, ":id" => $id_classe ), False );
        
        $params  = array( $pgid, $id_classe );
        $cl_prereq  = array_filter( $lista_cl, "Utils::filtraClasseSenzaPrerequisito" );
        
        if( count( $cl_prereq ) > 0 )
        {
            foreach ( $cl_prereq as $cp )
            {
                if ( $cp["prerequisito_classe"] === $id_classe )
                    $params[] = $cp["id_classe"];
***REMOVED***
***REMOVED***
        
        $marcatori = str_repeat("?,", count($params) - 2 )."?";
        $query_del = "DELETE FROM personaggi_has_classi WHERE personaggi_id_personaggio = ? AND classi_id_classe IN ($marcatori)";
        $this->db->doQuery( $query_del, $params, False );
        
        $query_del_ab = "DELETE personaggi_has_abilita FROM personaggi_has_abilita AS pha
                          JOIN abilita AS ab ON pha.abilita_id_abilita = ab.id_abilita
                          WHERE pha.personaggi_id_personaggio = ? AND ab.classi_id_classe IN ($marcatori)";
        $this->db->doQuery( $query_del_ab, $params, False );
        
        return "{\"status\": \"ok\",\"result\": \"true\"}";
    }
    
    public function rimuoviAbilitaPG( $pgid, $id_abilita )
    {
        UsersManager::operazionePossibile( $this->session, __FUNCTION__, $pgid );
        
        $query_info = "SELECT ab.id_abilita, ab.nome_abilita, ab.classi_id_classe, ab.prerequisito_abilita FROM personaggi_has_abilita AS pha
						JOIN abilita AS ab ON pha.abilita_id_abilita = ab.id_abilita
						WHERE pha.personaggi_id_personaggio = :pgid AND pha.abilita_id_abilita != :id";
        $lista_ab   = $this->db->doQuery( $query_info, array( ":pgid" => $pgid, ":id" => $id_abilita ), False );
        
        $params = $this->controllaPrerequisitiPerEliminazioneAbilita( $pgid, $id_abilita, $lista_ab );
        $params = array_merge( array( $pgid, $id_abilita ), $params );
        
        var_dump($params);
        die();
        
        $marcatori = str_repeat("?,", count($params) - 2 )."?";
        $query_del = "DELETE FROM personaggi_has_abilita WHERE personaggi_id_personaggio = ? AND abilita_id_abilita IN ($marcatori)";
        $this->db->doQuery( $query_del, $params, False );
        
        return "{\"status\": \"ok\",\"result\": \"true\"}";
    }
    
    public function acquista( $pgid, $classi, $abilita )
    {
        global $DB_ERR_DELIMITATORE;
        
        try {
            if( is_array($classi) ) $this->aggiungiClassiAlPG($pgid, $classi);
            if( is_array($abilita) ) $this->aggiungiAbilitaAlPG($pgid, $abilita);
***REMOVED***
        catch( Exception $e )
        {
            $err_mex = explode( $DB_ERR_DELIMITATORE, $e->getMessage() );
            
            if( count($err_mex) > 1 )
                $err_mex = $err_mex[1];
            else
                $err_mex = $err_mex[0];
            
            throw new Exception( $err_mex );
***REMOVED***
        //$this->mailer->sendMail( "acquisti", $mail, $nome, $pass  );
        
        return "{\"status\": \"ok\",\"result\": \"true\"}";
    }
    
    public function aggiungiPC( $pgid, $qta )
    {
        UsersManager::operazionePossibile( $this->session, __FUNCTION__, $pgid );
        
        $query_pc = "UPDATE personaggi SET pc_personaggio = pc_personaggio + :qta WHERE id_personaggio = :pgid";
        $this->db->doQuery( $query_pc, array( ":pgid" => $pgid, ":qta" => $qta ), False );
        
        return "{\"status\": \"ok\",\"result\": \"true\"}";
    }
    
    public function aggiungiPX( $pgid, $qta )
    {
        UsersManager::operazionePossibile( $this->session, __FUNCTION__, $pgid );
        
        $query_px = "UPDATE personaggi SET px_personaggio = px_personaggio + :qta WHERE id_personaggio = :pgid";
        $this->db->doQuery( $query_px, array( ":pgid" => $pgid, ":qta" => $qta ), False );
        
        return "{\"status\": \"ok\",\"result\": \"true\"}";
    }
    
    public function modificaPG( $pgid, $modifiche )
    {
        foreach( $modifiche as $campo => $valore )
        {
            UsersManager::operazionePossibile( $this->session, __FUNCTION__."_".$campo, $pgid );
            
            $campi[] = $campo;
            $valori[] = $valore;
***REMOVED***
        $campi_virgola = implode(", ", $campi);
        
        $query_vecchi_dati = "SELECT $campi_virgola FROM personaggi WHERE id_personaggio = :pgid";
        $vecchi_dati = $this->db->doQuery( $query_vecchi_dati, array( ":pgid" => $pgid ), False );
        
        $to_update = implode(" = ?, ", $campi )." = ?";
        $valori[] = $pgid;
        $query_bg = "UPDATE personaggi SET $to_update WHERE id_personaggio = ?";
        $this->db->doQuery( $query_bg, $valori, False );
        
        foreach( $vecchi_dati as $vd )
            foreach( $vd as $k => $val )
                $this->registraAzione( $pgid, 'UPDATE', 'personaggi', $k, $val, $modifiche[$k] );
        
        return "{\"status\": \"ok\",\"result\": \"true\"}";
    }
    
    public function eliminaPG( $pgid, $controlla_permessi = True )
    {
        if( $controlla_permessi )
            UsersManager::operazionePossibile( $this->session, __FUNCTION__, $pgid );
        
        $query_canc_pg = "DELETE FROM personaggi WHERE id_personaggio = :idpg";
        $this->db->doQuery( $query_canc_pg, array( ":idpg" => $pgid ), False );
        
        return "{\"status\": \"ok\",\"result\": \"true\"}";
    }
    
    public function loginPG( $pgid )
    {
        global $MAPPA_COSTO_CLASSI_CIVILI;
        global $ABILITA_CRAFTING;
        
        UsersManager::operazionePossibile( $this->session, __FUNCTION__, $pgid );
        
        $query_pg = "SELECT pg.id_personaggio, 
                            pg.nome_personaggio, 
                            pg.background_personaggio, 
                            pg.px_personaggio, 
                            pg.pc_personaggio, 
                            pg.credito_personaggio, 
                            pg.data_creazione_personaggio, 
                            pg.note_master_personaggio, 
                            pg.giocatori_email_giocatore,
                            gi.nome_giocatore 
                    FROM personaggi AS pg
                    JOIN giocatori AS gi ON pg.giocatori_email_giocatore = gi.email_giocatore 
                    WHERE id_personaggio = :idpg";
        $res_pg   = $this->db->doQuery( $query_pg, array( ":idpg" => $pgid ), False );
        
        if( count( $res_pg ) == 0 )
            throw new Exception( "Non puoi scaricare i dati di un giocatore non tuo." );
        
        $pg_data  = $res_pg[0];
        
        $query_classi  = "SELECT cl.* FROM classi AS cl WHERE id_classe IN ( SELECT classi_id_classe FROM personaggi_has_classi WHERE personaggi_id_personaggio = :idpg )";
        $res_classi    = $this->db->doQuery( $query_classi, array( ":idpg" => $pgid ), False );
        
        $query_abilita = "SELECT ab.id_abilita, ab.costo_abilita, ab.nome_abilita, ab.prerequisito_abilita, ab.tipo_abilita, ab.distanza_abilita, ab.classi_id_classe, cl.nome_classe 
                            FROM abilita AS ab 
                              JOIN classi AS cl ON ab.classi_id_classe = cl.id_classe 
                            WHERE id_abilita IN 
                            ( SELECT abilita_id_abilita FROM personaggi_has_abilita WHERE personaggi_id_personaggio = :idpg )";
        $res_abilita   = $this->db->doQuery( $query_abilita, array( ":idpg" => $pgid ), False );
        
        $classi  = array( "civile" => array(), "militare" => array() );
        $abilita = array( "civile" => array(), "militare" => array() );
        
        foreach( $res_classi as $cl )
            $classi[$cl["tipo_classe"]][] = $cl;
        
        $crafting_chimico = False;
        $crafting_programmazione = False;
        $crafting_ingegneria = False;
        
        foreach( $res_abilita as $ab )
        {
            $abilita[ $ab["tipo_abilita"] ][] = $ab;
            
            if( $ab["id_abilita"] === $ABILITA_CRAFTING["chimico"] )
                $crafting_chimico = True;
            
            if( $ab["id_abilita"] === $ABILITA_CRAFTING["programmazione"] )
                $crafting_programmazione = True;
            
            if( in_array( $ab["id_abilita"], $ABILITA_CRAFTING["ingegneria"] ) )
                $crafting_ingegneria = True;
***REMOVED***
        
        $px_spesi = 0;
        $pc_spesi = count( $classi["militare"] ) + count( $abilita["militare"] );
        
        for( $i = 0; $i < count( $classi["civile"] ); $i++ )
            $px_spesi += $MAPPA_COSTO_CLASSI_CIVILI[$i];
        
        foreach( $abilita["civile"] as $ac )
            $px_spesi += $ac["costo_abilita"];
        
        $px_risparmiati = $pg_data["px_personaggio"] - $px_spesi;
        $pc_risparmiati = $pg_data["pc_personaggio"] - $pc_spesi;
        
        $pg_data["classi"] = $classi;
        $pg_data["abilita"] = $abilita;
        $pg_data["px_spesi"] = $px_spesi;
        $pg_data["px_risparmiati"] = $px_risparmiati;
        $pg_data["pc_spesi"] = $pc_spesi;
        $pg_data["pc_risparmiati"] = $pc_risparmiati;
        $pg_data["crafting_chimico"] = $crafting_chimico;
        $pg_data["crafting_programmazione"] = $crafting_programmazione;
        $pg_data["crafting_ingegneria"] = $crafting_ingegneria;
        
        $this->session->pg_loggato = $pg_data;
        
        return "{\"status\": \"ok\",\"result\": ".json_encode($pg_data)."}";
    }
    
    public function recuperaStorico( $pgid )
    {
        UsersManager::operazionePossibile($this->session, __FUNCTION__, $pgid);
        
        $query = "SELECT gi.nome_giocatore, 
                            st.data_azione, 
                            st.tipo_azione, 
                            st.tabella_azione,
                            st.campo_azione,
                            st.valore_nuovo_azione, 
                            st.valore_vecchio_azione
                        FROM storico_azioni AS st
                        JOIN giocatori AS gi ON gi.email_giocatore = st.giocatori_email_giocatore
                    WHERE st.id_personaggio_azione = :idpg
                    ORDER BY st.data_azione DESC ";
        $result = $this->db->doQuery( $query, array( ":idpg" => $pgid ) );
        $result = isset($result) ? $result : "[]";
        
        return "{\"status\": \"ok\",\"result\": $result}";
    }
}
?>