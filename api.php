<?php
//https://www.leaseweb.com/labs/2015/10/creating-a-simple-rest-api-in-php/
// __FUNCTION__
$path = $_SERVER['DOCUMENT_ROOT']."/reboot-live-api/";
include_once( $path."classes/UsersManager.class.php" );
include_once( $path."classes/CharactersManager.class.php" );

class Main
{
	protected $usersmanager;
	protected $charactersmanager;
	
	public function __construct()
	{
		ini_set( 'html_errors', false );

		date_default_timezone_set( 'Europe/Rome' );

		header( 'Content-Type: application/json' );
		header( 'Access-Control-Allow-Origin: *' );

		$this->usersmanager      = new UsersManager();
		$this->charactersmanager = new CharactersManager();
		
		return $this->runAPI();
	}
	
	public function __destruct()
	{
	}
	
	private function runAPI()
	{
		// get the HTTP method, path and body of the request
		$method  = $_SERVER['REQUEST_METHOD'];
		$request = explode( '/', trim( $_SERVER['PATH_INFO'], '/' ) );
		//$input   = json_decode( file_get_contents( 'php://input' ), true );
		//die( var_dump($_POST) );
		try
		{
			if( $method == "GET" )        $data = $_GET;
			else if ( $method == "POST" ) $data = $_POST;
			
			return call_user_func_array( array( $this->$request[0], $request[1] ), $data );
		}
		catch( Exception $e )
		{
			return Utils::errorJSON( $e->getMessage() );
		}
	}
}

echo new Main();
?>