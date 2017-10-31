<?php
include_once("./classes/DatabaseBridge.class.php");
include_once("./classes/Utils.class.php");

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
	
	static function userHasGrant( $user, $pass, $grant )
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