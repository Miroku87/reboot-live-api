<?php

class Utils
{	
	static function errorJSON( $msg )
	{
		return "{\"status\":\"error\", \"message\":\"".$msg."\"}";
	}
	
	static function mappaPermessiUtente( $item )
	{
		return $item["permessi"];
	}
	
	static function generatePassword( $length = 8 )
	{
		$alphabet = "abcdefghijklmnopqrstuwxyzABCDEFGHIJKLMNOPQRSTUWXYZ0123456789";
		$pass = array();
		$alphaLength = strlen($alphabet) - 1;
		
		for ($i = 0; $i < $length; $i++) 
		{
			$n = rand( 0, $alphaLength );
			$pass[] = $alphabet[$n];
		}
		return implode($pass);
	}
}

?>