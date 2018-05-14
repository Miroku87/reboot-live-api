<?php

$path = $_SERVER['DOCUMENT_ROOT']."/reboot-live-api/src/";
include_once($path."classes/APIException.class.php");
include_once($path."classes/UsersManager.class.php");
include_once($path."classes/DatabaseBridge.class.php");
include_once($path."classes/SessionManager.class.php");
include_once($path."classes/Utils.class.php");
include_once($path."config/constants.php");

class TransactionManager
{
    protected $idev_in_corso;
    protected $session;
    protected $db;
    
    public function __construct($idev_in_corso = NULL)
    {
        $this->idev_in_corso = $idev_in_corso;
        $this->db = new DatabaseBridge();
        $this->session = SessionManager::getInstance();
    }
    
    public function __destruct()
    {
    }
    
    public function inserisciTransazione( $id_debitore, $id_creditore = NULL, $note = NULL, $id_acq_comp = NULL )
    {
        UsersManager::operazionePossibile( $this->session, __FUNCTION__ );
        
        $params = [
            ":pgdeb" => $id_debitore
        ];
        
        if( isset($id_creditore) )
        {
            $cred_macro = ":pgcred";
            $params[$cred_macro] = $id_creditore;
        }
        else
            $cred_macro = "NULL";
        
        if( isset($note) )
        {
            $note_macro = ":note";
            $params[$note_macro] = $note;
        }
        else
            $note_macro = "NULL";
        
        if( isset($id_acq_comp) )
        {
            $id_acq_comp_macro = ":idacqcomp";
            $params[$id_acq_comp_macro] = $id_acq_comp;
        }
        else
            $id_acq_comp_macro = "NULL";
        
        $sql_ins = "INSERT INTO transizioni_bit (debitore_transizione, creditore_transizione, note_transizione, id_acquisto_componente) VALUES (:pgdeb,$cred_macro,$note_macro,$id_acq_comp_macro)";
        $this->db->doQuery( $sql_ins, $params, False );
        
        $output = ["status" => "ok", "result" => true];
        
        return json_encode($output);
    }
    
    public function compraComponenti( $ids )
    {
        UsersManager::operazionePossibile( $this->session, __FUNCTION__ );
        
        if( !isset($this->session->pg_loggato->id_personaggio) )
            throw new APIException("Devi essere loggato con un personaggio per compiere questa operazione.");
        
        $marcatori = str_repeat("?, ", count($ids) - 1) . "?";
        $sql = "SELECT   id_componente
                        ,costo_attuale_componente
                 FROM componenti_crafting WHERE id_componente IN ($marcatori)";
        $risultati = $this->db->doQuery($sql, $ids, False);
        
        $totale      = 0;
        $params_comp = [];
        
        
        foreach( $ids as $i )
        {
            $componente = Utils::filtraArrayDiArrayAssoc($risultati, "id_componente", $i)[0];
            $totale += (int)$componente["costo_attuale_componente"];
            $params_comp[] = [ ":idpg" => $this->session->pg_loggato->id_personaggio, ":idcomp" => $i, ":costo" => $componente["costo_attuale_componente"] ];
        }
        
        $sql_check = "SELECT id_personaggio FROM personaggi WHERE credito_personaggio >= :tot AND id_personaggio = :idpg";
        $ris_check = $this->db->doQuery( $sql_check, [ ":tot" => $totale, "idpg" => $this->session->pg_loggato->id_personaggio ], False );
        
        if( !isset($ris_check) || count($ris_check) === 0 )
            throw new APIException("Non hai abbastanza Bit per completare l'acquisto.");
        
        $sql_acq_comp = "INSERT INTO componenti_acquistati (cliente_acquisto, id_componente_acquisto, importo_acquisto) VALUES (:idpg, :idcomp, :costo)";
        
        foreach ($params_comp as $p)
        {
            $id_acq_com   = $this->db->doQuery( $sql_acq_comp, $p, False );
            $this->inserisciTransazione( $p[":pgid"], NULL, "Acquisto componente ".$p[":idcomp"]." dal RavShop.", $id_acq_com );
        }
        
        $output = [
            "status" => "ok"
        ];
        
        return json_encode($output);
    }
}