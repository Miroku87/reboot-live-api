<?php
$path = $_SERVER['DOCUMENT_ROOT']."/reboot-live-api/src/";
include_once($path."classes/APIException.class.php");
include_once($path."classes/UsersManager.class.php");
include_once($path."classes/DatabaseBridge.class.php");
include_once($path."classes/Mailer.class.php");
include_once($path."classes/SessionManager.class.php");
include_once($path."classes/Utils.class.php");
include_once($path."config/constants.php");

class CharactersManager
{
    protected $db;
    protected $session;
    protected $mailer;
    
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
    
    private function recuperaPersonaggi( $draw, $columns, $order, $start, $length, $search, $extra_where = array(), $extra_param = array() )
    {
        $where  = $extra_where;
        $params = $extra_param;
        $filter = False;
        
        if( isset( $search ) && $search["value"] != "" )
        {
            $filter = True;
            $params[":search"] = "%$search[value]%";
            $where[] = "(
						bj.nome_personaggio LIKE :search OR
						bj.classi_civili LIKE :search OR
						bj.classi_militari LIKE :search OR
						bj.nome_giocatore LIKE :search OR
						bj.email_giocatore LIKE :search OR
						bj.ruoli_nome_ruolo LIKE :search OR
						bj.note_giocatore LIKE :search
					  )";
        }
    
        if( isset( $order ) )
        {
            $sorting = array();
            foreach ( $order as $elem )
                $sorting[] = "bj.".$columns[$elem["column"]]["data"]." ".$elem["dir"];
        
            $order_str = "ORDER BY ".implode( $sorting, "," );
        }
        
        $big_join = "SELECT
                        pg.id_personaggio,
                        pg.nome_personaggio,
                        IF( ISNULL(pg.background_personaggio), 0, 1 ) AS bg_personaggio,
                        pg.px_personaggio,
                        pg.pc_personaggio,
                        pg.credito_personaggio,
                        pg.data_creazione_personaggio,
                        pg.eliminato_personaggio,
                        pg.contattabile_personaggio,
                        gi.email_giocatore,
                        CONCAT( gi.nome_giocatore, ' ', gi.cognome_giocatore ) AS nome_giocatore,
                        gi.note_giocatore,
                        gi.eliminato_giocatore,
                        gi.ruoli_nome_ruolo,
                        GROUP_CONCAT(DISTINCT cl_c.nome_classe SEPARATOR ', ') AS classi_civili,
                        GROUP_CONCAT(DISTINCT cl_m.nome_classe SEPARATOR ', ') AS classi_militari
                    FROM personaggi AS pg
                        LEFT OUTER JOIN giocatori AS gi ON gi.email_giocatore = pg.giocatori_email_giocatore
                        LEFT OUTER JOIN personaggi_has_classi AS phc ON phc.personaggi_id_personaggio = pg.id_personaggio
                        LEFT OUTER JOIN classi AS cl_m ON cl_m.id_classe = phc.classi_id_classe AND cl_m.tipo_classe = 'militare'
                        LEFT OUTER JOIN classi AS cl_c ON cl_c.id_classe = phc.classi_id_classe AND cl_c.tipo_classe = 'civile'
                    GROUP BY pg.id_personaggio";
        
        $where_str = count( $where ) > 0 ? "AND ".implode( $where, " AND ") : "";
        $query     = "SELECT * FROM ( $big_join ) AS bj WHERE bj.eliminato_giocatore = 0 AND bj.eliminato_personaggio = 0 $where_str $order_str";
        
        $risultati = $this->db->doQuery( $query, $params, False );
        $totale    = count($risultati);
        
        if( count($risultati) > 0 )
            $risultati = array_splice($risultati, $start, $length);
        else
            $risultati = array();
    
        $output     = array(
            "status"          => "ok",
            "draw"            => $draw,
            "columns"         => $columns,
            "order"           => $order,
            "start"           => $start,
            "length"          => $length,
            "search"          => $search,
            "recordsTotal"    => $totale,
            "recordsFiltered" => $filter ? count($risultati) : $totale,
            "data"            => $risultati
        );
        
