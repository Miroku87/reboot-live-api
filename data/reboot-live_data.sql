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
-- Table structure for table `abilita_civili`
--

DROP TABLE IF EXISTS `abilita_civili`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abilita_civili` (
  `id_abilita_civile` int(255) unsigned NOT NULL,
  `nome_abilita_civile` varchar(255) NOT NULL,
  `costo_px_abilita_civile` int(10) NOT NULL,
  `descrizione_abilita_civile` varchar(255) NOT NULL,
  `prerequisito_abilita_civile` int(255) DEFAULT NULL,
  `classi_civili_id_classe_civile` int(11) NOT NULL,
  PRIMARY KEY (`id_abilita_civile`,`classi_civili_id_classe_civile`),
  KEY `fk_abilita_civili_classi_civili1_idx` (`classi_civili_id_classe_civile`),
  CONSTRAINT `fk_abilita_civili_classi_civili1` FOREIGN KEY (`classi_civili_id_classe_civile`) REFERENCES `classi_civili` (`id_classe_civile`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abilita_civili`
--

LOCK TABLES `abilita_civili` WRITE;
/*!40000 ALTER TABLE `abilita_civili` DISABLE KEYS */;
INSERT INTO `abilita_civili` VALUES (1,'GLICH',20,'Una volta per vita, se il personaggio entra in uno dei punti di Respown viene teletrasportato a un altro. (Pu&#242; essere utilizzata unicamente all&#8217;interno di una partita di DEATHMATCH)',NULL,1),(2,'LAG',20,'Una volta per vita , il personaggio se si muove a scatti dichiara IMMUNE! al primo danno che subisce. (Pu&#242; essere utilizzata unicamente all&#8217;interno di una partita di DEATHMATCH)',NULL,1),(3,'BARRA SPAZIATRICE',20,'Se il personaggio si muove saltellando dichiara IMMUNE! ai danni delle chiamate ad area e raggio. (Pu&#242; essere utilizzata unicamente all&#8217;interno di una partita di DEATHMATCH)',NULL,1),(4,'TEA BAG',20,'Se al primo avversario abbattuto il personaggio esulta in modo evidente al pubblico, guadagnaautomaticamente 1 punto in classifica nelle partite DEATHMATCH. (Pu&#242; essere utilizzata unicamente all&#8217;interno di una partita di DEATHMATCH)',NULL,1),(5,'CONOSCENZA MAPPE',20,'Il personaggio ha tempo 15 secondi per girare la mappa prima di giocare la partita. (Pu&#242; essere utilizzata unicamente all&#8217;interno di una partita di DEATHMATCH)',NULL,1),(6,'AKIMBO',20,'Il personaggio pu&#242; giocare usando 2 pistole. (Pu&#242; essere utilizzata unicamente all&#8217;interno di una partita di DEATHMATCH)',NULL,1),(7,'AIM BOT',20,'Una volta per Vita il personaggio pu&#242; fare la dichiarazione di danno a dito indicando la vittima. (Pu&#242; essere utilizzata unicamente all&#8217;interno di una partita di DEATHMATCH)',NULL,1),(8,'AUTOKILL',20,'Il personaggio pu&#242; suicidarsi per non dare punti al nemico. (Pu&#242; essere utilizzata unicamente all&#8217;interno di una partita di DEATHMATCH)',NULL,1),(9,'LANCIA LA BANDIERA',20,'Se il personaggio in un match &#8220; cattura la bandiera&#8221; &#232; equipaggiato con la sua arma base e tiene la bandiera lapu&#242; lanciare. (Pu&#242; essere utilizzata unicamente all&#8217;interno di una partita di DEATHMATCH)',NULL,1),(10,'FINTO MORTO',20,'Il personaggio pu&#242; fingersi morto per 30 secondi consecutivi. (Pu&#242; essere utilizzata unicamente all&#8217;interno di una partita di DEATHMATCH)',NULL,1),(11,'CAMPERONE',20,'Ogni volta che il personaggio sta fermo in un posto per sparare almeno per 3 secondi pu&#242; dichiarare al primocolpo che spara + 1 alla chiamata secondo lo schema SINGOLO!, DOPPIO! TRIPLO, QUADRUPLO! (Pu&#242; essere utilizzata unicamente all&#8217;inte',NULL,1),(12,'IDOLO DELLA FOLLA',40,'Se il personaggio ha appena vinto ( o fa parte della squadra che ha vinto) una partita pu&#242; richiedere allosponsor un extra del 25% del suo ingaggio dichiarando SONO L&#8217;IDOLO DELLA FOLLA.',-1,1),(13,'COCA E MIGNOTTE',70,'Il personaggio sceglie tra una di queste due opzioni:DROGA: il personaggio ha passato la sua vita a sniffare, risulta immune agli effetti negativi fisici delledroghe da inalazione.CONTATTO: il personaggio ha passato la sua vita a contatto con sostanze sch',12,1),(14,'STALKER',20,'I numerosi successi sportivi e mondani del personaggio hanno attirato l&#8217;attenzione di uno Stalker che lo seguir&#224;dall&#8217;ombra e potr&#224; fornire qualche aiuto, ma anche delle complicazioni, al personaggio.',12,1),(15,'GAVETTA',20,'Tra un evento e il successivo il personaggio pu&#242; inviare 1 articolo per farlo pubblicare, se questo avvieneguadagna Bit aggiuntivi che gli saranno consegnati al prossimo evento.',NULL,2),(16,'OTTIMO SCRITTORE',40,'I compensi degli articoli pubblicati aumentano del 30%.',15,2),(17,'CAMPO DI SPECIALIZZAZIONE 1',40,'Il personaggio sceglie tra i seguenti campi: cronaca nera, cronaca rosa, sport, economica, politica, giornalismospazzatura.Scrivendo nel campo selezionato pu&#242; mandare un articolo aggiuntivo.',NULL,2),(18,'CAMPO DI SPECIALIZZAZIONE 2',40,'Il personaggio sceglie tra i seguenti campi: cronaca nera, cronaca rosa, sport, economica, politica, giornalismospazzatura.Scrivendo nel campo selezionato pu&#242; mandare un articolo aggiuntivo.',NULL,2),(19,'CAMPO DI SPECIALIZZAZIONE 3',40,'Il personaggio sceglie tra i seguenti campi: cronaca nera, cronaca rosa, sport, economica, politica, giornalismospazzatura.Scrivendo nel campo selezionato pu&#242; mandare un articolo aggiuntivo.',NULL,2),(20,'CAMPO DI SPECIALIZZAZIONE 4',40,'Il personaggio sceglie tra i seguenti campi: cronaca nera, cronaca rosa, sport, economica, politica giornalismospazzatura.Scrivendo nel campo selezionato pu&#242; mandare un articolo aggiuntivo.',NULL,2),(21,'FOTO SCOTTANTI',30,'Il personaggio ha contatti per vendere facilmente e a un buon prezzo foto compromettenti (se le devecomunque procurare in gioco).',NULL,2),(22,'CLICCA QUI',60,'Il personaggio ha un sito dove vende informazioni spazzatura per allocchi, questo gli garantisce il 25% in pi&#249;del tuo attuale stipendio.',NULL,2),(23,'DISINFORMAZIONE',80,'Il personaggio pu&#242; far pubblicare informazioni palesemente false anche sui canali di informazione regolari.',NULL,2),(24,'DEVIARE L&#8217;ATTENZIONE',40,'Il personaggio pu&#242; scrivere un articolo &#8220;realistico &#8220;che devi l&#8217;attenzione da un altro evento che vuole nascondere( questa abilit&#224; blocca un articolo gi&#224; uscito fino all&#8217;evento successivo).',NULL,2),(25,'SERVO DEL SISTEMA',120,'Il personaggio guadagna il 75% in pi&#249; del suo stipendio MA non potr&#224; mai comprare le seguenti abilit&#224;:DISINFORMAZIONE, DEVIARE L&#8217;ATTENZIONE, SPECCHIETTO PER GLI ALLOCCHI, INFORMAZIONI FALSE.',NULL,2),(26,'INFORMAZIONI PRELIBATE',30,'Il personaggio ottiene informazioni commerciali preferenziali sull&#8217;apposita sezione del Ravnet.',NULL,2),(27,'BUNGA BUNGA',30,'Il personaggio pu&#242; investire Bit (quanti a sua discrezione) per ottenere informazioni su movimenti della politicae di personaggi di spicco della politica.',NULL,2),(28,'VOCI DI STRADA',30,'Il personaggio ottiene informazioni di quello che accade nelle strade in ambiti legati a Guardie di vigilanza omalavita tra un live e l&#8217;altro inoltrando allo staff una mail con la domanda.',NULL,2),(29,'PROGRAMMARE',20,'Il personaggio pu&#242; assemblare stringhe di codice per creare programmi singoli.',NULL,3),(30,'PROGRAMMAZIONE AVANZATA',40,'Il personaggio pu&#242; assemblare due programmi assieme; i bonus dei singoli programmi sono accorpati. Iprogrammi cos&#236; assemblati non possono pi&#249; essere separati.',29,3),(31,'PROGRAMMAZIONE TOTALE',60,'Il personaggio pu&#242; assemblare fino a 4 programmi assieme; i bonus dei singoli programmi sono accorpati. Iprogrammi cos&#236; assemblati non possono pi&#249; essere separati.',30,3),(32,'RIALLOCAZIONE CODICE',50,'Nella programmazione il giocatore pu&#242; modificare di +/&#8211; 1 uno dei parametri numerici di un singolo programmaprima del Debug finale.',NULL,3),(33,'CTRL&#8211;C , CTRL&#8211;V',50,'Il giocatore pu&#242; richiedere allo staff di ricopiare un programma in suo possesso una volta per evento .',NULL,3),(34,'TUTTO DA SOLO',60,'Il giocatore in possesso di una singola stringa di codice pu&#242; compilare un programma di massimo due righeutilizzando due volte la stessa stringa di codice.',NULL,3),(35,'CANCELLAZIONE PROGRAMMA',50,'Il personaggio mentre e nella rete pu&#242; decidere di cancellare un qualsiasi programma che ha equipaggiato perottenere uno spazio vuoto.',NULL,3),(36,'BRUCIARE IL SUPPORTO',50,'Il personaggio pu&#242; chiedere allo staff un cartellino &#8220;CRIPT&#8211;LOCK&#174;&#8221; .',NULL,3),(37,'MULTITASKING',60,'Il personaggio pu&#242; caricare fino ad un numero di programmi pari alla met&#224; delle abilit&#224; da netrunner chepossiede (arrotondate per difetto, con un minimo di 2) prima di entrare nella rete.',NULL,3),(38,'ZERG RUSH',30,'Il personaggio ogni volta che accede a una rete virtuale pu&#242; avvisare un membro staff che vuole adoperarel&#39;abilit&#224;; per ogni 2 cartellini codice che sacrifica ottiene 1 suo &#8220; clone &#8220; ( con profilo base e senza i vantaggi dieventu',37,3),(39,'STRADA SICURA',30,'Il personaggio 1 volta per accesso alla rete pu&#242; inviare in modo sicuro un pacchetto dati a una sua casella&#8220;sicura&#8221;. In termini di gioco pu&#242; prendere un singolo cartellino dati in suo possesso all&#39;interno della rete econsegnarlo ',NULL,3),(40,'NEURO ARMATURA',30,'Il personaggio ha installato un programma di protezione latente, se non equipaggiato con programmi diarmatura conta comunque come avere uno Shield da 6 punti. Nel caso sia gi&#224; presente un programma diarmatura la Neuro Armatura non si attiva.',NULL,3),(41,'SISTEMA DI SICUREZZA INTEGRATO',50,'Il personaggio nella rete virtuale pu&#242; dichiare DISINTEGRAZIONE! con bersaglio se stesso anche se al momentonon &#232; cosciente.',38,3),(42,'GUERRIGLIA INFORMATICA',40,'Il personaggio pu&#242;, quando entra nella rete, dichiarare BONUS! +X DANNI! RAGGIO 5! oppure dichiarareBONUS! +X PUNTI FERITA! RAGGIO 5! (in entrambi i casi X &#232; pari alla met&#224; dei personaggi che sono entratiinsieme a lui nella rete virtuale).',37,3),(43,'RIPARAZIONE',30,'Il personaggio pu&#242; dichiarare RIPARAZIONE 1 dopo 10 Minuti di lavoro.',NULL,4),(44,'RIPARAZIONE VELOCE',40,'Il personaggio pu&#242; dichiarare RIPARAZIONE 1 dopo 5 Minuti.',43,4),(45,'MAGO DELLA BRUGOLA',50,'Il personaggio aggiunge sempre + 1 al suo valore di RIPARAZIONE! Dato dall&#8217;abilit&#224; Riparare.',NULL,4),(46,'LAVORO DI SQUADRA',40,'Il personaggio se lavora con un altro personaggio con questa abilit&#224; dimezza i tempi di riparazione(approssimati per eccesso) e aggiunge +1 al valore della chiamata. Questa abilit&#224; non pu&#242; essere usataassieme a RIPARAZIONE VELOCE.',NULL,4),(47,'SPECIALIZZAZIONE &#8211; ARMI',40,'Il personaggio pu&#242; scegliere nei progetti fattibili qualsiasi tipologia da arma.',NULL,4),(48,'SPECIALIZZAZIONE &#8211; PROTESI',40,'Il personaggio pu&#242; scegliere nei progetti fattibili qualsiasi tipologia di protesi.',NULL,4),(49,'SPECIALIZZAZIONE &#8211; GADGET e SHIELD',40,'Il personaggio pu&#242; scegliere nei progetti fattibili qualsiasi tipologia di gadget e Shield.',NULL,4),(50,'SPECIALIZZAZIONE &#8211; ESOSCHELETRI e SCUDI',40,'Il personaggio pu&#242; scegliere nei progetti fattibili qualsiasi tipologia di potenziamento per tutte le tipologie diesoscheletro e scudi.',NULL,4),(51,'SPECIALIZZAZIONE AVANZATA &#8211; ESOSCHELETRI',40,'Il personaggio pu&#242; progettare esoscheletri completi.',50,4),(52,'SPECIALIZZAZIONE AVANZATA &#8211; GADGET',40,'Il personaggio pu&#242; progettare gadget complessi.',49,4),(53,'SCANSIONE SCHEMI',80,'Il personaggio pu&#242; demolire un oggetto per scoprire il suo esatto schema di realizzazione',NULL,4),(54,'SMONTAGGIO VELOCE',50,'Il personaggio pu&#242; smontare qualsiasi oggetto dotato di cartellino recuperando la componente pi&#249; facile daottenere. Il personaggio pu&#242;, mimando di smontare l&#8217;oggetto per 2 minuti, tagliare il cartellino lungo la lineatratteggiata ed i',NULL,4),(55,'RICERCA MIRATA',60,'Il personaggio pu&#242; demolire un oggetto per ottenere un suo componente. Il personaggio deve consegnarel&#8217;oggetto allo staff specificando quale parte vuole ottenere tra le seguenti tipologie: struttura, batteria,applicativo.',NULL,4),(56,'MACCHINARI SPECIALISTICI',20,'Il personaggio &#232; in grado di interagire ed adoperare macchinari complessi come ad esempio torrette laser omacchinari pesanti.',NULL,4),(57,'SQUADRA DI AIUTANTI',60,'Il personaggio pu&#242; farsi aiutare da altri personaggi (da uno ad un massimo pari alla met&#224; delle abilit&#224; di Tecnicoche possiede, arrotondate per difetto) nel compiere le operazioni di riparazione. Se lui, i suoi aiutanti e l&#8217;oggettoda ',NULL,4),(58,'IMPLANTOLOGIA CIBERNETICA',20,'Il personaggio &#232; in grado di montare protesi a un personaggio se opera in un struttura adeguata. L&#8217;operazionedeve essere mimata per 10 minuti.',NULL,5),(59,'IMPLANTOLOGIA CIBERNETICA MIGLIORATA',40,'Il personaggio &#232; in grado di montare protesi a un personaggio se opera in un struttura adeguata. L&#8217;operazionedeve essere mimata per 5 minuti.',NULL,5),(60,'CURE INTENSIVE',30,'Il personaggio pu&#242; dichiarare GUARIGIONE! X! (dove X &#232; pari alla met&#224; delle abilit&#224; di medicina che possiede)dopo aver mimato la procedura per 5 minuti ad un personaggio che non sia in stato di coma.',NULL,5),(61,'SINTESI E ANALISI CHIMICA',20,'Il personaggio &#232; in grado di analizzare e produrre sostanze chimiche tramite la specifica sezione del databasemedico e dello strumento di sintesi preposto.',NULL,5),(62,'PRODUZIONE MIGLIORATA',60,'Durante la sintesi chimica un personaggio ottiene il doppio dei prodotti normalmente ottenibili.',NULL,5),(63,'PRIME CURE',20,'Il personaggio pu&#242;, dopo 10 secondi di lavoro, allungare il tempo di coma del bersaglio di ulteriori 5 minuti. Pu&#242;essere utilizzata solo una volta sullo stesso bersaglio, anche da diversi Biomedici. Il giocatore dovr&#224; spiegare albersaglio g',NULL,5),(64,'CURE AVANZATE',40,'Il personaggio pu&#242; dichiarare GUARIGIONE! X! (dove X &#232; pari alla met&#224; delle abilit&#224; di medicina che possiede)su un personaggio in coma dopo aver mimato la procedura per 10 minuti.',60,5),(65,'EQUIPE MEDICA',40,'Il personaggio se lavora con un altro personaggio con questa abilit&#224; aggiunge +1 al valore della chiamata perogni personaggio con cui collabora.',NULL,5),(66,'GESTIRE GLI AIUTANTI',60,'Il personaggio pu&#242; farsi aiutare da altri personaggi (da uno ad un massimo pari alla met&#224; delle abilit&#224; dimedicina che possiede, arrotondate per difetto ) nel compiere le operazioni mediche. Se lui, i suoi aiutanti e ipazienti sono in un ra',NULL,5),(67,'GESTIRE I TEMPI',60,'Il personaggio pu&#242; farsi aiutare da altri personaggi (da uno ad un massimo pari alla met&#224; delle abilit&#224; dimedicina che possiede, arrotondate per difetto) nel compiere le operazioni mediche. Se lui, i suoi aiutanti e ilpaziente sono in un ra',NULL,5),(68,'NON PUOI INGRANDIRLA DI PIU&#8217;?',20,'Il personaggio pu&#242; ottenere informazioni aggiuntive tramite la Ravnet, su prove che sono gi&#224; state analizzate.',NULL,6),(69,'GRISSOM E&#8217; AMICO MIO',20,'Il personaggio ottiene informazioni aggiunte nei cartellini &#8220;Interazione&#8221;.',NULL,6),(70,'LINGUAGGIO DEL CORPO',40,'Il personaggio, dopo aver parlato almeno 5 minuti con una persona pu&#242; dichiarare SINCERITA&#8217;!: MI HAIMENTITO SU QUALCOSA IN QUESTI ULTIMI 5 MINUTI?. Non &#232; possibile interrogare con questa abilit&#224; la stessapersona pi&#249; volte nell&#8',NULL,6),(71,'DIREZIONE DEI COLPI',20,'Il personaggio se in presenza di un cadavere pu&#242; chiedere allo staff la direzione, il numero di colpi e la tipologiadell&#8217;arma che ha ucciso la persona.',NULL,6),(72,'INTERROGATORIO',60,'Durante un interrogatorio il personaggio pu&#242;, dopo aver posto allo stesso un bersaglio 5 domande sullo stessoargomento, dichiarare SINCERITA&#8217;! HAI MENTITO IN QUALCUNA DELLE RISPOSTE CHE MI HAI DATO?. Non &#232;possibile interrogare con questa a',NULL,6),(73,'POLIZIOTTO BUONO &#38; POLIZIOTTO CATTIVO',60,'Se 2 giocatori hanno l&#8217;abilit&#224; INTERROGATORIO possono interrogare lo stesso soggetto in contemporanea anchesullo stesso argomento. Viene richiesto ai due giocatori di interpretare correttamente la cosa con uno dei due&#8220;buono&#8221; e l&#82',NULL,6),(74,'CONTATTI NELL&#8217;AGO',40,'Il personaggio ha contatti nell&#8217;Ago e ottiene accesso all&#8217;apposita sezione nel Ravnet.',NULL,6),(75,'CHIUDEREMO UN OCCHIO',80,'La prima volta che il personaggio fa qualche errore grosso e si ritrova il dipartimento disciplinare pu&#242; dichiararea un membro staff l&#8217;uso di questa abilit&#224; e il suo problema verr&#224; ignorato solo per quella volta. Il favore pu&#242;ess',NULL,6),(76,'CONTATTI NELLA MALAVITA',40,'Il personaggio ha contatti nella malavita e ottiene accesso all&#8217;apposita sezione nel Ravnet.',NULL,6),(77,'NEMESI',60,'Il personaggio nel suo passato si &#232; creato un nemico giurato con cui si &#232; andato a creare una stana simbiosi, ilsuo nemico cercher&#224; di ostacolarlo ma non ucciderlo, non lo aiuter&#224; ma potrebbe salvarlo da situazioni estremesolo perch&#2',NULL,6),(78,'TORTURARE',50,'Durante un interrogatorio e dopo aver causato dei danni al bersaglio, il personaggio pu&#242;, dopo aver posto allostesso bersaglio 5 domande sullo stesso argomento, dichiarare SINCERITA&#8217;! HAI MENTITO IN QUALCUNA DELLERISPOSTE CHE MI HAI DATO?. Non ',NULL,7),(79,'BACIAMO LE MANI',80,'La prima volta che il personaggio fa qualche errore grosso e si ritrova nei guai con qualche organizzazionecriminale pu&#242; dichiarare a un membro staff l&#8217;uso di questa abilit&#224; e il suo problema verr&#224; ignorato solo perquella volta. Il fa',NULL,7),(80,'CONTATTI TRA GLI SBIRRI',40,'Il personaggio ha contatti che gli garantiscono informazioni sui movimenti delle guardie corporative e ottieneaccesso all&#8217;apposita sezione nel Ravnet.',NULL,7),(81,'CONTATTI NELLA FAMIGLIA',40,'Il personaggio ha contatti nella malavita e ottiene accesso all&#8217;apposita sezione nel Ravnet.',NULL,7),(82,'INQUINARE LE PROVE',40,'Il personaggio pu&#242; interagire su Cartellini Interazione &#8220;Prove&#8221; chiedendo allo staff di modificarlipermanentemente.',NULL,7),(83,'SCASSINARE',40,'Il personaggio pu&#242; mimare di scassinare una serratura e aprirla dopo 1 minuto di interazione per ogni livello didifficolt&#224; della serratura.',NULL,7),(84,'RICETTARE MERCE',40,'Il personaggio pu&#242; affidare alla segreteria oggetti in suo possesso e ottenerne il 50 % del valore.',NULL,7),(85,'MENU&#8217; DEL CONTINENTAL',30,'Il personaggio ottiene prima del live una lista di prodotti ottenibili sul mercato nero ma deve trovare qualcunoche gli venda l&#8217;oggetto del suo desiderio.',NULL,7),(86,'CONSIERGE DEL CONTINENTAL',80,'Il personaggio sapendo cosa vendono al Continental pu&#242; acquistare prima del live uno o pi&#249; beni (sempre sepossiede i Bit necessari per farlo).',85,7),(87,'ALLIBRATORE',40,'Se il personaggio perde giocando a delle scommesse ufficiali riguadagna il 25% del valore perso.',NULL,7),(88,'VITA ALLO SBANDO',60,'Il personaggio sceglie tra una di queste due opzioni:ALCOLISMO: il personaggio ha passato la sua vita a bere, risulta immune agli effetti negativi fisici delledroghe da ingestione.INIEZIONE: il personaggio ha passato la sua vita a bucarsi, risulta immune ',NULL,7),(89,'CONVERSIONE SICURA',70,'Il personaggio pu&#242; convertire Bit in Platino e viceversa senza problemi andando in sala staff.',NULL,7),(90,'RICONOSCERE DROGHE E SOSTANZE ILLEGALI',20,'Il personaggio &#232; in grado di riconoscere sostanze illegali non identificate se appartengono alla categoria&#8220;Droghe&#8221;',NULL,7);
/*!40000 ALTER TABLE `abilita_civili` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abilita_militari`
--

DROP TABLE IF EXISTS `abilita_militari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abilita_militari` (
  `id_abilita_militare` int(255) NOT NULL,
  `nome_abilita_militare` varchar(255) NOT NULL,
  `descrizione_abilita_militare` text NOT NULL,
  `distanza_abilita_militare` varchar(255) DEFAULT NULL,
  `costo_abilita_militare` varchar(10) DEFAULT NULL,
  `bruciacarica_abilita_militare` tinyint(1) DEFAULT '0',
  `prerequisito_abilita_militare` int(255) DEFAULT NULL,
  `classi_militari_id_classe_militare` int(11) NOT NULL,
  PRIMARY KEY (`id_abilita_militare`,`classi_militari_id_classe_militare`),
  KEY `fk_abilita_militari_classi_militari1_idx` (`classi_militari_id_classe_militare`),
  CONSTRAINT `fk_abilita_militari_classi_militari1` FOREIGN KEY (`classi_militari_id_classe_militare`) REFERENCES `classi_militari` (`id_classe_militare`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abilita_militari`
--

LOCK TABLES `abilita_militari` WRITE;
/*!40000 ALTER TABLE `abilita_militari` DISABLE KEYS */;
INSERT INTO `abilita_militari` VALUES (1,'ISTINTO OMICIDA','Se il personaggio &#232; sotto l&#8217;effetto di CONFUSIONE! pu&#242; comunque attaccare colpendo col danno basedell&#8217;arma usata ridotto di 1 seguendo la catena COMA! &#8211; A ZERO! &#8211; CRASH! - QUADRUPLO! - TRIPLO! -DOPPIO! &#8211; SINGOLO!.','personale','0',0,NULL,1),(2,'ISTINTO DI SOPRAVVIVENZA','Se il personaggio &#232; sotto effetto della chiamata DOLORE! pu&#242; comunque muoversi arrancando per tuttala durata della chiamata, senza compiere nessun&#8217;altra azione.','personale','0',0,NULL,1),(3,'SCUDO UMANO','Il personaggio pu&#242; dichiarare NEUTRALIZZA GRANATA! Il personaggio deve mimare di coprire la granatacol proprio corpo (NOTA: &#232; sufficiente essere entro un raggio massimo di 1 metro dalla granata)subendo per&#242; ARTEFATTO COMA! nel caso in cui la granata causi danni o ARTEFATTO SHOCK! nel caso incui sia una qualunque chiamata di effetto. Quest&#8217;abilit&#224; non funziona se non si &#232; coscienti.','personale','0',0,NULL,1),(4,'POSIZIONE DIFENSIVA','Il personaggio pu&#242; rilocare un danno subito dalla locazione vitale ad un arto o viceversa.ESEMPIO: un colpo alla gamba pu&#242; essere spostato sul torso ma non sulle braccia; un colpo al torso pu&#242;essere spostato dove si vuole.','personale','0',0,2,1),(5,'BATTERIA AUMENTATA','La batteria &#232; aumentata permanentemente di 1 Carica.','personale','0',0,NULL,1),(6,'ADDESTRAMENTO FISICO I','I Punti Ferita del personaggio aumentano permanentemente di 1.','personale','0',0,NULL,1),(7,'SHIELD MK 2','Se il personaggio ha almeno un Punto Shield base, guadagna +2 punti al suo valore globale.','personale','0',0,NULL,1),(8,'RESISTERE ALLA PAURA','Il personaggio pu&#242; dichiarare IMMUNE! Alla chiamata PAURA!.','personale','1',0,4,1),(9,'ESOSCHELETRO PESANTE MK2','Il valore base dei punti Shield garantiti dalle locazioni equipaggiate con esoscheletro pesante (comeindicato a pag. 17) &#232; moltiplicato per 1,5.','personale','0',0,NULL,1),(10,'ESOSCHELETRO PESANTE MK3','Il valore base dei punti Shield garantiti dalle locazioni equipaggiate con esoscheletro pesante (comeindicato a pag. 17) &#232; raddoppiato. Questa abilit&#224; sostituisce ESOSCHELETRO PESANTE MK2.','personale','0',0,9,1),(11,'SHIELD MK3','Il punteggio di Shield garantito dall&#8217;esoscheletro equipaggiato aumenta di +4, se il personaggio haalmeno un punto Shield Base. Questa abilit&#224; sostituisce SHIELD MK2.','personale','0',0,68,1),(12,'BRACCIO DI FERRO','Il personaggio pu&#242; dichiarare IMMUNE! alla chiamata DISARMO!.','personale','0',0,NULL,1),(13,'FUCILE MK2','Il personaggio pu&#242; aumentare di 1 i danni causati col Fucile d&#8217;Assalto in base alla seguente scala :SINGOLO! &#8211; DOPPIO! &#8211; TRIPLO! &#8211; QUADRUPLO! &#8211; CRASH! &#8211; A ZERO! Non &#232; possibile usare pi&#249; carichecontemporaneamente. L&#8217;effetto dura per 5 minuti.','personale','1',0,14,1),(14,'PRESA FERMA','Il personaggio pu&#242; impugnare armi di categoria Fucile d&#8217;Assalto con una sola mano se nell&#8217;altra impugnauno Scudo.','personale','0',0,12,1),(15,'TESTA DURA','Il personaggio pu&#242;, subendo BRUCIACARICA!, dichiarare IMMUNE! alla chiamata SHOCK!','personale','1',1,NULL,1),(16,'SCARICA D&#8217;ADRENALINA','Il personaggio quando entra in stato di COMA pu&#242;, se ha almeno 1 batteria carica e simulando un &#8220;urlobelluino&#8221; (o altro effetto scenografico simile ad alto tasso di testosterone), subire BLOCCO! Tempo 1 ora!alla batteria e subire BONUS X ai punti ferita e RIPARAZIONE X allo Shield, dove X &#232; il massimale delpersonaggio.','personale','1',1,-1,1),(17,'FARSI SCUDO','Se il personaggio impugna un Mitragliatore Pesante pu&#242; dichiarare IMMUNE! ad un colpo subito mal&#8217;arma subisce l&#8217;effetto BLOCCO! Eccezioni sono le chiamate DISINTEGRAZIONE! (applicata comunque albersaglio) e MUTILAZIONE! che infligge all&#8217;arma che la subisce la chiamata DISINTEGRAZIONE! Invecedi BLOCCO!.','personale','0',0,NULL,2),(18,'ADDESTRAMENTO FISICO II','I Punti ferita del personaggio aumentano permanentemente di 2 (questa abilit&#224; sostituisceADDESTRAMENTO FISICO I).','personale','0',0,6,2),(19,'DIFENDERE GLI ALTRI','Il personaggio pu&#242; dichiarare IMMUNE! ad una chiamata subita da una persona entro 1 metro da lui,subendo la chiamata al suo posto.','1 metro','0',0,NULL,2),(20,'INARRESTABILE','Se il personaggio ha almeno 1 carica pu&#242; dichiarare IMMUNE! a una qualsiasi delle seguenti chiamate:PARALISI! &#8211; CONFUSIONE! &#8211; SHOCK! &#8211; DISARMO! &#8211; SPINTA!, subendo BRUCIACARICA!.','personale','1',1,21,2),(21,'E&#8217; SOLO UN GRAFFIETTO','Il personaggio pu&#242; dichiarare IMMUNE! alla chiamata DOLORE!','personale','0',0,NULL,2),(22,'BUNKER SEMOVENTE','Il personaggio utilizzando un&#8217;arma di classe Mitragliatore Pesante pu&#242;, se appostato dietro un riparo,camminare per un massimo di 10 metri fino a posizionarsi dietro un altro riparo contando come se fossestazionario e appostato ai fini del prerequisito &#8220;Posizionamento&#8221; per questa classe d&#8217;arma.(N.B. in parole povere puoi camminare e sparare con un mitragliatore pesante.)','personale','0',0,20,2),(23,'TEMPESTA DI METALLO','Il personaggio, se sta usando un&#8217;arma di classe Mitragliatore Pesante per sparare, pu&#242; dichiarare lachiamata base dell&#8217;arma aggiungendo IN QUEST&#8217;AREA! Al costo di 1 carica.','Area 10 metri','1',0,NULL,2),(24,'FUOCO DIFENSIVO','Il personaggio se sta usando un&#8217;arma di classe Mitragliatore pesante, dopo aver sparatoininterrottamente sullo stesso bersaglio ostile per 10 secondi, subisce BONUS! + 4 PUNTI SHIELD!(N.b. Non &#232; possibile cambiare bersaglio, ma &#232; possibile sospendere il conteggio per cambiarecaricatore, riprendendo quindi a sparare sullo stesso bersaglio)','personale','0',0,23,2),(25,'RICARICA SCUDO D&#8217;EMERGENZA','Quando il personaggio arriva a 0 punti Shield pu&#242;, subendo BRUCIACARICA!, utilizzare la chiamataRIPARAZIONE X! sullo Shield (dove X &#232; pari al suo valore permanente di punti Shield). Deve averealmeno 2 cariche attive per poter usare questa abilit&#224;.','personale','2',1,5,2),(26,'FEEL NO PAIN','Il personaggio se subisce la chiamata MUTILAZIONE! ad un arto ignora la chiamata ARTEFATTO COMA!associata.','personale','0',0,21,2),(27,'MEGLIO UN PEZZO, CHE A PEZZI','Il personaggio pu&#242; dichiarare IMMUNE! a una qualsiasi chiamata di danno tra A ZERO!, COMA! , CREPA!Subita da un compagno entro 1m di distanza subendo lui ARTEFATTO MUTILAZIONE! ad una sualocazione non attualmente soggetta a MUTILAZIONE!.','1 metro','0',0,19,2),(28,'FORTEZZA DELLA SOLITUDINE','Il massimale base del valore di Shield del personaggio non &#232; mai inferiore a 3 punti quando indossa unesoscheletro pesante,',NULL,NULL,0,NULL,2),(29,'INTERFACCE PROTESICHE AVANZATE','Il personaggio se viene colpito ad una locazione sintetica dalle chiamate COMA! o CREPA! pu&#242;, subendoBLOCCO! alla batteria ed alla protesi interessata dal colpo, declassare la chiamata COMA! adARTEFATTO! A ZERO! oppure pu&#242; declassare la chiamata CREPA! ad ARTEFATTO! MUTILAZIONE!.(NOTA: le chiamate sostitutive si ritengono da applicarsi SEMPRE alla locazione originale dell&#8217;impatto,non possono essere deviate o rilocate su un&#8217;altra parte del corpo o su un altro bersaglio.)','personale','0',0,26,2),(30,'ULTIMA PAROLA','Il personaggio, dopo aver subito la chiamata CREPA! (non &#232; sufficiente entrare in status Morto perconteggio) pu&#242; rialzarsi per 1 minuto e si considera avere 50 Punti Ferita alocazionali, durante questoperiodo non pu&#242; utilizzare nessuna delle sue abilit&#224; a cariche, il suo Shield &#232; considerato spento. Subiscetutte le chiamate di danno fino a QUADRUPLO come 1 singolo danno, le altre chiamate come 5 dannieccetto il crepa. Passato il minuto o esauriti i Punti Ferita subisce la chiamata ARTEFATTO CREPA!','personale','0',0,NULL,2),(31,'YIPPIE KAY YAY','Il personaggio dopo avere subito per almeno 10 secondi la chiamata DOLORE (senza quindi averdichiarato IMMUNE o aver subito NEUTRALIZZA) pu&#242; alzare di due la prossima chiamata di dannosecondo la normale scala, fino ad A ZERO!','personale','0',0,NULL,2),(32,'LAST MAN STANDING','Il personaggio, bruciando tutte le sue cariche attive (con un minimo di 2), per 1 minuto pu&#242; dichiarareIMMUNE! a PARALISI! &#8211; PAURA! - CONFUSIONE! &#8211; SHOCK! &#8211; DISARMO! &#8211; DOLORE!, i suoi punti Shieldvengono raddoppiati, i suoi Punti Ferita vengono raddoppiati. Passato il minuto il personaggio subisceARTEFATTO COMA!; una volta curato, subisce tutte le chiamate di status per il doppio del tempo, le sueCariche sono considerate dimezzate (arrotondato per difetto) e i suoi punti ferita sono dimezzati(arrotondati per difetto) fino alla fine della giornata di gioco. Nota: se un personaggio con questi malusarriva ad avere Punti Ferita pari o inferiori a 0 (NOTA: calcolo effettuato in base ai punti standard, nonquelli temporanei dovuti all&#8217;abilit&#224;) il personaggio si considera aver avuto un collasso multiorgano esubisce immediatamente la chiamata ARTEFATTO CREPA!','personale','2',1,-1,2),(33,'BATTERIA AUMENTATA','Il punteggio della batteria &#232; aumentato di 1 Carica.',NULL,'0',0,NULL,3),(34,'ESOSCHELETRO LEGGERO MK2','Il punteggio di Shield garantito dall&#8217;esoscheletro equipaggiato aumenta di +1, se il personaggio haalmeno un punto Shield Base.',NULL,'0',0,NULL,3),(35,'PISTOLERO','Il personaggio se combatte impugnando contemporaneamente due armi di classe Pistola pu&#242;, al costo di1 carica sostituire il danno base dell&#8217;arma con la chiamata SINGOLO! CONFUSIONE! Al prossimo colpo(o solo CONFUSIONE! Nel caso il danno base dell&#8217;arma fosse gi&#224; SINGOLO!).','personale','1',0,NULL,3),(36,'HOTSHOT','Il personaggio utilizza tutte le sue Cariche per sovraccaricare la pistola sparando un colpo molto pi&#249;potente.Il personaggio pu&#242;, subendo BRUCIACARICA, aumentare di +2 il danno del suo prossimo colpo ( fino aCOMA! compreso). L&#8217;abilit&#224; &#232; utilizzabile solo con pistole ad energia, ed il personaggio deve avere averealmeno 2 cariche attive per poter utilizzare questa abilit&#224;. Dopo aver sparato, l&#8217;arma subisce la chiamataBLOCCO.',NULL,NULL,0,35,3),(37,'AMBIDESTRIA','Il personaggio pu&#242; impugnare un&#8217;arma a una mano (pistola, coltello, arma da mischia) per mano outilizzare l&#8217;arma con la mano secondaria.','personale','0',0,NULL,3),(38,'ADDESTRAMENTO FISICO','I Punti Ferita del personaggio aumentano permanentemente di 1.','personale','0',0,NULL,3),(39,'TIRATORE SCELTO','Il personaggio con le armi di classe Fucile di Precisione pu&#242; aumentare di +1 il danno del prossimo colpoal costo di 1 Carica. La carica viene spesa anche se il colpo manca il bersaglio.(NOTA: i potenziamenti seguono la seguente scala SINGOLO! &#8211; DOPPIO! &#8211; TRIPLO! &#8211; QUADRUPLO! &#8211;CRASH! &#8211; A ZERO!)','personale','1',0,NULL,3),(40,'NON A ME, A LUI!','Il personaggio, se subisce PAURA! Pu&#242; considerare qualunque personaggio cosciente e consenzientecome riparo fisso per gli effetti della chiamata.','personale','0',0,NULL,3),(41,'COLPO PERFORANTE','Il personaggio se spara con un Fucile di Precisione pu&#242; dichiarare CRASH!. Il costo &#232; di 1 Carica percolpo sparato. Non &#232; possibile utilizzare altre abilit&#224; in congiunzione con questa.','personale','1',0,47,3),(42,'BRACCIA ROBUSTE','Il Personaggio pu&#242; sparare con Shotgun e Fucili d&#8217;Assalto impugnandoli con una sola mano.','personale','0',0,38,3),(43,'PROIETTILI INCENDIARI','Il personaggio, se utilizza un Fucile di Precisione, pu&#242; aggiungere la chiamata FUOCO! al prossimo colpo,al costo di una Carica.','personale','1',0,NULL,3),(44,'FUOCO A TERRA','Al costo di 1 carica, il personaggio pu&#242; dichiarare per il prossimo colpo SPINTA X! al posto del dannodell&#8217;arma, dove X corrisponde al danno causato (se il danno &#232; superiore a QUADRUPLO! X assume comevalore 7) con Shotgun e con Fucili di Precisione.','personale','1',0,NULL,3),(45,'COLPO NON LETALE','Il personaggio pu&#242; utilizzare la chiamata SHOCK! sparando con uno Shotgun, al costo di 2 Cariche percolpo sparato.','personale','2',0,NULL,3),(46,'DISARMARE','Il personaggio pu&#242; sostituire il danno con la chiamata DISARMO! al costo di 1 Carica ogni colpo, conogni arma da fuoco nella quale &#232; competente.','personale','1',0,NULL,3),(47,'MIRARE','Il personaggio quando equipaggiato con un Fucile di Precisione pu&#242; dichiarare il prossimo colpo a dito suun bersaglio entro i 10 metri dopo aver simulato di mirare il suo obiettivo per 10 secondi e utilizzando 1Carica. E&#39; possibile utilizzare questa abilit&#224; insieme ad altre, pagandone il rispettivo costo.','10 metri','1',0,-2,3),(48,'COLPO SANGUINANTE','Il personaggio pu&#242; abbinare l&#8217;effetto CONTINUO! al prossimo colpo. Pu&#242; sommare eventuali altre abilit&#224;,pagandone i relativi costi. Deve avere almeno una carica libera per attivare questa abilit&#224;, subendoBRUCIACARICA!','personale','1',1,-1,3),(49,'ARMA SELEZIONATA','Il personaggio deve scegliere un&#8217;arma da fuoco tra quelle in cui &#232; addestrato. Pu&#242; aumentare di 1 ildanno fatto con l&#8217;arma prescelta secondo la scala SINGOLO! &#8211; DOPPIO! &#8211; TRIPLO! &#8211; QUADRUPLO! &#8211;CRASH! &#8211; A ZERO!.(NOTA: bonus sommabile a qualunque altro eventuale bonus disponibile per il giocatore con quellaclasse d&#8217;arma.)','personale','0',0,NULL,4),(50,'PISTOLA &#38; COLTELLO','Se il personaggio impugna un&#8217;Arma corta e una Pistola, pu&#242; bruciando una carica dichiarareCONFUSIONE! con l&#8217;arma da mischia ed aumentare di 1 le chiamate di danno effettuate con la pistola sespara sul bersaglio confuso.(NOTA: i potenziamenti seguono la seguente scala SINGOLO! &#8211; DOPPIO! &#8211; TRIPLO! &#8211; QUADRUPLO! &#8211;CRASH! &#8211; A ZERO!)','personale','1',0,NULL,4),(51,'GESTIONE TATTICA','Fino a quando il personaggio ha lo Shield ridotto a zero aumenta di 1 le chiamate fatte con le Armi damischia.','personale','0',0,NULL,4),(52,'SCARICA ACCECANTE','Il personaggio subendo BRUCIACARICA! (deve avere almeno 1 carica attiva per poter utilizzare questaabilit&#224;) pu&#242; sparando con uno Shotgun dichiarare CONFUSIONE! IN QUEST&#8217;AREA 3!.(NOTA: l&#8217;angolo formato dalle braccia per determinare l&#8217;area d&#8217;effetto DEVE essere 90&#176;.)','3 metri','1',1,45,4),(53,'GRANATE MODIFICATE','Il personaggio pu&#242; aggiungere la chiamata CONFUSIONE ! Alla prossima granate al costo di 2 Cariche.','personale','2',0,NULL,4),(54,'BOMBE GEMELLE','Il personaggio pu&#242; attaccare il cartellino Granata a una Granata che ne sia gi&#224; fornita purch&#233; i cartellinidelle due Granate siano identici, aumentando di 1 il danno base e aggiungendo +1 al raggio .','personale','o',0,NULL,4),(55,'MIRA VELOCE','Il personaggio riduce il tempo necessario per l&#39;abilit&#224; MIRARE a 5 secondi.','personale','o',0,47,4),(56,'I MORTI NON PARLANO','Se il personaggio ha subito almeno una ferita (Punti Ferita ridotti di almeno 1 punto a causa di danni)alla locazione vitale, pu&#242; fingersi morto, e subendo CRASH! e BLOCCO! allo Shield per 5 minuti. Seanalizzato dichiara il suo status come CREPA!; tuttavia, se subisce una chiamata di danno, deve reagiremuovendosi e rivelandosi.','personale','0',1,60,4),(57,'COLPO DI MANO','Il personaggio pu&#242; dichiarare DISARMO! Utilizzando armi da mischia al costo di 1 Carica.','personale','1',0,NULL,4),(58,'APRISCATOLA','Il personaggio pu&#242; aggiungere il descrittore DIRETTO! al prossimo colpo che sferrer&#224; con un arma damischia al costo di 1 Carica.','personale','1',0,61,4),(59,'BOMBA ADESIVA','Il personaggio pu&#242;, colpendo con una granata direttamente un Bersaglio, dichiarare la normale chiamatadella granata, escludendo &#8220;GRANATA! &#8220; e &#8220; RAGGIO X&#8221; al costo di 1 Carica. Se manchi la granata &#232;sprecata e non &#232; possibile dichiarare.','personale','1',0,NULL,4),(60,'MOVIMENTO OCCULTATO','Il personaggio &#232; equipaggiato e addestrato all&#8217;utilizzo di rifrattori ottici che gli permettono di restareinvisibile per poco tempo. Il personaggio subisce ATTENUAZIONE! per 10 secondi consumando 1 carica.Tra un uso e il seguente di questa abilit&#224; devono trascorrere almeno 5 secondi.','personale','1',0,51,4),(61,'TEMPESTA DI LAME','Il personaggio &#232; un maestro nell&#8217;uso di due lame in combattimento. Se impugna contemporaneamente 2armi da mischia pu&#242; aggiungere + 1 alle chiamate di danno fino ad A ZERO! (inclusa).','personale','0',0,37,4),(62,'BOMBA IN BUCA','Il personaggio ha affinato il suo istinto di sopravvivenza. Il personaggio prima di essere colpito daglieffetti di GRANATA! pu&#242; dichiarare IMMUNE! al costo di 2 Cariche.','personale','2',0,NULL,4),(63,'RESISTERE ALLA PAURA','Il personaggio pu&#242; dichiarare IMMUNE! Alla chiamata PAURA! al costo di 1 Carica.','personale','1',0,56,4),(64,'GLORIA O MORTE','Il personaggio pu&#242;, se ha almeno 2 cariche attive e dopo aver subito BRUCIACARICA!, attivare questaabilit&#224; urlando &#8220;GLORIA O MORTE!&#8221;.Da questo momento si considera avere punti ferita alocazionali pari ai suoi punti ferita attuali allalocazione vitale x 10 (massimo 40), considera tutte le chiamate di danno come ARTEFATTO! TRIPLO! adeccezione di CREPA! DISINTEGRAZIONE! E MUTILAZIONE! che subisce normalmente.Il suo Shield, se presente, funziona normalmente.Il personaggio deve lanciarsi in combattimento in mischia contro il pi&#249; vicino bersaglio ostile.Se tutti i bersagli ostili in vista sono morti prima di aver concluso i punti ferita il personaggio sviene esubisce ARTEFATTO COMA!; tuttavia, se viene abbattuto prima di aver terminato i bersagli ostili subisceARTEFATTO! CREPA!Ogni volta che utilizza questa abilit&#224; riduce il suo massimale di punti ferita di 1 per tuttol&#39;evento.','personale','2',1,-1,4),(65,'BATTERIA AUMENTATA','Il punteggio delle Cariche della Batteria &#232; aumentato permanentemente di 1 unit&#224;.','personale','0',0,NULL,5),(66,'BATTERIA AUMENTATA 2','Il punteggio delle Cariche della Batteria &#232; aumentato permanentemente di 2 unit&#224; (il suo effetto va asostituire il potenziamento dato da BATTERIA AUMENTATA).','personale','0',0,5,5),(67,'ESOSCHELETRO PESANTE MK2','Il punteggio di Shield garantito dall&#8217;esoscheletro equipaggiato aumenta di +2, se il personaggio haalmeno un punto Shield Base.','personale','0',0,NULL,5),(68,'SHIELD MK2','Se il personaggio ha almeno un Punto Shield base, guadagna +2 punti al suo valore globale.','personale','0',0,NULL,5),(69,'CONTROLLO DELLO STRESS SUL CAMPO','Il personaggio, se ha almeno 1 carica attiva e subendo BRUCIACARICA!, pu&#242; dichiarare NEUTRALIZZA!(Effetto a scelta tra DOLORE! &#8211; SHOCK! &#8211; CONFUSIONE!) su un numero di bersagli pari al suomassimale di Carica della batteria.','10 metri','1',1,NULL,5),(70,'INTERVENTO D&#8217;EMERGENZA','Il personaggio pu&#242; dichiarare, al costo di 3 cariche, GUARIGIONE 1! su un bersaglio in stato di comadopo 1 minuto di interazione.','tocco','3',0,NULL,5),(71,'SMUOVERE','Il personaggio pu&#242;, al costo di 1 cariche batteria per utilizzo, dichiarare NEUTRALIZZA CONFUSIONE!Oppure NEUTRALIZZA DOLORE!. Deve poter toccare il bersaglio per poter effettuare la chiamata.','tocco','1',0,NULL,5),(72,'MEDIPACK &#8211; PRIME CURE','Il personaggio pu&#242; dichiarare BONUS! +X PUNTO FERITA! (dove X &#232; il doppio delle cariche che utilizza),ad un bersaglio che sta toccando.','tocco','X',0,NULL,5),(73,'MEDIPACK - ANTIDOLORIFICI AD AMPIO SPETTRO','Il valore di BONUS! + X PUNTI FERITA! del Medipack &#232; aumentato permanentemente di 1.','personale','0',0,72,5),(74,'MEDIPACK - NANOCHIRURGHI INTEGRATI','Il personaggio pu&#242;, al costo di 2 cariche, dichiarare NEUTRALIZZA! MUTILAZIONE! Dopo 10 secondi albersaglio toccato.(N.b. La locazione non ricresce miracolosamente: il bersaglio per&#242; potr&#224; essere guarito anche senecessita comunque di un innesto se vuole tornare ad usare la locazione colpita da mutilazione)','tocco','2',0,72,5),(75,'SOCCORRITORE DI LINEA','Il personaggio se impugna solo una pistola pu&#242; aumentare di 1 il danno fatto secondo la scalaSINGOLO! &#8211; DOPPIO! &#8211; TRIPLO! &#8211; QUADRUPLO! &#8211; CRASH! &#8211; A ZERO!.(NOTA: il bonus &#232; sommabile a qualunque altro bonus disponibile per il giocatore con le pistole.)','personale','0',0,-3,5),(76,'CONTROLLER &#8211; MODIFICA FIRMWARE GESTIONE BATTERIA.','Il personaggio pu&#242; dichiarare BONUS! BATTERIA +1!Tempo hacking: 10 secondi.Costo in Cariche Batteria: 1','10 metri','1',0,NULL,5),(77,'CONTROLLER &#8211; REINIZIALIZZAZIONE DISPOSITIVI ELETTRONICI.','Il personaggio pu&#242; dichiarare NEUTRALIZZA! BLOCCO! su un qualunque impianto cibernetico (arto olocazione vitale) che sta toccando.Tempo hacking: 10 secondi.Costo in Cariche Batteria: 1','tocco','1',0,NULL,5),(78,'CONTROLLER &#8211; MODIFICA FREQUENZA SHIELD','Il personaggio pu&#242; dichiarare BONUS! +X SHIELD! su un bersaglio equipaggiato con uno Shield, dove X&#232; pari al numero di cariche spese in fase di attivazione.Tempo hacking: 10 secondi.Costo in Cariche Batteria: 1 + X per punto Shield ripristinato.','10 metri','X',0,NULL,5),(79,'CONTROLLER &#8211; MIGLIORAMENTO FIRMWARE INNESTI.','Il personaggio pu&#242; dichiarare BONUS! DIFESA MENTALE +1!Tempo hacking: 10 secondi.Costo in Cariche Batteria: 1','10 metri','1',0,NULL,5),(80,'CONTROLLER &#8211; CAMPO DIFENSIVO','Il Personaggio pu&#242; dichiarare BONUS! SHIELD +X! (dove X &#232; il punteggio di Shield del personaggio)RAGGIO 10!.Tempo hacking: 10 secondi.Costo in Cariche Batteria: 2.Al termine, il personaggio subisce BLOCCO! CONTINUO! TEMPO 1 ORA! al proprio Controller.','Raggio 10 metri','2',0,-1,5),(81,'PROTEZIONE FIRMWARE AVANZATA','Il personaggio aumenta permanentemente di 1 il suo punteggio di Difesa Mentale.','personale','0',0,NULL,6),(82,'SCHERMATURA CEREBRALE','Il personaggio aumenta permanentemente di 2 il suo punteggio di Difesa Mentale (quest&#8217;abilit&#224; va asostituire &#8220;Protezione Firmware Avanzata&#8221;).','personale','0',0,81,6),(83,'ESOSCHELETRO PESANTE &#8220;REDENTORE&#8221;','Il personaggio se equipaggiato con un esoscheletro pesante aumenta di 2 punti lo Shield ottenuto dalsuddetto esoscheletro. Se il personaggio entra in status di Coma pu&#242;, subendo BLOCCO! allo Shield,subire BONUS! +X PUNTI FERITA! (dove X &#232; pari ai punti ferita massimi del personaggio).','personale','0',0,NULL,6),(84,'ANGELO CUSTODE','Il personaggio, quando equipaggiato con uno Scudo, pu&#242; dichiarare IMMUNE! Ad una chiamata di dannosu un bersaglio entro 1 metro da lui e subire la chiamata sullo Scudo, al costo di 1 carica.','1 metro','1',0,NULL,6),(85,'NON FA MALE! NON FA MALE!','Il personaggio quando armato con un fucile d&#8217;assalto pu&#242;, dopo aver mirato un bersaglio per 10 secondi,utilizzare l&#8217;effetto DOLORE! In sostituzione al normale danno portato dal prossimo colpo.','personale','0',0,NULL,6),(86,'CONTROLLER - STIMOLANTI DA BATTAGLIA','Il personaggio pu&#242; dichiarare BONUS! DANNI +1!Tempo hacking: 10 secondi.Costo in Cariche Batteria: 2','10 metri','2',0,NULL,6),(87,'MEDICO DA BATTAGLIA','Il personaggio mentre &#232; impegnato a prestare soccorso non pu&#242; essere distratto da nessuno stimoloinferiore ad una lesione fisica. Mentre sta utilizzando il Medipack per curare un bersaglio pu&#242;,spendendo ogni volta 1 Carica, dichiarare IMMUNE! Ai seguenti effetti: DOLORE! - PARALISI! &#8211;CONFUSIONE! &#8211; SHOCK! &#8211; DISARMO! &#8211; SPINTA!','personale','1',0,88,6),(88,'MENTE RAZIONALE','Il personaggio pu&#242; dichiarare IMMUNE! alla chiamata PAURA! spendendo 1 Carica su se stesso oNEUTRALIZZA PAURA! toccando un altro bersaglio.','personale/tocco','1',0,NULL,6),(89,'DEVIARE ENERGIA','Il personaggio pu&#242; convertire 3 dei suoi Punti Shield in una Cariche Batteria e viceversa.','personale','0',0,83,6),(90,'CONTROLLER &#8211; TRASFERIMENTO ENERGETICO','Il personaggio pu&#242; dichiarare BONUS! X SHIELD! (dove X sono i suoi punti Shield che vuole trasferire).Tempo hacking: 10 secondi.Costo: 1 Carica + X Punti Shield (corrisponde alle cariche o ai punti shield da trasferire).','personale','X',0,NULL,6),(91,'CONTROLLER &#8211; POTENZIAMENTO NANORIPARATORI.','Il personaggio pu&#242; dichiarare BONUS! +5 SHIELD! E BONUS! IMMUNE a CRASH! su un qualunquebersaglio equipaggiato con un esoscheletro.Tempo hacking: 10 secondi.Costo in Cariche Batteria: 3.','10 metri','3',0,NULL,6),(92,'BATTERIA AVANZATA','Il personaggio aumenta di un ulteriore +1 il suo valore di batteria.','personale','0',0,NULL,6),(93,'MEDIPACK &#8211; VETTORE CURATIVO AEREODISPERSO','Il personaggio pu&#242;, dopo 10 secondi di utilizzo del Medipack, dichiarare BONUS! +2 PUNTO FERITA!RAGGIO 10!. Subisce quindi la dichiarazione BLOCCO! CONTINUO! TEMPO 5 MINUTI! al Medipack.','Raggio 10 metri','0',0,NULL,6),(94,'MEDIPACK &#8211; INTERFACCIA BIOMECCANICA DI MANUTENZIONE E CURA','Il personaggio pu&#242; dichiarare BONUS! +2 PUNTO FERITA! e RIPARAZIONE 2! ad un bersaglio.Tempo hacking: 10 secondi.Costo in Cariche Batteria: 2','tocco','2',0,NULL,6),(95,'MEDIPACK &#8211; DISPOSITIVO DI CURA AUTOMATICO D&#8217;EMERGENZA','Il personaggio, se cade in stato di Coma, pu&#242; prima di cadere dichiarare BONUS! +1 PUNTO FERITA!Raggio 10!. E subire BLOCCO! Al Medipack.','personale','0',0,NULL,6),(96,'INGANNO DELLA NERA SIGNORA','Il personaggio pu&#242; sostituire il danno della sua arma con la chiamata BONUS! + X PUNTI FERITA!VELENO!BONUS! + X PUNTI FERITA! Dove X &#232; il danno che avrebbe causato, con un massimale di 4.','personale','1',0,-1,6),(97,'BATTERIA AUMENTATA','Il punteggio delle Cariche Batteria aumenta di + 1.','personale','0',0,NULL,7),(98,'BATTERIA AUMENTATA 2','Il punteggio delle Cariche Batteria aumenta di +2. (sostituisce il bonus di Batteria Aumentata)','personale','0',0,5,7),(99,'ESOSCHELETRO LEGGERO MK2','Il punteggio di Shield garantito dall&#8217;esoscheletro equipaggiato aumenta di +1, se il personaggio haalmeno un punto Shield Base.','personale','0',0,NULL,7),(100,'SHIELD MK 2','Se il personaggio ha almeno un Punto Shield base, guadagna +2 punti al suo valore globale.','personale','0',0,NULL,7),(101,'TEMPESTA DI PIOMBO','Il personaggio pu&#242;, al costo di 2 cariche, aggiungere PAURA! al prossimo colpo sparato con unmitragliatore pesante.','10 metri','2',0,NULL,7),(102,'PERFEZIONAMENTO TATTICHE DI INTRUSIONE','Il personaggio ha + 1 permanente alle sue dichiarazioni di hacking.','personale','0',0,103,7),(103,'BRUTE FORCE','Il personaggio pu&#242; ripetere il lancio di un programma di hacking senza pagare nuovamente il costo inbatteria: per ogni lancio cos&#236; effettuato pu&#242; aumentare di + 1 il valore di lancio del programma, fino aquando tutti i bersagli non hanno subito la chiamata lanciata.Se un bersaglio dichiara immune a ELETTRO! L&#39;abilit&#224; si interrompe immediatamente.(Esempio: Thug Sta lanciando il potere di distrazione su Erebron. Attende 10 secondi e poi dichiara&#8220;ELETTRO!CONFUSIONE! DIFESA 1!&#8221; ad Erebron, il quale dichiara IMMUNE! e prosegue in quello che stafacendo. Thug continua il conteggio dei 10 secondi successivi, per poi dichiarare&#8220;ELETTRO!CONFUSIONE! DIFESA 2!&#8221; ad Erebron, il quale risponde ancora IMMUNE! e prosegue nelle sueazioni. Thug continua il conteggio dei 10 secondi successivi, per poi dichiarare &#8220;ELETTRO!CONFUSIONE!DIFESA 3!&#8221; ad Erebron, il quale questa volta subisce la chiamata. Thug paga il costo in batteria, e potr&#224;fare nuove azioni.)','personale','0',0,-4,7),(104,'FARSI SCUDO','Se il personaggio impugna un Mitragliatore Pesante pu&#242; dichiarare IMMUNE! ad un colpo subito mal&#8217;arma subisce BLOCCO! eccezione fatta per la chiamata DISINTEGRAZIONE! Che viene comunquesubita, o MUTILAZIONE ! che pu&#242; essere parata in questo modo ma l&#8217;arma subisce la chiamataDISINTEGRAZIONE!.','personale','0',0,NULL,7),(105,'CONTROLLER &#8211; DISTRAZIONE','Il personaggio pu&#242; dichiarare ELETTRO 1! CONFUSIONE!Tempo hacking: 10 secondi.Costo in Cariche Batteria: 1','10 metri','1',0,NULL,7),(106,'CONTROLLER &#8211; DISARMARE','Il personaggio pu&#242; dichiarare ELETTRO 1! DISARMO !Tempo hacking: 10 secondi.Costo in Cariche Batteria:1','10 metri','1',0,NULL,7),(107,'CONTROLLER &#8211; DOLORE','Il personaggio pu&#242; dichiarare ELETTRO 1! DOLORE !Tempo hacking: 10 secondi.Costo in Cariche Batteria: 1','10 metri','1',0,NULL,7),(108,'CONTROLLER &#8211; ROTTURA','Il personaggio pu&#242; dichiarare ELETTRO 1! CRASH! Shield.Tempo hacking: 10 secondi.Costo in Cariche Batteria: 1(N.b. Questa abilit&#224; ha effetto solo sullo shield)','10 metri','1',0,NULL,7),(109,'CONTROLLER &#8211; BLOCCO','Il personaggio pu&#242; dichiarare ELETTRO 1! BLOCCO!Tempo hacking: 10 secondi.Costo in Cariche Batteria: 2','10 metri','2',0,NULL,7),(110,'CONTROLLER &#8211; PARALISI','Il personaggio pu&#242; dichiarare ELETTRO 1! PARALISI !Tempo hacking : 10 secondi.Costo in Cariche Batteria:1','10 metri','1',0,NULL,7),(111,'SCHERMATURA CEREBRALE','Il valore di Difesa mentale del personaggio aumenta di +1.','personale','0',0,NULL,7),(112,'HACKING AD AREA','Il personaggio pu&#242; usare una qualsiasi abilit&#224; del Controller spendendo 20 Secondi + il tempo previstodal Programma selezionato, modificando l&#8217;estensione a IN QUEST&#8217;AREA! e subendo quindiBRUCIACARICA!, CRASH! e BLOCCO! CONTINUO! TEMPO 5 MINUTI! allo Shield.(NOTA: l&#8217;angolo formato dalle braccia per determinare l&#8217;area d&#8217;effetto DEVE essere massimo 90&#176;.)','personale','0',1,-1,7),(113,'BATTERIA AVANZATA','Il personaggio aumenta di un ulteriore +1 il suo valore di batteria.','personale','0',0,NULL,8),(114,'AMPLIFICAZIONE DELL&#8217;AREA','Il personaggio quando usa una granata pu&#242; aumentare di +2 i metri del raggio della granata.','personale','0',0,NULL,8),(115,'SCHERMATURA CEREBRALE AVANZATA','Il valore di Difesa del personaggio aumenta di +2. (Sostituisce il bonus dato da Schermatura avanzata)','personale','0',0,82,8),(116,'CONTROLLER &#8211; SOVRACCARICO ELETTROMAGNETICO','Il personaggio pu&#242; dichiarare ELETTRO 1! TRIPLO! TRIPLO! TRIPLO!Tempo hacking : 10 secondi.Costo in Cariche Batteria: 3(N.B. Non pu&#242; mai essere utilizzata con Hacking ad area)','10 Metri','3',0,NULL,8),(117,'CONTROLLER &#8211; SMORZAMENTO NEURALE','Il personaggio pu&#242; dichiarare ELETTRO 1! BONUS! MENO 1 DANNI!Tempo hacking : 10 secondi.Costo in Cariche Batteria: 2','10 metri','2',0,NULL,8),(118,'GRANATA CONGELANTE','Il personaggio pu&#242; aggiungere la chiamata GELO! Al prossimo colpo con il lanciagranate, al costo di 2cariche.','personale','2',0,114,8),(119,'FUOCO DI COPERTURA','Il personaggio pu&#242;, al costo di 2 cariche, dichiarare PAURA! IN QUEST&#39;AREA! Se impugna unmitragliatore pesante e sta gi&#224; sparando nella stessa direzione. Il personaggio dovr&#224; continuare asparare nella direzione generica in cui ha effettuato la dichiarazione, fermandosi solo quando avr&#224;terminato il caricatore o sar&#224; in qualche modo incapacitato.(NOTA: l&#8217;angolo formato dalle braccia per determinare l&#8217;area d&#8217;effetto DEVE essere massimo 90&#176;.)','personale','2',0,NULL,8),(120,'COLPO DI SPONDA','Dopo aver sparato un colpo con il lanciagranate, se il colpo non ha colpito nessuno, il personaggio potr&#224;dichiarare a dito, ad un bersaglio entro 1 metro da dove &#232; caduto il colpo a vuoto, il danno del suolanciagranate scalato di uno secondo la normale scala.','personale','0',0,118,8),(121,'CONFETTONE','Il personaggio pu&#242;, strappando il cartellino di una granata da lancio, effettuare la stessa chiamata(senza dichiarare GRANATA! RAGGIO X!) con il prossimo colpo che sparer&#224; con il lanciagranate, al costodi 1 carica.','personale','1',0,118,8),(122,'CONTROLLER &#8211; ALTERARE PERCEZIONI','Il personaggio pu&#242; dichiarare ELETTRO 1! COMANDO! UCCIDILO!Tempo hacking : 10 secondi.Costo in Cariche Batteria: 2(N.B. Non pu&#242; essere utilizzata con Hacking ad area)','10 Metri','2',0,NULL,8),(123,'CONTROLLER &#8211; SVANIRE DALLA MENTE','Il personaggio pu&#242; dichiarare ELETTRO 1! COMANDO! IGNORAMI!Tempo hacking : 10 secondi.Costo in Cariche Batteria: 2','10 Metri','2',0,122,8),(124,'CONTROLLER &#8211; FOTOGRAFIA','Il personaggio pu&#242; dichiarare ELETTRO 1! PARALISI! TEMPO 1 Minuto!Tempo hacking : 10 secondi.Costo in Cariche Batteria: 3','10 Metri','3',0,123,8),(125,'CONTROLLER &#8211; BLOCCO TOTALE','Il personaggio pu&#242; dichiarare ELETTRO1! CRASH! BLOCCO!Tempo hacking : 10 secondi.Costo in Cariche Batteria: 2','10 Metri','2',0,NULL,8),(126,'CONTROLLER &#8211; CORTOCIRCUITO','Il personaggio pu&#242; dichiarare ELETTRO 1! BRUCIACARICA!Tempo hacking : 10 secondi.Costo in Cariche Batteria: 3','10 Metri','3',0,123,8),(127,'SATURARE L&#39;AREA','Il personaggio pu&#242;, al costo di 2 cariche, aggiungere la chiamata IN QUEST&#39;AREA! al danno base dellasua arma se impugna un mitragliatore pesante. Fino a quando continua a sparare, potr&#224; ripetere ladichiarazione IN QUEST&#39;AREA! Una volta ogni cinque secondi, senza un nuovo costo in cariche, fino aquando non si muover&#224; o non sia incapacitato.(NOTA: l&#8217;angolo formato dalle braccia per determinare l&#8217;area d&#8217;effetto DEVE essere massimo 90&#176;.)','personale','2',0,119,8),(128,'FRONT TOWARD ENEMY','Il personaggio pu&#242;, subendo la chiamata CRASH! Alla locazione vitale, strappare un cartellino granata efare la dichiarazione della granata sostituendo la chiamata GRANATA! RAGGIO X! con la chiamata INQUEST&#39;AREA!(NOTA: l&#8217;angolo formato dalle braccia per determinare l&#8217;area d&#8217;effetto DEVE obbligatoriamente esserecompreso tra 90&#176; e 180&#176;.)','personale','0',0,-1,8);
/*!40000 ALTER TABLE `abilita_militari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classi_civili`
--

DROP TABLE IF EXISTS `classi_civili`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classi_civili` (
  `id_classe_civile` int(11) NOT NULL AUTO_INCREMENT,
  `nome_classe_civile` varchar(255) NOT NULL,
  PRIMARY KEY (`id_classe_civile`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classi_civili`
--

LOCK TABLES `classi_civili` WRITE;
/*!40000 ALTER TABLE `classi_civili` DISABLE KEYS */;
INSERT INTO `classi_civili` VALUES (1,'Sportivo'),(2,'Giornalista'),(3,'Netrunner'),(4,'Tecnico'),(5,'Biomedico'),(6,'Guardia di Sicurezza'),(7,'Sciacallo');
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
  `nome_classe_militare` varchar(255) NOT NULL,
  `grado_classe_militare` set('base','avanzata') NOT NULL DEFAULT 'base',
  PRIMARY KEY (`id_classe_militare`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classi_militari`
--

LOCK TABLES `classi_militari` WRITE;
/*!40000 ALTER TABLE `classi_militari` DISABLE KEYS */;
INSERT INTO `classi_militari` VALUES (1,'Guardiano','base'),(2,'Guardiano','avanzata'),(3,'Assaltatore','base'),(4,'Assaltatore','avanzata'),(5,'Supporto','base'),(6,'Supporto','avanzata'),(7,'Guastatore','base'),(8,'Guastatore','avanzata');
/*!40000 ALTER TABLE `classi_militari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componenti_crafting`
--

DROP TABLE IF EXISTS `componenti_crafting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `componenti_crafting` (
  `id_componente` int(255) NOT NULL AUTO_INCREMENT,
  `nome_componente` varchar(255) NOT NULL,
  `tipo_componente` set('contenitore','batteria','applicazione') NOT NULL,
  `valore_componente` int(11) NOT NULL,
  PRIMARY KEY (`id_componente`)
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
  `componenti_crafting_id_componente` int(255) NOT NULL,
  `ricette_id_ricetta` int(11) NOT NULL,
  PRIMARY KEY (`componenti_crafting_id_componente`,`ricette_id_ricetta`),
  KEY `fk_componenti_crafting_has_ricette_ricette1_idx` (`ricette_id_ricetta`),
  CONSTRAINT `fk_componenti_crafting_has_ricette_componenti_crafting1` FOREIGN KEY (`componenti_crafting_id_componente`) REFERENCES `componenti_crafting` (`id_componente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
INSERT INTO `giocatori` VALUES ('ABCDEF90C04C345F','ciao','Matteo','Barbieri','b-teo-90@libero.it',3),('SLVNDR87C27F205N','ciao','Andrea','Silvestri','miroku_87@yahoo.it',1);
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
  `px_personaggio` int(11) NOT NULL DEFAULT '0',
  `pc_personaggio` int(11) NOT NULL DEFAULT '0',
  `giocatori_codice_fiscale_giocatore` varchar(255) NOT NULL,
  PRIMARY KEY (`id_personaggio`,`giocatori_codice_fiscale_giocatore`),
  KEY `fk_personaggi_giocatori_idx` (`giocatori_codice_fiscale_giocatore`),
  CONSTRAINT `fk_personaggi_giocatori` FOREIGN KEY (`giocatori_codice_fiscale_giocatore`) REFERENCES `giocatori` (`codice_fiscale_giocatore`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personaggi`
--

LOCK TABLES `personaggi` WRITE;
/*!40000 ALTER TABLE `personaggi` DISABLE KEYS */;
INSERT INTO `personaggi` VALUES (1,'Ciccio','Pasticcio',NULL,30,1,'SLVNDR87C27F205N');
/*!40000 ALTER TABLE `personaggi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personaggi_has_abilita_civili`
--

DROP TABLE IF EXISTS `personaggi_has_abilita_civili`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personaggi_has_abilita_civili` (
  `personaggi_id_personaggio` int(11) NOT NULL,
  `abilita_civili_id_abilita_civile` int(255) unsigned zerofill NOT NULL,
  PRIMARY KEY (`personaggi_id_personaggio`,`abilita_civili_id_abilita_civile`),
  KEY `fk_personaggi_has_abilita_civili_abilita_civili1_idx` (`abilita_civili_id_abilita_civile`),
  KEY `fk_personaggi_has_abilita_civili_personaggi1_idx` (`personaggi_id_personaggio`),
  CONSTRAINT `fk_personaggi_has_abilita_civili_abilita_civili1` FOREIGN KEY (`abilita_civili_id_abilita_civile`) REFERENCES `abilita_civili` (`id_abilita_civile`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_personaggi_has_abilita_civili_personaggi1` FOREIGN KEY (`personaggi_id_personaggio`) REFERENCES `personaggi` (`id_personaggio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personaggi_has_abilita_civili`
--

LOCK TABLES `personaggi_has_abilita_civili` WRITE;
/*!40000 ALTER TABLE `personaggi_has_abilita_civili` DISABLE KEYS */;
/*!40000 ALTER TABLE `personaggi_has_abilita_civili` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `reboot_live`.`personaggi_has_abilita_civili_BEFORE_INSERT` BEFORE INSERT ON `personaggi_has_abilita_civili` FOR EACH ROW
BEGIN
	IF  (
			SELECT px_personaggio FROM personaggi WHERE id_personaggio = NEW.personaggi_id_personaggio
		) < (
			SELECT costo_px_abilita_civile FROM abilita_civili WHERE id_abilita_civile = NEW.abilita_civili_id_abilita_civile
        )
    THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Non hai abbastanza Punti Esperienza per acquistare abilità.';
    END IF;
    
	CALL controllaAbilitaCivileAcquistata( NEW.personaggi_id_personaggio, NEW.abilita_civili_id_abilita_civile );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `reboot_live`.`personaggi_has_abilita_civili_BEFORE_UPDATE` BEFORE UPDATE ON `personaggi_has_abilita_civili` FOR EACH ROW
BEGIN
	CALL controllaAbilitaCivileAcquistata( NEW.personaggi_id_personaggio, NEW.abilita_civili_id_abilita_civile );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `personaggi_has_abilita_militari`
--

DROP TABLE IF EXISTS `personaggi_has_abilita_militari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personaggi_has_abilita_militari` (
  `personaggi_id_personaggio` int(255) NOT NULL,
  `abilita_id_abilita_militare` int(255) NOT NULL,
  PRIMARY KEY (`personaggi_id_personaggio`,`abilita_id_abilita_militare`),
  KEY `fk_personaggi_has_abilita_abilita1_idx` (`abilita_id_abilita_militare`),
  KEY `fk_personaggi_has_abilita_personaggi1_idx` (`personaggi_id_personaggio`),
  CONSTRAINT `fk_personaggi_has_abilita_abilita1` FOREIGN KEY (`abilita_id_abilita_militare`) REFERENCES `abilita_militari` (`id_abilita_militare`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_personaggi_has_abilita_personaggi1` FOREIGN KEY (`personaggi_id_personaggio`) REFERENCES `personaggi` (`id_personaggio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personaggi_has_abilita_militari`
--

LOCK TABLES `personaggi_has_abilita_militari` WRITE;
/*!40000 ALTER TABLE `personaggi_has_abilita_militari` DISABLE KEYS */;
INSERT INTO `personaggi_has_abilita_militari` VALUES (1,1);
/*!40000 ALTER TABLE `personaggi_has_abilita_militari` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `reboot_live`.`personaggi_has_abilita_militari_BEFORE_INSERT` BEFORE INSERT ON `personaggi_has_abilita_militari` FOR EACH ROW
BEGIN
	IF  (
			SELECT pc_personaggio FROM personaggi WHERE id_personaggio = NEW.personaggi_id_personaggio
		) < 1
    THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Non hai abbastanza Punti Combattimento per acquistare abilità.';
    END IF;
    
	CALL controllaAbilitaMilitareAcquistata( NEW.personaggi_id_personaggio, NEW.abilita_id_abilita_militare );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `reboot_live`.`personaggi_has_abilita_militari_BEFORE_UPDATE` BEFORE UPDATE ON `personaggi_has_abilita_militari` FOR EACH ROW
BEGIN
	CALL controllaAbilitaMilitareAcquistata( NEW.personaggi_id_personaggio, NEW.abilita_id_abilita_militare );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `personaggi_has_classi_civili`
--

DROP TABLE IF EXISTS `personaggi_has_classi_civili`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personaggi_has_classi_civili` (
  `personaggi_id_personaggio` int(11) NOT NULL,
  `classi_civili_id_classe_civile` int(11) NOT NULL,
  PRIMARY KEY (`personaggi_id_personaggio`,`classi_civili_id_classe_civile`),
  KEY `fk_personaggi_has_classi_civili_classi_civili1_idx` (`classi_civili_id_classe_civile`),
  KEY `fk_personaggi_has_classi_civili_personaggi1_idx` (`personaggi_id_personaggio`),
  CONSTRAINT `fk_personaggi_has_classi_civili_classi_civili1` FOREIGN KEY (`classi_civili_id_classe_civile`) REFERENCES `classi_civili` (`id_classe_civile`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_personaggi_has_classi_civili_personaggi1` FOREIGN KEY (`personaggi_id_personaggio`) REFERENCES `personaggi` (`id_personaggio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personaggi_has_classi_civili`
--

LOCK TABLES `personaggi_has_classi_civili` WRITE;
/*!40000 ALTER TABLE `personaggi_has_classi_civili` DISABLE KEYS */;
/*!40000 ALTER TABLE `personaggi_has_classi_civili` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personaggi_has_classi_militari`
--

DROP TABLE IF EXISTS `personaggi_has_classi_militari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personaggi_has_classi_militari` (
  `personaggi_id_personaggio` int(11) NOT NULL,
  `classi_militari_id_classe_militare` int(11) NOT NULL,
  PRIMARY KEY (`personaggi_id_personaggio`,`classi_militari_id_classe_militare`),
  KEY `fk_personaggi_has_classi_militari_classi_militari1_idx` (`classi_militari_id_classe_militare`),
  KEY `fk_personaggi_has_classi_militari_personaggi1_idx` (`personaggi_id_personaggio`),
  CONSTRAINT `fk_personaggi_has_classi_militari_classi_militari1` FOREIGN KEY (`classi_militari_id_classe_militare`) REFERENCES `classi_militari` (`id_classe_militare`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_personaggi_has_classi_militari_personaggi1` FOREIGN KEY (`personaggi_id_personaggio`) REFERENCES `personaggi` (`id_personaggio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personaggi_has_classi_militari`
--

LOCK TABLES `personaggi_has_classi_militari` WRITE;
/*!40000 ALTER TABLE `personaggi_has_classi_militari` DISABLE KEYS */;
/*!40000 ALTER TABLE `personaggi_has_classi_militari` ENABLE KEYS */;
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
INSERT INTO `ruoli_has_grants` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21);
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

--
-- Dumping routines for database 'reboot_live'
--
/*!50003 DROP PROCEDURE IF EXISTS `controllaAbilitaCivileAcquistata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `controllaAbilitaCivileAcquistata`( _id_pg INT, _id_abilita INT )
BEGIN
	-- Trigger che controlla se il pg ha i prerequisiti necessari
	-- Solitamente nel campo prerequisito_abilita_civile c'e' l'id
	-- dell'abilita necessaria, ma esiste un id d'eccezione:
	--  -1: per l'abilità IDOLO DELLA FOLLA (id 12) per lo Sportivo bisogna avere almeno 4 abilità da Sportivo
    
	SELECT prerequisito_abilita_civile, classi_civili_id_classe_civile INTO @prerequisito, @classe 
		FROM abilita_civili 
		WHERE id_abilita_civile = _id_abilita;

	IF @prerequisito = -1 AND (
		SELECT COUNT(*) AS num_abilita 
			FROM personaggi_has_abilita_civili
            WHERE personaggi_id_personaggio = _id_pg AND
				abilita_civili_id_abilita_civile IN (
					SELECT id_abilita_civile
						FROM abilita_civili
                        WHERE classi_civili_id_classe_civile = @classe
                )
		) < 4
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Non puoi acquistare questa abilità senza almeno 4 abilità da Sportivo.';
	ELSEIF @prerequisiti != -1 AND (
		SELECT COUNT(*) AS num_abilita
			FROM personaggi_has_abilita_civili
            WHERE personaggi_id_personaggio = _id_pg AND
				abilita_civili_id_abilita_civile = @prerequisito
        ) = 0
	THEN
		SELECT nome_abilita_civile INTO @nome_abilita FROM abilita_civili WHERE id_abilita_civile = @prerequisito;
        SET @message = CONCAT('Non puoi acquistare questa abilità senza aver prima acquistato ', CAST(@nome_abilita AS CHAR));
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `controllaAbilitaMilitareAcquistata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `controllaAbilitaMilitareAcquistata`( _id_pg INT, _id_abilita INT )
BEGIN
	-- Trigger che controlla se il pg ha i prerequisiti necessari
	-- Solitamente nel campo prerequisito_abilita_militare c'e' l'id
	-- dell'abilita necessaria, ma esistono degli id d'eccezione:
	--  -1: servono tutte le abilta della classe dell'abilita che si sta cercando di inserire
	--  -2: servono FUOCO A TERRA e TIRATORE SCELTO (id 44 e 39)
	--  -3: servono almeno 5 abilita di Supporto Base
	--  -4: servono almeno 3 abilita "CONTROLLER"
	SELECT prerequisito_abilita_militare, classi_militari_id_classe_militare INTO @prerequisito, @classe 
		FROM abilita_militari 
		WHERE id_abilita_militare = _id_abilita;

	IF @prerequisito = -1 AND (
		SELECT COUNT(*) AS num_abilita 
			FROM personaggi_has_abilita_militari 
            WHERE personaggi_id_personaggio = _id_pg AND
				abilita_id_abilita_militare IN (
					SELECT id_abilita_militare
						FROM abilita_militari
                        WHERE classi_militari_id_classe_militare = @classe
                )
		) != (
			SELECT COUNT(*) AS tot_abilita_classe
				FROM abilita_militari
                WHERE classi_militari_id_classe_militare = @classe
        ) - 1
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Non puoi acquistare questa abilità senza avere tutte le altre della stessa classe.';
	ELSEIF @prerequisito = -2 AND (
		SELECT COUNT(*) AS num_abilita
			FROM personaggi_has_abilita_militari
            WHERE personaggi_id_personaggio = _id_pg AND 
				abilita_id_abilita_militare IN (
					SELECT id_abilita_militare
						FROM abilita_militari
                        WHERE nome_abilita_militare = 'FUOCO A TERRA' OR
							nome_abilita_militare = 'TIRATORE SCELTO'
                )
		) != 2    
    THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Non puoi acquistare questa abilità senza avere FUOCO A TERRA e TIRATORE SCELTO.';
	ELSEIF @prerequisito = -3 AND (
		SELECT COUNT(*) AS num_abilita 
			FROM personaggi_has_abilita_militari 
            WHERE personaggi_id_personaggio = _id_pg AND
				abilita_id_abilita_militare IN (
					SELECT id_abilita_militare
						FROM abilita_militari
                        WHERE classi_militari_id_classe_militare = @classe
                )
		) < 5
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Non puoi acquistare questa abilità senza almeno 5 abilità di Supporto Base.';
	ELSEIF @prerequisito = -4 AND (
		SELECT COUNT(*) AS num_abilita 
			FROM personaggi_has_abilita_militari 
            WHERE personaggi_id_personaggio = _id_pg AND
				abilita_id_abilita_militare IN (
					SELECT id_abilita_militare
						FROM abilita_militari
                        WHERE nome_abilita_militare LIKE '%CONTROLLER%'
                )
		) < 3
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Non puoi acquistare questa abilità senza almeno 3 abilità CONTROLLER.';
	ELSEIF @prerequisito NOT IN (-1,-2,-3,-4) AND (
		SELECT COUNT(*) AS num_abilita
			FROM personaggi_has_abilita_militari
            WHERE personaggi_id_personaggio = _id_pg AND
				abilita_id_abilita_militare = @prerequisito
        ) = 0
	THEN
		SELECT nome_abilita_militare INTO @nome_abilita FROM abilita_militari WHERE id_abilita_militare = @prerequisito;
        SET @message = CONCAT('Non puoi acquistare questa abilità senza aver prima acquistato ', CAST(@nome_abilita AS CHAR));
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-01 23:17:59
