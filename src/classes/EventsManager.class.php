<?php
$path = $_SERVER['DOCUMENT_ROOT']."/reboot-live-api/src/";
include_once($path."classes/APIException.class.php");
include_once($path."classes/UsersManager.class.php");
include_once($path."classes/DatabaseBridge.class.php");
include_once($path."classes/Mailer.class.php");
include_once($path."classes/SessionManager.class.php");
include_once($path."classes/Utils.class.php");
include_once($path."config/constants.php");

class EventsManager
{
    protected $db;
    protected $grants;
    protected $session;
    protected $mailer;
    
    public function __construct()
    {
        $this->db      = new DatabaseBridge();
        $this->session = SessionManager::getInstance();
        $this->mailer  = new Mailer();
    }
    
    private function controllaAnomalie( $costo, $costo_max, $note )
    {
        $warning = "";
        
        if( !$costo || Utils::soloSpazi($costo) || (int)$costo === 0 )
            $warning .= "Il campo Costo non &egrave; stato riempito.<br>";
        if( !$costo_max || Utils::soloSpazi($costo_max) || (int)$costo === 0 )
            $warning .= "Il campo Costo Maggiorato non &egrave; stato riempito.<br>";
        if( !$note || Utils::soloSpazi($note) )
            $warning .= "Il campo Dettagli non &egrave; stato riempito.<br>";
    
        return $warning;
    }
    
    private function controllaErrori( $titolo, $data_inizio, $ora_inizio, $data_fine, $ora_fine, $luogo, $costo, $costo_max, $note )
    {
        $error       = "";
    
        if( !$titolo || Utils::soloSpazi($titolo) )
            $error .= "<li>Il campo Titolo non pu&ograve; essere lasciato vuoto.</li>";
        if( !$data_inizio || Utils::soloSpazi($data_inizio) )
            $error .= "<li>Il campo Data Inizio non pu&ograve; essere lasciato vuoto.</li>";
        else
            $d_inizio = DateTime::createFromFormat("d/m/Y", $data_inizio);
        if( !$ora_inizio || Utils::soloSpazi($ora_inizio) )
            $error .= "<li>Il campo Ora Inizio non pu&ograve; essere lasciato vuoto.</li>";
        if( !$data_fine || Utils::soloSpazi($data_fine) )
            $error .= "<li>Il campo Data Fine non pu&ograve; essere lasciato vuoto.</li>";
        else
            $d_fine = DateTime::createFromFormat("d/m/Y", $data_fine);
        if( !$ora_fine || Utils::soloSpazi($ora_fine) )
            $error .= "<li>Il campo Ora Fine non pu&ograve; essere lasciato vuoto.</li>";
        if( $costo && !Utils::soloSpazi($costo) && !preg_match( "/^\d+$/", $costo ) )
            $error .= "<li>Il campo Costo pu&ograve; contenere solo numeri.</li>";
        if( $costo_max && Utils::soloSpazi($costo_max) && !preg_match( "/^\d+$/", $costo_max ) )
            $error .= "<li>Il campo Costo Maggiorato pu&ograve; contenere solo numeri.</li>";
        if( !$luogo || Utils::soloSpazi($luogo) )
            $error .= "<li>Il campo Luogo non pu&ograve; essere lasciato vuoto.<br>";
    
        if( isset($d_inizio) && isset($d_fine) && $d_fine < $d_inizio )
            $error .= "<li>La data di fine non pu&ograve; essere prima di quella d'inizio.</li>";
        
        return $error;
    }
    
