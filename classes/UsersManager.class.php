<?php
include_once("./classes/DatabaseBridge.class.php");
include_once("./classes/GrantManager.class.php");
include_once("./classes/Utils.class.php");

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
	public function getAllCharacters( $user, $pass, $current = 0, $row_count = 10, $sort = NULL, $search = NULL )
	{
		if( !GrantManager::userHasGrant( $user, $pass, "visualizza_tutti_personaggi" ) )
			return Utils::errorJSON( "Non hai i permessi per compiere questa operazione." );
		
		if( isset( $search ) )
			$where = " WHERE pg.nome_personaggio LIKE '%$search%' OR 
		                     pg.cognome_personaggio LIKE '%$search%' OR
		                     cc.nome_classe_civile LIKE '%$search%' OR
		                     cm.nome_classe_militare LIKE '%$search%' OR
		                     gi.nome_giocatore LIKE '%$search%' OR
		                     gi.cognome_giocatore LIKE '%$search%' OR
		                     gi.email_giocatore LIKE '%$search%'";
		
		if( isset( $sort ) )
		{
			$sorting = [];
			foreach ($sort as $col => $value) {
				$sorting[] = "$col $value";
			}			
			$order = "ORDER BY ".implode( $sorting, "," );
		}
		
		$query = "SELECT * FROM personaggi AS pg
		            JOIN giocatori AS gi
					JOIN classi_civili AS cc
					JOIN classi_militari AS cm
					$where
					$order
		            LIMIT $row_count OFFSET $current";
		
		try 
		{
			$ret = $this->db->doQuery( $query, False );
		}
		catch( Exception $e )
		{
			return Utils::errorJSON( $e->getMessage() );
		}
		
		$i = 0;
		while( $row = $result->fetch_assoc( ) )
		{
			$i++;
			$arr[] = $row;
		}
		
		return "{\"status\":\"ok\", \"data\":".$ret."}";
	}
}
?>