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
    
    public function creaEvento( $titolo, $data_inizio, $ora_inizio, $data_fine, $ora_fine, $luogo, $costo, $costo_max, $note )
    {
        UsersManager::operazionePossibile( $this->session, __FUNCTION__ );
        
        
    }
}