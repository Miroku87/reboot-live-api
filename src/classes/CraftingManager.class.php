<?php

$path = $_SERVER['DOCUMENT_ROOT']."/reboot-live-api/src/";
include_once($path."classes/APIException.class.php");
include_once($path."classes/UsersManager.class.php");
include_once($path."classes/DatabaseBridge.class.php");
include_once($path."classes/SessionManager.class.php");
include_once($path."classes/Utils.class.php");
include_once($path."config/constants.php");

class CraftingManager
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
    
    public function inserisciRicettaNetrunner($pgid, $programmi)
    {
        global $GRANT_VISUALIZZA_CRAFT_PROGRAM;
        
        UsersManager::operazionePossibile($this->session, $GRANT_VISUALIZZA_CRAFT_PROGRAM);
        
        $nome_programma = $programmi[0]["nome_programma"];
        $risultati = [];
        unset($programmi[0]["nome_programma"]);
        
        foreach ($programmi as $p)
        {
            $sql_x = "SELECT effetto_valore_crafting AS effetto, parametro_collegato_crafting AS pcc FROM crafting_programmazione WHERE parametro_crafting = 'X1' AND valore_parametro_crafting = :x_val";
            $res_x = $this->db->doQuery($sql_x, [":x_val" => $p["x_val"]], False);
            
            $sql_y = "SELECT effetto_valore_crafting AS effetto, parametro_collegato_crafting AS pcc FROM crafting_programmazione WHERE parametro_crafting = :pcc AND valore_parametro_crafting = :y_val";
            $res_y = $this->db->doQuery($sql_y, [":pcc" => $res_x[0]["pcc"], ":y_val" => $p["y_val"]], False);
            
            $sql_z = "SELECT effetto_valore_crafting AS effetto FROM crafting_programmazione WHERE parametro_crafting = :pcc AND valore_parametro_crafting = :z_val";
            $res_z = $this->db->doQuery($sql_z, [":pcc" => $res_y[0]["pcc"], ":z_val" => $p["z_val"]], False);
            
            $risultati[] = $res_x[0]["effetto"] . " - " . $res_y[0]["effetto"] . " - " . $res_z[0]["effetto"];
        }
        
        $risultato_crafting = implode("@@", $risultati);
        
        $sql_progr = "SELECT id_unico_risultato FROM ricette WHERE risultato_ricetta = :risultato";
        $progr_id = $this->db->doQuery($sql_progr, [":risultato" => $risultato_crafting], False);
        
        if (!isset($progr_id) || count($progr_id) === 0)
        {
            $sql_id_res = "SELECT IFNULL( MAX( COALESCE(id_unico_risultato, 0) ), 0) AS id_unico_risultato FROM ricette WHERE tipo_ricetta = :tipo";
            $progr_id = $this->db->doQuery($sql_id_res, [":tipo" => "Programmazione"], False);
            $progr_id[0]["id_unico_risultato"] = (int)$progr_id[0]["id_unico_risultato"] + 1;
        }
        
        $params = [
            ":idpg" => $pgid,
            ":tipo" => "Programmazione",
            ":tipo_ogg" => "Programma",
            ":nome" => $nome_programma,
            ":res" => $risultato_crafting,
            ":id_res" => (int)$progr_id[0]["id_unico_risultato"]
        ];
        
        $sql_ricetta = "INSERT INTO ricette (id_ricetta, personaggi_id_personaggio, data_inserimento_ricetta, tipo_ricetta, tipo_oggetto, nome_ricetta, risultato_ricetta, approvata_ricetta, id_unico_risultato)
                          VALUES (NULL, :idpg, NOW(), :tipo, :tipo_ogg, :nome, :res, 0, :id_res )";
        $id_nuova    = $this->db->doQuery($sql_ricetta, $params, False);
    
        foreach ($programmi as $k => $p)
        {
            $inserts[] = [":idcomp" => "X=" . $p["x_val"], ":idric" => $id_nuova, ":ord" => $k];
            $inserts[] = [":idcomp" => "Y=" . $p["y_val"], ":idric" => $id_nuova, ":ord" => $k];
            $inserts[] = [":idcomp" => "Z=" . $p["z_val"], ":idric" => $id_nuova, ":ord" => $k];
        }
        
        $sql_componenti = "INSERT INTO componenti_ricetta VALUES (:idcomp,:idric,:ord)";
        $this->db->doMultipleManipulations( $sql_componenti, $inserts, False );
        
        $output = ["status" => "ok", "result" => true];
        
        return json_encode($output);
    }
    
    public function inserisciRicettaTecnico( $pgid, $nome, $tipo, $batterie, $strutture, $applicativi )
    {
        global $GRANT_VISUALIZZA_CRAFT_TECNICO;
        
        UsersManager::operazionePossibile($this->session, $GRANT_VISUALIZZA_CRAFT_TECNICO);
        
        $tutti_id  = array_merge($batterie, $strutture, $applicativi);
        $marcatori = str_repeat( "?, ", count($tutti_id) - 1 )."?";
        $sql_check = "SELECT SUM(COALESCE(volume_componente,0)) AS volume_rimanente, SUM(COALESCE(energia_componente,0)) AS energia_rimanente
                        FROM componenti_crafting
                        WHERE id_componente IN ($marcatori)";
        $check_res = $this->db->doQuery( $sql_check, $tutti_id, False);
        
        if( isset($check_res) && count($check_res) > 0 )
        {
            foreach ( $check_res[0] as $c )
            {
                if( (int)$c < 0 )
                    throw new APIException("Il crafting non &egrave; andato a buon fine. Riprovare.");
            }
        }
        else
            throw new APIException("Il crafting non &egrave; andato a buon fine. Riprovare.");
    
        $params = [
            ":idpg" => $pgid,
            ":tipo" => "Tecnico",
            ":tipo_ogg" => $tipo,
            ":nome" => $nome
        ];
    
        $sql_ricetta = "INSERT INTO ricette (id_ricetta, personaggi_id_personaggio, data_inserimento_ricetta, tipo_ricetta, tipo_oggetto, nome_ricetta)
                          VALUES (NULL, :idpg, NOW(), :tipo, :tipo_ogg, :nome, :res, 0, :id_res )";
        $id_nuova    = $this->db->doQuery($sql_ricetta, $params, False);
    
        foreach ($tutti_id as $id)
            $inserts[] = [":idcomp" => $id, ":idric" => $id_nuova];
    
        $sql_componenti = "INSERT INTO componenti_ricetta VALUES (:idcomp,:idric,:ord)";
        $this->db->doMultipleManipulations( $sql_componenti, $inserts, False );
    
        $output = ["status" => "ok", "result" => true];
    
        return json_encode($output);
    }
    
    public function inserisciRicettaMedico($pgid, $substrato, $principio_att, $psicotropo)
    {
        global $GRANT_VISUALIZZA_CRAFT_CHIMICO;
        
        UsersManager::operazionePossibile($this->session, $GRANT_VISUALIZZA_CRAFT_CHIMICO);
        
    }
    
    public function modificaRicetta($id_r, $modifiche)
    {
        UsersManager::operazionePossibile($this->session, __FUNCTION__);
        
        $to_update = implode(" = ?, ", array_keys($modifiche)) . " = ?";
        $valori = array_values($modifiche);
        $valori[] = $id_r;
        
        $query = "UPDATE ricette SET $to_update WHERE id_ricetta = ?";
        
        $this->db->doQuery($query, $valori, False);
        
        return "{\"status\": \"ok\",\"result\": \"true\"}";
    }
    
    public function recuperaRicette($draw, $columns, $order, $start, $length, $search, $pgid = -1)
    {
        UsersManager::operazionePossibile($this->session, __FUNCTION__, $pgid);
        
        $filter = False;
        $where = [];
        $order_str = "";
        $params = [];
        $campi_prvt = ["ri.risultato_ricetta", "ri.id_unico_risultato", "ri.note_ricetta", "ri.extra_cartellino_ricetta"];
        $campi_str = (int)$pgid === -1 ? ", " . implode(", ", $campi_prvt) : "";
        
        if (isset($search) && isset($search["value"]) && $search["value"] != "")
        {
            $filter = True;
            $params[":search"] = "%$search[value]%";
            $where[] = " (
						r.nome_giocatore LIKE :search OR
						r.personaggi_id_personaggio LIKE :search OR
						r.nome_personaggio LIKE :search OR
						r.tipo_ricetta LIKE :search OR
						r.componenti_ricetta LIKE :search OR
						r.risultato_ricetta LIKE :search OR
						r.note_ricetta LIKE :search OR
						r.note_pg_ricetta LIKE :search OR
						r.extra_cartellino_ricetta LIKE :search OR
						r.data_inserimento_it LIKE :search
					  )";
        }
        
        if (isset($order) && !empty($order) && count($order) > 0)
        {
            $sorting = array();
            foreach ($order as $elem)
                $sorting[] = "r." . $columns[$elem["column"]]["data"] . " " . $elem["dir"];
            
            $order_str = "ORDER BY " . implode($sorting, ",");
        }
        
        if ((int)$pgid > 0)
        {
            $where[] = "r.personaggi_id_personaggio = :pgid";
            $params[":pgid"] = $pgid;
        }
        
        if (count($where) > 0)
            $where = "WHERE " . implode(" AND ", $where);
        else
            $where = "";
        
        $query_ric = "SELECT * FROM
                      (
                        SELECT  ri.id_ricetta,
                                ri.personaggi_id_personaggio,
                                DATE_FORMAT( ri.data_inserimento_ricetta, '%d/%m/%Y %H:%i:%s' ) as data_inserimento_it,
                                ri.data_inserimento_ricetta,
                                ri.tipo_ricetta,
                                ri.tipo_oggetto,
                                ri.nome_ricetta,
                                GROUP_CONCAT( DISTINCT cc.nome_componente SEPARATOR '; ') as componenti_ricetta,
                                ri.approvata_ricetta,
                                ri.note_pg_ricetta,
                                CONCAT(gi.nome_giocatore,' ',gi.cognome_giocatore) AS nome_giocatore,
                                pg.nome_personaggio
                                $campi_str
                        FROM ricette AS ri
                            JOIN personaggi AS pg ON pg.id_personaggio = ri.personaggi_id_personaggio
                            JOIN giocatori AS gi ON gi.email_giocatore = pg.giocatori_email_giocatore
                            JOIN componenti_ricetta AS cr ON ri.id_ricetta = cr.ricette_id_ricetta
                            JOIN componenti_crafting AS cc ON cr.componenti_crafting_id_componente = cc.id_componente
                        GROUP BY ri.id_ricetta
                      ) AS r $where $order_str";
        
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
    
    public function recupeRaricetteConId($ids)
    {
        UsersManager::operazionePossibile($this->session, "recuperaRicette", -1);
        
        $marcatori = str_repeat("?, ", count($ids) - 1) . "?";
        $query_ric = "SELECT * FROM ricette WHERE id_ricetta IN ($marcatori)";
        $risultati = $this->db->doQuery($query_ric, $ids, False);
        
        $output = [
            "status" => "ok",
            "result" => $risultati
        ];
        
        return json_encode($output);
    }
    
    private function recuperaComponenti($draw, $columns, $order, $start, $length, $search, $where = [])
    {
        $filter = False;
        $order_str = "";
        $params = [];
        $campi = Utils::mappaArrayDiArrayAssoc($columns, "data");
        $campi_str = implode(",", $campi);
        
        if (isset($search) && isset($search["value"]) && $search["value"] != "")
        {
            $filter = True;
            $params[":search"] = "%$search[value]%";
            $where[] = " (
						id_componente LIKE :search OR
                        nome_componente LIKE :search OR
                        tipo_componente LIKE :search OR
                        costo_attuale_componente LIKE :search OR
                        costo_vecchio_componente LIKE :search OR
                        valore_param_componente LIKE :search OR
                        volume_componente LIKE :search OR
                        energia_componente LIKE :search OR
                        tipo_supporto_componente LIKE :search OR
                        tipo_sostanza_componente LIKE :search OR
                        fattore_legame_componente LIKE :search OR
                        curativo_primario_componente LIKE :search OR
                        psicotropo_primario_componente LIKE :search OR
                        tossico_primario_componente LIKE :search OR
                        curativo_secondario_componente LIKE :search OR
                        psicotropo_secondario_componente LIKE :search OR
                        tossico_secondario_componente LIKE :search OR
                        possibilita_dipendeza_componente LIKE :search OR
                        descrizione LIKE :search
					  )";
        }
        
        if (isset($order) && !empty($order) && count($order) > 0)
        {
            $sorting = array();
            foreach ($order as $elem)
                $sorting[] = "r." . $columns[$elem["column"]]["data"] . " " . $elem["dir"];
            
            $order_str = "ORDER BY " . implode($sorting, ",");
        }
        
        if (count($where) > 0)
            $where = "WHERE " . implode(" AND ", $where);
        else
            $where = "";
        
        $query_ric = "SELECT $campi_str FROM componenti_crafting $where $order_str";
        
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
    
    public function recuperaComponentiBase( $tipo_crafting )
    {
        UsersManager::operazionePossibile($this->session, __FUNCTION__);
        /*
						id_componente LIKE :search OR
                        nome_componente LIKE :search OR
                        tipo_componente LIKE :search OR
                        costo_attuale_componente LIKE :search OR
                        costo_vecchio_componente LIKE :search OR
                        valore_param_componente LIKE :search OR
                        volume_componente LIKE :search OR
                        energia_componente LIKE :search OR
                        tipo_supporto_componente LIKE :search OR
                        tipo_sostanza_componente LIKE :search OR
                        fattore_legame_componente LIKE :search OR
                        curativo_primario_componente LIKE :search OR
                        psicotropo_primario_componente LIKE :search OR
                        tossico_primario_componente LIKE :search OR
                        curativo_secondario_componente LIKE :search OR
                        psicotropo_secondario_componente LIKE :search OR
                        tossico_secondario_componente LIKE :search OR
                        possibilita_dipendeza_componente LIKE :search OR
                        descrizione LIKE :search*/
        $campi = [
            [ "data" => "id_componente" ],
            [ "data" => "nome_componente" ],
            [ "data" => "tipo_componente" ],
            [ "data" => "costo_attuale_componente" ],
            [ "data" => "costo_vecchio_componente" ],
            [ "data" => "valore_param_componente" ],
            [ "data" => "volume_componente" ],
            [ "data" => "energia_componente" ]
        ];
        
        return $this->recuperaComponenti(1, $campi, [],0,99999, NULL, ["tipo_crafting_componente = '$tipo_crafting'"]);
    }
}