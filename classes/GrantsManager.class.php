<?php
$path = $_SERVER['DOCUMENT_ROOT']."/reboot-live-api";
include_once($path."/classes/DatabaseBridge.class.php");
include_once($path."/classes/Utils.class.php");

class GrantsManager
{
	protected $db;
	
	public function __construct()
	{
		$this->db = new DatabaseBridge();
	}
	
	public function __destruct()
	{
	}
	
	public function getUserGrants( $user, $pass )
	{
		$query = "SELECT gr.nome_grant AS permessi FROM giocatori AS gi
					JOIN ruoli_has_grants AS rhg ON gi.ruoli_id_ruolo = rhg.ruoli_id_ruolo
					JOIN reboot_live.grants AS gr ON gr.id_grant = rhg.grants_id_grant
					WHERE gi.codice_fiscale_giocatore = '$user' AND 
					      gi.password_giocatore = '$pass'";
		
		try 
		{
			$ret = $this->db->doQuery( $query, False );
		}
		catch( Exception $e )
		{
			return Utils::errorJSON( $e->getMessage() );
		}
		
		$arr = [];
		while( $row = $ret->fetch_assoc( ) )
		{
			$arr[] = $row['permessi'];
		}
		
		return $arr;
	}
	
	public function userHasGrant( $user, $pass, $grant )
	{
		$query = "SELECT gr.nome_grant FROM giocatori AS gi
					JOIN ruoli_has_grants AS rhg ON gi.ruoli_id_ruolo = rhg.ruoli_id_ruolo
					JOIN reboot_live.grants AS gr ON gr.id_grant = rhg.grants_id_grant
					WHERE gi.codice_fiscale_giocatore = '$user' AND 
					      gi.password_giocatore = '$pass' AND 
					      gr.nome_grant = '$grant'";
		
		try 
		{
			$ret = $this->db->doQuery( $query, False );			
		}
		catch( Exception $e )
		{
			return Utils::errorJSON( $e->getMessage() );
		}
		
		return $ret->num_rows > 0;
	}
}
?>