    public function creaEvento( $titolo, $data_inizio, $ora_inizio, $data_fine, $ora_fine, $luogo, $costo, $costo_max, $note )
    {
        UsersManager::operazionePossibile( $this->session, __FUNCTION__ );
        
        $errori = $this->controllaErrori($titolo, $data_inizio, $ora_inizio, $data_fine, $ora_fine, $luogo, $costo, $costo_max, $note);
        
        if( !empty($errori) )
            throw new APIException("Sono stati rilevati i seguenti errori:<ul>".$errori."</ul>");
        
        $params = [
            ":titolo"    => $titolo,
            ":d_inizio"  => DateTime::createFromFormat("d/m/Y", $data_inizio)->format("Y-m-d"),
            ":t_inizio"  => $ora_inizio.":00",
            ":d_fine"    => DateTime::createFromFormat("d/m/Y", $data_fine)->format("Y-m-d"),
            ":t_fine"    => $ora_fine.":00",
            ":luogo"     => $luogo,
            ":costo"     => $costo,
            ":costo_max" => $costo_max,
            ":note"      => $note
        ];
        
        $query_crea = "INSERT INTO eventi VALUES (NULL, :titolo, :d_inizio, :t_inizio, :d_fine, :t_fine, :luogo, :costo, :costo_max, 0, :note )";
        $this->db->doQuery( $query_crea, $params, False );
        
        return json_encode([ "status" => "ok", "result" => "true" ]);
    }
    
    public function modificaEvento( $id, $titolo, $data_inizio, $ora_inizio, $data_fine, $ora_fine, $luogo, $costo, $costo_max, $note )
    {
        UsersManager::operazionePossibile( $this->session, __FUNCTION__ );
        
        $errori = $this->controllaErrori($titolo, $data_inizio, $ora_inizio, $data_fine, $ora_fine, $luogo, $costo, $costo_max, $note);
        
        if( !empty($errori) )
            throw new APIException("Sono stati rilevati i seguenti errori:<ul>".$errori."</ul>");
        
        $params = [
            ":id"        => $id,
            ":titolo"    => $titolo,
            ":d_inizio"  => DateTime::createFromFormat("d/m/Y", $data_inizio)->format("Y-m-d"),
            ":t_inizio"  => $ora_inizio.":00",
            ":d_fine"    => DateTime::createFromFormat("d/m/Y", $data_fine)->format("Y-m-d"),
            ":t_fine"    => $ora_fine.":00",
            ":luogo"     => $luogo,
            ":costo"     => $costo,
            ":costo_max" => $costo_max,
            ":note"      => nl2br($note)
        ];
        
        $query_crea = "UPDATE eventi SET titolo_evento = :titolo,
                                         data_inizio_evento = :d_inizio,
                                         ora_inizio_evento = :t_inizio,
                                         data_fine_evento = :d_fine,
                                         ora_fine_evento = :t_fine,
                                         luogo_evento = :luogo,
                                         costo_evento = :costo,
                                         costo_maggiorato_evento = :costo_max,
                                         note_evento = :note
                        WHERE id_evento = :id";
        $this->db->doQuery( $query_crea, $params, False );
        
        return json_encode([ "status" => "ok", "result" => "true" ]);
    }
    
    public function recuperaEvento( $id = "last" )
    {
        UsersManager::operazionePossibile( $this->session, "recuperaEventi" );
        
        $query_end = $id === "last" ? "WHERE data_inizio_evento > NOW() ORDER BY id_evento DESC LIMIT 1" : "WHERE id_evento = :id";
        $params    = $id === "last" ? [] : [ ":id" => $id ];
        
        $query_ev = "SELECT ev.*,
                            DATE_FORMAT(ev.data_inizio_evento, '%d/%m/%Y') AS data_inizio_evento_it,
                            DATE_FORMAT(ev.data_fine_evento, '%d/%m/%Y') AS data_fine_evento_it
                     FROM eventi AS ev $query_end";
        $evento = $this->db->doQuery( $query_ev, $params, False );
        
        return json_encode([ "status" => "ok", "result" => $evento[0] ]);
    }
    
    public function iscriviPg( $id_evento, $id_pg, $pagato, $tipo_pagamento, $note )
    {
        UsersManager::operazionePossibile( $this->session, __FUNCTION__, $id_pg );
    
        $params = [
            ":id_ev"     => $id_evento,
            ":id_pg"     => $id_pg,
            ":pagato"    => $pagato,
            ":tipo_pag"  => $tipo_pagamento,
            ":note"      => nl2br($note)
        ];
        
        $query_ev = "INSERT INTO iscrizione_personaggi VALUES ( :id_ev, :id_pg, :pagato, :tipo_pag, :note)";
        $evento = $this->db->doQuery( $query_ev, $params, False );
        
        return json_encode([ "status" => "ok", "result" => $evento[0] ]);
    }
}