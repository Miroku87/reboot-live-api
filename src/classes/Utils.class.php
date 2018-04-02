<?php
class Utils
{	
	static function errorJSON( $msg, $type = "genericError" )
	{
	    $json = array(
	        "status"  => "error",
            "type"    => $type,
            "message" => $msg
        );
	    
		return json_encode($json);
	}
	
	static function mappaPermessiUtente( $item )
	{
		return $item["permessi"];
	}

	static function mappaPGUtente( $item )
	{
		return $item["id_personaggio"];
	}

	static function mappaRisultatoJson( $item )
	{
		return $item["json"];
	}

	static function mappaId( $item )
	{
		return $item["id"];
	}

	static function mappaIdAbilita( $item )
	{
		return $item["id_abilita"];
	}

	static function mappaOffsetPFAbilita( $item )
	{
		return $item["offset_pf_abilita"];
	}

	static function mappaArrayDiArrayAssoc( $arr, $key )
	{
	    $mappa = function ( $item ) use ( $key )
        {
            return $item[$key];
        };
	    
		return array_map($mappa, $arr);
	}

	static function filtraClasseSenzaPrerequisito( $item )
	{
		return $item["prerequisito_classe"] != NULL;
	}

	static function filtraAbilitaSenzaPrerequisito( $item )
	{
		return $item["prerequisito_abilita"] != NULL;
	}

	static function filtraAbilitaSupportoBase( $item )
	{
		global $ID_CLASSE_SUPPORTO_BASE;
		
		return (int)$item["classi_id_classe"] === $ID_CLASSE_SUPPORTO_BASE;
	}

	static function filtraAbilitaSportivo( $item )
	{
		global $ID_CLASSE_SPORTIVO;
		
		return (int)$item["classi_id_classe"] === $ID_CLASSE_SPORTIVO;
	}

	static function filtraAbilitaAssaltatoreBase( $item )
	{
        global $ID_CLASSE_ASSALTATORE_BASE;
        
        return (int)$item["classi_id_classe"] === $ID_CLASSE_ASSALTATORE_BASE;
	}

	static function filtraAbilitaGuastatoreBase( $item )
	{
        global $ID_CLASSE_GUASTATORE_BASE;
        
        return (int)$item["classi_id_classe"] === $ID_CLASSE_GUASTATORE_BASE;
	}

	static function filtraAbilitaGuastatoreAvanzato( $item )
	{
        global $ID_CLASSE_GUASTATORE_AVANZATO;
        
        return (int)$item["classi_id_classe"] === $ID_CLASSE_GUASTATORE_AVANZATO;
	}
	
	static function rimuoviElementoArrayMultidimensionale( &$arr, $chiave, $valore )
    {
        foreach( $arr as $i => $a )
        {
            if( $a[$chiave] === $valore )
            {
                array_splice($arr, $i, 1);
                break;
            }
        }
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
	
	static function utf8ize($d)
    {
        if (is_array($d))
        {
            foreach ($d as $k => $v)
            {
                $d[$k] = self::utf8ize($v);
            }
        }
        else if (is_string($d))
        {
            return utf8_encode($d);
        }
        return $d;
    }
    
    static function getUserIP()
    {
        $client  = @$_SERVER['HTTP_CLIENT_IP'];
        $forward = @$_SERVER['HTTP_X_FORWARDED_FOR'];
        $remote  = $_SERVER['REMOTE_ADDR'];
        
        if(filter_var($client, FILTER_VALIDATE_IP))
        {
            $ip = $client;
        }
        elseif(filter_var($forward, FILTER_VALIDATE_IP))
        {
            $ip = $forward;
        }
        else
        {
            $ip = $remote;
        }
        
        return $ip;
    }
}