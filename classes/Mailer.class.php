<?php
$path = $_SERVER['DOCUMENT_ROOT'] . "/reboot-live-api/";
include_once($path . "classes/SessionManager.class.php");
include_once($path . "classes/Utils.class.php");
include_once($path . "config/constants.php");
include_once($path . "phpmailer/Exception.php");
include_once($path . "phpmailer/PHPMailer.php");
include_once($path . "phpmailer/SMTP.php");

use PHPMailer\PHPMailer\PHPMailer;

class Mailer
{
    protected $session;
    
    public function __construct()
    {
    }
    
    public function __destruct()
    {
    }
    
    private function impostaMailer()
    {
        global $MAIL_MITTENTE_INDIRIZZO;
        global $MAIL_MITTENTE_NOME;
        global $MAIL_PASSWORD;
        global $MAIL_HOST;
        global $MAIL_PORT;
        
        //Create a new PHPMailer instance
        $mail = new PHPMailer(true);
        //Tell PHPMailer to use SMTP
        $mail->isSMTP();
        //Enable SMTP debugging
        // 0 = off (for production use)
        // 1 = client messages
        // 2 = client and server messages
        $mail->SMTPDebug = 0;
        //Set the hostname of the mail server
        $mail->Host = $MAIL_HOST;
        // use
        // $mail->Host = gethostbyname('smtp.gmail.com');
        // if your network does not support SMTP over IPv6
        //Set the SMTP port number - 587 for authenticated TLS, a.k.a. RFC4409 SMTP submission
        $mail->Port = $MAIL_PORT;
        //Set the encryption system to use - ssl (deprecated) or tls
        $mail->SMTPSecure = 'tls';
        //Whether to use SMTP authentication
        $mail->SMTPAuth = true;
        //Username to use for SMTP authentication - use full email address for gmail
        $mail->Username = $MAIL_MITTENTE_INDIRIZZO;
        //Password to use for SMTP authentication
        $mail->Password = $MAIL_PASSWORD;
        //Set who the message is to be sent from
        $mail->setFrom($MAIL_MITTENTE_INDIRIZZO, $MAIL_MITTENTE_NOME);
        //Set an alternative reply-to address
        $mail->addReplyTo($MAIL_MITTENTE_INDIRIZZO, $MAIL_MITTENTE_NOME);
        
        return $mail;
    }
    
    public function inviaMailRegistrazione( $dest_indirizzo, $dest_nome, $pass )
    {
        $mail = $this->impostaMailer();
        //Set who the message is to be sent to
        $mail->addAddress($dest_indirizzo, $dest_nome);
        //Set the subject line
        $mail->Subject = 'Reboot Live: Registrazione Giocatore';
        //Read an HTML message body from an external file, convert referenced images to embedded,
        //convert HTML into a basic plain-text alternative body
        $mail->msgHTML( "Gentile giocatore,<br>
                         ti informiamo che il tuo account &egrave; stato creato.<br><br>
                         Qui di seguito i dati di accesso:<br>
                         <b>Nome Utente:</b> $dest_indirizzo<br>
                         <b>Password:</b> $pass" );
        //Replace the plain text body with one created manually
        $mail->AltBody = "Gentile giocatore,
                         ti informiamo che il tuo account e' stato creato.
                         
                         Qui di seguito i dati di accesso:
                         Nome Utente: $dest_indirizzo
                         Password: $pass";

        $mail->send();
    }
    
    public function inviaMailRecuperoPassowrd( $dest_indirizzo, $dest_nome, $pass )
    {
        $mail = $this->impostaMailer();
        //Set who the message is to be sent to
        $mail->addAddress($dest_indirizzo, $dest_nome);
        //Set the subject line
        $mail->Subject = 'Reboot Live: Recupero Password';
        //Read an HTML message body from an external file, convert referenced images to embedded,
        //convert HTML into a basic plain-text alternative body
        $mail->msgHTML( "Gentile giocatore,<br>
                         qui di seguito troverai i dati da te richiesti:<br><br>
                         <b>Nome Utente:</b> $dest_indirizzo<br>
                         <b>Password:</b> $pass" );
        //Replace the plain text body with one created manually
        $mail->AltBody = "Gentile giocatore,
                         qui di seguito troverai i dati da te richiesti:
                         Nome Utente: $dest_indirizzo
                         Password: $pass";

        $mail->send();
    }
}