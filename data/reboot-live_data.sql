
--
-- Dumping data for table `classi_civili`
--

LOCK TABLES `classi_civili` WRITE;
/*!40000 ALTER TABLE `classi_civili` DISABLE KEYS */;
INSERT INTO `classi_civili` VALUES (1,'Sportivo'),(2,'Giornalista'),(3,'Netrunner'),(4,'Tecnico'),(5,'Biomedico'),(6,'Guardia di Sicurezza'),(7,'Sciacallo');
/*!40000 ALTER TABLE `classi_civili` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `classi_militari`
--

LOCK TABLES `classi_militari` WRITE;
/*!40000 ALTER TABLE `classi_militari` DISABLE KEYS */;
INSERT INTO `classi_militari` VALUES (1,'Guardiano','base'),(2,'Guardiano','avanzata'),(3,'Assaltatore','base'),(4,'Assaltatore','avanzata'),(5,'Supporto','base'),(6,'Supporto','avanzata'),(7,'Guastatore','base'),(8,'Guastatore','avanzata');
/*!40000 ALTER TABLE `classi_militari` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `grants`
--

LOCK TABLES `grants` WRITE;
/*!40000 ALTER TABLE `grants` DISABLE KEYS */;
INSERT INTO `grants` VALUES (1,'visualizza_pagina_personaggi','L\'utente potrà visualizzare la pagina dei suoi personaggi.'),(2,'visualizza_pagina_componenti','L\'utente potrà visualizzare la pagina con la lista dei componenti.'),(3,'visualizza_pagina_ricette','L\'utente potrà visualizzare la pagina con la lista delle ricette.'),(4,'visualizza_pagina_gestione_eventi','L\'utente potrà visualizzare la pagina di gestione degli eventi.'),(5,'visualizza_pagina_eventi','L\'utente potrà visualizzare la pagina con la lista degli eventi.'),(6,'visualizza_pagina_giocatori','L\'utente potrà visualizzare la pagina con la lista dei giocatori iscritti.'),(7,'visualizza_tutti_personaggi','L\'utente potrà visualizzare tutti i personaggi creati dagli altri utenti.'),(8,'crea_personaggio','L\'utente può creare un nuovo personaggio.'),(9,'modifica_personaggio','L\'utente può modificare qualsiasi parametro di un personaggio qualsiasi.'),(10,'cancella_personaggio','L\'utente può eliminare definitivamente un personaggio dal database.'),(11,'crea_ruolo_utente','L\'utente può creare un ruolo con date grant.'),(12,'modifica_ruolo_utente','L\'utente può modificare un ruolo utente già esistente.'),(13,'cancella_ruolo_utente','L\'utente può eliminare definitivamente un ruolo dal database. Gli utenti associati diventeranno ospiti.'),(14,'crea_componente','L\'utente può creare un componente crafting.'),(15,'modifica_componente','L\'utente può modificare un componente esistente.'),(16,'elimina_componente','L\'utente può eliminare definitivamente un componente. Tutte le ricette con quel componente vengono eliminate a cascata.'),(17,'crea_evento','L\'utente può creare eventi di gioco.'),(18,'modifica_evento','L\'utente può modificare un evento già creato.'),(19,'elimina_evento','L\'utente può eliminare definitivamente un evento.'),(20,'modifica_giocatore','L\'utente può modificare i dati di un qualsiasi utente del quale può vedere i dati.'),(21,'elimina_giocatore','L\'utente può eliminare definitivamente un qualsiasi utente di cui può visualizzare i dati.');
/*!40000 ALTER TABLE `grants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ruoli`
--

LOCK TABLES `ruoli` WRITE;
/*!40000 ALTER TABLE `ruoli` DISABLE KEYS */;
INSERT INTO `ruoli` VALUES (1,'admin'),(2,'staff'),(3,'giocatore'),(4,'ospite');
/*!40000 ALTER TABLE `ruoli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ruoli_has_grants`
--

LOCK TABLES `ruoli_has_grants` WRITE;
/*!40000 ALTER TABLE `ruoli_has_grants` DISABLE KEYS */;
INSERT INTO `ruoli_has_grants` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21);
/*!40000 ALTER TABLE `ruoli_has_grants` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Dumping data for table `giocatori`
--

LOCK TABLES `giocatori` WRITE;
/*!40000 ALTER TABLE `giocatori` DISABLE KEYS */;
INSERT INTO `giocatori` VALUES ('ABCDEF90C04C345F','ciao','Matteo','Barbieri','b-teo-90@libero.it',3),('SLVNDR87C27F205N','ciao','Andrea','Silvestri','miroku_87@yahoo.it',1);
/*!40000 ALTER TABLE `giocatori` ENABLE KEYS */;
UNLOCK TABLES;
