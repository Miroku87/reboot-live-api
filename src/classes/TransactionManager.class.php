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
    
    public function inserisciTransazione( $id_debitore, $importo, $id_creditore = NULL, $note = NULL, $id_acq_comp = NULL )
    {
        UsersManager::operazionePossibile( $this->session, __FUNCTION__ );
    
        $sql_check = "SELECT id_personaggio FROM personaggi WHERE credito_personaggio >= :tot AND id_personaggio = :idpg";
        $ris_check = $this->db->doQuery( $sql_check, [ ":tot" => $importo, ":idpg" => $id_debitore ], False );
    
        if( !isset($ris_check) || count($ris_check) === 0 )
            throw new APIException("Non hai abbastanza Bit per completare l'acquisto.");
        
        $params = [
            ":pgdeb" => $id_debitore,
            ":importo" => $importo
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
        
        $sql_ins = "INSERT INTO transazioni_bit (debitore_transazione, creditore_transazione, importo_transazione, note_transazione, id_acquisto_componente) VALUES (:pgdeb,$cred_macro,:importo,$note_macro,$id_acq_comp_macro)";
        $this->db->doQuery( $sql_ins, $params, False );
        
        $output = ["status" => "ok", "result" => true];
        
        return json_encode($output);
    }
    
    public function compraComponenti( $ids )
    {
        global $SCONTO_MERCATO;
        global $QTA_PER_SCONTO_MERCATO;
        
        UsersManager::operazionePossibile( $this->session, __FUNCTION__ );
        
        if( !isset($this->session->pg_loggato) )
            throw new APIException("Devi essere loggato con un personaggio per compiere questa operazione.");
        
        if( !isset($ids) || count($ids) === 0 )
            throw new APIException( "Non ci sono articoli nel carrello." );
        
        $marcatori = str_repeat("?, ", count($ids) - 1) . "?";
        $sql = "SELECT   id_componente
                        ,costo_attuale_componente
                 FROM componenti_crafting WHERE id_componente IN ($marcatori)";
        $risultati = $this->db->doQuery($sql, $ids, False);
        
        $totale      = 0;
        $params_comp = [];
        
        foreach( $ids as $i )
        {
            $componente = Utils::filtraArrayDiArrayAssoc( $risultati, "id_componente", [ $i ] )[0];
            $totale += (int)$componente["costo_attuale_componente"];
            $params_comp[] = [ ":idpg" => $this->session->pg_loggato["id_personaggio"], ":idcomp" => $i, ":costo" => $componente["costo_attuale_componente"] ];
        }
        
        if( count( $ids ) % $QTA_PER_SCONTO_MERCATO === 0 )
            $totale = $totale - ( $totale * ( $SCONTO_MERCATO / 100 ) );
        
        $sql_check = "SELECT id_personaggio FROM personaggi WHERE credito_personaggio >= :tot AND id_personaggio = :idpg";
        $ris_check = $this->db->doQuery( $sql_check, [ ":tot" => $totale, ":idpg" => $this->session->pg_loggato["id_personaggio"] ], False );
        
        if( !isset($ris_check) || count($ris_check) === 0 )
            throw new APIException("Non hai abbastanza Bit per completare l'acquisto.");
        
        $sql_acq_comp = "INSERT INTO componenti_acquistati (cliente_acquisto, id_componente_acquisto, importo_acquisto) VALUES (:idpg, :idcomp, :costo)";
        
        foreach ($params_comp as $p)
        {
            $id_acq_com   = $this->db->doQuery( $sql_acq_comp, $p, False );
            $this->inserisciTransazione( $p[":idpg"], $p[":costo"], NULL, "Acquisto componente ".$p[":idcomp"]." dal RavShop.", $id_acq_com );
        }
        
        $output = [
            "status" => "ok",
            "result" => $totale
        ];
        
        return json_encode($output);
    }
    
    public function recuperaInfoBanca( )
    {
        if( !isset( $this->session->pg_loggato["id_personaggio"] ) )
            throw new APIException("Devi essere loggato con un personaggio per eseguire questa operazione.", APIException::$PG_LOGIN_ERROR );
        
        UsersManager::operazionePossibile( $this->session, __FUNCTION__, $this->session->pg_loggato["id_personaggio"] );
    
        $sql_check = "SELECT
                        ( SELECT credito_personaggio FROM personaggi WHERE id_personaggio = :idpg ) AS credito_personaggio,
                        ( SELECT COALESCE( SUM(importo_transazione), 0 ) FROM transazioni_bit WHERE YEAR(data_transazione) = YEAR(NOW()) AND creditore_transazione = :idpg ) as entrate_anno_personaggio,
                        ( SELECT COALESCE( SUM(importo_transazione), 0 ) FROM transazioni_bit WHERE YEAR(data_transazione) = YEAR(NOW()) AND debitore_transazione = :idpg ) as uscite_anno_personaggio";
        $ris_check = $this->db->doQuery( $sql_check, [ ":idpg" => $this->session->pg_loggato["id_personaggio"] ], False );
        
        $output = [
            "status" => "ok",
            "result" => $ris_check[0]
        ];
    
        return json_encode($output);
    }
    
    public function recuperaMovimenti( $draw, $columns, $order, $start, $length, $search, $tutti = False )
    {
        if( !$tutti && !isset( $this->session->pg_loggato["id_personaggio"] ) )
            throw new APIException("Devi essere loggato con un personaggio per eseguire questa operazione.", APIException::$PG_LOGIN_ERROR );
		
		if( $tutti )
			$pgid = -1;
		else
			$pgid = $this->session->pg_loggato["id_personaggio"];
        
        UsersManager::operazionePossibile( $this->session, __FUNCTION__, $pgid );
    
        $filter    = False;
        $where     = $tutti ? [] : [ "( t.debitore_transazione = :pgid OR t.creditore_transazione = :pgid )" ];
        $order_str = "";
        $params    = $tutti ? [] : [ ":pgid" => $pgid ];
    
        if (isset($search) && isset($search["value"]) && $search["value"] != "")
        {
            $filter = True;
            $params[":search"] = "%$search[value]%";
            $where[] = " (
						t.nome_creditore LIKE :search OR
						t.nome_debitore LIKE :search OR
						t.tipo_transazione LIKE :search OR
						t.note_transazione LIKE :search OR
						t.datait_transazione LIKE :search
					  )";
        }
        
        if( isset( $order ) && count($order) > 0 )
        {
            $order_by_field = $columns[$order[0]["column"]]["data"];
            $order_by_dir   = $order[0]["dir"];
            $order_str      = "ORDER BY t." . $order_by_field . " " . $order_by_dir;
        }
    
        if (count($where) > 0)
            $where = "WHERE " . implode(" AND ", $where);
        else
            $where = "";
    
        $query_ric = "SELECT * FROM
                      (
                        SELECT
                            tb.*,
                            DATE_FORMAT( tb.data_transazione, '%d/%m/%Y %H:%i:%s' ) as datait_transazione,
                            IF( tb.creditore_transazione = :pgid, 'entrata', 'uscita' ) as tipo_transazione,
                            IF( tb.id_acquisto_componente IS NOT NULL, 'RavShop', pgc.nome_personaggio ) as nome_creditore,
                            pgd.nome_personaggio as nome_debitore
                        FROM transazioni_bit AS tb
                            LEFT OUTER JOIN personaggi AS pgc ON pgc.id_personaggio = tb.creditore_transazione
                            JOIN personaggi AS pgd ON pgd.id_personaggio = tb.debitore_transazione
                      ) AS t $where $order_str";
    
        $risultati = $this->db->doQuery($query_ric, $params, False);
        $totale = count($risultati);
    
        if (count($risultati) > 0)
            $risultati = array_splice($risultati, $start, $length);
        else
            $risultati = array();
    
        $output = array(
            "status" => "ok",
            "draw" => $draw,
            "columns" => $columns,
            "order" => $order,
            "start" => $start,
            "length" => $length,
            "search" => $search,
            "recordsTotal" => $totale,
            "recordsFiltered" => $filter ? count($risultati) : $totale,
            "data" => $risultati
        );
    
        return json_encode($output);
    }
}