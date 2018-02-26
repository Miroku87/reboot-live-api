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

    static function controllaLogin( $sessione )
    {
        if( !isset($sessione->permessi_giocatore) )
            throw new Exception( "Devi essere loggato per compiere questa operazione." );
    }

    static function operazionePossibile( $sessione, $funzione, $pgid = NULL )
    {
        global $TIPO_GRANT_PG_PROPRIO;
        global $TIPO_GRANT_PG_ALTRI;

        $tipo_grant = "";

        UsersManager::controllaLogin( $sessione );

        if( isset( $pgid ) )
            $tipo_grant = in_array($pgid, $sessione->pg_propri) ? $TIPO_GRANT_PG_PROPRIO : $TIPO_GRANT_PG_ALTRI;

        if( !in_array( $funzione.$tipo_grant, $sessione->permessi_giocatore ) )
            throw new Exception( "Non hai i permessi per compiere questa operazione: <code>$funzione$tipo_grant</code>" );
    }

	private function controllaDatiRegistrazione( $nome, $cognome, $note, $mail, $pass1, $pass2, $condizioni )
	{
		$errors = "";
		
		if ( $nome === "" || Utils::soloSpazi($nome) )
			$errors .= "Il campo Nome non pu&ograve; essere vuoto.<br>";

		if ( $cognome === "" || Utils::soloSpazi($cognome) )
			$errors .= "Il campo Cognome non pu&ograve; essere vuoto.<br>";

		if ( $mail === "" || Utils::soloSpazi($mail) )
			$errors .= "Il campo Mail non pu&ograve; essere vuoto.<br>";
		else if ( !Utils::controllaMail($mail) )
			$errors .= "Il campo Mail contiene un indirizzo non valido.<br>";

		if ( $pass1 === "" || Utils::soloSpazi($pass1) )
			$errors .= "Il primo campo Password non pu&ograve; essere vuoto.<br>";

		if ( $pass2 === "" || Utils::soloSpazi($pass2) )
			$errors .= "Il secondo campo Password non pu&ograve; essere vuoto.<br>";

		if( $pass1 !== "" && !Utils::soloSpazi($pass1) &&
			$pass2 !== "" && !Utils::soloSpazi($pass2) &&
			$pass1 !== $pass2
		)
			$errors .= "Le password inserite non combaciano.<br>";
			
		if( !isset( $condizioni ) || ( isset( $condizioni ) && $condizioni !== "on" ) )
			$errors .= "Non &egrave; possibile registrarsi senza accettare i termini e le condizioni.";
		
		return $errors;
	}
	
	public function login( $mail, $pass )
	{
		$query_grants  = "SELECT gi.email_giocatore, gi.nome_giocatore, gr.nome_grant AS permessi FROM giocatori AS gi
                            LEFT OUTER JOIN ruoli_has_grants AS rhg ON gi.ruoli_id_ruolo = rhg.ruoli_id_ruolo
                            LEFT OUTER JOIN reboot_live.grants AS gr ON gr.id_grant = rhg.grants_id_grant
                            WHERE gi.email_giocatore = :mail AND 
                                  gi.password_giocatore = :pass";

		$params = array( ":mail" => $mail, ":pass" => sha1( $pass ) );
		$result = $this->db->doQuery( $query_grants, $params, False );
		
		if( count( $result ) === 0 )
			throw new Exception( "Email utente o password sono errati. Per favore riprovare." );

		$query_pg_propri = "SELECT id_personaggio FROM personaggi WHERE giocatori_email_giocatore = :email";
        $pg_propri       = $this->db->doQuery( $query_pg_propri, array( ":email" => $mail ), False );
		
		$this->session->email_giocatore    = $result[0]["email_giocatore"];
		$this->session->nome_giocatore     = $result[0]["nome_giocatore"];
		$this->session->permessi_giocatore = array_map( "Utils::mappaPermessiUtente", $result );
		$this->session->pg_propri          = array_map( "Utils::mappaPGUtente", $pg_propri );

		return "{\"status\": \"ok\", \"user_info\": { \"email_giocatore\":\"".$this->session->email_giocatore."\",\"nome_giocatore\":\"".$result[0]["nome_giocatore"]."\", \"permessi\":".json_encode( $this->session->permessi_giocatore )."} }";
	}

	public function controllaaccesso( )
	{
	    $section = func_get_arg(0);
		if( !isset( $this->session ) || ( isset( $this->session ) && !in_array( "visualizza_pagina_".$section, $this->session->permessi_giocatore ) ) )
            throw new Exception( "Impossibile accedere a questa sezione." );

		return "{\"status\": \"ok\"}";
	}

	public function logout( )
	{
		$this->session->destroy();

		return "{\"status\": \"ok\"}";
	}
	
	public function registra( $nome, $cognome, $cf, $note, $mail, $pass1, $pass2, $condizioni )
	{
		$errors = $this->controllaDatiRegistrazione( $nome, $cognome, $cf, $note, $mail, $pass1, $pass2, $condizioni );
		
		if( isset( $errors ) && $errors !== "" )
			throw new Exception($errors);
		
		$pass   = sha1( $pass1 );
		$query  = "INSERT INTO giocatori VALUES (:cf,:pass,:nome,:cognome,:mail,NOW(),:note,NULL,4)";
		$params = array(
			":cf"      => $cf, 
			":pass"    => $pass,
			":nome"    => $nome,
			":cognome" => $cognome,
			":mail"    => $mail,
			":note"    => $note
		);
		
		$result = $this->db->doQuery( $query, $params );
		//$this->mailer->sendMail( "registrazione", $mail, $nome, $pass  ); //TODO

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