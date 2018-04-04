USE `reboot_live`;

INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('visualizza_pagina_crea_evento', 'L\'utente può accedere alla pagina che permette di creare un evento.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('recuperaOpzioniAbilita', 'L\'utente può recuperare dal db le opzioni extra di varie abilità.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('aggiungiOpzioniAbilita_proprio', 'L\'utente può aggiungere opzioni alle proprie abilità.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('aggiungiOpzioniAbilita_altri', 'L\'utente può aggiungere opzioni alle abilità di altri.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('creaEvento', 'L\'utente può creare eventi di gioco.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('recuperaEventi', 'L\'utente può leggere gli eventi inseriti a database.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaEvento', 'L\'utente può modificare i dati di un evento già esistente.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('iscriviPg_proprio', 'L\'utente può iscrivere il proprio pg a un evento live.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('iscriviPg_altri', 'L\'utente può iscrivere pg di altri a un evento live.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('recuperaListaEventi', 'L\'utente può vedere tutti gli eventi inseriti nel database.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('pubblicaEvento', 'L\'utente può rendere pubblico a tutti i giocatori un evento creato in precedenza.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('eliminaEvento', 'L\'utente può eliminare un evento precedentemente creato.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('ritiraEvento', 'L\'utente può ritrare un evento pubblicato.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('disiscriviPG_altri', 'L\'utente può disicrivere un personaggio non suo.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('disiscriviPG_proprio', 'L\'utente può disiscrivere un suo personaggio.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('recuperaListaIscrittiBase', 'L\'utente può vedere le informaizoni base dei pg iscritti all\'evento live.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('recuperaListaIscrittiAvanzato', 'L\'utente può vedere le informazioni base e di pagamento dei pg iscritit all\'evento live.');



INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'visualizza_pagina_crea_evento');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'recuperaOpzioniAbilita');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'aggiungiOpzioniAbilita_altri');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'aggiungiOpzioniAbilita_proprio');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'creaEvento');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'recuperaEventi');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaEvento');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'iscriviPg_proprio');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'iscriviPg_altri');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'recuperaListaEventi');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'pubblicaEvento');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'eliminaEvento');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'ritiraEvento');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'disiscriviPG_altri');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'disiscriviPG_proprio');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'recuperaListaIscrittiBase');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'recuperaListaIscrittiAvanzato');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('giocatore', 'recuperaListaIscrittiBase');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('giocatore', 'recuperaOpzioniAbilita');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('giocatore', 'aggiungiOpzioniAbilita_proprio');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('giocatore', 'recuperaEventi');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('giocatore', 'iscriviPg_proprio');

UPDATE `abilita` SET `prerequisito_abilita`='-8' WHERE `id_abilita`='155';

ALTER TABLE `eventi` 
CHANGE COLUMN `data_inizio_evento` `data_inizio_evento` DATE NOT NULL ,
CHANGE COLUMN `data_fine_evento` `data_fine_evento` DATE NOT NULL ,
CHANGE COLUMN `costo_anticipo_evento` `costo_anticipo_evento` DECIMAL(7,2) NOT NULL ,
CHANGE COLUMN `costo_standard_evento` `costo_standard_evento` DECIMAL(7,2) NOT NULL ;

ALTER TABLE `eventi` 
ADD COLUMN `ora_inizio_evento` TIME NOT NULL AFTER `note_evento`,
ADD COLUMN `ora_fine_evento` TIME NOT NULL AFTER `ora_inizio_evento`,
ADD COLUMN `creatore_evento` VARCHAR(255) NOT NULL AFTER `pubblico_evento`;

ALTER TABLE `eventi` 
CHANGE COLUMN `ora_inizio_evento` `ora_inizio_evento` TIME NOT NULL AFTER `data_inizio_evento`,
CHANGE COLUMN `ora_fine_evento` `ora_fine_evento` TIME NOT NULL AFTER `data_fine_evento`,
CHANGE COLUMN `costo_anticipo_evento` `costo_evento` DECIMAL(3,2) NOT NULL ,
CHANGE COLUMN `costo_standard_evento` `costo_maggiorato_evento` DECIMAL(3,2) NOT NULL ;

