<?php

class Utils
{	
	static function errorJSON( $msg )
	{
		return "{\"status\":\"error\", \"message\":\"".$msg."\"}";
	}
	
	static function arrangeDataForBootgrid( $data, $current, $row_count, $sort, $search )
	{
		
	}
}

?>