USE 

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

-- 05 APRILE

UPDATE `grants` SET `descrizione_grant`='L\'utente può visualizzare la pagina principale del sito con la lista dei pg creati.' WHERE `nome_grant`='visualizza_pagina_main';

ALTER TABLE `notizie` 
ADD COLUMN `data_creazione_notizia` DATETIME NOT NULL DEFAULT NOW() AFTER `testo_notizia`;

-- 06 APRILE

ALTER TABLE `notizie` 
ADD COLUMN `creatore_notizia` VARCHAR(255) NOT NULL AFTER `data_creazione_notizia`,

  
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('ritiraNotizia', 'L\'utente può ritirare un articolo pubblicato.');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'ritiraNotizia');

ALTER TABLE `notizie` 
ADD INDEX `fk_creatore_notizia_idx` (`creatore_notizia` ASC),
ADD CONSTRAINT `fk_creatore_notizia`
  FOREIGN KEY (`creatore_notizia`)
  REFERENCES `giocatori` (`email_giocatore`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
-- INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('visualizza_pagina_crafting_programmazione', 'L\'utente, se loggato con un pg che ha le giuste abilità, potrà accedere alla sezione del crafting di Netrunner.');
-- INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('visualizza_pagina_crafting_chimico', 'L\'utente, se loggato con un pg che ha le giuste abilità, potrà accedere alla sezione del crafting del Medico.');
-- INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('visualizza_pagina_crafting_ingegneria', 'L\'utente, se loggato con un pg che ha le giuste abilità, potrà accedere alla sezione del crafting da Tecnico.');

-- INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'visualizza_pagina_crafting_programmazione');
-- INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'visualizza_pagina_crafting_chimico');
-- INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'visualizza_pagina_crafting_ingegneria');
-- INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('giocatore', 'visualizza_pagina_crafting_programmazione');
-- INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('giocatore', 'visualizza_pagina_crafting_chimico');
-- INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('giocatore', 'visualizza_pagina_crafting_ingegneria');

-- 07 APRILE

CREATE TABLE `crafting_programmazione` (
  `parametro_crafting` VARCHAR(45) NOT NULL,
  `valore_parametro_crafting` VARCHAR(45) NOT NULL,
  `effetto_valore_crafting` VARCHAR(45) NOT NULL,
  `parametro_collegato_crafting` VARCHAR(45) NULL,
  PRIMARY KEY (`parametro_crafting`,`valore_parametro_crafting`));
  
INSERT INTO `crafting_programmazione` VALUES ('X1','0','ATTACCO','Y1'),('X1','1','ATTACCO','Y1'),('X1','2','DIFESA','Y1'),('X1','3','DIFESA','Y1'),('X1','4','ABILITA\'','Y2'),('X1','5','ABILITA\'','Y2'),('X1','6','ATTACCO','Y1'),('X1','7','DIFESA','Y1'),('X1','8','ABILITA\'','Y2'),('X1','9','ATTACCO','Y1'),('Y1','0','danno','Z1'),('Y1','1','status','Z2'),('Y1','2','danno','Z1'),('Y1','3','status','Z2'),('Y1','4','danno','Z1'),('Y1','5','status','Z2'),('Y1','6','danno','Z1'),('Y1','7','status','Z2'),('Y1','8','danno','Z1'),('Y1','9','status','Z2'),('Y2','0','1 uso','Z3'),('Y2','1','2 usi','Z3'),('Y2','2','1 uso','Z3'),('Y2','3','2 usi','Z3'),('Y2','4','3 usi','Z3'),('Y2','5','1 uso','Z3'),('Y2','6','2 usi','Z3'),('Y2','7','3 usi','Z3'),('Y2','8','4 usi ','Z3'),('Y2','9','1 uso','Z3'),('Z1','0','SINGOLO',NULL),('Z1','1','DOPPIO',NULL),('Z1','2','TRIPLO',NULL),('Z1','3','QUADRUPLO',NULL),('Z1','4','A ZERO',NULL),('Z1','5','DOPPIO',NULL),('Z1','6','TRIPLO',NULL),('Z1','7','QUADRUPLO',NULL),('Z1','8','DOPPIO',NULL),('Z1','9','TRIPLO',NULL),('Z2','0','DISARMO!',NULL),('Z2','1','CONFUSIONE!',NULL),('Z2','2','PARALISI!',NULL),('Z2','3','SPINTA 5 !',NULL),('Z2','4','SHOCK!',NULL),('Z2','5','DISARMO!',NULL),('Z2','6','CONFUSIONE!',NULL),('Z2','7','SPINTA 5 !',NULL),('Z2','8','SHOCK!',NULL),('Z2','9','PARALISI!',NULL),('Z3','0','COMANDO!',NULL),('Z3','1','SINCERITA\'!',NULL),('Z3','2','GUARIGIONE 5!',NULL),('Z3','3','RIPARARAZIONE 5!',NULL),('Z3','4','ATTENUAZIONE!',NULL),('Z3','5','COMANDO ! IGNORAMI',NULL),('Z3','6','VELENO!  GUARIGIONE 1! TEMPO 1 MINUTO',NULL),('Z3','7','RIFLESSO! ',NULL),('Z3','8','BONUS ! ATTENUAZIONE! RAGGIO 2 TEMPO 1 MINUTO',NULL),('Z3','9','NEUTRALIZZA ( associabile a qualsiasi effetto o status)',NULL);
  