ALTER TABLE `eventi` 
ADD INDEX `fk_creatori_evento_idx` (`creatore_evento` ASC);
ALTER TABLE `eventi` 
ADD CONSTRAINT `fk_creatori_evento`
  FOREIGN KEY (`creatore_evento`)
  REFERENCES `giocatori` (`email_giocatore`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `iscrizione_personaggi` 
DROP FOREIGN KEY `fk_eventi_has_personaggi_eventi1`,
DROP FOREIGN KEY `fk_eventi_has_personaggi_personaggi1`;
ALTER TABLE `iscrizione_personaggi` 
ADD CONSTRAINT `fk_eventi_has_personaggi_eventi1`
  FOREIGN KEY (`eventi_id_evento`)
  REFERENCES `eventi` (`id_evento`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_eventi_has_personaggi_personaggi1`
  FOREIGN KEY (`personaggi_id_personaggio`)
  REFERENCES `personaggi` (`id_personaggio`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

  
ALTER TABLE `iscrizione_personaggi` 
CHANGE COLUMN `tipo_pagamento_iscrizione` `tipo_pagamento_iscrizione` SET('Location', 'Manuale', 'PayPal', 'PostePay', 'Bonifico') NOT NULL ;


CREATE TABLE `opzioni_abilita` (
  `abilita_id_abilita` int(255) NOT NULL,
  `opzione` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`abilita_id_abilita`,`opzione`),
  CONSTRAINT `fk_id_abilita` FOREIGN KEY (`abilita_id_abilita`) REFERENCES `abilita` (`id_abilita`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('140', 'Pistola');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('140', 'Fucile d\'Assalto');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('140', 'Shotgun');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('140', 'Fucile di Precisione');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('140', 'Armi da Mischia');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('13', 'Droga');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('13', 'Contatto');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('89', 'Alcolismo');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('89', 'Iniezione');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('17', 'Cronaca Nera');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('17', 'Cronaca Rosa');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('17', 'Sport');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('17', 'Economia');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('17', 'Politica');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('17', 'Giornalismo Spazzatura');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('18', 'Cronaca Nera');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('18', 'Cronaca Rosa');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('18', 'Sport');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('18', 'Economia');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('18', 'Politica');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('18', 'Giornalismo Spazzatura');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('19', 'Cronaca Nera');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('19', 'Cronaca Rosa');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('19', 'Sport');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('19', 'Economia');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('19', 'Politica');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('19', 'Giornalismo Spazzatura');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('20', 'Cronaca Nera');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('20', 'Cronaca Rosa');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('20', 'Sport');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('20', 'Economia');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('20', 'Politica');
INSERT INTO `opzioni_abilita` (`abilita_id_abilita`, `opzione`) VALUES ('20', 'Giornalismo Spazzatura');

CREATE TABLE `personaggi_has_opzioni_abilita` (
  `personaggi_id_personaggio` INT(11) NOT NULL,
  `abilita_id_abilita` INT(11) NOT NULL,
  `opzioni_abilita_opzione` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`personaggi_id_personaggio`, `abilita_id_abilita`, `opzioni_abilita_opzione`),
  INDEX `fk_phoa_id_abilita_idx` (`abilita_id_abilita` ASC),
  INDEX `fk_phoa_opzione_idx` (`opzioni_abilita_opzione` ASC),
  CONSTRAINT `fk_phoa_pg`
    FOREIGN KEY (`personaggi_id_personaggio`)
    REFERENCES `personaggi` (`id_personaggio`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_phoa_id_abilita`
    FOREIGN KEY (`abilita_id_abilita`)
    REFERENCES `opzioni_abilita` (`abilita_id_abilita`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

DROP procedure IF EXISTS `controllaPrerequisitoAbilita`;
DELIMITER $$
CREATE PROCEDURE `controllaPrerequisitoAbilita`( _id_pg INT, _id_abilita INT )
BEGIN
	-- Trigger che controlla se il pg ha i prerequisiti necessari
	-- Solitamente nel campo prerequisito_abilita c'e' l'id
	-- dell'abilita necessaria, ma esistono degli id d'eccezione:
	--  -1: servono tutte le abilta della classe dell'abilita che si sta cercando di inserire
	--  -2: servono FUOCO A TERRA e TIRATORE SCELTO (id 135 e 130)
	--  -3: servono almeno 5 abilita di Supporto Base ( id 12 )
	--  -4: servono almeno 3 abilita Guastatore Base (id 14)
    --  -5: servono almeno 4 abilita da Sportivo (id 1)
    --  -6: servono almeno 3 talenti da Assaltatore-Base (id 10)
    --  -7: servono almeno 3 talenti da Guastatore-Avanzato (id 15)
    --  -8: servono almeno 3 talenti da Assaltatore-Avanzato (id 15)
    
    SET @id_fuoco_a_terra = 135;
    SET @id_tiratore_scelto = 130;
    SET @id_supporto_base = 12;
    SET @id_guastatore_base = 14;
    SET @id_sportivo = 1;
    SET @id_assaltatore_base = 10;
    SET @id_assaltatore_avanzato = 11;
    SET @id_guastatore_avanzato = 15;
    
	SELECT prerequisito_abilita, classi_id_classe INTO @prerequisito, @classe 
		FROM abilita 
		WHERE id_abilita = _id_abilita;

	IF @prerequisito = -1 AND (
		SELECT COUNT(*) AS num_abilita 
			FROM personaggi_has_abilita 
            WHERE personaggi_id_personaggio = _id_pg AND
				abilita_id_abilita IN (
					SELECT id_abilita
						FROM abilita
                        WHERE classi_id_classe = @classe
                )
		) != (
			SELECT COUNT(*) AS tot_abilita_classe
				FROM abilita
                WHERE classi_id_classe = @classe
        ) - 1
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '@@@Non puoi acquistare questa abilit&agrave; senza avere tutte le altre della stessa classe.@@@';
        
	ELSEIF @prerequisito = -2 AND (
		SELECT COUNT(*) AS num_abilita
			FROM personaggi_has_abilita
            WHERE personaggi_id_personaggio = _id_pg AND 
				abilita_id_abilita IN ( @id_fuoco_a_terra, @id_tiratore_scelto )
		) != 2    
    THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '@@@Non puoi acquistare questa abilit&agrave; senza avere FUOCO A TERRA e TIRATORE SCELTO.@@@';
        
	ELSEIF @prerequisito = -3 AND (
		SELECT COUNT(*) AS num_abilita 
			FROM personaggi_has_abilita 
            WHERE personaggi_id_personaggio = _id_pg AND
				abilita_id_abilita IN (
					SELECT id_abilita
						FROM abilita
                        WHERE classi_id_classe = @id_supporto_base
                )
		) < 5
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '@@@Non puoi acquistare questa abilit&agrave; senza almeno 5 abilit&agrave; di Supporto Base.@@@';
        
	ELSEIF @prerequisito = -4 AND (
		SELECT COUNT(*) AS num_abilita 
			FROM personaggi_has_abilita 
            WHERE personaggi_id_personaggio = _id_pg AND
				abilita_id_abilita IN (
					SELECT id_abilita
						FROM abilita
                        WHERE classi_id_classe = @id_guastatore_base
                )
		) < 3
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '@@@Non puoi acquistare questa abilit&agrave; senza almeno 3 abilit&agrave; CONTROLLER.@@@';
        
	ELSEIF @prerequisito = -5 AND (
		SELECT COUNT(*) AS num_abilita 
			FROM personaggi_has_abilita
            WHERE personaggi_id_personaggio = _id_pg AND
				abilita_id_abilita IN (
					SELECT id_abilita
						FROM abilita
                        WHERE classi_id_classe = @id_sportivo
                )
		) < 4
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '@@@Non puoi acquistare questa abilit&agrave; senza almeno 4 abilit&agrave; da Sportivo.@@@';
        
	ELSEIF @prerequisito = -6 AND (
		SELECT COUNT(*) AS num_abilita 
			FROM personaggi_has_abilita
            WHERE personaggi_id_personaggio = _id_pg AND
				abilita_id_abilita IN (
					SELECT id_abilita
						FROM abilita
                        WHERE classi_id_classe = @id_assaltatore_base
                )
		) < 3
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '@@@Non puoi acquistare questa abilit&agrave; senza almeno 3 abilit&agrave; da Assaltatore Base.@@@';
        
	ELSEIF @prerequisito = -7 AND (
		SELECT COUNT(*) AS num_abilita 
			FROM personaggi_has_abilita
            WHERE personaggi_id_personaggio = _id_pg AND
				abilita_id_abilita IN (
					SELECT id_abilita
						FROM abilita
                        WHERE classi_id_classe = @id_guastatore_avanzato
                )
		) < 3
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '@@@Non puoi acquistare questa abilit&agrave; senza almeno 4 abilit&agrave; da Guastatore Avanzato.@@@';
        
	ELSEIF @prerequisito = -8 AND (
		SELECT COUNT(*) AS num_abilita 
			FROM personaggi_has_abilita
            WHERE personaggi_id_personaggio = _id_pg AND
				abilita_id_abilita IN (
					SELECT id_abilita
						FROM abilita
                        WHERE classi_id_classe = @id_assaltatore_avanzato
                )
		) < 3
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '@@@Non puoi acquistare questa abilit&agrave; senza almeno 4 abilit&agrave; da Assaltatore Avanzato.@@@';
        
	ELSEIF @prerequisito > 0 AND (
		SELECT COUNT(*) AS num_abilita
			FROM personaggi_has_abilita
            WHERE personaggi_id_personaggio = _id_pg AND
				abilita_id_abilita = @prerequisito
        ) = 0
	THEN
		SELECT nome_abilita INTO @nome_abilita FROM abilita WHERE id_abilita = @prerequisito;
        SET @message = CONCAT('@@@Non puoi acquistare questa abilit&agrave; senza aver prima acquistato ', CAST(@nome_abilita AS CHAR), '@@@');
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
        
	END IF;
END$$
DELIMITER ;

-- 26 MARZO

ALTER TABLE `abilita` 
ADD COLUMN `offset_pf_abilita` INT(5) NULL DEFAULT 0 AFTER `effetto_abilita`,
ADD COLUMN `offset_shield_abilita` INT(5) NULL DEFAULT 0 AFTER `offset_pf_abilita`,
ADD COLUMN `offset_mente_abilita` INT(5) NULL DEFAULT 0 AFTER `offset_shield_abilita`;

ALTER TABLE `classi` 
ADD COLUMN `mente_base_classe` INT(5) NOT NULL DEFAULT 0 AFTER `nome_classe`,
ADD COLUMN `shield_max_base_classe` INT(5) NOT NULL DEFAULT 0 AFTER `mente_base_classe`;


UPDATE `classi` SET `mente_base_classe`='1' WHERE `id_classe`='8';
UPDATE `classi` SET `mente_base_classe`='1' WHERE `id_classe`='12';
UPDATE `classi` SET `mente_base_classe`='2' WHERE `id_classe`='14';
UPDATE `classi` SET `shield_max_base_classe`='6' WHERE `id_classe`='8';
UPDATE `classi` SET `shield_max_base_classe`='3' WHERE `id_classe`='10';
UPDATE `classi` SET `shield_max_base_classe`='6' WHERE `id_classe`='12';
UPDATE `classi` SET `shield_max_base_classe`='3' WHERE `id_classe`='14';

UPDATE `abilita` SET `offset_pf_abilita`='1' WHERE `id_abilita`='97';
UPDATE `abilita` SET `offset_pf_abilita`='2' WHERE `id_abilita`='109';
UPDATE `abilita` SET `offset_pf_abilita`='1' WHERE `id_abilita`='129';
UPDATE `abilita` SET `offset_shield_abilita`='2' WHERE `id_abilita`='98';
UPDATE `abilita` SET `offset_shield_abilita`='4' WHERE `id_abilita`='102';
UPDATE `abilita` SET `offset_shield_abilita`='2' WHERE `id_abilita`='159';
UPDATE `abilita` SET `offset_shield_abilita`='2' WHERE `id_abilita`='191';
UPDATE `abilita` SET `offset_shield_abilita`='2' WHERE `id_abilita`='174';
UPDATE `abilita` SET `offset_shield_abilita`='1' WHERE `id_abilita`='125';
UPDATE `abilita` SET `offset_shield_abilita`='1' WHERE `id_abilita`='190';
UPDATE `abilita` SET `offset_mente_abilita`='2' WHERE `id_abilita`='173';
UPDATE `abilita` SET `offset_mente_abilita`='1' WHERE `id_abilita`='202';
UPDATE `abilita` SET `offset_mente_abilita`='2' WHERE `id_abilita`='206';
UPDATE `abilita` SET `offset_mente_abilita`='1' WHERE `id_abilita`='96';
UPDATE `abilita` SET `offset_mente_abilita`='1' WHERE `id_abilita`='172';


UPDATE `abilita` SET `descrizione_abilita`='Il valore di Difesa mentale del personaggio aumenta di 2. (Sostituisce il bonus dato da Schermatura Cerebrale)' WHERE `id_abilita`='206';

INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaIscrizionePG_pagato_iscrizione_proprio', 'L\'utente può modificare lo stato di pagato di un suo pg per l\'iscrizione a un evento.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaIscrizionePG_pagato_iscrizione_altri', 'L\'utente può modificare lo stato di pagato di un pg altrui per l\'iscrizione a un evento.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaIscrizionePG_note_iscrizione_proprio', 'L\'utene può modificare le note dell\'\'iscrizione ad un evento di un suo pg.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaIscrizionePG_note_iscrizione_altri', 'L\'utene può modificare le note dell\'\'iscrizione ad un evento di un pg di altri.');


INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaIscrizionePG_pagato_iscrizione_proprio');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaIscrizionePG_pagato_iscrizione_altri');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaIscrizionePG_note_iscrizione_proprio');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaIscrizionePG_note_iscrizione_altri');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('giocatore', 'visualizza_pagina_gestione_eventi');

