<?php

$path = $_SERVER['DOCUMENT_ROOT']."/reboot-live-api/src/";
include_once($path."classes/APIException.class.php");
include_once($path."classes/UsersManager.class.php");
include_once($path."classes/DatabaseBridge.class.php");
include_once($path."classes/Mailer.class.php");
include_once($path."classes/SessionManager.class.php");
include_once($path."classes/Utils.class.php");
include_once($path."config/constants.php");

class CraftingManager
{
    protected $idev_in_corso;
    
    public function __construct( $idev_in_corso = NULL )
    {
        $this->idev_in_corso = $idev_in_corso;
    }
    
    public function __destruct()
    {
    }
}