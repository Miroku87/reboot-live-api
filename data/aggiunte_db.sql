
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
  `id_acquisto` INT NOT NULL AUTO_INCREMENT,
  `cliente_acquisto` INT(11) NOT NULL,
  `id_componente_acquisto` VARCHAR(255) NOT NULL,
  `importo_acquisto` INT NOT NULL,
  `data_acquisto` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_acquisto`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8
  COLLATE = utf8_unicode_ci;

ALTER TABLE `componenti_acquistati`
  ADD INDEX `fk_acquirente_idx` (`cliente_acquisto` ASC);
ALTER TABLE `componenti_acquistati`
  ADD CONSTRAINT `fk_acquirente`
FOREIGN KEY (`cliente_acquisto`)
REFERENCES `personaggi` (`id_personaggio`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


CREATE TABLE `transizioni_bit` (
  `id_transizione` INT NOT NULL AUTO_INCREMENT,
  `data_transizione` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `debitore_transizione` INT(11) NOT NULL,
  `creditore_transizione` INT(11) NULL DEFAULT NULL,
  `note_transizione` TEXT NULL DEFAULT NULL,
  `id_acquisto_componente` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_transizione`));

ALTER TABLE `transizioni_bit`
  ADD INDEX `fk_debitore_idx` (`debitore_transizione` ASC);
ALTER TABLE `transizioni_bit`
  ADD CONSTRAINT `fk_debitore`
FOREIGN KEY (`debitore_transizione`)
REFERENCES `personaggi` (`id_personaggio`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `transizioni_bit`
  ADD INDEX `fk_creditore_idx` (`creditore_transizione` ASC);
ALTER TABLE `transizioni_bit`
  ADD CONSTRAINT `fk_creditore`
FOREIGN KEY (`creditore_transizione`)
REFERENCES `personaggi` (`id_personaggio`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('inserisciTransazione', 'L\'utente può compiere una transazione monetaria.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('compraComponenti', 'L\'utente può comprare componenti dallo shop.');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'inserisciTransazione');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'compraComponenti');
