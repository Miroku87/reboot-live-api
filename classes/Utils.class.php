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
}

?>