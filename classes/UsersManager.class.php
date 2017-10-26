<?php
include_once("./classes/DatabaseBridge.class.php");
include_once("./classes/GrantManager.class.php");

class UsersManager
{
	protected $db;
	
	public function __construct()
	{
		$this->db = new DatabaseBridge();
	}
	
	public function __destruct()
	{
	}
	
	private function errorJSON( $msg )
	{
		return "{\"status\":\"error\", \"message\":\"".$msg."\"}";
	}
	
	/**
	current=1&rowCount=10&sort[sender]=asc&searchPhrase=
	{
	  "current": 1,
	  "rowCount": 10,
	  "rows": [
		{
		  "id": 19,
		  "sender": "123@test.de",
		  "received": "2014-05-30T22:15:00"
		},
		{
		  "id": 14,
		  "sender": "123@test.de",
		  "received": "2014-05-30T20:15:00"
		},
		...
	  ],
	  "total": 1123
	}
	*/	
	public function getAllCharacters( $user, $pass, $current, $row_count, $sort, $search )
	{
		if( !GrantManager::userHasGrant( $user, $pass, "visualizza_tutti_personaggi" ) )
			return errorJSON( "Non hai i permessi per compiere questa operazione." );
		
		$query = "";
		
		try 
		{
			$ret = $this->db->doQuery( $query );			
		}
		catch( Exception $e )
		{
			return $this->errorJSON( $e->getMessage() );
		}
		
		return "{\"status\":\"ok\", \"data\":".$ret."}";
	}
}
?>