<?php
$path = $_SERVER['DOCUMENT_ROOT']."/reboot-live-api/src/";
include_once( $path."classes/APIException.class.php" );
include_once( $path."classes/UsersManager.class.php" );
include_once( $path."classes/CharactersManager.class.php" );
include_once( $path."classes/MessagingManager.class.php" );
include_once( $path."config/constants.php" );

class Main
{
	protected $usersmanager;
	protected $charactersmanager;
	protected $messagingmanager;
	
	public function __construct()
	{
	    global $SITE_URL;
	    
		ini_set( 'html_errors', false );

		date_default_timezone_set( 'Europe/Rome' );

		header( 'Content-Type: application/json;charset=UTF-8' );
		header( 'Access-Control-Allow-Origin: '.$SITE_URL );
		header( 'Access-Control-Allow-Credentials: true' );

		$this->usersmanager      = new UsersManager();
		$this->charactersmanager = new CharactersManager();
		$this->messagingmanager  = new MessagingManager();
	}
	
	public function __destruct()
	{
	}
	
	public function runAPI()
	{
	    global $DEBUG;

		// get the HTTP method, path and body of the request
		$method  = $_SERVER['REQUEST_METHOD'];
		$request = explode( '/', trim( $_SERVER['PATH_INFO'], '/' ) );
		$classe  = $request[0];
		$func    = $request[1];
		//$input   = json_decode( file_get_contents( 'php://input' ), true );
		//die( var_dump($_POST) );
		try
		{
			if( $method == "GET" )        $data = $_GET;
			else if ( $method == "POST" ) $data = $_POST;
			
			return call_user_func_array( array( $this->$classe, $func ), $data );
		}
		catch( Exception $e )
		{
		    $mex = $e->getMessage();
            
            if( $DEBUG )
                $mex .= " \n".$e->getTraceAsString();
            
		    if( method_exists($e,'getType') )
		        $err = Utils::errorJSON( $mex, $e->getType() );
		    else
                $err = Utils::errorJSON( $mex );

			return $err;
		}
	}
}

$main = new Main();
echo $main->runAPI();