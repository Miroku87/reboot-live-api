<?php
$path = $_SERVER['DOCUMENT_ROOT']."/reboot-live-api/";
include_once($path."classes/DatabaseBridge.class.php");
include_once($path."classes/Mailer.class.php");
include_once($path."classes/SessionManager.class.php");
include_once($path."classes/Utils.class.php");
include_once($path."config/constants.php");

class UsersManager
{
	protected $db;
	protected $grants;
	protected $session;
	
	public function __construct()
	{
		$this->session = SessionManager::getInstance();
		$this->db      = new DatabaseBridge();
		$this->mailer  = new Mailer();
	}
	
	public function __destruct()
	{
	}
	
	public function __toString()
    {
        return "[UsersManager]";
    }
	
	public function login( $mail, $pass )
	{
		$query  = "SELECT gi.codice_fiscale_giocatore, gr.nome_grant AS permessi FROM giocatori AS gi
					JOIN ruoli_has_grants AS rhg ON gi.ruoli_id_ruolo = rhg.ruoli_id_ruolo
					JOIN reboot_live.grants AS gr ON gr.id_grant = rhg.grants_id_grant
					WHERE gi.email_giocatore = :mail AND 
					      gi.password_giocatore = :pass";
		$params = array( ":mail" => $mail, ":pass" => $pass );
		
		try 
		{
			$result = $this->db->doQuery( $query, $params, False );
		}
		catch( Exception $e )
		{
			return Utils::errorJSON( $e->getMessage() );
		}
		
		if( count( $result ) === 0 )
			return Utils::errorJSON( "Email utente o password sono errati. Per favore ritentare." );
		
		$this->session->codice_fiscale_giocatore = $result[0]["codice_fiscale_giocatore"];
		$this->session->permessi_giocatore       = array_map( "Utils::mappaPermessiUtente", $result );
		
		return "{\"status\": \"ok\", \"permessi\":".json_encode( $this->session->permessi_giocatore )."}";
	}
	
	public function registra( $cf, $nome, $cognome, $mail, $note )
	{
		$pass   = Utils::generatePassword();
		$query  = "INSERT INTO giocatori VALUES (:cf,:pass,:nome,:cognome,:mail,:note)";
		$params = array( 
			":cf"      => $cf, 
			":pass"    => $pass,
			":nome"    => $nome,
			":cognome" => $cognome,
			":mail"    => $mail,
			":note"    => $note
		);
		
		try 
		{
			$result = $this->db->doQuery( $query, $params );
		}
		catch( Exception $e )
		{
			return Utils::errorJSON( $e->getMessage() );
		}
		
		$this->mailer->sendMail( "registrazione", $mail, $nome, $pass  );
		
		return "{\"status\": \"ok\"}";
	}
	
	public function aggiornaUtente( $cf, $aggiornamenti )
	{
		
	}
	
	public function eliminaUtente( $cf, $aggiornamenti )
	{
		
	}
}
?>