-- 27 MARZO

ALTER TABLE `personaggi` 
ADD COLUMN `anno_nascita_personaggio` INT(11) NOT NULL DEFAULT 271 AFTER `credito_personaggio`;

INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaPG_anno_nascita_personaggio_proprio', 'L\'utente può modificare l\'anno di nascita di un proprio pg.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaPG_anno_nascita_personaggio_altri', 'L\'utente può modificare l\'anno di nascita di un pg altrui.');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('giocatore', 'modificaPG_anno_nascita_personaggio_proprio');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaPG_anno_nascita_personaggio_proprio');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaPG_anno_nascita_personaggio_altri');

ALTER TABLE `eventi` 
ADD COLUMN `punti_assegnati_evento` TINYINT(1) NOT NULL DEFAULT 0 AFTER `pubblico_evento`;

-- MERGE FATTO FINO A QUI IN DATA 28 MARZO 2018

-- 29 MARZO

INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('associaPermessi','L\'utente può associare il permesso di compiere un\'azione ad un dato ruolo.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('creaRuolo','L\'utente può creare un nuovo ruolo.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('eliminaRuolo','L\'utente può eliminare un ruolo già esistente.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('recuperaListaPermessi','L\'utente può scaricare dal database la lista di permessi presenti.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('recuperaPermessiDeiRuoli','L\'utente può scaricare da database i permessi associati ad ogni ruolo.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('recuperaRuoli','L\'utente può recuperare una lista di tutti i ruoli esistenti.');

INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'associaPermessi');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'creaRuolo');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'eliminaRuolo');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'recuperaListaPermessi');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'recuperaPermessiDeiRuoli');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'recuperaRuoli');

ALTER TABLE `ruoli_has_grants` 
DROP FOREIGN KEY `fk_nome_ruolo`;
ALTER TABLE `ruoli_has_grants` 
ADD CONSTRAINT `fk_nome_ruolo`
  FOREIGN KEY (`ruoli_nome_ruolo`)
  REFERENCES `ruoli` (`nome_ruolo`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

DROP TRIGGER IF EXISTS `ruoli_BEFORE_DELETE`;

DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `ruoli_BEFORE_DELETE` BEFORE DELETE ON `ruoli` FOR EACH ROW
BEGIN
	IF OLD.nome_ruolo = 'admin' THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '@@@Non puoi eliminare il ruolo admin.@@@';
	END IF;
END$$
DELIMITER ;

-- MERGE FATTO FINO A QUI IN DATA 29 MARZO 2018

-- 30 MARZO

ALTER TABLE `personaggi` 
ADD COLUMN `motivazioni_olocausto_inserite_personaggio` TINYINT(1) NOT NULL DEFAULT 0 AFTER `giocatori_email_giocatore`;

INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaPG_motivazioni_olocausto_inserite_personaggio_proprio', 'L\'utente può modificare il flag che indica se ha scritto le motivazioni per l\'olocausto degli innocenti del proprio pg.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaPG_motivazioni_olocausto_inserite_personaggio_altri', 'L\'utente può modificare il flag che indica se ha scritto le motivazioni per l\'olocausto degli innocenti degli altri pg.');

INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('giocatore', 'modificaPG_motivazioni_olocausto_inserite_personaggio_proprio');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaPG_motivazioni_olocausto_inserite_personaggio_proprio');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaPG_motivazioni_olocausto_inserite_personaggio_altri');

-- 31 MARZO

INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaUtente_note_staff_giocatore_altri', 'L\'utente può modificare le note Staff di altri utenti.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaUtente_note_staff_giocatore_proprio', 'L\'utente può modificare le proprie note Staff.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaUtente_email_giocatore_altri', 'L\'utente può modificare l\'email di un altro giocatore.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaUtente_email_giocatore_proprio', 'L\'utente può modificare la propria email.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaUtente_nome_giocatore_altri', 'L\'utente può modificare il nome di un altro utente.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaUtente_nome_giocatore_proprio', 'L\'utente può modificare il proprio nome.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaUtente_cognome_giocatore_altri', 'L\'utente può modificare il cognome di un altro utente.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaUtente_cognome_giocatore_proprio', 'L\'utente può modificare il proprio cognome.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaUtente_ruoli_nome_ruolo_altri', 'L\'utente può modificare il ruolo di altri.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaUtente_ruoli_nome_ruolo_proprio', 'L\'utente può modificare il proprio ruolo.');

INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaUtente_note_staff_giocatore_altri');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaUtente_note_staff_giocatore_proprio');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaUtente_email_giocatore_altri');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaUtente_email_giocatore_proprio');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaUtente_nome_giocatore_altri');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaUtente_nome_giocatore_proprio');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaUtente_cognome_giocatore_altri');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaUtente_cognome_giocatore_proprio');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaUtente_ruoli_nome_ruolo_altri');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaUtente_ruoli_nome_ruolo_proprio');

