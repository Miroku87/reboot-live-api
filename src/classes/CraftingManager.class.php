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
    
    public function __construct( $idev_in_corso = NULL )
    {
        $this->idev_in_corso = $idev_in_corso;
        $this->db = new DatabaseBridge();
        $this->session = SessionManager::getInstance();
    }
    
    public function __destruct()
    {
    }
    
    public function inserisciRicettaNetrunner( $pgid, $programmi )
    {
        global $GRANT_VISUALIZZA_CRAFT_PROGRAM;
        
        UsersManager::operazionePossibile( $this->session, $GRANT_VISUALIZZA_CRAFT_PROGRAM );
        
        $nome_programma = $programmi[0]["nome_programma"];
        $valori_usati   = [];
        $risultati      = [];
        unset($programmi[0]["nome_programma"]);
    
        foreach ($programmi as $p)
        {
            $sql_x = "SELECT effetto_valore_crafting AS effetto, parametro_collegato_crafting AS pcc FROM crafting_programmazione WHERE parametro_crafting = 'X1' AND valore_parametro_crafting = :x_val";
            $res_x = $this->db->doQuery($sql_x, [":x_val" => $p["x_val"]], False);
            
            $sql_y = "SELECT effetto_valore_crafting AS effetto, parametro_collegato_crafting AS pcc FROM crafting_programmazione WHERE parametro_crafting = :pcc AND valore_parametro_crafting = :y_val";
            $res_y = $this->db->doQuery($sql_y, [":pcc" => $res_x[0]["pcc"], ":y_val" => $p["y_val"]], False);
            
            $sql_z = "SELECT effetto_valore_crafting AS effetto FROM crafting_programmazione WHERE parametro_crafting = :pcc AND valore_parametro_crafting = :z_val";
            $res_z = $this->db->doQuery($sql_z, [":pcc" => $res_y[0]["pcc"], ":z_val" => $p["z_val"]], False);
    
            $valori_usati[] = "X=".$p["x_val"]." - Y=".$p["y_val"]." - Z=".$p["z_val"];
            $risultati[] = $res_x[0]["effetto"]." - ".$res_y[0]["effetto"]." - ".$res_z[0]["effetto"];
        }
        
        $params = [
            ":idpg" => $pgid,
            ":tipo" => "Programmazione",
            ":nome" => $nome_programma,
            ":comps" => implode("@@", $valori_usati),
            ":res" => implode("@@", $risultati)
        ];
        
        $sql_ricetta = "INSERT INTO ricette VALUES (NULL, :idpg, NOW(), :tipo, :nome, :comps, :res, 0, NULL, NULL )";
        $this->db->doQuery( $sql_ricetta, $params, False );
        
        $output = ["status" => "ok", "result"=> true];
        
        return json_encode($output);
    }
    
    public function inserisciRicettaTecnico( $pgid, $batteria, $struttura, $applicativo )
    {
        global $GRANT_VISUALIZZA_CRAFT_TECNICO;
    
        UsersManager::operazionePossibile( $this->session, $GRANT_VISUALIZZA_CRAFT_TECNICO );
    
    }
    
    public function inserisciRicettaMedico( $pgid, $substrato, $principio_att, $psicotropo )
    {
        global $GRANT_VISUALIZZA_CRAFT_CHIMICO;
    
        UsersManager::operazionePossibile( $this->session, $GRANT_VISUALIZZA_CRAFT_CHIMICO );
    
    }
    
    public function recuperaRicette( $draw, $columns, $order, $start, $length, $search, $pgid = NULL )
    {
        UsersManager::operazionePossibile( $this->session, __FUNCTION__, $pgid );
        
    }
}