DROP TABLE IF EXISTS `ricette`;
CREATE TABLE `ricette` (
  `id_ricetta` int(11) NOT NULL AUTO_INCREMENT,
  `personaggi_id_personaggio` int(11) NOT NULL,
  `data_inserimento_ricetta` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo_ricetta` set('Programmazione','Tecnico','Chimico') NOT NULL,
  `tipo_oggetto` SET('Programma', 'Arma Mischia', 'Pistola', 'Fucile Assalto', 'Mitragliatore', 'Shotgun', 'Fucile Precisione', 'Gadget Normale', 'Gadget Avanzato', 'Protesi Generica', 'Protesi Braccio', 'Protesi Gamba', 'Esoscheletro', 'Scudo') DEFAULT NULL,
  `nome_ricetta` varchar(255) NOT NULL,
  `componenti_ricetta` varchar(255) NOT NULL,
  `risultato_ricetta` varchar(255) NOT NULL,
  `approvata_ricetta` TINYINT(1) NOT NULL DEFAULT 0,
  `note_ricetta` text,
  `extra_cartellino_ricetta` text,
  PRIMARY KEY (`id_ricetta`),
  KEY `fk_ricette_personaggi1_idx` (`personaggi_id_personaggio`),
  CONSTRAINT `fk_ricette_personaggi1` FOREIGN KEY (`personaggi_id_personaggio`) REFERENCES `personaggi` (`id_personaggio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 08 APRILE

INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaRicetta', 'L\'utente può modificare una ricetta creata.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('recuperaRicette_proprio', 'L\'utente può recuperare le ricette create da un suo personaggio.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('recuperaRicette_altri', 'L\'utente può recuperare le ricette create da chiunque.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('visualizza_pagina_gestione_ricette', 'L\'utente può vedere la pagina di gestione delle ricette.');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaRicetta');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'recuperaRicette_proprio');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'recuperaRicette_altri');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'visualizza_pagina_gestione_ricette');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('giocatore', 'recuperaRicette_proprio');

-- 11 APRILE
  
ALTER TABLE `ricette` 
ADD COLUMN `id_unico_risultato` INT(11) NULL DEFAULT NULL AFTER `approvata_ricetta`;

ALTER TABLE `personaggi` 
ADD COLUMN `note_cartellino_personaggio` TEXT NULL DEFAULT NULL AFTER `note_master_personaggio`;

ALTER TABLE `ricette` 
ADD COLUMN `note_pg_ricetta` TEXT NULL DEFAULT NULL AFTER `note_ricetta`;

INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaPG_note_cartellino_personaggio_altri', 'L\'utente può modificare le note da stampare sul cartellino dei pg di altri giocatori.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('modificaPG_note_cartellino_personaggio_proprio', 'L\'utente può modificare le note da stampare sul cartellino dei propri pg.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('recuperaNoteCartellino_altri', 'L\'utente può leggere gli extra che verranno stampati sul cartellino di un PG non suo.');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('recuperaNoteCartellino_proprio', 'L\'utente può guardare le note extra che verranno stampate sul cartellino di un proprio pg.');

INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaPG_note_cartellino_personaggio_altri');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'modificaPG_note_cartellino_personaggio_proprio');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'recuperaNoteCartellino_altri');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'recuperaNoteCartellino_proprio');

-- 17 APRILE


ALTER TABLE `componenti_crafting` 
CHANGE COLUMN `costo_componente` `costo_attuale_componente` INT(255) NULL AFTER `tipo_componente`,
CHANGE COLUMN `id_componente` `id_componente` VARCHAR(255) NOT NULL ,
CHANGE COLUMN `tipo_componente` `tipo_componente` SET('parametro_x', 'parametro_y', 'parametro_z', 'struttura', 'batteria', 'applicativo', 'supporto', 'sostanza base', 'sostanza satellite') NOT NULL ,
CHANGE COLUMN `valore_componente` `valore_param_componente` INT(11) NULL ,
ADD COLUMN `costo_vecchio_componente` INT(255) NULL AFTER `costo_attuale_componente`,
ADD COLUMN `volume_componente` INT(11) NULL AFTER `valore_param_componente`,
ADD COLUMN `energia_componente` INT(11) NULL AFTER `volume_componente`,
ADD COLUMN `tipo_supporto_componente` SET('cerotto', 'fiala', 'polvere') NULL AFTER `energia_componente`,
ADD COLUMN `fattore_legame_componente` VARCHAR(255) NULL AFTER `tipo_supporto_componente`,
ADD COLUMN `curativo_primario_componente` VARCHAR(255) NULL AFTER `fattore_legame_componente`,
ADD COLUMN `psicotropo_primario_componente` VARCHAR(255) NULL AFTER `curativo_primario_componente`,
ADD COLUMN `tossico_primario_componente` VARCHAR(255) NULL AFTER `psicotropo_primario_componente`,
ADD COLUMN `curativo_secondario_componente` VARCHAR(255) NULL AFTER `tossico_primario_componente`,
ADD COLUMN `psicotropo_secondario_componente` VARCHAR(255) NULL AFTER `curativo_secondario_componente`,
ADD COLUMN `tossico_secondario_componente` VARCHAR(255) NULL AFTER `psicotropo_secondario_componente`,
ADD COLUMN `possibilita_dipendeza_componente` VARCHAR(255) NULL AFTER `tossico_secondario_componente`,
ADD COLUMN `descrizione` TEXT NULL AFTER `possibilita_dipendeza_componente`;

ALTER TABLE `componenti_crafting` 
ADD COLUMN `tipo_crafting_componente` SET('tecnico', 'programmazione', 'chimico') NOT NULL AFTER `nome_componente`;

ALTER TABLE `componenti_ricetta` 
CHANGE COLUMN `componenti_crafting_id_componente` `componenti_crafting_id_componente` VARCHAR(255) NOT NULL ;