-- 02 APRILE


INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('stampaListaIscritti', 'L\'utente può stampare la lista degli iscritti a un evento con tutte le loro informazioni.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('visualizza_pagina_stampa_tabella_iscritti', 'L\'utente può accedere alla pagina di stampa della tabella degli iscritti a un evento.');

INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'stampaListaIscritti');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'visualizza_pagina_stampa_tabella_iscritti');

-- MERGE FINO A QUI FATTO IN DATA 02 APRILE

-- 03 APRILE
CREATE TABLE `notizie` (
  `id_notizia` INT(11) NOT NULL AUTO_INCREMENT,
  `tipo_notizia` VARCHAR(255) NOT NULL,
  `autore_notizia` VARCHAR(255) NOT NULL,
  `data_ig_notizia` VARCHAR(255) NOT NULL DEFAULT '271',
  `data_pubblicazione_notizia` DATETIME NULL,
  `pubblica_notizia` DATETIME NOT NULL,
  `testo_notizia` TEXT(255) NOT NULL,
  PRIMARY KEY (`id_notizia`));
  
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('visualizza_pagina_notizie', 'L\'utente può accedere alla pagina delle notizie');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('creaNotizia', 'L\'utente può creare nuove notizie');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('recuperaNotizie', 'L\'utente può recuperare tutte le notizie create');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('recuperaNotiziePubbliche', 'L\'utente può recuperare le notizie pubblicate');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaNotizia', 'L\'utente può modificare notizie esistenti');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('pubblicaNotizia', 'L\'utente può pubblicare una notizia già creata');

INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('giocatore', 'visualizza_pagina_notizie');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('giocatore', 'recuperaNotiziePubbliche');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'visualizza_pagina_notizie');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'creaNotizia');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'recuperaNotizie');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'recuperaNotiziePubbliche');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaNotizia');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'pubblicaNotizia');

-- 04 APRILE
ALTER TABLE `notizie` 
ADD COLUMN `titolo_notizia` VARCHAR(255) NOT NULL AFTER `tipo_notizia`;

