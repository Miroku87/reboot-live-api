<?php

$DEBUG                          = False;
$MAINTENANCE                    = False;
$RETE_LOCALE                    = False;
$IP_MAINTAINER                  = ["82.48.82.184"];

$MAIL_ACCOUNT                   = "rebootlivegrv@gmail.com";
$MAIL_MITTENTE_INDIRIZZO        = "rebootlivegrv@gmail.com";
$MAIL_MITTENTE_NOME             = "Reboot GRV";
$MAIL_PASSWORD                  = "Reboot1234";
$MAIL_HOST                      = "smtp.gmail.com";
$MAIL_PORT                      = 587;

$SITE_URL                       = "http://localhost:9000";
$ALLOWED_ORIGINS                = [$SITE_URL];

$MYSQL_DUPLICATE_ENTRY_ERRCODE  = "1062";
$DB_ERR_DELIMITATORE            = "@@@";
$TIPO_GRANT_PG_PROPRIO          = "_proprio";
$TIPO_GRANT_PG_ALTRI            = "_altri";
$RUOLO_ADMIN                    = "admin";

$GRANT_MOSTRA_ALTRI_PG          = "mostraPersonaggi_altri";
$GRANT_VISUALIZZA_MAIN          = "visualizza_pagina_main";
$GRANT_VISUALIZZA_CRAFT_CHIMICO = "visualizza_pagina_crafting_chimico";
$GRANT_VISUALIZZA_CRAFT_PROGRAM = "visualizza_pagina_crafting_programmazione";
$GRANT_VISUALIZZA_CRAFT_TECNICO = "visualizza_pagina_crafting_ingegneria";
$GRANT_VISUALIZZA_NOTIZIE       = "visualizza_pagina_notizie";
$GRANT_VISUALIZZA_MERCATO       = "visualizza_pagina_mercato";
$GRANT_CRAFTA_ARMI              = "crafta_armi";
$GRANT_CRAFTA_PROTESI           = "crafta_protesi";
$GRANT_CRAFTA_GADGET_SHIELD     = "crafta_gadget_shield";
$GRANT_CRAFTA_SCUDI_ESOSCHELE   = "crafta_scudi_esoscheletri";
$GRANT_CREA_NOTIZIE             = "creaNotizia";
$GRANT_MODIFICA_NOTIZIE         = "modificaNotizia";

$PX_INIZIALI                    = 100;
$PC_INIZIALI                    = 4;
$PF_INIZIALI                    = 2;
$ANNO_PRIMO_LIVE                = 271;

$ID_RICETTA_PAG                 = 4;
$CRAFTING_ARMI                  = 48;
$CRAFTING_PROTESI               = 49;
$CRAFTING_GADGET_SHIELD         = 50;
$CRAFTING_SCUDI_ESOSCHELE       = 51;
$ABILITA_CRAFTING               = array(
    "chimico"                 => 61,
    "programmazione"          => 29,
    "programmazione_avanzata" => 30,
    "programmazione_totale"   => 31,
    "ingegneria"              => array(
        $CRAFTING_ARMI,
        $CRAFTING_PROTESI,
        $CRAFTING_GADGET_SHIELD,
        $CRAFTING_SCUDI_ESOSCHELE
    )
);

$MAPPA_COSTO_CLASSI_CIVILI      = array(0,20,40,60,80,100,120);

$PREREQUISITO_TUTTE_ABILITA     = -1;
$PREREQUISITO_F_TERRA_T_SCELTO  = -2;
$PREREQUISITO_5_SUPPORTO_BASE   = -3;
$PREREQUISITO_3_GUASTATOR_BASE  = -4;
$PREREQUISITO_4_SPORTIVO        = -5;
$PREREQUISITO_3_ASSALTATA_BASE  = -6;
$PREREQUISITO_3_GUASTATOR_AVAN  = -7;
$PREREQUISITO_3_ASSALTATA_AVAN  = -8;

$ID_ABILITA_F_TERRA             = 135;
$ID_ABILITA_T_SCELTO            = 130;
$ID_ABILITA_IDOLO               = 12;

$ID_CLASSE_SPORTIVO             = 1;
$ID_CLASSE_SUPPORTO_BASE        = 12;
$ID_CLASSE_ASSALTATORE_BASE     = 10;
$ID_CLASSE_ASSALTATORE_AVANZATO = 11;
$ID_CLASSE_GUASTATORE_BASE      = 14;
$ID_CLASSE_GUASTATORE_AVANZATO  = 15;
