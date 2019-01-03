


-- 19 OTTOBRE
INSERT INTO `grants` (`nome_grant`, `descrizione_grant`) VALUES ('inviaMessaggioPiuDestinatari', 'L\'utente può inserire diversi destinatari all\'interno del campo del destinatario nell\'invio dei messaggi privati.');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('admin', 'inviaMessaggioPiuDestinatari');
INSERT INTO `ruoli_has_grants` (`ruoli_nome_ruolo`, `grants_nome_grant`) VALUES ('staff', 'inviaMessaggioPiuDestinatari');


