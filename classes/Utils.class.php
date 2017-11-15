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

	static function controllaCF( $cf )
	{
		$pattern = "/^[a-zA-Z]{6}[0-9]{2}[a-zA-Z][0-9]{2}[a-zA-Z][0-9]{3}[a-zA-Z]$/";

		return preg_match( $pattern, $cf );
	}

	static function controllaMail( $mail )
	{
		$pattern = "/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/";

		return preg_match( $pattern, $mail );
	}

	static function soloSpazi( $stringa )
	{
		$pattern = "/^\s+$/";

		return preg_match( $pattern, $stringa );
	}
}

?>