
-- MERGE IN PROD FINO A QUI

-- 25 APRILE

ALTER TABLE `iscrizione_personaggi`
  ADD COLUMN `ha_partecipato_iscrizione` TINYINT(1) NOT NULL DEFAULT 1 AFTER `tipo_pagamento_iscrizione`;

UPDATE `grants` SET `nome_grant`='visualizza_pagina_eventi', `descrizione_grant`='L\'utente può entrare nella sezione cone le informazioni degli eventi.' WHERE `nome_grant`='visualizza_pagina_gestione_eventi';

INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaIscrizionePG_ha_partecipato_iscrizione_altri', 'L\'utente può modificare lo stato di partecipazione di un altro utente per un evento passato.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaIscrizionePG_ha_partecipato_iscrizione_proprio', 'L\'utente può modificare lo stato di partecipazione del suo utente per un evento passato.');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaIscrizionePG_ha_partecipato_iscrizione_altri');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaIscrizionePG_ha_partecipato_iscrizione_proprio');


-- 13 MAGGIO

CREATE TABLE `componenti_acquistati` (
  `id_acquisto` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_acquisto` int(11) NOT NULL,
  `id_componente_acquisto` varchar(255) CHARACTER SET utf8 NOT NULL,
  `importo_acquisto` int(11) NOT NULL,
  `data_acquisto` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_acquisto`),
  KEY `fk_acquirente_idx` (`cliente_acquisto`),
  KEY `fk_id_comp_acq_idx` (`id_componente_acquisto`),
  CONSTRAINT `fk_acquirente` FOREIGN KEY (`cliente_acquisto`) REFERENCES `personaggi` (`id_personaggio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_comp_acq` FOREIGN KEY (`id_componente_acquisto`) REFERENCES `componenti_crafting` (`id_componente`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `transizioni_bit` (
  `id_transazione` INT NOT NULL AUTO_INCREMENT,
  `data_transazione` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `debitore_transazione` INT(11) NOT NULL,
  `creditore_transazione` INT(11) NULL DEFAULT NULL,
  `importo_transazione` INT NOT NULL DEFAULT 0,
  `note_transazione` TEXT NULL DEFAULT NULL,
  `id_acquisto_componente` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_transazione`));

ALTER TABLE `transizioni_bit`
  ADD INDEX `fk_debitore_idx` (`debitore_transazione` ASC);

ALTER TABLE `transizioni_bit`
  ADD INDEX `fk_creditore_idx` (`creditore_transazione` ASC);

ALTER TABLE `transazioni_bit`
  ADD CONSTRAINT `fk_debitore`
FOREIGN KEY (`debitore_transazione`)
REFERENCES `personaggi` (`id_personaggio`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_creditore`
FOREIGN KEY (`creditore_transazione`)
REFERENCES `personaggi` (`id_personaggio`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_acq_comp`
FOREIGN KEY (`id_acquisto_componente`)
REFERENCES `componenti_acquistati` (`id_acquisto`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('inserisciTransazione', 'L\'utente può compiere una transazione monetaria.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('compraComponenti', 'L\'utente può comprare componenti dallo shop.');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'inserisciTransazione');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'compraComponenti');

-- 14 MAGGIO

INSERT INTO ruoli_has_grants (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('giocatore', 'modificaPG_credito_personaggio_proprio');


ALTER TABLE `ricette`
  ADD COLUMN `gia_stampata` TINYINT(1) NOT NULL DEFAULT 0 AFTER `approvata_ricetta`;

-- 21 MAGGIO

INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('visualizza_pagina_banca', 'L\'utente può accedere alla pagina delle transazioni bancarie.');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'visualizza_pagina_banca');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('giocatore', 'visualizza_pagina_banca');

-- PREPROD MERGED TIL HERE

-- 24 MAGGIO
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('recuperaInfoBanca_proprio', 'L\'utente può recuperare le informazioni sul credito dei propri pg.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('recuperaInfoBanca_altri', 'L\'utente può recuperare le informazioni sul credito di pg non suoi.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('recuperaMovimenti_proprio', 'L\'utente può recuperare le informazioni sui movimenti dei propri pg.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('recuperaMovimenti_altri', 'L\'utente può recuperare le informazioni sui movimenti dei pg di altri giocatori');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'recuperaInfoBanca_proprio');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'recuperaInfoBanca_altri');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'recuperaMovimenti_proprio');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'recuperaMovimenti_altri');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('giocatore', 'recuperaInfoBanca_proprio');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('giocatore', 'recuperaMovimenti_proprio');


