<?php
$path = $_SERVER['DOCUMENT_ROOT']."/reboot-live-api/src/";
include_once($path."classes/DatabaseBridge.class.php");

function decodeObjects( $db, $tabella )
{
    $query  = "SELECT id_messaggio, oggetto_messaggio FROM $tabella WHERE oggetto_messaggio LIKE 'Re\%%'";
    $result = $db->doQuery( $query, [], False );
    
    foreach ($result as $r)
    {
        $ogg = $r["oggetto_messaggio"];
        $occ = substr_count($ogg, 'Re%');
        
        for ($i = 0; $i <= $occ; $i++)
        {
            $ogg = rawurldecode($ogg);
            $ogg = preg_replace("/(Re: )+/","Re: ",$ogg);
        }
        
        $ogg_dec = rawurlencode($ogg);
//        $update  = "UPDATE $tabella SET oggetto_messaggio = :ogg WHERE id_messaggio = :id";
//        $db->doQuery( $update, [ ':ogg' => $ogg_dec, ':id' => $r["id_messaggio"] ], False );
        echo $ogg_dec . "<br>";
    }
}

$db = new DatabaseBridge();

echo "<html class=\"\"><head><meta charset=\"utf-8\"></head><body>";
decodeObjects( $db, "messaggi_fuorigioco" );
decodeObjects( $db,"messaggi_ingioco" );
echo "</body></html>";