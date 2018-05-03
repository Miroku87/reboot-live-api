
-- MERGE IN PROD FINO A QUI

-- 25 APRILE

ALTER TABLE `iscrizione_personaggi`
  ADD COLUMN `ha_partecipato_iscrizione` TINYINT(1) NOT NULL DEFAULT 1 AFTER `tipo_pagamento_iscrizione`;

UPDATE `grants` SET `nome_grant`='visualizza_pagina_eventi', `descrizione_grant`='L\'utente può entrare nella sezione cone le informazioni degli eventi.' WHERE `nome_grant`='visualizza_pagina_gestione_eventi';

INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaIscrizionePG_ha_partecipato_iscrizione_altri', 'L\'utente può modificare lo stato di partecipazione di un altro utente per un evento passato.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaIscrizionePG_ha_partecipato_iscrizione_proprio', 'L\'utente può modificare lo stato di partecipazione del suo utente per un evento passato.');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaIscrizionePG_ha_partecipato_iscrizione_altri');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaIscrizionePG_ha_partecipato_iscrizione_proprio');


