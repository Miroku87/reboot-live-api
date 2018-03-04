<?php
$path = $_SERVER['DOCUMENT_ROOT']."/reboot-live-api/";
include_once($path."classes/UsersManager.class.php");
include_once($path."classes/DatabaseBridge.class.php");
include_once($path."classes/SessionManager.class.php");

class MessagingManager
{
    protected $db;
    protected $session;
    
    public function __construct()
    {
        $this->session = SessionManager::getInstance();
        $this->db      = new DatabaseBridge();
    }
    
    public function __destruct()
    {
        // TODO: Implement __destruct() method.
    }
    
    public function inviaMessaggio( $tipo, $mitt, $dest, $ogg, $mex, $risp_id = NULL  )
    {
        UsersManager::operazionePossibile( $this->session, __FUNCTION__ );
        
        $tabella = $tipo === "fg" ? "messaggi_fuorigioco" : "messaggi_ingioco";
        
        $params = array(
            ":mitt" => $mitt,
            ":dest" => $dest,
            ":ogg"  => $ogg,
            ":mex"  => $mex,
            ":risp" => $risp_id
        );
        
        $query_mex = "INSERT INTO $tabella (mittente_messaggio, destinatario_messaggio, oggetto_messaggio, testo_messaggio, risposta_a_messaggio) VALUES ( :mitt, :dest, :ogg, :mex, :risp )";
        $this->db->doQuery( $query_mex, $params, False );
        
        return "{\"status\": \"ok\",\"result\": \"true\"}";
    }
    
    public function messaggioLetto( $idmex )
    {
        //TODO;
    }
    
    public function recuperaMessaggiFg( $draw, $columns, $order, $start, $length, $search, $tipo, $casella, $id )
    {
        UsersManager::operazionePossibile( $this->session, "recuperaMessaggi", $id );

        $params     = array( ":id" => $id );
        $where      = $casella === "inviati" ? "mex.mittente_messaggio = :id" : "mex.destinatario_messaggio = :id";
        $tabella    = $tipo === "ig" ? "messaggi_ingioco" : "messaggi_fuorigioco";
        $t_join     = $tipo === "ig" ? "personaggi" : "giocatori";
        $campo_id   = $tipo === "ig" ? "id_personaggio" : "email_giocatore";
        $campo_nome = $tipo === "ig" ? "nome_personaggio" : "nome_giocatore";

        if( isset( $search ) && $search["value"] != "" )
        {
            $params[":search"] = "%$search[value]%";
            $where .= " AND (
						t_mitt.$campo_nome LIKE :search OR
						t_dest.$campo_nome LIKE :search OR
						mex.oggetto_messaggio LIKE :search OR
						mex.testo_messaggio LIKE :search
					  )";
***REMOVED***

        if( isset( $order ) )
        {
            $sorting = array();
            foreach ( $order as $elem )
                $sorting[] = $columns[$elem["column"]]["data"]." ".$elem["dir"];
    
            $order_str = "ORDER BY ".implode( $sorting, "," );
***REMOVED***
        
        $query_mex = "SELECT mex.id_messaggio,
                             mex.oggetto_messaggio,
                             mex.data_messaggio,
                             t_mitt.$campo_id AS id_mittente,
                             t_mitt.$campo_nome AS nome_mittente,
                             t_dest.$campo_id AS id_destinatario,
                             t_dest.$campo_nome AS nome_destinatario,
                             'fg' AS tipo_messaggio
                      FROM $tabella AS mex
                        JOIN $t_join AS t_mitt ON mex.mittente_messaggio = t_mitt.$campo_id
                        JOIN $t_join AS t_dest ON mex.destinatario_messaggio = t_dest.$campo_id
                      WHERE $where $order_str";

        $risultati  = $this->db->doQuery( $query_mex, $params, False );
        $totale     = count($risultati);
        
        if( count($risultati) > 0 )
            $risultati = array_splice($risultati, $start, $length);
        else
            $risultati = array();

        $output     = array(
            "draw"            => $draw,
            "columns"         => $columns,
            "order"           => $order,
            "start"           => $start,
            "length"          => $length,
            "search"          => $search,
            "recordsTotal"    => $totale,
            "recordsFiltered" => count($risultati),
            "data"            => $risultati
        );

        return json_encode( $output );
    }
}