        return json_encode( $output );
    }
    
    private function controllaOpzioniDuplicate( $opzioni, $pgid = NULL )
    {
        if( isset($pgid) )
        {
            $query_opzioni = "SELECT opzioni_abilita_opzione FROM personaggi_has_opzioni_abilita WHERE personaggi_id_personaggio = :pgid";
            $opzioni_db    = $this->db->doQuery($query_opzioni, array(":pgid"=>$pgid), False);
            
            foreach( $opzioni_db as $o )
                $opzioni[] = $o["opzioni_abilita_opzione"];
        }
        
        if( count($opzioni) !== count(array_unique($opzioni)) )
            throw new APIException("Non &egrave; possibile selezionare due opzioni uguali per abilit&agrave; diverse.");
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
        }
        else if ( isset( $disponibilita_px ) && isset( $disponibilita_pc ) )
        {
            $px = $disponibilita_px;
            $pc = $disponibilita_pc;
        }
        
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
            throw new APIException( "Non hai abbastanza Punti Esperienza per effettuare questi acquisti." );
        
        if( $pc < $costo["militare"] )
            throw new APIException( "Non hai abbastanza Punti Combattimento per effettuare questi acquisti." );
    }
    
    private function controllaPrerequisitiPerEliminazioneAbilita( $pgid, $id_abilita, $lista_ab, $params = array() )
    {
        global $PREREQUISITO_TUTTE_ABILITA;
        global $PREREQUISITO_F_TERRA_T_SCELTO;
        global $PREREQUISITO_5_SUPPORTO_BASE;
        global $PREREQUISITO_3_GUASTATOR_BASE;
        global $PREREQUISITO_4_SPORTIVO;
        global $PREREQUISITO_3_ASSALTATA_BASE;
        global $PREREQUISITO_3_GUASTATOR_AVAN;
        global $ID_ABILITA_F_TERRA;
        global $ID_ABILITA_T_SCELTO;
        
		$id_abilita = (int)$id_abilita;
		
        $query_ab = "SELECT * FROM abilita WHERE id_abilita = :id";
        $abilita  = $this->db->doQuery( $query_ab, array( ":id" => $id_abilita ), False );
        $abilita  = $abilita[0];
        
        $ab_prereq  = array_filter( $lista_ab, "Utils::filtraAbilitaSenzaPrerequisito" );
		
        $new_params = array();
        
        if( count( $ab_prereq ) > 0 )
        {
			// -1 per non contare anche l'abilita che ha il prerequisito
            $qta_sportivo = count( array_filter( $lista_ab, "Utils::filtraAbilitaSportivo" ) ) - 1;
            $qta_sup_base = count( array_filter( $lista_ab, "Utils::filtraAbilitaSupportoBase" ) ) - 1;
            $qta_ass_base = count( array_filter( $lista_ab, "Utils::filtraAbilitaAssaltatoreBase" ) );
            $qta_gua_base = count( array_filter( $lista_ab, "Utils::filtraAbilitaGuastatoreBase" ) );
            $qta_gua_avan = count( array_filter( $lista_ab, "Utils::filtraAbilitaGuastatoreAvanzato" ) );
			
            foreach( $ab_prereq as $i => $ap )
            {
				$pre    = (int)$ap["prerequisito_abilita"];
				$pre_cl = (int)$ap["classi_id_classe"];
				$ab_cl  = (int)$abilita["classi_id_classe"];
				
                if (
                    $pre === $id_abilita
                    || ( $pre === $PREREQUISITO_TUTTE_ABILITA && $ab_cl === $pre_cl )
                    || (
                        $pre === $PREREQUISITO_F_TERRA_T_SCELTO
                        && (
                            $id_abilita === $ID_ABILITA_F_TERRA
                            || $id_abilita === $ID_ABILITA_T_SCELTO
                        )
                    )
                    || $pre === $PREREQUISITO_5_SUPPORTO_BASE && $qta_sup_base < 5
                    || $pre === $PREREQUISITO_4_SPORTIVO && $qta_sportivo < 4
                    || $pre === $PREREQUISITO_3_ASSALTATA_BASE && $qta_ass_base < 3
                    || $pre === $PREREQUISITO_3_GUASTATOR_BASE && $qta_gua_base < 3
                    || $pre === $PREREQUISITO_3_GUASTATOR_AVAN && $qta_gua_avan < 3
                )
                {
                    $new_params[] = $ap["id_abilita"];
                    Utils::rimuoviElementoArrayMultidimensionale( $lista_ab, "id_abilita", $ap["id_abilita"] );
                }
            }
        }
        
        if( count( $new_params ) > 0 )
        {
            foreach( $new_params as $p )
                $params = $this->controllaPrerequisitiPerEliminazioneAbilita( $pgid, $p, $lista_ab, $params );
        }
        
        return array_merge( $new_params, $params );
    }
    
    public function mostraPersonaggi(  $draw, $columns, $order, $start, $length, $search )
    {
        UsersManager::controllaLogin( $this->session );
        
        $tutti       = in_array( __FUNCTION__."_proprio", $this->session->permessi_giocatore ) && in_array( __FUNCTION__."_altri", $this->session->permessi_giocatore );
        $solo_propri = in_array( __FUNCTION__."_proprio", $this->session->permessi_giocatore ) && !in_array( __FUNCTION__."_altri", $this->session->permessi_giocatore );
        
        if( $solo_propri && !$tutti )
        {
            $where  = array( "bj.email_giocatore = :userid" );
            $params = array( ":userid" => $this->session->email_giocatore );
            $result = $this->recuperaPersonaggi( $draw, $columns, $order, $start, $length, $search, $where, $params );
        }
        else if ( $tutti && !$solo_propri )
            $result = $this->recuperaPersonaggi( $draw, $columns, $order, $start, $length, $search );
        else
            throw new APIException( "Non hai i permessi per compiere questa operazione: <code>".__FUNCTION__."</code>", APIException::$GRANTS_ERROR );
        
        
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
        
        if( count( $res_abilita ) > 0 )
        {
            foreach ($res_abilita as $l)
            {
                $l["id_classe"] = $l["classi_id_classe"];
                unset($l["classi_id_classe"]);
                $lista_abilita[$l["id_classe"]][] = $l;
            }
            $lista_output = json_encode($lista_abilita);
        }
        else
            $lista_output = "{}";
        
        $info_obj = "{\"classi\":".json_encode($lista_classi).", \"abilita\":$lista_output}";
        
        return "{\"status\": \"ok\", \"info\": $info_obj }";
    }
    
    public function creaPG( $nome, $classi, $abilita, $opzioni )
    {
        global $PX_INIZIALI;
        global $PC_INIZIALI;
        global $DB_ERR_DELIMITATORE;
        
        UsersManager::operazionePossibile( $this->session, __FUNCTION__ );
        
        $this->controllaPossibilitaPunti( $classi, $abilita, NULL, $PX_INIZIALI, $PC_INIZIALI );
        $this->controllaOpzioniDuplicate( $opzioni );
        
        $new_pg_query  = "INSERT INTO personaggi (nome_personaggio, px_personaggio, pc_personaggio, giocatori_email_giocatore) VALUES ( :nomepg, :initpx, :initpc, :email )";
        $new_pg_params = array(
            ":nomepg"    => $nome,
            ":initpx"    => $PX_INIZIALI,
            ":initpc"    => $PC_INIZIALI,
            ":email"     => $this->session->email_giocatore
        );
        
        $new_pg_id = $this->db->doQuery( $new_pg_query, $new_pg_params );
        
        if( !isset( $this->session->pg_propri ) )
            $this->session->pg_propri = [];
        
        $pg_propri   = $this->session->pg_propri;
        $pg_propri[] = $new_pg_id;
        $this->session->pg_propri = $pg_propri;
        
        $this->registraAzione( $new_pg_id, "INSERT", "personaggi", "nome", NULL, $nome );
        $this->registraAzione( $new_pg_id, "INSERT", "personaggi", "PX", NULL, $PX_INIZIALI );
        $this->registraAzione( $new_pg_id, "INSERT", "personaggi", "PC", NULL, $PC_INIZIALI );
        $this->registraAzione( $new_pg_id, "INSERT", "personaggi", "email", NULL, $this->session->email_giocatore );
        
        try {
            $this->aggiungiClassiAlPG($new_pg_id, $classi);
            $this->aggiungiAbilitaAlPG($new_pg_id, $abilita);
            $this->aggiungiOpzioniAbilita($new_pg_id, $opzioni);
        }
        catch( Exception $e )
        {
            $this->eliminaPG( $new_pg_id, False );
            $pg_propri   = $this->session->pg_propri;
            array_splice($pg_propri, count( $pg_propri ) - 1, 1);
            $this->session->pg_propri = $pg_propri;
            
            $err_mex = explode( $DB_ERR_DELIMITATORE, $e->getMessage() );
            $err_mex = count( $err_mex ) > 1 ? $err_mex[1] : $err_mex[0];
            throw new APIException( $err_mex );
        }
        
//        $this->mailer->inviaMailRegistrazione( $mail, $nome, $pass  );
        
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
    
		$marcatori  = str_repeat("?, ", count($class_ids)-1)." ?";
		$query_nomi = "SELECT nome_classe FROM classi WHERE id_classe IN ($marcatori)";
		$nomi = $this->db->doQuery( $query_nomi, $class_ids, False );
	
        foreach( $nomi as $n )
            $this->registraAzione( $pgid, "INSERT", "classi_personaggio", "classe", NULL, $n["nome_classe"] );
        
        return "{\"status\": \"ok\",\"result\": \"true\"}";
    }
    
    public function aggiungiAbilitaAlPG( $pgid, $ab_ids )
    {
        UsersManager::operazionePossibile( $this->session, __FUNCTION__, $pgid );
        
        $marcatori     = str_repeat("?,", count( $ab_ids ) - 1 )."?";
        $query_prereq  = "SELECT * FROM (
                            SELECT 1 AS rank, id_abilita, nome_abilita, prerequisito_abilita FROM abilita WHERE id_abilita IN ( $marcatori ) AND prerequisito_abilita IS NULL
                             UNION ALL
                            SELECT 2 AS rank, id_abilita, nome_abilita, prerequisito_abilita FROM abilita WHERE id_abilita IN ( $marcatori ) AND prerequisito_abilita > 0
                             UNION ALL
                            SELECT 3 AS rank, id_abilita, nome_abilita, prerequisito_abilita FROM abilita WHERE id_abilita IN ( $marcatori ) AND prerequisito_abilita < 0
                          ) AS ab GROUP BY rank, prerequisito_abilita, id_abilita";
        $ordine_ab     = $this->db->doQuery( $query_prereq, array_merge($ab_ids, $ab_ids, $ab_ids), False );
        
        $abilita_query  = "INSERT INTO personaggi_has_abilita VALUES ( :idpg, :idabilita )";
        $abilita_params = array();
        
        foreach( $ordine_ab as $ab )
            $abilita_params[] = array( ":idpg" => $pgid, ":idabilita" => $ab["id_abilita"] );
        
        $this->db->doMultipleInserts( $abilita_query, $abilita_params );
		
        foreach( $ordine_ab as $ab )
            $this->registraAzione( $pgid, "INSERT", "abilita_personaggio", "abilita", NULL, $ab["nome_abilita"] );
        
        return "{\"status\": \"ok\",\"result\": \"true\"}";
    }
    
    public function aggiungiOpzioniAbilita( $pgid, $opzioni )
    {
        UsersManager::operazionePossibile( $this->session, __FUNCTION__, $pgid );
        
        $query_opzioni  = "INSERT INTO personaggi_has_opzioni_abilita VALUES ( :idpg, :idabilita, :opzione )";
        $params_opzioni = array();
        
        foreach( $opzioni as $id_ab => $opz )
            $params_opzioni[] = array( ":idpg" => $pgid, ":idabilita" => $id_ab, ":opzione" => $opz );
        
        $this->db->doMultipleInserts( $query_opzioni, $params_opzioni );
        
        $marcatori     = str_repeat("?,", count( $opzioni ) - 1 )."?";
        $query_abilita = "SELECT id_abilita, nome_abilita FROM abilita WHERE id_abilita IN ($marcatori)";
        $lista_abilita = $this->db->doQuery($query_abilita, array_keys($opzioni), False);
    
        foreach( $lista_abilita as $ab )
            $this->registraAzione( $pgid, "INSERT", "opzioni_abilita", "abilita - opzione", NULL, $ab["nome_abilita"]." - ".$opzioni[$ab["id_abilita"]] );
        
        return "{\"status\": \"ok\",\"result\": \"true\"}";
    }
    
    public function rimuoviClassePG( $pgid, $id_classe )
    {
        UsersManager::operazionePossibile( $this->session, __FUNCTION__, $pgid );
        
        $query_info = "SELECT cl.id_classe, cl.nome_classe, cl.prerequisito_classe FROM personaggi_has_classi AS phc
						JOIN classi AS cl ON phc.classi_id_classe = cl.id_classe
						WHERE phc.personaggi_id_personaggio = :pgid AND phc.classi_id_classe != :id";
        $lista_cl   = $this->db->doQuery( $query_info, array( ":pgid" => $pgid, ":id" => $id_classe ), False );
        
        $classi_del = array( $id_classe );
        $cl_prereq  = array_filter( $lista_cl, "Utils::filtraClasseSenzaPrerequisito" );
        
        if( count( $cl_prereq ) > 0 )
        {
            foreach ( $cl_prereq as $cp )
            {
                if ( $cp["prerequisito_classe"] === $id_classe )
                    $classi_del[] = $cp["id_classe"];
            }
        }
		
        $params = $classi_del;
        array_unshift($params, $pgid);
        
        $marcatori_cl = str_repeat("?,", count($classi_del) - 1 )."?";
        $query_del    = "DELETE FROM personaggi_has_classi WHERE personaggi_id_personaggio = ? AND classi_id_classe IN ($marcatori_cl)";
        $this->db->doQuery( $query_del, $params, False );
        
        $query_sel_ab = "SELECT id_abilita, nome_abilita FROM personaggi_has_abilita AS pha
                          JOIN abilita AS ab ON pha.abilita_id_abilita = ab.id_abilita
                          WHERE pha.personaggi_id_personaggio = ? AND ab.classi_id_classe IN ($marcatori_cl)";
        $lista_ab     = $this->db->doQuery( $query_sel_ab, $params, False );
        
        $params_ab    = $lista_ab;
        array_unshift( $params_ab, $pgid );
		
        $marcatori_ab = str_repeat("?, ", count($lista_ab) - 2)."?";
        $query_del_ab = "DELETE FROM personaggi_has_abilita WHERE pha.personaggi_id_personaggio = ? AND ab.classi_id_classe IN ($marcatori_ab)";
        $this->db->doQuery( $query_del_ab, $params_ab, False );
    
		$query_nomi_cl = "SELECT nome_classe FROM classi WHERE id_classe IN ($marcatori)";
		$nomi_cl       = $this->db->doQuery( $query_nomi_cl, $classi_del, False );
	
        foreach ($nomi_cl as $n)
            $this->registraAzione( $pgid, "DELETE", "classi_personaggio", "classe", $n["nome_classe"], NULL );
    
        foreach ($lista_ab as $la)
            $this->registraAzione( $pgid, "DELETE", "abilita_personaggio", "abilita", $la["nome_abilita"], NULL );
        
        return "{\"status\": \"ok\",\"result\": \"true\"}";
    }
    
    public function rimuoviAbilitaPG( $pgid, $id_abilita )
    {
        UsersManager::operazionePossibile( $this->session, __FUNCTION__, $pgid );
        
        $query_info = "SELECT ab.id_abilita, ab.nome_abilita, ab.classi_id_classe, ab.prerequisito_abilita FROM personaggi_has_abilita AS pha
						JOIN abilita AS ab ON pha.abilita_id_abilita = ab.id_abilita
						WHERE pha.personaggi_id_personaggio = :pgid AND pha.abilita_id_abilita != :id";
        $lista_ab   = $this->db->doQuery( $query_info, array( ":pgid" => $pgid, ":id" => $id_abilita ), False );
        
        $lista_completa = $this->controllaPrerequisitiPerEliminazioneAbilita( $pgid, $id_abilita, $lista_ab );
        array_unshift( $lista_completa, $id_abilita );
        
        $params = $lista_completa;
        array_unshift( $params, $pgid );
        
        $marcatori = str_repeat("?,", count($params) - 2 )."?";
        $query_del = "DELETE FROM personaggi_has_abilita WHERE personaggi_id_personaggio = ? AND abilita_id_abilita IN ($marcatori)";
        $this->db->doQuery( $query_del, $params, False );
        
		$query_nomi_ab = "SELECT nome_abilita FROM abilita WHERE id_abilita IN ($marcatori)";
		$nomi_ab       = $this->db->doQuery( $query_nomi_ab, $lista_completa, False );
		
        foreach ($nomi_ab as $n)
            $this->registraAzione( $pgid, "DELETE", "abilita_personaggio", "abilita", $n["nome_abilita"], NULL );
        
        return "{\"status\": \"ok\",\"result\": \"true\"}";
    }
    
    public function acquista( $pgid, $classi, $abilita, $opzioni )
    {
        global $DB_ERR_DELIMITATORE;
    
        $this->controllaOpzioniDuplicate($opzioni,$pgid);
        
        try {
            if( is_array($classi) ) $this->aggiungiClassiAlPG($pgid, $classi);
            if( is_array($abilita) ) $this->aggiungiAbilitaAlPG($pgid, $abilita);
            if( is_array($opzioni) ) $this->aggiungiOpzioniAbilita($pgid, $opzioni);
        }
        catch( Exception $e )
        {
            $err_mex = explode( $DB_ERR_DELIMITATORE, $e->getMessage() );
            
            if( count($err_mex) > 1 )
                $err_mex = $err_mex[1];
            else
                $err_mex = $err_mex[0];
            
            throw new APIException( $err_mex );
        }
        
        return "{\"status\": \"ok\",\"result\": \"true\"}";
    }
    
    public function modificaPG( $pgid, $modifiche, $is_offset = False )
    {
        foreach( $modifiche as $campo => $valore )
        {
            UsersManager::operazionePossibile( $this->session, __FUNCTION__."_".$campo, $pgid );
            
            $campi[] = $campo;
            $valori[] = $valore;
        }
        $campi_virgola = implode(", ", $campi);
        
        $query_vecchi_dati = "SELECT $campi_virgola FROM personaggi WHERE id_personaggio = :pgid";
        $vecchi_dati = $this->db->doQuery( $query_vecchi_dati, array( ":pgid" => $pgid ), False );
    
        $to_update = "";
        
        if( $is_offset )
        {
            foreach ($campi as $c)
                $to_update .= "$c = $c + ?, ";
    
            $to_update = substr( $to_update,0, -2 );
        }
        else
            $to_update = implode(" = ?, ", $campi )." = ?";
        
        $valori[] = $pgid;
        $query_bg = "UPDATE personaggi SET $to_update WHERE id_personaggio = ?";
        $this->db->doQuery( $query_bg, $valori, False );
        
        if( in_array("background_personaggio", $campi ) )
            $this->mailer->inviaAvvisoBackground($pgid);
        
        foreach( $vecchi_dati as $vd )
            foreach( $vd as $k => $val )
            {
                $nuovo_val = !$is_offset ? $modifiche[$k] : $val + $modifiche[$k];
                
                if( $nuovo_val !== $val )
                    $this->registraAzione($pgid, 'UPDATE', 'personaggi', $k, $val, $nuovo_val);
            }
        
        return "{\"status\": \"ok\",\"result\": \"true\"}";
    }
    
    public function modificaMoltiPG( $pgids, $modifiche, $is_offset = False )
    {
        foreach( $pgids as $id )
            $this->modificaPG($id,$modifiche,$is_offset);
        
        return "{\"status\": \"ok\",\"result\": \"true\"}";
    }
    
    public function eliminaPG( $pgid, $controlla_permessi = True )
    {
        if( $controlla_permessi )
        {
            UsersManager::operazionePossibile($this->session, __FUNCTION__, $pgid);
    
            $query_canc_pg = "UPDATE personaggi SET eliminato_personaggio = 1 WHERE id_personaggio = :idpg";
            $this->db->doQuery( $query_canc_pg, array( ":idpg" => $pgid ), False );
            $this->registraAzione( $pgid, "DELETE", "personaggi", "eliminato_personaggio", 0, 1 );
        }
        else
        {
            $query_canc_pg = "DELETE FROM personaggi WHERE id_personaggio = :idpg";
            $this->db->doQuery( $query_canc_pg, array( ":idpg" => $pgid ), False );
        }
        
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
        
        if( count( $res_pg ) === 0 )
            throw new APIException( "Non puoi scaricare i dati di un giocatore non tuo." );
		
        $pg_data  = $res_pg[0];
        
        $query_classi  = "SELECT cl.* FROM classi AS cl WHERE id_classe IN ( SELECT classi_id_classe FROM personaggi_has_classi WHERE personaggi_id_personaggio = :idpg )";
        $res_classi    = $this->db->doQuery( $query_classi, array( ":idpg" => $pgid ), False );
        
        $query_abilita = "SELECT ab.id_abilita,
                                 ab.costo_abilita,
                                 ab.nome_abilita,
                                 ab.prerequisito_abilita,
                                 ab.tipo_abilita,
                                 ab.distanza_abilita,
                                 ab.classi_id_classe,
                                 ab.effetto_abilita,
                                 cl.nome_classe
                            FROM abilita AS ab 
                              JOIN classi AS cl ON ab.classi_id_classe = cl.id_classe 
                            WHERE id_abilita IN 
                            ( SELECT abilita_id_abilita FROM personaggi_has_abilita WHERE personaggi_id_personaggio = :idpg )";
        $res_abilita   = $this->db->doQuery( $query_abilita, array( ":idpg" => $pgid ), False );
        
        $classi  = array( "civile" => array(), "militare" => array() );
        $abilita = array( "civile" => array(), "militare" => array() );
        
        foreach( $res_classi as $cl )
            $classi[$cl["tipo_classe"]][] = $cl;
        
        $crafting_chimico        = False;
        $crafting_programmazione = False;
        $crafting_ingegneria     = False;
        
        if( count( $res_abilita ) > 0 )
        {
            foreach ($res_abilita as $ab)
            {
                $abilita[$ab["tipo_abilita"]][] = $ab;
        
                if ($ab["id_abilita"] === $ABILITA_CRAFTING["chimico"])
                    $crafting_chimico = True;
        
                if ($ab["id_abilita"] === $ABILITA_CRAFTING["programmazione"])
                    $crafting_programmazione = True;
        
                if (in_array($ab["id_abilita"], $ABILITA_CRAFTING["ingegneria"]))
                    $crafting_ingegneria = True;
            }
        }
        else
        {
            $crafting_chimico = False;
            $crafting_programmazione = False;
            $crafting_ingegneria = False;
        }
        
        $px_spesi = 0;
        $pc_spesi = count( $classi["militare"] ) + count( $abilita["militare"] );
        
        for( $i = 0; $i < count( $classi["civile"] ); $i++ )
            $px_spesi += $MAPPA_COSTO_CLASSI_CIVILI[$i];
        
        if( count( $abilita["civile"] ) > 0 )
            foreach( $abilita["civile"] as $ac )
                $px_spesi += $ac["costo_abilita"];
        
        $px_risparmiati = $pg_data["px_personaggio"] - $px_spesi;
        $pc_risparmiati = $pg_data["pc_personaggio"] - $pc_spesi;
        
        //recupero le opzioni
        $query = "SELECT phoa.*, ab.nome_abilita
                    FROM personaggi_has_opzioni_abilita AS phoa
                    JOIN abilita AS ab ON ab.id_abilita = phoa.abilita_id_abilita
                  WHERE personaggi_id_personaggio = :pgid";
        $result = $this->db->doQuery( $query, array( ":pgid" => $pgid ), False );
        $opzioni = array();
    
        foreach( $result as $r )
            $opzioni[$r["abilita_id_abilita"]] = [ "nome_abilita" => $r["nome_abilita"], "opzione" => $r["opzioni_abilita_opzione"] ];
        
        $pg_data["classi"] = $classi;
        $pg_data["abilita"] = $abilita;
        $pg_data["px_spesi"] = $px_spesi;
        $pg_data["px_risparmiati"] = $px_risparmiati;
        $pg_data["pc_spesi"] = $pc_spesi;
        $pg_data["pc_risparmiati"] = $pc_risparmiati;
        $pg_data["crafting_chimico"] = $crafting_chimico;
        $pg_data["crafting_programmazione"] = $crafting_programmazione;
        $pg_data["crafting_ingegneria"] = $crafting_ingegneria;
        $pg_data["opzioni"] = $opzioni;
        
        $this->session->pg_loggato = $pg_data;
        
        return "{\"status\": \"ok\",\"result\": ".json_encode($pg_data)."}";
    }
    
    public function recuperaStorico( $pgid )
    {
        UsersManager::operazionePossibile($this->session, __FUNCTION__, $pgid);
        
        $query = "SELECT CONCAT( gi.nome_giocatore, ' ', gi.cognome_giocatore ) AS nome_giocatore, 
                            st.data_azione, 
                            st.tipo_azione, 
                            st.tabella_azione,
                            st.campo_azione,
                            st.valore_nuovo_azione, 
                            st.valore_vecchio_azione
                        FROM storico_azioni AS st
                        JOIN giocatori AS gi ON gi.email_giocatore = st.giocatori_email_giocatore
                    WHERE st.id_personaggio_azione = :idpg
                    ORDER BY st.data_azione DESC, st.valore_nuovo_azione DESC, st.valore_vecchio_azione DESC";
        $result = $this->db->doQuery( $query, array( ":idpg" => $pgid ) );
        $result = isset($result) ? $result : "[]";
        
        return "{\"status\": \"ok\",\"result\": $result}";
    }
    
    public function recuperaOpzioniAbilita( )
    {
        UsersManager::operazionePossibile( $this->session, __FUNCTION__ );
        
        $query = "SELECT * FROM opzioni_abilita";
        $result = $this->db->doQuery( $query, array( ), False );
        
        $ret = array();
        
        foreach( $result as $r )
        {
            if( !isset( $ret[$r["abilita_id_abilita"]] ) )
                $ret[$r["abilita_id_abilita"]] = [];
    
            $ret[$r["abilita_id_abilita"]][] = $r["opzione"];
        }
        
        return "{\"status\": \"ok\",\"result\": ".json_encode($ret)."}";
    }
}