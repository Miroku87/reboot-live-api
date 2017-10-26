-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: reboot_live
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abilita`
--

DROP TABLE IF EXISTS `abilita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abilita` (
  `id_abilita` int(11) NOT NULL AUTO_INCREMENT,
  `nome_abilita` varchar(255) NOT NULL,
  `famiglia_abilita` varchar(255) DEFAULT NULL,
  `costo_abilita` int(11) NOT NULL,
  PRIMARY KEY (`id_abilita`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abilita`
--

LOCK TABLES `abilita` WRITE;
/*!40000 ALTER TABLE `abilita` DISABLE KEYS */;
/*!40000 ALTER TABLE `abilita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classi_civili`
--

DROP TABLE IF EXISTS `classi_civili`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classi_civili` (
  `id_classe_civile` int(11) NOT NULL AUTO_INCREMENT,
  `nome_classe_civile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_classe_civile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classi_civili`
--

LOCK TABLES `classi_civili` WRITE;
/*!40000 ALTER TABLE `classi_civili` DISABLE KEYS */;
/*!40000 ALTER TABLE `classi_civili` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classi_militari`
--

DROP TABLE IF EXISTS `classi_militari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classi_militari` (
  `id_classe_militare` int(11) NOT NULL AUTO_INCREMENT,
  `nome_classe_militare` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_classe_militare`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classi_militari`
--

LOCK TABLES `classi_militari` WRITE;
/*!40000 ALTER TABLE `classi_militari` DISABLE KEYS */;
/*!40000 ALTER TABLE `classi_militari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componenti_crafting`
--

DROP TABLE IF EXISTS `componenti_crafting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `componenti_crafting` (
  `nome_componente` varchar(255) NOT NULL,
  `tipo_componente` set('contenitore','batteria','applicazione') NOT NULL,
  `valore_componente` int(11) NOT NULL,
  PRIMARY KEY (`nome_componente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componenti_crafting`
--

LOCK TABLES `componenti_crafting` WRITE;
/*!40000 ALTER TABLE `componenti_crafting` DISABLE KEYS */;
/*!40000 ALTER TABLE `componenti_crafting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componenti_ricetta`
--

DROP TABLE IF EXISTS `componenti_ricetta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `componenti_ricetta` (
  `componenti_crafting_nome_componente` varchar(255) NOT NULL,
  `ricette_id_ricetta` int(11) NOT NULL,
  PRIMARY KEY (`componenti_crafting_nome_componente`,`ricette_id_ricetta`),
  KEY `fk_componenti_crafting_has_ricette_ricette1_idx` (`ricette_id_ricetta`),
  KEY `fk_componenti_crafting_has_ricette_componenti_crafting1_idx` (`componenti_crafting_nome_componente`),
  CONSTRAINT `fk_componenti_crafting_has_ricette_componenti_crafting1` FOREIGN KEY (`componenti_crafting_nome_componente`) REFERENCES `componenti_crafting` (`nome_componente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_componenti_crafting_has_ricette_ricette1` FOREIGN KEY (`ricette_id_ricetta`) REFERENCES `ricette` (`id_ricetta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componenti_ricetta`
--

LOCK TABLES `componenti_ricetta` WRITE;
/*!40000 ALTER TABLE `componenti_ricetta` DISABLE KEYS */;
/*!40000 ALTER TABLE `componenti_ricetta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventi`
--

DROP TABLE IF EXISTS `eventi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventi` (
  `id_evento` int(255) NOT NULL AUTO_INCREMENT,
  `data_inizio_evento` varchar(255) NOT NULL,
  `data_fine_evento` varchar(255) NOT NULL,
  `luogo` varchar(255) NOT NULL,
  `costo_anticipo` int(255) NOT NULL,
  `costo_standard` int(255) NOT NULL,
  `note` text,
  PRIMARY KEY (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventi`
--

LOCK TABLES `eventi` WRITE;
/*!40000 ALTER TABLE `eventi` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giocatori`
--

DROP TABLE IF EXISTS `giocatori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giocatori` (
  `codice_fiscale_giocatore` varchar(255) NOT NULL,
  `password_giocatore` varchar(255) NOT NULL,
  `nome_giocatore` varchar(255) NOT NULL,
  `cognome_giocatore` varchar(255) NOT NULL,
  `email_giocatore` varchar(255) NOT NULL,
  `ruoli_id_ruolo` int(255) NOT NULL,
  PRIMARY KEY (`codice_fiscale_giocatore`,`ruoli_id_ruolo`),
  KEY `fk_giocatori_ruoli1_idx` (`ruoli_id_ruolo`),
  CONSTRAINT `fk_giocatori_ruoli1` FOREIGN KEY (`ruoli_id_ruolo`) REFERENCES `ruoli` (`id_ruolo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giocatori`
--

LOCK TABLES `giocatori` WRITE;
/*!40000 ALTER TABLE `giocatori` DISABLE KEYS */;
INSERT INTO `giocatori` VALUES ('SLVNDR87C27F205N','ciao','Andrea','Silvestri','miroku_87@yahoo.it',1);
/*!40000 ALTER TABLE `giocatori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grants`
--

DROP TABLE IF EXISTS `grants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grants` (
  `id_grant` int(255) NOT NULL AUTO_INCREMENT,
  `nome_grant` varchar(255) NOT NULL,
  `descrizione_grant` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_grant`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grants`
--

LOCK TABLES `grants` WRITE;
/*!40000 ALTER TABLE `grants` DISABLE KEYS */;
INSERT INTO `grants` VALUES (1,'visualizza_pagina_personaggi','L\'utente potrà visualizzare la pagina dei suoi personaggi.'),(2,'visualizza_pagina_componenti','L\'utente potrà visualizzare la pagina con la lista dei componenti.'),(3,'visualizza_pagina_ricette','L\'utente potrà visualizzare la pagina con la lista delle ricette.'),(4,'visualizza_pagina_gestione_eventi','L\'utente potrà visualizzare la pagina di gestione degli eventi.'),(5,'visualizza_pagina_eventi','L\'utente potrà visualizzare la pagina con la lista degli eventi.'),(6,'visualizza_pagina_giocatori','L\'utente potrà visualizzare la pagina con la lista dei giocatori iscritti.'),(7,'visualizza_tutti_personaggi','L\'utente potrà visualizzare tutti i personaggi creati dagli altri utenti.'),(8,'crea_personaggio','L\'utente può creare un nuovo personaggio.'),(9,'modifica_personaggio','L\'utente può modificare qualsiasi parametro di un personaggio qualsiasi.'),(10,'cancella_personaggio','L\'utente può eliminare definitivamente un personaggio dal database.'),(11,'crea_ruolo_utente','L\'utente può creare un ruolo con date grant.'),(12,'modifica_ruolo_utente','L\'utente può modificare un ruolo utente già esistente.'),(13,'cancella_ruolo_utente','L\'utente può eliminare definitivamente un ruolo dal database. Gli utenti associati diventeranno ospiti.'),(14,'crea_componente','L\'utente può creare un componente crafting.'),(15,'modifica_componente','L\'utente può modificare un componente esistente.'),(16,'elimina_componente','L\'utente può eliminare definitivamente un componente. Tutte le ricette con quel componente vengono eliminate a cascata.'),(17,'crea_evento','L\'utente può creare eventi di gioco.'),(18,'modifica_evento','L\'utente può modificare un evento già creato.'),(19,'elimina_evento','L\'utente può eliminare definitivamente un evento.'),(20,'modifica_giocatore','L\'utente può modificare i dati di un qualsiasi utente del quale può vedere i dati.'),(21,'elimina_giocatore','L\'utente può eliminare definitivamente un qualsiasi utente di cui può visualizzare i dati.');
/*!40000 ALTER TABLE `grants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iscrizione_personaggi`
--

DROP TABLE IF EXISTS `iscrizione_personaggi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iscrizione_personaggi` (
  `eventi_id_evento` int(255) NOT NULL,
  `personaggi_id_personaggio` int(11) NOT NULL,
  PRIMARY KEY (`eventi_id_evento`,`personaggi_id_personaggio`),
  KEY `fk_eventi_has_personaggi_personaggi1_idx` (`personaggi_id_personaggio`),
  KEY `fk_eventi_has_personaggi_eventi1_idx` (`eventi_id_evento`),
  CONSTRAINT `fk_eventi_has_personaggi_eventi1` FOREIGN KEY (`eventi_id_evento`) REFERENCES `eventi` (`id_evento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_eventi_has_personaggi_personaggi1` FOREIGN KEY (`personaggi_id_personaggio`) REFERENCES `personaggi` (`id_personaggio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iscrizione_personaggi`
--

LOCK TABLES `iscrizione_personaggi` WRITE;
/*!40000 ALTER TABLE `iscrizione_personaggi` DISABLE KEYS */;
/*!40000 ALTER TABLE `iscrizione_personaggi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifiche`
--

DROP TABLE IF EXISTS `notifiche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifiche` (
  `giocatori_codice_fiscale_giocatore` varchar(255) NOT NULL,
  `storico_azioni_id_azione` int(255) NOT NULL,
  `notifica_letta` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`giocatori_codice_fiscale_giocatore`,`storico_azioni_id_azione`,`notifica_letta`),
  KEY `fk_giocatori_has_storico_azioni_storico_azioni1_idx` (`storico_azioni_id_azione`),
  KEY `fk_giocatori_has_storico_azioni_giocatori1_idx` (`giocatori_codice_fiscale_giocatore`),
  CONSTRAINT `fk_giocatori_has_storico_azioni_giocatori1` FOREIGN KEY (`giocatori_codice_fiscale_giocatore`) REFERENCES `giocatori` (`codice_fiscale_giocatore`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_giocatori_has_storico_azioni_storico_azioni1` FOREIGN KEY (`storico_azioni_id_azione`) REFERENCES `storico_azioni` (`id_azione`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifiche`
--

LOCK TABLES `notifiche` WRITE;
/*!40000 ALTER TABLE `notifiche` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifiche` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personaggi`
--

DROP TABLE IF EXISTS `personaggi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personaggi` (
  `id_personaggio` int(11) NOT NULL AUTO_INCREMENT,
  `nome_personaggio` varchar(255) NOT NULL,
  `cognome_personaggio` varchar(255) DEFAULT NULL,
  `background_personaggio` longtext,
  `punti_esperienza_personaggio` int(11) NOT NULL,
  `crediti_personaggio` int(11) NOT NULL DEFAULT '0',
  `giocatori_codice_fiscale_giocatore` varchar(255) NOT NULL,
  `classi_civili_id_classe_civile` int(11) NOT NULL,
  `classi_militari_id_classe_militare` int(11) NOT NULL,
  PRIMARY KEY (`id_personaggio`,`giocatori_codice_fiscale_giocatore`,`classi_civili_id_classe_civile`,`classi_militari_id_classe_militare`),
  KEY `fk_personaggi_giocatori_idx` (`giocatori_codice_fiscale_giocatore`),
  KEY `fk_personaggi_classi_civili1_idx` (`classi_civili_id_classe_civile`),
  KEY `fk_personaggi_classi_militari1_idx` (`classi_militari_id_classe_militare`),
  CONSTRAINT `fk_personaggi_classi_civili1` FOREIGN KEY (`classi_civili_id_classe_civile`) REFERENCES `classi_civili` (`id_classe_civile`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_personaggi_classi_militari1` FOREIGN KEY (`classi_militari_id_classe_militare`) REFERENCES `classi_militari` (`id_classe_militare`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_personaggi_giocatori` FOREIGN KEY (`giocatori_codice_fiscale_giocatore`) REFERENCES `giocatori` (`codice_fiscale_giocatore`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personaggi`
--

LOCK TABLES `personaggi` WRITE;
/*!40000 ALTER TABLE `personaggi` DISABLE KEYS */;
/*!40000 ALTER TABLE `personaggi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personaggi_has_abilita`
--

DROP TABLE IF EXISTS `personaggi_has_abilita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personaggi_has_abilita` (
  `personaggi_id_personaggio` int(11) NOT NULL,
  `abilita_id_abilita` int(11) NOT NULL,
  PRIMARY KEY (`personaggi_id_personaggio`,`abilita_id_abilita`),
  KEY `fk_personaggi_has_abilita_abilita1_idx` (`abilita_id_abilita`),
  KEY `fk_personaggi_has_abilita_personaggi1_idx` (`personaggi_id_personaggio`),
  CONSTRAINT `fk_personaggi_has_abilita_abilita1` FOREIGN KEY (`abilita_id_abilita`) REFERENCES `abilita` (`id_abilita`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_personaggi_has_abilita_personaggi1` FOREIGN KEY (`personaggi_id_personaggio`) REFERENCES `personaggi` (`id_personaggio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personaggi_has_abilita`
--

LOCK TABLES `personaggi_has_abilita` WRITE;
/*!40000 ALTER TABLE `personaggi_has_abilita` DISABLE KEYS */;
/*!40000 ALTER TABLE `personaggi_has_abilita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ricette`
--

DROP TABLE IF EXISTS `ricette`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ricette` (
  `id_ricetta` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_ricetta` int(255) NOT NULL,
  `nome_ricetta` varchar(255) NOT NULL,
  `personaggi_id_personaggio` int(11) NOT NULL,
  PRIMARY KEY (`id_ricetta`,`personaggi_id_personaggio`),
  KEY `fk_ricette_personaggi1_idx` (`personaggi_id_personaggio`),
  KEY `fk_ricette_tipo_ricetta_idx` (`tipo_ricetta`),
  CONSTRAINT `fk_ricette_personaggi1` FOREIGN KEY (`personaggi_id_personaggio`) REFERENCES `personaggi` (`id_personaggio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ricette_tipo_ricetta` FOREIGN KEY (`tipo_ricetta`) REFERENCES `tipi_ricetta` (`id_tipo_ricetta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ricette`
--

LOCK TABLES `ricette` WRITE;
/*!40000 ALTER TABLE `ricette` DISABLE KEYS */;
/*!40000 ALTER TABLE `ricette` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruoli`
--

DROP TABLE IF EXISTS `ruoli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruoli` (
  `id_ruolo` int(255) NOT NULL AUTO_INCREMENT,
  `nome_ruolo` varchar(255) NOT NULL,
  PRIMARY KEY (`id_ruolo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruoli`
--

LOCK TABLES `ruoli` WRITE;
/*!40000 ALTER TABLE `ruoli` DISABLE KEYS */;
INSERT INTO `ruoli` VALUES (1,'admin'),(2,'staff'),(3,'giocatore'),(4,'ospite');
/*!40000 ALTER TABLE `ruoli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruoli_has_grants`
--

DROP TABLE IF EXISTS `ruoli_has_grants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruoli_has_grants` (
  `ruoli_id_ruolo` int(255) NOT NULL,
  `grants_id_grant` int(255) NOT NULL,
  PRIMARY KEY (`ruoli_id_ruolo`,`grants_id_grant`),
  KEY `fk_ruoli_has_grants_grants1_idx` (`grants_id_grant`),
  KEY `fk_ruoli_has_grants_ruoli1_idx` (`ruoli_id_ruolo`),
  CONSTRAINT `fk_ruoli_has_grants_grants1` FOREIGN KEY (`grants_id_grant`) REFERENCES `grants` (`id_grant`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ruoli_has_grants_ruoli1` FOREIGN KEY (`ruoli_id_ruolo`) REFERENCES `ruoli` (`id_ruolo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruoli_has_grants`
--

LOCK TABLES `ruoli_has_grants` WRITE;
/*!40000 ALTER TABLE `ruoli_has_grants` DISABLE KEYS */;
INSERT INTO `ruoli_has_grants` VALUES (1,1),(1,2),(1,3),(1,4);
/*!40000 ALTER TABLE `ruoli_has_grants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storico_azioni`
--

DROP TABLE IF EXISTS `storico_azioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storico_azioni` (
  `id_azione` int(255) NOT NULL AUTO_INCREMENT,
  `id_personaggio_azione` int(255) NOT NULL,
  `id_esecutore_azione` int(255) NOT NULL,
  `tipo_azione` set('UPDATE','DELETE','INSERT') NOT NULL,
  `valore_vecchio_azione` text NOT NULL,
  `valore_nuovo_azione` text NOT NULL,
  PRIMARY KEY (`id_azione`),
  KEY `personaggio_idx` (`id_personaggio_azione`),
  CONSTRAINT `personaggio` FOREIGN KEY (`id_personaggio_azione`) REFERENCES `personaggi` (`id_personaggio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storico_azioni`
--

LOCK TABLES `storico_azioni` WRITE;
/*!40000 ALTER TABLE `storico_azioni` DISABLE KEYS */;
/*!40000 ALTER TABLE `storico_azioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipi_ricetta`
--

DROP TABLE IF EXISTS `tipi_ricetta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipi_ricetta` (
  `id_tipo_ricetta` int(255) NOT NULL AUTO_INCREMENT,
  `tipo_ricetta` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tipo_ricetta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipi_ricetta`
--

LOCK TABLES `tipi_ricetta` WRITE;
/*!40000 ALTER TABLE `tipi_ricetta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipi_ricetta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'reboot_live'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-26 23:25:58
