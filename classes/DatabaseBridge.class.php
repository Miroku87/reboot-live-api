<?php
$path = $_SERVER['DOCUMENT_ROOT']."/reboot-live-api/";
include $path."config/config.inc.php";

class DatabaseBridge extends PDO
{
	public function __construct()
	{
	}
	
	public function __destruct()
	{
	}
	
	private function connect()
	{
		global $DB_DATA;
		$dns = $DB_DATA["DB_DRIVER"] . ':host=' . $DB_DATA["DB_HOST"] . ';dbname=' . $DB_DATA["DB_NAME"];
		
        try
		{
			$connection = new PDO( $dns, $DB_DATA["DB_USER"], $DB_DATA["DB_PASS"] );
		} 
		catch (PDOException $e) 
		{
			die( "{\"status\":\"error\", \"message\":\"".$e->getMessage()."\"}" );
		}
		
		return $connection;
	}
	
	/*private function toJSON( $result )
	{
		$arr = array();
		
		while( $row = $result->fetch_assoc( ) )
			$arr[] = $row;
			
		return json_encode($arr);
	}*/
	
	public function doQuery( $query, $params, $to_json = True )
	{
		if( !is_array( $params ) )
			throw new Exception("I parametri passati devono essere sotto forma di array di traduzione PDO.");
		
		$conn   = $this->connect();		
		$stmnt  = $conn->prepare( $query );
		
		$stmnt->execute( $params );
		
		$result = $stmnt->fetchAll( PDO::FETCH_ASSOC );
		
		if( $result && !$to_json )
			return $result;
		else if( $result && $to_json )
			return json_encode( $result );
	}
}

?>