ALTER TABLE `componenti_ricetta` 
ADD INDEX `fk_ricette_id_ricetta_idx` (`ricette_id_ricetta` ASC);
ALTER TABLE `componenti_ricetta` 
ADD CONSTRAINT `fk_componente_ricetta`
  FOREIGN KEY (`componenti_crafting_id_componente`)
  REFERENCES `componenti_crafting` (`id_componente`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_ricette_id_ricetta`
  FOREIGN KEY (`ricette_id_ricetta`)
  REFERENCES `ricette` (`id_ricetta`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `ricette` 
DROP COLUMN `componenti_ricetta`;

ALTER TABLE `componenti_ricetta`
ADD COLUMN `ordine_crafting` INT(11) NULL AFTER `ricette_id_ricetta`;

ALTER TABLE `ricette` 
CHANGE COLUMN `approvata_ricetta` `approvata_ricetta` TINYINT(1) NOT NULL DEFAULT '0' AFTER `nome_ricetta`,
CHANGE COLUMN `tipo_oggetto` `tipo_oggetto` SET('Programma', 'Arma Mischia', 'Pistola', 'Fucile Assalto', 'Mitragliatore', 'Shotgun', 'Fucile Precisione', 'Gadget Normale', 'Gadget Avanzato', 'Protesi Generica', 'Protesi Braccio', 'Protesi Gamba', 'Esoscheletro') NOT NULL ,
CHANGE COLUMN `risultato_ricetta` `risultato_ricetta` VARCHAR(255) NULL ;

INSERT INTO `componenti_crafting`
(`id_componente`,
`nome_componente`,
`tipo_crafting_componente`,
`tipo_componente`,
`valore_param_componente`
)
VALUES
('X=0', 'X=0', 'programmazione','parametro_x', '0' ),
('X=1', 'X=1', 'programmazione','parametro_x', '1' ),
('X=2', 'X=2', 'programmazione','parametro_x', '2' ),
('X=3', 'X=3', 'programmazione','parametro_x', '3' ),
('X=4', 'X=4', 'programmazione','parametro_x', '4' ),
('X=5', 'X=5', 'programmazione','parametro_x', '5' ),
('X=6', 'X=6', 'programmazione','parametro_x', '6' ),
('X=7', 'X=7', 'programmazione','parametro_x', '7' ),
('X=8', 'X=8', 'programmazione','parametro_x', '8' ),
('X=9', 'X=9', 'programmazione','parametro_x', '9' ),
('Y=0', 'Y=0', 'programmazione','parametro_y', '0' ),
('Y=1', 'Y=1', 'programmazione','parametro_y', '1' ),
('Y=2', 'Y=2', 'programmazione','parametro_y', '2' ),
('Y=3', 'Y=3', 'programmazione','parametro_y', '3' ),
('Y=4', 'Y=4', 'programmazione','parametro_y', '4' ),
('Y=5', 'Y=5', 'programmazione','parametro_y', '5' ),
('Y=6', 'Y=6', 'programmazione','parametro_y', '6' ),
('Y=7', 'Y=7', 'programmazione','parametro_y', '7' ),
('Y=8', 'Y=8', 'programmazione','parametro_y', '8' ),
('Y=9', 'Y=9', 'programmazione','parametro_y', '9' ),
('Z=0', 'Z=0', 'programmazione','parametro_z', '0' ),
('Z=1', 'Z=1', 'programmazione','parametro_z', '1' ),
('Z=2', 'Z=2', 'programmazione','parametro_z', '2' ),
('Z=3', 'Z=3', 'programmazione','parametro_z', '3' ),
('Z=4', 'Z=4', 'programmazione','parametro_z', '4' ),
('Z=5', 'Z=5', 'programmazione','parametro_z', '5' ),
('Z=6', 'Z=6', 'programmazione','parametro_z', '6' ),
('Z=7', 'Z=7', 'programmazione','parametro_z', '7' ),
('Z=8', 'Z=8', 'programmazione','parametro_z', '8' ),
('Z=9', 'Z=9', 'programmazione','parametro_z', '9' );

INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('recuperaComponentiBase', 'L\'utente può vedere la lista dei componenti durante i crafting e nel mercato');
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('recuperaComponentiAvanzata', 'L\'utente può vedere tutti i dati riguardanti i componenti');

INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'recuperaComponentiBase');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'recuperaComponentiAvanzata');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('giocatore', 'recuperaComponentiBase');

-- 17 APRILE

INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('visualizza_pagina_mercato', 'L\'utente può vedere la pagina che permette l\'acaquisto dei componenti.');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'visualizza_pagina_mercato');

ALTER TABLE `componenti_crafting` 
CHANGE COLUMN `descrizione` `descrizione_componente` TEXT NULL DEFAULT NULL ;

DELETE FROM `ruoli_has_grants` WHERE `ruoli_nome_ruolo`='giocatore' and`grants_nome_grant`='visualizza_pagina_notizie';

ALTER TABLE `componenti_ricetta` 
CHANGE COLUMN `ordine_crafting` `ordine_crafting` INT(11) NULL DEFAULT 0 ;

-- 18 APRILE
ALTER TABLE `componenti_crafting` 
ADD COLUMN `fcc_componente` INT(11) NULL AFTER `costo_vecchio_componente`;

ALTER TABLE `componenti_crafting` 
DROP COLUMN `tipo_supporto_componente`,
CHANGE COLUMN `tipo_componente` `tipo_componente` SET('parametro_x', 'parametro_y', 'parametro_z', 'struttura', 'batteria', 'applicativo', 'supporto', 'cerotto', 'fiala', 'solido', 'sostanza') NOT NULL ;

CREATE TABLE `crafting_chimico` (
  `id_crafting_chimico` INT(2) NOT NULL,
  `cura_crafting_chimico` VARCHAR(100) DEFAULT NULL,
  `tossico_crafting_chimico` VARCHAR(100) DEFAULT NULL,
  `psicotropo_crafting_chimico` VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (`id_crafting_chimico`));

INSERT INTO `crafting_chimico` VALUES (1,NULL,NULL,NULL),(2,'RIMARGINAZIONE 1','SINGOLO','PARALISI'),(3,'RIMARGINAZIONE 2','SINGOLO','DISARMO'),(4,'RIMARGINAZIONE 3','DOPPIO','SPINTA 0'),(5,'RIMARGINAZIONE 4','DOPPIO','DOLORE'),(6,'RIMARGINAZIONE 5','TRIPLO','CONFUSIONE'),(7,'NEUTRALLIZZA PARALISI','TRIPLO',NULL),(8,'NEUTRALIZZA DOLORE',NULL,'SHOCK'),(9,'NEUTRALIZZA CONTINUO','CRASH','SINCERITÀ 1 DOMANDA'),(10,'NEUTRALLIZZA SHOK','QUADRUPLO','SHOCK 30'),(11,'NEUTRALLIZZA SONNO','SINGOLO','DOLORE 30'),(12,'NEUTRALIZZA VELENO','CRASH','SPINTA 0'),(13,'GUARIGIONE 1','QUADRUPLO','CONFUSIONE 30'),(14,'GUARIGIONE 3',NULL,'PAURA'),(15,'GUARIGIONE 5','A ZERO','DISARMO 30'),(16,'GUARIGIONE 7','A ZERO',NULL),(17,'GUARIGIONE 10','TRIPLO','PARALISI 30'),(18,NULL,'SINGOLO','COMANDO Prima Frase Imperativa'),(19,'NEUTRALIZZA MUTILAZIONE','COMA','SINCERITÀ 3 Domande'),(20,NULL,NULL,NULL);

ALTER TABLE `componenti_crafting` 
ADD COLUMN `effetto_sicuro_componente` VARCHAR(255) NULL AFTER `possibilita_dipendeza_componente`;

ALTER TABLE `ricette` 
CHANGE COLUMN `tipo_oggetto` `tipo_oggetto` SET('Programma', 'Sostanza', 'Arma Mischia', 'Pistola', 'Fucile Assalto', 'Mitragliatore', 'Shotgun', 'Fucile Precisione', 'Gadget Normale', 'Gadget Avanzato', 'Protesi Generica', 'Protesi Braccio', 'Protesi Gamba', 'Esoscheletro') NOT NULL ;

ALTER TABLE `componenti_ricetta` 
ADD COLUMN `ruolo_componente_ricetta` SET('Principio Attivo', 'Sostanza Satellite', 'Base') NULL AFTER `ordine_crafting`;

UPDATE `abilita` SET `prerequisito_abilita`='65' WHERE `id_abilita`='65';

ALTER TABLE `ricette` 
CHANGE COLUMN `id_unico_risultato` `id_unico_risultato_ricetta` INT(11) NULL DEFAULT NULL ;

ALTER TABLE `componenti_ricetta` 
DROP FOREIGN KEY `fk_ricette_id_ricetta`,
DROP FOREIGN KEY `fk_componente_ricetta`;
ALTER TABLE `componenti_ricetta` 
ADD COLUMN `id_componenti_ricetta` INT(11) NOT NULL AUTO_INCREMENT FIRST,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`id_componenti_ricetta`),
DROP INDEX `fk_ricette_id_ricetta_idx` ;

ALTER TABLE `componenti_ricetta` 
ADD INDEX `fk_ricetta_id_ricetta_idx` (`ricette_id_ricetta` ASC),
ADD INDEX `fk_componenti_id_componente_idx` (`componenti_crafting_id_componente` ASC);
ALTER TABLE `componenti_ricetta` 
ADD CONSTRAINT `fk_ricetta_id_ricetta`
  FOREIGN KEY (`ricette_id_ricetta`)
  REFERENCES `ricette` (`id_ricetta`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_componenti_id_componente`
  FOREIGN KEY (`componenti_crafting_id_componente`)
  REFERENCES `componenti_crafting` (`id_componente`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- MERGE SU DB-BETA FINO A QUI

-- 19 APRILE
ALTER TABLE `crafting_chimico` 
CHANGE COLUMN `cura_crafting_chimico` `curativo_crafting_chimico` VARCHAR(100) NULL DEFAULT NULL ;
