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

    static function operazionePossibile( $sessione, $funzione, $id = NULL )
    {
        global $TIPO_GRANT_PG_PROPRIO;
        global $TIPO_GRANT_PG_ALTRI;

        $tipo_grant = "";

        UsersManager::controllaLogin( $sessione );

        if( isset( $id ) && in_array($id, $sessione->pg_propri) )
            $tipo_grant = in_array($id, $sessione->pg_propri) ? $TIPO_GRANT_PG_PROPRIO : $TIPO_GRANT_PG_ALTRI;
        else if ( isset( $id ) && !in_array($id, $sessione->pg_propri) )
            $tipo_grant = $tipo_grant && $id === $sessione->email_giocatore ? $TIPO_GRANT_PG_PROPRIO : $TIPO_GRANT_PG_ALTRI;

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
	    if( !Utils::controllaMail($mail) )
	        throw new Exception("La mail inserita non &egrave; valida. Riprova con un'altra.");
	    
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
        
        if( count($pg_propri) === 0 )
            $pg_propri = [];
        
        $this->session->destroy();
        $this->session                     = SessionManager::getInstance();
		$this->session->email_giocatore    = $result[0]["email_giocatore"];
		$this->session->nome_giocatore     = $result[0]["nome_giocatore"];
		$this->session->permessi_giocatore = array_map( "Utils::mappaPermessiUtente", $result );
		$this->session->pg_propri          = array_map( "Utils::mappaPGUtente", $pg_propri );

		$json =  "{\"status\": \"ok\", \"user_info\": {
            \"email_giocatore\":\"".$this->session->email_giocatore."\",
            \"nome_giocatore\":\"".$result[0]["nome_giocatore"]."\",
            \"pg_propri\":".json_encode( $this->session->pg_propri ).",
            \"permessi\":".json_encode( $this->session->permessi_giocatore )."
		}}";
        $json = trim(preg_replace('/\s+/', ' ', $json));
        
		return $json;
	}

	public function controllaaccesso( )
	{
	    $section = func_get_arg(0);
		if( !isset( $this->session ) || ( isset( $this->session ) && !in_array( "visualizza_pagina_".$section, $this->session->permessi_giocatore ) ) )
            throw new Exception( "Impossibile accedere a questa sezione." );

		return "{\"status\": \"ok\"}";
	}

	public function controllaPWD( $pass )
	{
        $query_pwd  = "SELECT * FROM giocatori WHERE email_giocatore = :mail AND password_giocatore = :pass";
        $params = array( ":mail" => $this->session->email_giocatore, ":pass" => sha1( $pass ) );
        $result = $this->db->doQuery( $query_pwd, $params, False );

        if( count( $result ) > 0 )
            $json = "{\"status\": \"ok\"}";
        else
            $json = "{\"status\": \"error\", \"message\":\"Password errata.\"}";

		return $json;
	}

	public function logout( )
	{
		$this->session->destroy();

		return "{\"status\": \"ok\"}";
	}
	
	public function registra( $nome, $cognome, $note, $mail, $pass1, $pass2, $condizioni )
	{
	    //TODO: controllare che non esista già un utente con la mail
		$errors = $this->controllaDatiRegistrazione( $nome, $cognome, $note, $mail, $pass1, $pass2, $condizioni );
		
		if( isset( $errors ) && $errors !== "" )
			throw new Exception($errors);
		
		$pass   = sha1( $pass1 );
		$query  = "INSERT INTO giocatori (email_giocatore, password_giocatore, nome_giocatore, cognome_giocatore, note_giocatore) VALUES (:mail,:pass,:nome,:cognome,:note)";
		$params = array(
			":pass"    => $pass,
			":nome"    => $nome,
			":cognome" => $cognome,
			":mail"    => $mail,
			":note"    => $note
		);
		
		$this->db->doQuery( $query, $params );
		
		$this->mailer->inviaMailRegistrazione( $mail, $nome." ".$cognome, $pass1  );

		return "{\"status\": \"ok\"}";
	}
	
	public function recuperaPassword( $mail )
	{
        if( !Utils::controllaMail($mail) )
            throw new Exception("La mail inserita non &egrave; valida.");
        
		$query_check = "SELECT CONCAT(nome_giocatore, ' ', cognome_giocatore) as nome_completo FROM giocatori WHERE email_giocatore = :id";
		$giocatore = $this->db->doQuery( $query_check, array( ":id" => $mail ), False );
	 
		if( count( $giocatore ) < 1 )
		    throw new Exception("La mail inserita non esiste.");
				
	    $new_pass = Utils::generatePassword();
		
		$pass   = sha1( $new_pass );
		$query  = "UPDATE giocatori SET password_giocatore = :pass WHERE email_giocatore = :id";
		$params = array(
			":pass" => $pass,
			":id"   => $mail,
		);
		
		$this->db->doQuery( $query, $params, False );
		$this->mailer->inviaMailRecuperoPassowrd( $mail, $giocatore[0]["nome_completo"], $new_pass  );

		return "{\"status\": \"ok\"}";
	}
	
	public function recuperaListaGiocatori( $draw, $columns, $order, $start, $length, $search )
    {
        UsersManager::operazionePossibile( $this->session, __FUNCTION__ );
        
        $where = "";
        $params = array();
        
        if( isset( $search ) && $search["value"] != "" )
        {
            $params[":search"] = "%$search[value]%";
            $where = "AND (
						gi2.nome_giocatore LIKE :search OR
						gi2.email_giocatore LIKE :search OR
						gi2.nome_ruolo LIKE :search OR
						gi2.note_giocatore LIKE :search OR
						gi2.note_staff_giocatore LIKE :search
					  )";
***REMOVED***
        
        if( isset( $order ) )
        {
            $sorting = array();
            foreach ( $order as $elem )
                $sorting[] = "gi2.".$columns[$elem["column"]]["data"]." ".$elem["dir"];
            
            $order_str = "ORDER BY ".implode( $sorting, "," );
***REMOVED***
        
        $query_players = "SELECT * FROM (
                            SELECT CONCAT(gi.nome_giocatore, ' ', gi.cognome_giocatore) AS nome_completo, gi.*, ru.nome_ruolo
                              FROM giocatori AS gi
                              JOIN ruoli AS ru ON ru.id_ruolo = gi.ruoli_id_ruolo ) AS gi2 WHERE gi2.eliminato_giocatore = 0 $where $order_str";
        $risultati = $this->db->doQuery( $query_players, $params, False );
        $totale    = count($risultati);
    
        if( count($risultati) > 0 )
            $risultati = array_splice($risultati, $start, $length);
        else
            $risultati = array();
    
        $output     = array(
            "draw"            => $draw,
            "columns"         => $columns,
            "order"           => $order,
            "start"           => $start,
            "length"          => $length,
            "search"          => $search,
            "recordsTotal"    => $totale,
            "recordsFiltered" => count($risultati),
            "data"            => $risultati
        );
    
        return json_encode( $output );
	}
	
	public function modificaUtente( $cf, $aggiornamenti )
	{
	
	}
	
	public function eliminaGiocatore( $id )
	{
        UsersManager::operazionePossibile($this->session, __FUNCTION__);
        
        $query_canc_pg = "UPDATE giocatori SET eliminato_giocatore = 1 WHERE email_giocatore = :id";
        $this->db->doQuery( $query_canc_pg, array( ":id" => $id ), False );
        
        return "{ \"status\":\"ok\" }";
	}
}