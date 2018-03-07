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
  `id_abilita` int(255) NOT NULL AUTO_INCREMENT,
  `tipo_abilita` set('civile','militare') COLLATE utf8_unicode_ci NOT NULL,
  `nome_abilita` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descrizione_abilita` text COLLATE utf8_unicode_ci NOT NULL,
  `costo_abilita` int(255) NOT NULL DEFAULT '1',
  `classi_id_classe` int(255) NOT NULL,
  `prerequisito_abilita` int(255) DEFAULT NULL COMMENT 'I prerequisiti possono assumere valori minori di zero. Questi hanno significati eccezionali:\n* -1: servono tutte le abilta della classe dell''abilita che si sta cercando di inserire\n* -2: servono FUOCO A TERRA e TIRATORE SCELTO (id 134 e 129)\n* -3: servono almeno 5 abilita di Supporto Base (id 12)\n* -4: servono almeno 3 abilita "CONTROLLER"\n* -5: servono almeno 4 abilita da Sportivo',
  `distanza_abilita` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bruciacarica_abilita` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_abilita`),
  KEY `fk_abilita_classi_idx` (`classi_id_classe`),
  CONSTRAINT `fk_abilita_classi` FOREIGN KEY (`classi_id_classe`) REFERENCES `classi` (`id_classe`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abilita`
--

LOCK TABLES `abilita` WRITE;
/*!40000 ALTER TABLE `abilita` DISABLE KEYS */;
INSERT INTO `abilita` VALUES (1,'civile','GLICH','Una volta per vita, se il personaggio entra in uno dei punti di Respown viene teletrasportato a un altro. (Pu&#242; essere utilizzata unicamente all&#8217;interno di una partita di DEATHMATCH)',20,1,NULL,NULL,NULL),(2,'civile','LAG','Una volta per vita , il personaggio se si muove a scatti dichiara IMMUNE! al primo danno che subisce. (Pu&#242; essere utilizzata unicamente all&#8217;interno di una partita di DEATHMATCH)',20,1,NULL,NULL,NULL),(3,'civile','BARRA SPAZIATRICE','Se il personaggio si muove saltellando dichiara IMMUNE! ai danni delle chiamate ad area e raggio. (Pu&#242; essere utilizzata unicamente all&#8217;interno di una partita di DEATHMATCH)',20,1,NULL,NULL,NULL),(4,'civile','TEA BAG','Se al primo avversario abbattuto il personaggio esulta in modo evidente al pubblico, guadagnaautomaticamente 1 punto in classifica nelle partite DEATHMATCH. (Pu&#242; essere utilizzata unicamente all&#8217;interno di una partita di DEATHMATCH)',20,1,NULL,NULL,NULL),(5,'civile','CONOSCENZA MAPPE','Il personaggio ha tempo 15 secondi per girare la mappa prima di giocare la partita. (Pu&#242; essere utilizzata unicamente all&#8217;interno di una partita di DEATHMATCH)',20,1,NULL,NULL,NULL),(6,'civile','AKIMBO','Il personaggio pu&#242; giocare usando 2 pistole. (Pu&#242; essere utilizzata unicamente all&#8217;interno di una partita di DEATHMATCH)',20,1,NULL,NULL,NULL),(7,'civile','AIM BOT','Una volta per Vita il personaggio pu&#242; fare la dichiarazione di danno a dito indicando la vittima. (Pu&#242; essere utilizzata unicamente all&#8217;interno di una partita di DEATHMATCH)',20,1,NULL,NULL,NULL),(8,'civile','AUTOKILL','Il personaggio pu&#242; suicidarsi per non dare punti al nemico. (Pu&#242; essere utilizzata unicamente all&#8217;interno di una partita di DEATHMATCH)',20,1,NULL,NULL,NULL),(9,'civile','LANCIA LA BANDIERA','Se il personaggio in un match &#8220; cattura la bandiera&#8221; &#232; equipaggiato con la sua arma base e tiene la bandiera lapu&#242; lanciare. (Pu&#242; essere utilizzata unicamente all&#8217;interno di una partita di DEATHMATCH)',20,1,NULL,NULL,NULL),(10,'civile','FINTO MORTO','Il personaggio pu&#242; fingersi morto per 30 secondi consecutivi. (Pu&#242; essere utilizzata unicamente all&#8217;interno di una partita di DEATHMATCH)',20,1,NULL,NULL,NULL),(11,'civile','CAMPERONE','Ogni volta che il personaggio sta fermo in un posto per sparare almeno per 3 secondi pu&#242; dichiarare al primocolpo che spara + 1 alla chiamata secondo lo schema SINGOLO!, DOPPIO! TRIPLO, QUADRUPLO! (Pu&#242; essere utilizzata unicamente all&#8217;inte',20,1,NULL,NULL,NULL),(12,'civile','IDOLO DELLA FOLLA','Se il personaggio ha appena vinto ( o fa parte della squadra che ha vinto) una partita pu&#242; richiedere allosponsor un extra del 25% del suo ingaggio dichiarando SONO L&#8217;IDOLO DELLA FOLLA.',40,1,-5,NULL,NULL),(13,'civile','COCA E MIGNOTTE','Il personaggio sceglie tra una di queste due opzioni:DROGA: il personaggio ha passato la sua vita a sniffare, risulta immune agli effetti negativi fisici delledroghe da inalazione.CONTATTO: il personaggio ha passato la sua vita a contatto con sostanze sch',70,1,12,NULL,NULL),(14,'civile','STALKER','I numerosi successi sportivi e mondani del personaggio hanno attirato l&#8217;attenzione di uno Stalker che lo seguir&#224;dall&#8217;ombra e potr&#224; fornire qualche aiuto, ma anche delle complicazioni, al personaggio.',20,1,12,NULL,NULL),(15,'civile','GAVETTA','Tra un evento e il successivo il personaggio pu&#242; inviare 1 articolo per farlo pubblicare, se questo avvieneguadagna Bit aggiuntivi che gli saranno consegnati al prossimo evento.',20,2,NULL,NULL,NULL),(16,'civile','OTTIMO SCRITTORE','I compensi degli articoli pubblicati aumentano del 30%.',40,2,15,NULL,NULL),(17,'civile','CAMPO DI SPECIALIZZAZIONE 1','Il personaggio sceglie tra i seguenti campi: cronaca nera, cronaca rosa, sport, economica, politica, giornalismospazzatura.Scrivendo nel campo selezionato pu&#242; mandare un articolo aggiuntivo.',40,2,NULL,NULL,NULL),(18,'civile','CAMPO DI SPECIALIZZAZIONE 2','Il personaggio sceglie tra i seguenti campi: cronaca nera, cronaca rosa, sport, economica, politica, giornalismospazzatura.Scrivendo nel campo selezionato pu&#242; mandare un articolo aggiuntivo.',40,2,NULL,NULL,NULL),(19,'civile','CAMPO DI SPECIALIZZAZIONE 3','Il personaggio sceglie tra i seguenti campi: cronaca nera, cronaca rosa, sport, economica, politica, giornalismospazzatura.Scrivendo nel campo selezionato pu&#242; mandare un articolo aggiuntivo.',40,2,NULL,NULL,NULL),(20,'civile','CAMPO DI SPECIALIZZAZIONE 4','Il personaggio sceglie tra i seguenti campi: cronaca nera, cronaca rosa, sport, economica, politica giornalismospazzatura.Scrivendo nel campo selezionato pu&#242; mandare un articolo aggiuntivo.',40,2,NULL,NULL,NULL),(21,'civile','FOTO SCOTTANTI','Il personaggio ha contatti per vendere facilmente e a un buon prezzo foto compromettenti (se le devecomunque procurare in gioco).',30,2,NULL,NULL,NULL),(22,'civile','CLICCA QUI','Il personaggio ha un sito dove vende informazioni spazzatura per allocchi, questo gli garantisce il 25% in pi&#249;del tuo attuale stipendio.',60,2,NULL,NULL,NULL),(23,'civile','DISINFORMAZIONE','Il personaggio pu&#242; far pubblicare informazioni palesemente false anche sui canali di informazione regolari.',80,2,NULL,NULL,NULL),(24,'civile','DEVIARE L&#8217;ATTENZIONE','Il personaggio pu&#242; scrivere un articolo &#8220;realistico &#8220;che devi l&#8217;attenzione da un altro evento che vuole nascondere( questa abilit&#224; blocca un articolo gi&#224; uscito fino all&#8217;evento successivo).',40,2,NULL,NULL,NULL),(25,'civile','SERVO DEL SISTEMA','Il personaggio guadagna il 75% in pi&#249; del suo stipendio MA non potr&#224; mai comprare le seguenti abilit&#224;:DISINFORMAZIONE, DEVIARE L&#8217;ATTENZIONE, SPECCHIETTO PER GLI ALLOCCHI, INFORMAZIONI FALSE.',120,2,NULL,NULL,NULL),(26,'civile','INFORMAZIONI PRELIBATE','Il personaggio ottiene informazioni commerciali preferenziali sull&#8217;apposita sezione del Ravnet.',30,2,NULL,NULL,NULL),(27,'civile','BUNGA BUNGA','Il personaggio pu&#242; investire Bit (quanti a sua discrezione) per ottenere informazioni su movimenti della politicae di personaggi di spicco della politica.',30,2,NULL,NULL,NULL),(28,'civile','VOCI DI STRADA','Il personaggio ottiene informazioni di quello che accade nelle strade in ambiti legati a Guardie di vigilanza omalavita tra un live e l&#8217;altro inoltrando allo staff una mail con la domanda.',30,2,NULL,NULL,NULL),(29,'civile','PROGRAMMARE','Il personaggio pu&#242; assemblare stringhe di codice per creare programmi singoli.',20,3,NULL,NULL,NULL),(30,'civile','PROGRAMMAZIONE AVANZATA','Il personaggio pu&#242; assemblare due programmi assieme; i bonus dei singoli programmi sono accorpati. Iprogrammi cos&#236; assemblati non possono pi&#249; essere separati.',40,3,29,NULL,NULL),(31,'civile','PROGRAMMAZIONE TOTALE','Il personaggio pu&#242; assemblare fino a 4 programmi assieme; i bonus dei singoli programmi sono accorpati. Iprogrammi cos&#236; assemblati non possono pi&#249; essere separati.',60,3,30,NULL,NULL),(32,'civile','RIALLOCAZIONE CODICE','Nella programmazione il giocatore pu&#242; modificare di +/&#8211; 1 uno dei parametri numerici di un singolo programmaprima del Debug finale.',50,3,NULL,NULL,NULL),(33,'civile','CTRL&#8211;C , CTRL&#8211;V','Il giocatore pu&#242; richiedere allo staff di ricopiare un programma in suo possesso una volta per evento .',50,3,NULL,NULL,NULL),(34,'civile','TUTTO DA SOLO','Il giocatore in possesso di una singola stringa di codice pu&#242; compilare un programma di massimo due righeutilizzando due volte la stessa stringa di codice.',60,3,NULL,NULL,NULL),(35,'civile','CANCELLAZIONE PROGRAMMA','Il personaggio mentre e nella rete pu&#242; decidere di cancellare un qualsiasi programma che ha equipaggiato perottenere uno spazio vuoto.',50,3,NULL,NULL,NULL),(36,'civile','BRUCIARE IL SUPPORTO','Il personaggio pu&#242; chiedere allo staff un cartellino &#8220;CRIPT&#8211;LOCK&#174;&#8221; .',50,3,NULL,NULL,NULL),(37,'civile','MULTITASKING','Il personaggio pu&#242; caricare fino ad un numero di programmi pari alla met&#224; delle abilit&#224; da netrunner chepossiede (arrotondate per difetto, con un minimo di 2) prima di entrare nella rete.',60,3,NULL,NULL,NULL),(38,'civile','ZERG RUSH','Il personaggio ogni volta che accede a una rete virtuale pu&#242; avvisare un membro staff che vuole adoperarel&#39;abilit&#224;; per ogni 2 cartellini codice che sacrifica ottiene 1 suo &#8220; clone &#8220; ( con profilo base e senza i vantaggi dieventu',30,3,37,NULL,NULL),(39,'civile','STRADA SICURA','Il personaggio 1 volta per accesso alla rete pu&#242; inviare in modo sicuro un pacchetto dati a una sua casella&#8220;sicura&#8221;. In termini di gioco pu&#242; prendere un singolo cartellino dati in suo possesso all&#39;interno della rete econsegnarlo ',30,3,NULL,NULL,NULL),(40,'civile','NEURO ARMATURA','Il personaggio ha installato un programma di protezione latente, se non equipaggiato con programmi diarmatura conta comunque come avere uno Shield da 6 punti. Nel caso sia gi&#224; presente un programma diarmatura la Neuro Armatura non si attiva.',30,3,NULL,NULL,NULL),(41,'civile','SISTEMA DI SICUREZZA INTEGRATO','Il personaggio nella rete virtuale pu&#242; dichiare DISINTEGRAZIONE! con bersaglio se stesso anche se al momentonon &#232; cosciente.',50,3,38,NULL,NULL),(42,'civile','GUERRIGLIA INFORMATICA','Il personaggio pu&#242;, quando entra nella rete, dichiarare BONUS! +X DANNI! RAGGIO 5! oppure dichiarareBONUS! +X PUNTI FERITA! RAGGIO 5! (in entrambi i casi X &#232; pari alla met&#224; dei personaggi che sono entratiinsieme a lui nella rete virtuale).',40,3,37,NULL,NULL),(43,'civile','RIPARAZIONE','Il personaggio pu&#242; dichiarare RIPARAZIONE 1 dopo 10 Minuti di lavoro.',30,4,NULL,NULL,NULL),(44,'civile','RIPARAZIONE VELOCE','Il personaggio pu&#242; dichiarare RIPARAZIONE 1 dopo 5 Minuti.',40,4,43,NULL,NULL),(45,'civile','MAGO DELLA BRUGOLA','Il personaggio aggiunge sempre + 1 al suo valore di RIPARAZIONE! Dato dall&#8217;abilit&#224; Riparare.',50,4,NULL,NULL,NULL),(46,'civile','LAVORO DI SQUADRA','Il personaggio se lavora con un altro personaggio con questa abilit&#224; dimezza i tempi di riparazione(approssimati per eccesso) e aggiunge +1 al valore della chiamata. Questa abilit&#224; non pu&#242; essere usataassieme a RIPARAZIONE VELOCE.',40,4,NULL,NULL,NULL),(47,'civile','SPECIALIZZAZIONE &#8211; ARMI','Il personaggio pu&#242; scegliere nei progetti fattibili qualsiasi tipologia da arma.',40,4,NULL,NULL,NULL),(48,'civile','SPECIALIZZAZIONE &#8211; PROTESI','Il personaggio pu&#242; scegliere nei progetti fattibili qualsiasi tipologia di protesi.',40,4,NULL,NULL,NULL),(49,'civile','SPECIALIZZAZIONE &#8211; GADGET e SHIELD','Il personaggio pu&#242; scegliere nei progetti fattibili qualsiasi tipologia di gadget e Shield.',40,4,NULL,NULL,NULL),(50,'civile','SPECIALIZZAZIONE &#8211; ESOSCHELETRI e SCUDI','Il personaggio pu&#242; scegliere nei progetti fattibili qualsiasi tipologia di potenziamento per tutte le tipologie diesoscheletro e scudi.',40,4,NULL,NULL,NULL),(51,'civile','SPECIALIZZAZIONE AVANZATA &#8211; ESOSCHELETRI','Il personaggio pu&#242; progettare esoscheletri completi.',40,4,50,NULL,NULL),(52,'civile','SPECIALIZZAZIONE AVANZATA &#8211; GADGET','Il personaggio pu&#242; progettare gadget complessi.',40,4,49,NULL,NULL),(53,'civile','SCANSIONE SCHEMI','Il personaggio pu&#242; demolire un oggetto per scoprire il suo esatto schema di realizzazione',80,4,NULL,NULL,NULL),(54,'civile','SMONTAGGIO VELOCE','Il personaggio pu&#242; smontare qualsiasi oggetto dotato di cartellino recuperando la componente pi&#249; facile daottenere. Il personaggio pu&#242;, mimando di smontare l&#8217;oggetto per 2 minuti, tagliare il cartellino lungo la lineatratteggiata ed i',50,4,NULL,NULL,NULL),(55,'civile','RICERCA MIRATA','Il personaggio pu&#242; demolire un oggetto per ottenere un suo componente. Il personaggio deve consegnarel&#8217;oggetto allo staff specificando quale parte vuole ottenere tra le seguenti tipologie: struttura, batteria,applicativo.',60,4,NULL,NULL,NULL),(56,'civile','MACCHINARI SPECIALISTICI','Il personaggio &#232; in grado di interagire ed adoperare macchinari complessi come ad esempio torrette laser omacchinari pesanti.',20,4,NULL,NULL,NULL),(57,'civile','SQUADRA DI AIUTANTI','Il personaggio pu&#242; farsi aiutare da altri personaggi (da uno ad un massimo pari alla met&#224; delle abilit&#224; di Tecnicoche possiede, arrotondate per difetto) nel compiere le operazioni di riparazione. Se lui, i suoi aiutanti e l&#8217;oggettoda ',60,4,NULL,NULL,NULL),(58,'civile','IMPLANTOLOGIA CIBERNETICA','Il personaggio &#232; in grado di montare protesi a un personaggio se opera in un struttura adeguata. L&#8217;operazionedeve essere mimata per 10 minuti.',20,5,NULL,NULL,NULL),(59,'civile','IMPLANTOLOGIA CIBERNETICA MIGLIORATA','Il personaggio &#232; in grado di montare protesi a un personaggio se opera in un struttura adeguata. L&#8217;operazionedeve essere mimata per 5 minuti.',40,5,NULL,NULL,NULL),(60,'civile','CURE INTENSIVE','Il personaggio pu&#242; dichiarare GUARIGIONE! X! (dove X &#232; pari alla met&#224; delle abilit&#224; di medicina che possiede)dopo aver mimato la procedura per 5 minuti ad un personaggio che non sia in stato di coma.',30,5,NULL,NULL,NULL),(61,'civile','SINTESI E ANALISI CHIMICA','Il personaggio &#232; in grado di analizzare e produrre sostanze chimiche tramite la specifica sezione del databasemedico e dello strumento di sintesi preposto.',20,5,NULL,NULL,NULL),(62,'civile','PRODUZIONE MIGLIORATA','Durante la sintesi chimica un personaggio ottiene il doppio dei prodotti normalmente ottenibili.',60,5,NULL,NULL,NULL),(63,'civile','PRIME CURE','Il personaggio pu&#242;, dopo 10 secondi di lavoro, allungare il tempo di coma del bersaglio di ulteriori 5 minuti. Pu&#242;essere utilizzata solo una volta sullo stesso bersaglio, anche da diversi Biomedici. Il giocatore dovr&#224; spiegare albersaglio g',20,5,NULL,NULL,NULL),(64,'civile','CURE AVANZATE','Il personaggio pu&#242; dichiarare GUARIGIONE! X! (dove X &#232; pari alla met&#224; delle abilit&#224; di medicina che possiede)su un personaggio in coma dopo aver mimato la procedura per 10 minuti.',40,5,60,NULL,NULL),(65,'civile','EQUIPE MEDICA','Il personaggio se lavora con un altro personaggio con questa abilit&#224; aggiunge +1 al valore della chiamata perogni personaggio con cui collabora.',40,5,NULL,NULL,NULL),(66,'civile','GESTIRE GLI AIUTANTI','Il personaggio pu&#242; farsi aiutare da altri personaggi (da uno ad un massimo pari alla met&#224; delle abilit&#224; dimedicina che possiede, arrotondate per difetto ) nel compiere le operazioni mediche. Se lui, i suoi aiutanti e ipazienti sono in un ra',60,5,NULL,NULL,NULL),(67,'civile','GESTIRE I TEMPI','Il personaggio pu&#242; farsi aiutare da altri personaggi (da uno ad un massimo pari alla met&#224; delle abilit&#224; dimedicina che possiede, arrotondate per difetto) nel compiere le operazioni mediche. Se lui, i suoi aiutanti e ilpaziente sono in un ra',60,5,NULL,NULL,NULL),(68,'civile','NON PUOI INGRANDIRLA DI PIU&#8217;?','Il personaggio pu&#242; ottenere informazioni aggiuntive tramite la Ravnet, su prove che sono gi&#224; state analizzate.',20,6,NULL,NULL,NULL),(69,'civile','GRISSOM E&#8217; AMICO MIO','Il personaggio ottiene informazioni aggiunte nei cartellini &#8220;Interazione&#8221;.',20,6,NULL,NULL,NULL),(70,'civile','LINGUAGGIO DEL CORPO','Il personaggio, dopo aver parlato almeno 5 minuti con una persona pu&#242; dichiarare SINCERITA&#8217;!: MI HAIMENTITO SU QUALCOSA IN QUESTI ULTIMI 5 MINUTI?. Non &#232; possibile interrogare con questa abilit&#224; la stessapersona pi&#249; volte nell&#8',40,6,NULL,NULL,NULL),(71,'civile','DIREZIONE DEI COLPI','Il personaggio se in presenza di un cadavere pu&#242; chiedere allo staff la direzione, il numero di colpi e la tipologiadell&#8217;arma che ha ucciso la persona.',20,6,NULL,NULL,NULL),(72,'civile','INTERROGATORIO','Durante un interrogatorio il personaggio pu&#242;, dopo aver posto allo stesso un bersaglio 5 domande sullo stessoargomento, dichiarare SINCERITA&#8217;! HAI MENTITO IN QUALCUNA DELLE RISPOSTE CHE MI HAI DATO?. Non &#232;possibile interrogare con questa a',60,6,NULL,NULL,NULL),(73,'civile','POLIZIOTTO BUONO &#38; POLIZIOTTO CATTIVO','Se 2 giocatori hanno l&#8217;abilit&#224; INTERROGATORIO possono interrogare lo stesso soggetto in contemporanea anchesullo stesso argomento. Viene richiesto ai due giocatori di interpretare correttamente la cosa con uno dei due&#8220;buono&#8221; e l&#82',60,6,NULL,NULL,NULL),(74,'civile','CONTATTI NELL&#8217;AGO','Il personaggio ha contatti nell&#8217;Ago e ottiene accesso all&#8217;apposita sezione nel Ravnet.',40,6,NULL,NULL,NULL),(75,'civile','CHIUDEREMO UN OCCHIO','La prima volta che il personaggio fa qualche errore grosso e si ritrova il dipartimento disciplinare pu&#242; dichiararea un membro staff l&#8217;uso di questa abilit&#224; e il suo problema verr&#224; ignorato solo per quella volta. Il favore pu&#242;ess',80,6,NULL,NULL,NULL),(76,'civile','CONTATTI NELLA MALAVITA','Il personaggio ha contatti nella malavita e ottiene accesso all&#8217;apposita sezione nel Ravnet.',40,6,NULL,NULL,NULL),(77,'civile','NEMESI','Il personaggio nel suo passato si &#232; creato un nemico giurato con cui si &#232; andato a creare una stana simbiosi, ilsuo nemico cercher&#224; di ostacolarlo ma non ucciderlo, non lo aiuter&#224; ma potrebbe salvarlo da situazioni estremesolo perch&#2',60,6,NULL,NULL,NULL),(78,'civile','TORTURARE','Durante un interrogatorio e dopo aver causato dei danni al bersaglio, il personaggio pu&#242;, dopo aver posto allostesso bersaglio 5 domande sullo stesso argomento, dichiarare SINCERITA&#8217;! HAI MENTITO IN QUALCUNA DELLERISPOSTE CHE MI HAI DATO?. Non ',50,7,NULL,NULL,NULL),(79,'civile','BACIAMO LE MANI','La prima volta che il personaggio fa qualche errore grosso e si ritrova nei guai con qualche organizzazionecriminale pu&#242; dichiarare a un membro staff l&#8217;uso di questa abilit&#224; e il suo problema verr&#224; ignorato solo perquella volta. Il fa',80,7,NULL,NULL,NULL),(80,'civile','CONTATTI TRA GLI SBIRRI','Il personaggio ha contatti che gli garantiscono informazioni sui movimenti delle guardie corporative e ottieneaccesso all&#8217;apposita sezione nel Ravnet.',40,7,NULL,NULL,NULL),(81,'civile','CONTATTI NELLA FAMIGLIA','Il personaggio ha contatti nella malavita e ottiene accesso all&#8217;apposita sezione nel Ravnet.',40,7,NULL,NULL,NULL),(82,'civile','INQUINARE LE PROVE','Il personaggio pu&#242; interagire su Cartellini Interazione &#8220;Prove&#8221; chiedendo allo staff di modificarlipermanentemente.',40,7,NULL,NULL,NULL),(83,'civile','SCASSINARE','Il personaggio pu&#242; mimare di scassinare una serratura e aprirla dopo 1 minuto di interazione per ogni livello didifficolt&#224; della serratura.',40,7,NULL,NULL,NULL),(84,'civile','RICETTARE MERCE','Il personaggio pu&#242; affidare alla segreteria oggetti in suo possesso e ottenerne il 50 % del valore.',40,7,NULL,NULL,NULL),(85,'civile','MENU&#8217; DEL CONTINENTAL','Il personaggio ottiene prima del live una lista di prodotti ottenibili sul mercato nero ma deve trovare qualcunoche gli venda l&#8217;oggetto del suo desiderio.',30,7,NULL,NULL,NULL),(86,'civile','CONSIERGE DEL CONTINENTAL','Il personaggio sapendo cosa vendono al Continental pu&#242; acquistare prima del live uno o pi&#249; beni (sempre sepossiede i Bit necessari per farlo).',80,7,85,NULL,NULL),(87,'civile','ALLIBRATORE','Se il personaggio perde giocando a delle scommesse ufficiali riguadagna il 25% del valore perso.',40,7,NULL,NULL,NULL),(88,'civile','VITA ALLO SBANDO','Il personaggio sceglie tra una di queste due opzioni:ALCOLISMO: il personaggio ha passato la sua vita a bere, risulta immune agli effetti negativi fisici delledroghe da ingestione.INIEZIONE: il personaggio ha passato la sua vita a bucarsi, risulta immune ',60,7,NULL,NULL,NULL),(89,'civile','CONVERSIONE SICURA','Il personaggio pu&#242; convertire Bit in Platino e viceversa senza problemi andando in sala staff.',70,7,NULL,NULL,NULL),(90,'civile','RICONOSCERE DROGHE E SOSTANZE ILLEGALI','Il personaggio &#232; in grado di riconoscere sostanze illegali non identificate se appartengono alla categoria&#8220;Droghe&#8221;',20,7,NULL,NULL,NULL),(91,'militare','ISTINTO OMICIDA','Se il personaggio &#232; sotto l&#8217;effetto di CONFUSIONE! pu&#242; comunque attaccare colpendo col danno basedell&#8217;arma usata ridotto di 1 seguendo la catena COMA! &#8211; A ZERO! &#8211; CRASH! - QUADRUPLO! - TRIPLO! -DOPPIO! &#8211; SINGOLO!.',1,8,NULL,'personale',0),(92,'militare','ISTINTO DI SOPRAVVIVENZA','Se il personaggio &#232; sotto effetto della chiamata DOLORE! pu&#242; comunque muoversi arrancando per tuttala durata della chiamata, senza compiere nessun&#8217;altra azione.',1,8,NULL,'personale',0),(93,'militare','SCUDO UMANO','Il personaggio pu&#242; dichiarare NEUTRALIZZA GRANATA! Il personaggio deve mimare di coprire la granatacol proprio corpo (NOTA: &#232; sufficiente essere entro un raggio massimo di 1 metro dalla granata)subendo per&#242; ARTEFATTO COMA! nel caso in cui la granata causi danni o ARTEFATTO SHOCK! nel caso incui sia una qualunque chiamata di effetto. Quest&#8217;abilit&#224; non funziona se non si &#232; coscienti.',1,8,NULL,'personale',0),(94,'militare','POSIZIONE DIFENSIVA','Il personaggio pu&#242; rilocare un danno subito dalla locazione vitale ad un arto o viceversa.ESEMPIO: un colpo alla gamba pu&#242; essere spostato sul torso ma non sulle braccia; un colpo al torso pu&#242;essere spostato dove si vuole.',1,8,92,'personale',0),(95,'militare','BATTERIA AUMENTATA','La batteria &#232; aumentata permanentemente di 1 Carica.',1,8,NULL,'personale',0),(96,'militare','ADDESTRAMENTO FISICO I','I Punti Ferita del personaggio aumentano permanentemente di 1.',1,8,NULL,'personale',0),(97,'militare','SHIELD MK 2','Se il personaggio ha almeno un Punto Shield base, guadagna +2 punti al suo valore globale.',1,8,NULL,'personale',0),(98,'militare','RESISTERE ALLA PAURA','Il personaggio pu&#242; dichiarare IMMUNE! Alla chiamata PAURA!.',1,8,94,'personale',0),(99,'militare','ESOSCHELETRO PESANTE MK2','Il valore base dei punti Shield garantiti dalle locazioni equipaggiate con esoscheletro pesante (comeindicato a pag. 17) &#232; moltiplicato per 1,5.',1,8,NULL,'personale',0),(100,'militare','ESOSCHELETRO PESANTE MK3','Il valore base dei punti Shield garantiti dalle locazioni equipaggiate con esoscheletro pesante (comeindicato a pag. 17) &#232; raddoppiato. Questa abilit&#224; sostituisce ESOSCHELETRO PESANTE MK2.',1,8,99,'personale',0),(101,'militare','SHIELD MK3','Il punteggio di Shield garantito dall&#8217;esoscheletro equipaggiato aumenta di +4, se il personaggio haalmeno un punto Shield Base. Questa abilit&#224; sostituisce SHIELD MK2.',1,8,97,'personale',0),(102,'militare','BRACCIO DI FERRO','Il personaggio pu&#242; dichiarare IMMUNE! alla chiamata DISARMO!.',1,8,NULL,'personale',0),(103,'militare','FUCILE MK2','Il personaggio pu&#242; aumentare di 1 i danni causati col Fucile d&#8217;Assalto in base alla seguente scala :SINGOLO! &#8211; DOPPIO! &#8211; TRIPLO! &#8211; QUADRUPLO! &#8211; CRASH! &#8211; A ZERO! Non &#232; possibile usare pi&#249; carichecontemporaneamente. L&#8217;effetto dura per 5 minuti.',1,8,104,'personale',0),(104,'militare','PRESA FERMA','Il personaggio pu&#242; impugnare armi di categoria Fucile d&#8217;Assalto con una sola mano se nell&#8217;altra impugnauno Scudo.',1,8,102,'personale',0),(105,'militare','TESTA DURA','Il personaggio pu&#242;, subendo BRUCIACARICA!, dichiarare IMMUNE! alla chiamata SHOCK!',1,8,NULL,'personale',1),(106,'militare','SCARICA D&#8217;ADRENALINA','Il personaggio quando entra in stato di COMA pu&#242;, se ha almeno 1 batteria carica e simulando un &#8220;urlobelluino&#8221; (o altro effetto scenografico simile ad alto tasso di testosterone), subire BLOCCO! Tempo 1 ora!alla batteria e subire BONUS X ai punti ferita e RIPARAZIONE X allo Shield, dove X &#232; il massimale delpersonaggio.',1,8,-1,'personale',1),(107,'militare','FARSI SCUDO','Se il personaggio impugna un Mitragliatore Pesante pu&#242; dichiarare IMMUNE! ad un colpo subito mal&#8217;arma subisce l&#8217;effetto BLOCCO! Eccezioni sono le chiamate DISINTEGRAZIONE! (applicata comunque albersaglio) e MUTILAZIONE! che infligge all&#8217;arma che la subisce la chiamata DISINTEGRAZIONE! Invecedi BLOCCO!.',1,9,NULL,'personale',0),(108,'militare','ADDESTRAMENTO FISICO II','I Punti ferita del personaggio aumentano permanentemente di 2 (questa abilit&#224; sostituisceADDESTRAMENTO FISICO I).',1,9,96,'personale',0),(109,'militare','DIFENDERE GLI ALTRI','Il personaggio pu&#242; dichiarare IMMUNE! ad una chiamata subita da una persona entro 1 metro da lui,subendo la chiamata al suo posto.',1,9,NULL,'1 metro',0),(110,'militare','INARRESTABILE','Se il personaggio ha almeno 1 carica pu&#242; dichiarare IMMUNE! a una qualsiasi delle seguenti chiamate:PARALISI! &#8211; CONFUSIONE! &#8211; SHOCK! &#8211; DISARMO! &#8211; SPINTA!, subendo BRUCIACARICA!.',1,9,111,'personale',1),(111,'militare','E&#8217; SOLO UN GRAFFIETTO','Il personaggio pu&#242; dichiarare IMMUNE! alla chiamata DOLORE!',1,9,NULL,'personale',0),(112,'militare','BUNKER SEMOVENTE','Il personaggio utilizzando un&#8217;arma di classe Mitragliatore Pesante pu&#242;, se appostato dietro un riparo,camminare per un massimo di 10 metri fino a posizionarsi dietro un altro riparo contando come se fossestazionario e appostato ai fini del prerequisito &#8220;Posizionamento&#8221; per questa classe d&#8217;arma.(N.B. in parole povere puoi camminare e sparare con un mitragliatore pesante.)',1,9,110,'personale',0),(113,'militare','TEMPESTA DI METALLO','Il personaggio, se sta usando un&#8217;arma di classe Mitragliatore Pesante per sparare, pu&#242; dichiarare lachiamata base dell&#8217;arma aggiungendo IN QUEST&#8217;AREA! Al costo di 1 carica.',1,9,NULL,'Area 10 metri',0),(114,'militare','FUOCO DIFENSIVO','Il personaggio se sta usando un&#8217;arma di classe Mitragliatore pesante, dopo aver sparatoininterrottamente sullo stesso bersaglio ostile per 10 secondi, subisce BONUS! + 4 PUNTI SHIELD!(N.b. Non &#232; possibile cambiare bersaglio, ma &#232; possibile sospendere il conteggio per cambiarecaricatore, riprendendo quindi a sparare sullo stesso bersaglio)',1,9,113,'personale',0),(115,'militare','RICARICA SCUDO D&#8217;EMERGENZA','Quando il personaggio arriva a 0 punti Shield pu&#242;, subendo BRUCIACARICA!, utilizzare la chiamataRIPARAZIONE X! sullo Shield (dove X &#232; pari al suo valore permanente di punti Shield). Deve averealmeno 2 cariche attive per poter usare questa abilit&#224;.',1,9,95,'personale',1),(116,'militare','FEEL NO PAIN','Il personaggio se subisce la chiamata MUTILAZIONE! ad un arto ignora la chiamata ARTEFATTO COMA!associata.',1,9,111,'personale',0),(117,'militare','MEGLIO UN PEZZO, CHE A PEZZI','Il personaggio pu&#242; dichiarare IMMUNE! a una qualsiasi chiamata di danno tra A ZERO!, COMA! , CREPA!Subita da un compagno entro 1m di distanza subendo lui ARTEFATTO MUTILAZIONE! ad una sualocazione non attualmente soggetta a MUTILAZIONE!.',1,9,109,'1 metro',0),(118,'militare','FORTEZZA DELLA SOLITUDINE','Il massimale base del valore di Shield del personaggio non &#232; mai inferiore a 3 punti quando indossa unesoscheletro pesante,',1,9,NULL,NULL,0),(119,'militare','INTERFACCE PROTESICHE AVANZATE','Il personaggio se viene colpito ad una locazione sintetica dalle chiamate COMA! o CREPA! pu&#242;, subendoBLOCCO! alla batteria ed alla protesi interessata dal colpo, declassare la chiamata COMA! adARTEFATTO! A ZERO! oppure pu&#242; declassare la chiamata CREPA! ad ARTEFATTO! MUTILAZIONE!.(NOTA: le chiamate sostitutive si ritengono da applicarsi SEMPRE alla locazione originale dell&#8217;impatto,non possono essere deviate o rilocate su un&#8217;altra parte del corpo o su un altro bersaglio.)',1,9,116,'personale',0),(120,'militare','ULTIMA PAROLA','Il personaggio, dopo aver subito la chiamata CREPA! (non &#232; sufficiente entrare in status Morto perconteggio) pu&#242; rialzarsi per 1 minuto e si considera avere 50 Punti Ferita alocazionali, durante questoperiodo non pu&#242; utilizzare nessuna delle sue abilit&#224; a cariche, il suo Shield &#232; considerato spento. Subiscetutte le chiamate di danno fino a QUADRUPLO come 1 singolo danno, le altre chiamate come 5 dannieccetto il crepa. Passato il minuto o esauriti i Punti Ferita subisce la chiamata ARTEFATTO CREPA!',1,9,NULL,'personale',0),(121,'militare','YIPPIE KAY YAY','Il personaggio dopo avere subito per almeno 10 secondi la chiamata DOLORE (senza quindi averdichiarato IMMUNE o aver subito NEUTRALIZZA) pu&#242; alzare di due la prossima chiamata di dannosecondo la normale scala, fino ad A ZERO!',1,9,NULL,'personale',0),(122,'militare','LAST MAN STANDING','Il personaggio, bruciando tutte le sue cariche attive (con un minimo di 2), per 1 minuto pu&#242; dichiarareIMMUNE! a PARALISI! &#8211; PAURA! - CONFUSIONE! &#8211; SHOCK! &#8211; DISARMO! &#8211; DOLORE!, i suoi punti Shieldvengono raddoppiati, i suoi Punti Ferita vengono raddoppiati. Passato il minuto il personaggio subisceARTEFATTO COMA!; una volta curato, subisce tutte le chiamate di status per il doppio del tempo, le sueCariche sono considerate dimezzate (arrotondato per difetto) e i suoi punti ferita sono dimezzati(arrotondati per difetto) fino alla fine della giornata di gioco. Nota: se un personaggio con questi malusarriva ad avere Punti Ferita pari o inferiori a 0 (NOTA: calcolo effettuato in base ai punti standard, nonquelli temporanei dovuti all&#8217;abilit&#224;) il personaggio si considera aver avuto un collasso multiorgano esubisce immediatamente la chiamata ARTEFATTO CREPA!',1,9,-1,'personale',1),(123,'militare','BATTERIA AUMENTATA','Il punteggio della batteria &#232; aumentato di 1 Carica.',1,10,NULL,NULL,0),(124,'militare','ESOSCHELETRO LEGGERO MK2','Il punteggio di Shield garantito dall&#8217;esoscheletro equipaggiato aumenta di +1, se il personaggio haalmeno un punto Shield Base.',1,10,NULL,NULL,0),(125,'militare','PISTOLERO','Il personaggio se combatte impugnando contemporaneamente due armi di classe Pistola pu&#242;, al costo di1 carica sostituire il danno base dell&#8217;arma con la chiamata SINGOLO! CONFUSIONE! Al prossimo colpo(o solo CONFUSIONE! Nel caso il danno base dell&#8217;arma fosse gi&#224; SINGOLO!).',1,10,NULL,'personale',0),(126,'militare','HOTSHOT','Il personaggio utilizza tutte le sue Cariche per sovraccaricare la pistola sparando un colpo molto pi&#249;potente.Il personaggio pu&#242;, subendo BRUCIACARICA, aumentare di +2 il danno del suo prossimo colpo ( fino aCOMA! compreso). L&#8217;abilit&#224; &#232; utilizzabile solo con pistole ad energia, ed il personaggio deve avere averealmeno 2 cariche attive per poter utilizzare questa abilit&#224;. Dopo aver sparato, l&#8217;arma subisce la chiamataBLOCCO.',1,10,125,NULL,0),(127,'militare','AMBIDESTRIA','Il personaggio pu&#242; impugnare un&#8217;arma a una mano (pistola, coltello, arma da mischia) per mano outilizzare l&#8217;arma con la mano secondaria.',1,10,NULL,'personale',0),(128,'militare','ADDESTRAMENTO FISICO','I Punti Ferita del personaggio aumentano permanentemente di 1.',1,10,NULL,'personale',0),(129,'militare','TIRATORE SCELTO','Il personaggio con le armi di classe Fucile di Precisione pu&#242; aumentare di +1 il danno del prossimo colpoal costo di 1 Carica. La carica viene spesa anche se il colpo manca il bersaglio.(NOTA: i potenziamenti seguono la seguente scala SINGOLO! &#8211; DOPPIO! &#8211; TRIPLO! &#8211; QUADRUPLO! &#8211;CRASH! &#8211; A ZERO!)',1,10,NULL,'personale',0),(130,'militare','NON A ME, A LUI!','Il personaggio, se subisce PAURA! Pu&#242; considerare qualunque personaggio cosciente e consenzientecome riparo fisso per gli effetti della chiamata.',1,10,NULL,'personale',0),(131,'militare','COLPO PERFORANTE','Il personaggio se spara con un Fucile di Precisione pu&#242; dichiarare CRASH!. Il costo &#232; di 1 Carica percolpo sparato. Non &#232; possibile utilizzare altre abilit&#224; in congiunzione con questa.',1,10,137,'personale',0),(132,'militare','BRACCIA ROBUSTE','Il Personaggio pu&#242; sparare con Shotgun e Fucili d&#8217;Assalto impugnandoli con una sola mano.',1,10,128,'personale',0),(133,'militare','PROIETTILI INCENDIARI','Il personaggio, se utilizza un Fucile di Precisione, pu&#242; aggiungere la chiamata FUOCO! al prossimo colpo,al costo di una Carica.',1,10,NULL,'personale',0),(134,'militare','FUOCO A TERRA','Al costo di 1 carica, il personaggio pu&#242; dichiarare per il prossimo colpo SPINTA X! al posto del dannodell&#8217;arma, dove X corrisponde al danno causato (se il danno &#232; superiore a QUADRUPLO! X assume comevalore 7) con Shotgun e con Fucili di Precisione.',1,10,NULL,'personale',0),(135,'militare','COLPO NON LETALE','Il personaggio pu&#242; utilizzare la chiamata SHOCK! sparando con uno Shotgun, al costo di 2 Cariche percolpo sparato.',1,10,NULL,'personale',0),(136,'militare','DISARMARE','Il personaggio pu&#242; sostituire il danno con la chiamata DISARMO! al costo di 1 Carica ogni colpo, conogni arma da fuoco nella quale &#232; competente.',1,10,NULL,'personale',0),(137,'militare','MIRARE','Il personaggio quando equipaggiato con un Fucile di Precisione pu&#242; dichiarare il prossimo colpo a dito suun bersaglio entro i 10 metri dopo aver simulato di mirare il suo obiettivo per 10 secondi e utilizzando 1Carica. E&#39; possibile utilizzare questa abilit&#224; insieme ad altre, pagandone il rispettivo costo.',1,10,-2,'10 metri',0),(138,'militare','COLPO SANGUINANTE','Il personaggio pu&#242; abbinare l&#8217;effetto CONTINUO! al prossimo colpo. Pu&#242; sommare eventuali altre abilit&#224;,pagandone i relativi costi. Deve avere almeno una carica libera per attivare questa abilit&#224;, subendoBRUCIACARICA!',1,10,-1,'personale',1),(139,'militare','ARMA SELEZIONATA','Il personaggio deve scegliere un&#8217;arma da fuoco tra quelle in cui &#232; addestrato. Pu&#242; aumentare di 1 ildanno fatto con l&#8217;arma prescelta secondo la scala SINGOLO! &#8211; DOPPIO! &#8211; TRIPLO! &#8211; QUADRUPLO! &#8211;CRASH! &#8211; A ZERO!.(NOTA: bonus sommabile a qualunque altro eventuale bonus disponibile per il giocatore con quellaclasse d&#8217;arma.)',1,11,NULL,'personale',0),(140,'militare','PISTOLA &#38; COLTELLO','Se il personaggio impugna un&#8217;Arma corta e una Pistola, pu&#242; bruciando una carica dichiarareCONFUSIONE! con l&#8217;arma da mischia ed aumentare di 1 le chiamate di danno effettuate con la pistola sespara sul bersaglio confuso.(NOTA: i potenziamenti seguono la seguente scala SINGOLO! &#8211; DOPPIO! &#8211; TRIPLO! &#8211; QUADRUPLO! &#8211;CRASH! &#8211; A ZERO!)',1,11,NULL,'personale',0),(141,'militare','GESTIONE TATTICA','Fino a quando il personaggio ha lo Shield ridotto a zero aumenta di 1 le chiamate fatte con le Armi damischia.',1,11,NULL,'personale',0),(142,'militare','SCARICA ACCECANTE','Il personaggio subendo BRUCIACARICA! (deve avere almeno 1 carica attiva per poter utilizzare questaabilit&#224;) pu&#242; sparando con uno Shotgun dichiarare CONFUSIONE! IN QUEST&#8217;AREA 3!.(NOTA: l&#8217;angolo formato dalle braccia per determinare l&#8217;area d&#8217;effetto DEVE essere 90&#176;.)',1,11,135,'3 metri',1),(143,'militare','GRANATE MODIFICATE','Il personaggio pu&#242; aggiungere la chiamata CONFUSIONE ! Alla prossima granate al costo di 2 Cariche.',1,11,NULL,'personale',0),(144,'militare','BOMBE GEMELLE','Il personaggio pu&#242; attaccare il cartellino Granata a una Granata che ne sia gi&#224; fornita purch&#233; i cartellinidelle due Granate siano identici, aumentando di 1 il danno base e aggiungendo +1 al raggio .',1,11,NULL,'personale',0),(145,'militare','MIRA VELOCE','Il personaggio riduce il tempo necessario per l&#39;abilit&#224; MIRARE a 5 secondi.',1,11,137,'personale',0),(146,'militare','I MORTI NON PARLANO','Se il personaggio ha subito almeno una ferita (Punti Ferita ridotti di almeno 1 punto a causa di danni)alla locazione vitale, pu&#242; fingersi morto, e subendo CRASH! e BLOCCO! allo Shield per 5 minuti. Seanalizzato dichiara il suo status come CREPA!; tuttavia, se subisce una chiamata di danno, deve reagiremuovendosi e rivelandosi.',1,11,150,'personale',1),(147,'militare','COLPO DI MANO','Il personaggio pu&#242; dichiarare DISARMO! Utilizzando armi da mischia al costo di 1 Carica.',1,11,NULL,'personale',0),(148,'militare','APRISCATOLA','Il personaggio pu&#242; aggiungere il descrittore DIRETTO! al prossimo colpo che sferrer&#224; con un arma damischia al costo di 1 Carica.',1,11,151,'personale',0),(149,'militare','BOMBA ADESIVA','Il personaggio pu&#242;, colpendo con una granata direttamente un Bersaglio, dichiarare la normale chiamatadella granata, escludendo &#8220;GRANATA! &#8220; e &#8220; RAGGIO X&#8221; al costo di 1 Carica. Se manchi la granata &#232;sprecata e non &#232; possibile dichiarare.',1,11,NULL,'personale',0),(150,'militare','MOVIMENTO OCCULTATO','Il personaggio &#232; equipaggiato e addestrato all&#8217;utilizzo di rifrattori ottici che gli permettono di restareinvisibile per poco tempo. Il personaggio subisce ATTENUAZIONE! per 10 secondi consumando 1 carica.Tra un uso e il seguente di questa abilit&#224; devono trascorrere almeno 5 secondi.',1,11,141,'personale',0),(151,'militare','TEMPESTA DI LAME','Il personaggio &#232; un maestro nell&#8217;uso di due lame in combattimento. Se impugna contemporaneamente 2armi da mischia pu&#242; aggiungere + 1 alle chiamate di danno fino ad A ZERO! (inclusa).',1,11,127,'personale',0),(152,'militare','BOMBA IN BUCA','Il personaggio ha affinato il suo istinto di sopravvivenza. Il personaggio prima di essere colpito daglieffetti di GRANATA! pu&#242; dichiarare IMMUNE! al costo di 2 Cariche.',1,11,NULL,'personale',0),(153,'militare','RESISTERE ALLA PAURA','Il personaggio pu&#242; dichiarare IMMUNE! Alla chiamata PAURA! al costo di 1 Carica.',1,11,146,'personale',0),(154,'militare','GLORIA O MORTE','Il personaggio pu&#242;, se ha almeno 2 cariche attive e dopo aver subito BRUCIACARICA!, attivare questaabilit&#224; urlando &#8220;GLORIA O MORTE!&#8221;.Da questo momento si considera avere punti ferita alocazionali pari ai suoi punti ferita attuali allalocazione vitale x 10 (massimo 40), considera tutte le chiamate di danno come ARTEFATTO! TRIPLO! adeccezione di CREPA! DISINTEGRAZIONE! E MUTILAZIONE! che subisce normalmente.Il suo Shield, se presente, funziona normalmente.Il personaggio deve lanciarsi in combattimento in mischia contro il pi&#249; vicino bersaglio ostile.Se tutti i bersagli ostili in vista sono morti prima di aver concluso i punti ferita il personaggio sviene esubisce ARTEFATTO COMA!; tuttavia, se viene abbattuto prima di aver terminato i bersagli ostili subisceARTEFATTO! CREPA!Ogni volta che utilizza questa abilit&#224; riduce il suo massimale di punti ferita di 1 per tuttol&#39;evento.',1,11,-1,'personale',1),(155,'militare','BATTERIA AUMENTATA','Il punteggio delle Cariche della Batteria &#232; aumentato permanentemente di 1 unit&#224;.',1,12,NULL,'personale',0),(156,'militare','BATTERIA AUMENTATA 2','Il punteggio delle Cariche della Batteria &#232; aumentato permanentemente di 2 unit&#224; (il suo effetto va asostituire il potenziamento dato da BATTERIA AUMENTATA).',1,12,155,'personale',0),(157,'militare','ESOSCHELETRO PESANTE MK2','Il punteggio di Shield garantito dall&#8217;esoscheletro equipaggiato aumenta di +2, se il personaggio haalmeno un punto Shield Base.',1,12,NULL,'personale',0),(158,'militare','SHIELD MK2','Se il personaggio ha almeno un Punto Shield base, guadagna +2 punti al suo valore globale.',1,12,NULL,'personale',0),(159,'militare','CONTROLLO DELLO STRESS SUL CAMPO','Il personaggio, se ha almeno 1 carica attiva e subendo BRUCIACARICA!, pu&#242; dichiarare NEUTRALIZZA!(Effetto a scelta tra DOLORE! &#8211; SHOCK! &#8211; CONFUSIONE!) su un numero di bersagli pari al suomassimale di Carica della batteria.',1,12,NULL,'10 metri',1),(160,'militare','INTERVENTO D&#8217;EMERGENZA','Il personaggio pu&#242; dichiarare, al costo di 3 cariche, GUARIGIONE 1! su un bersaglio in stato di comadopo 1 minuto di interazione.',1,12,NULL,'tocco',0),(161,'militare','SMUOVERE','Il personaggio pu&#242;, al costo di 1 cariche batteria per utilizzo, dichiarare NEUTRALIZZA CONFUSIONE!Oppure NEUTRALIZZA DOLORE!. Deve poter toccare il bersaglio per poter effettuare la chiamata.',1,12,NULL,'tocco',0),(162,'militare','MEDIPACK &#8211; PRIME CURE','Il personaggio pu&#242; dichiarare BONUS! +X PUNTO FERITA! (dove X &#232; il doppio delle cariche che utilizza),ad un bersaglio che sta toccando.',1,12,NULL,'tocco',0),(163,'militare','MEDIPACK - ANTIDOLORIFICI AD AMPIO SPETTRO','Il valore di BONUS! + X PUNTI FERITA! del Medipack &#232; aumentato permanentemente di 1.',1,12,162,'personale',0),(164,'militare','MEDIPACK - NANOCHIRURGHI INTEGRATI','Il personaggio pu&#242;, al costo di 2 cariche, dichiarare NEUTRALIZZA! MUTILAZIONE! Dopo 10 secondi albersaglio toccato.(N.b. La locazione non ricresce miracolosamente: il bersaglio per&#242; potr&#224; essere guarito anche senecessita comunque di un innesto se vuole tornare ad usare la locazione colpita da mutilazione)',1,12,162,'tocco',0),(165,'militare','SOCCORRITORE DI LINEA','Il personaggio se impugna solo una pistola pu&#242; aumentare di 1 il danno fatto secondo la scalaSINGOLO! &#8211; DOPPIO! &#8211; TRIPLO! &#8211; QUADRUPLO! &#8211; CRASH! &#8211; A ZERO!.(NOTA: il bonus &#232; sommabile a qualunque altro bonus disponibile per il giocatore con le pistole.)',1,12,-3,'personale',0),(166,'militare','CONTROLLER &#8211; MODIFICA FIRMWARE GESTIONE BATTERIA.','Il personaggio pu&#242; dichiarare BONUS! BATTERIA +1!Tempo hacking: 10 secondi.Costo in Cariche Batteria: 1',1,12,NULL,'10 metri',0),(167,'militare','CONTROLLER &#8211; REINIZIALIZZAZIONE DISPOSITIVI ELETTRONICI.','Il personaggio pu&#242; dichiarare NEUTRALIZZA! BLOCCO! su un qualunque impianto cibernetico (arto olocazione vitale) che sta toccando.Tempo hacking: 10 secondi.Costo in Cariche Batteria: 1',1,12,NULL,'tocco',0),(168,'militare','CONTROLLER &#8211; MODIFICA FREQUENZA SHIELD','Il personaggio pu&#242; dichiarare BONUS! +X SHIELD! su un bersaglio equipaggiato con uno Shield, dove X&#232; pari al numero di cariche spese in fase di attivazione.Tempo hacking: 10 secondi.Costo in Cariche Batteria: 1 + X per punto Shield ripristinato.',1,12,NULL,'10 metri',0),(169,'militare','CONTROLLER &#8211; MIGLIORAMENTO FIRMWARE INNESTI.','Il personaggio pu&#242; dichiarare BONUS! DIFESA MENTALE +1!Tempo hacking: 10 secondi.Costo in Cariche Batteria: 1',1,12,NULL,'10 metri',0),(170,'militare','CONTROLLER &#8211; CAMPO DIFENSIVO','Il Personaggio pu&#242; dichiarare BONUS! SHIELD +X! (dove X &#232; il punteggio di Shield del personaggio)RAGGIO 10!.Tempo hacking: 10 secondi.Costo in Cariche Batteria: 2.Al termine, il personaggio subisce BLOCCO! CONTINUO! TEMPO 1 ORA! al proprio Controller.',1,12,-1,'Raggio 10 metri',0),(171,'militare','PROTEZIONE FIRMWARE AVANZATA','Il personaggio aumenta permanentemente di 1 il suo punteggio di Difesa Mentale.',1,13,NULL,'personale',0),(172,'militare','SCHERMATURA CEREBRALE','Il personaggio aumenta permanentemente di 2 il suo punteggio di Difesa Mentale (quest&#8217;abilit&#224; va asostituire &#8220;Protezione Firmware Avanzata&#8221;).',1,13,171,'personale',0),(173,'militare','ESOSCHELETRO PESANTE &#8220;REDENTORE&#8221;','Il personaggio se equipaggiato con un esoscheletro pesante aumenta di 2 punti lo Shield ottenuto dalsuddetto esoscheletro. Se il personaggio entra in status di Coma pu&#242;, subendo BLOCCO! allo Shield,subire BONUS! +X PUNTI FERITA! (dove X &#232; pari ai punti ferita massimi del personaggio).',1,13,NULL,'personale',0),(174,'militare','ANGELO CUSTODE','Il personaggio, quando equipaggiato con uno Scudo, pu&#242; dichiarare IMMUNE! Ad una chiamata di dannosu un bersaglio entro 1 metro da lui e subire la chiamata sullo Scudo, al costo di 1 carica.',1,13,NULL,'1 metro',0),(175,'militare','NON FA MALE! NON FA MALE!','Il personaggio quando armato con un fucile d&#8217;assalto pu&#242;, dopo aver mirato un bersaglio per 10 secondi,utilizzare l&#8217;effetto DOLORE! In sostituzione al normale danno portato dal prossimo colpo.',1,13,NULL,'personale',0),(176,'militare','CONTROLLER - STIMOLANTI DA BATTAGLIA','Il personaggio pu&#242; dichiarare BONUS! DANNI +1!Tempo hacking: 10 secondi.Costo in Cariche Batteria: 2',1,13,NULL,'10 metri',0),(177,'militare','MEDICO DA BATTAGLIA','Il personaggio mentre &#232; impegnato a prestare soccorso non pu&#242; essere distratto da nessuno stimoloinferiore ad una lesione fisica. Mentre sta utilizzando il Medipack per curare un bersaglio pu&#242;,spendendo ogni volta 1 Carica, dichiarare IMMUNE! Ai seguenti effetti: DOLORE! - PARALISI! &#8211;CONFUSIONE! &#8211; SHOCK! &#8211; DISARMO! &#8211; SPINTA!',1,13,178,'personale',0),(178,'militare','MENTE RAZIONALE','Il personaggio pu&#242; dichiarare IMMUNE! alla chiamata PAURA! spendendo 1 Carica su se stesso oNEUTRALIZZA PAURA! toccando un altro bersaglio.',1,13,NULL,'personale/tocco',0),(179,'militare','DEVIARE ENERGIA','Il personaggio pu&#242; convertire 3 dei suoi Punti Shield in una Cariche Batteria e viceversa.',1,13,173,'personale',0),(180,'militare','CONTROLLER &#8211; TRASFERIMENTO ENERGETICO','Il personaggio pu&#242; dichiarare BONUS! X SHIELD! (dove X sono i suoi punti Shield che vuole trasferire).Tempo hacking: 10 secondi.Costo: 1 Carica + X Punti Shield (corrisponde alle cariche o ai punti shield da trasferire).',1,13,NULL,'personale',0),(181,'militare','CONTROLLER &#8211; POTENZIAMENTO NANORIPARATORI.','Il personaggio pu&#242; dichiarare BONUS! +5 SHIELD! E BONUS! IMMUNE a CRASH! su un qualunquebersaglio equipaggiato con un esoscheletro.Tempo hacking: 10 secondi.Costo in Cariche Batteria: 3.',1,13,NULL,'10 metri',0),(182,'militare','BATTERIA AVANZATA','Il personaggio aumenta di un ulteriore +1 il suo valore di batteria.',1,13,NULL,'personale',0),(183,'militare','MEDIPACK &#8211; VETTORE CURATIVO AEREODISPERSO','Il personaggio pu&#242;, dopo 10 secondi di utilizzo del Medipack, dichiarare BONUS! +2 PUNTO FERITA!RAGGIO 10!. Subisce quindi la dichiarazione BLOCCO! CONTINUO! TEMPO 5 MINUTI! al Medipack.',1,13,NULL,'Raggio 10 metri',0),(184,'militare','MEDIPACK &#8211; INTERFACCIA BIOMECCANICA DI MANUTENZIONE E CURA','Il personaggio pu&#242; dichiarare BONUS! +2 PUNTO FERITA! e RIPARAZIONE 2! ad un bersaglio.Tempo hacking: 10 secondi.Costo in Cariche Batteria: 2',1,13,NULL,'tocco',0),(185,'militare','MEDIPACK &#8211; DISPOSITIVO DI CURA AUTOMATICO D&#8217;EMERGENZA','Il personaggio, se cade in stato di Coma, pu&#242; prima di cadere dichiarare BONUS! +1 PUNTO FERITA!Raggio 10!. E subire BLOCCO! Al Medipack.',1,13,NULL,'personale',0),(186,'militare','INGANNO DELLA NERA SIGNORA','Il personaggio pu&#242; sostituire il danno della sua arma con la chiamata BONUS! + X PUNTI FERITA!VELENO!BONUS! + X PUNTI FERITA! Dove X &#232; il danno che avrebbe causato, con un massimale di 4.',1,13,-1,'personale',0),(187,'militare','BATTERIA AUMENTATA','Il punteggio delle Cariche Batteria aumenta di + 1.',1,14,NULL,'personale',0),(188,'militare','BATTERIA AUMENTATA 2','Il punteggio delle Cariche Batteria aumenta di +2. (sostituisce il bonus di Batteria Aumentata)',1,14,187,'personale',0),(189,'militare','ESOSCHELETRO LEGGERO MK2','Il punteggio di Shield garantito dall&#8217;esoscheletro equipaggiato aumenta di +1, se il personaggio haalmeno un punto Shield Base.',1,14,NULL,'personale',0),(190,'militare','SHIELD MK 2','Se il personaggio ha almeno un Punto Shield base, guadagna +2 punti al suo valore globale.',1,14,NULL,'personale',0),(191,'militare','TEMPESTA DI PIOMBO','Il personaggio pu&#242;, al costo di 2 cariche, aggiungere PAURA! al prossimo colpo sparato con unmitragliatore pesante.',1,14,NULL,'10 metri',0),(192,'militare','PERFEZIONAMENTO TATTICHE DI INTRUSIONE','Il personaggio ha + 1 permanente alle sue dichiarazioni di hacking.',1,14,193,'personale',0),(193,'militare','BRUTE FORCE','Il personaggio pu&#242; ripetere il lancio di un programma di hacking senza pagare nuovamente il costo inbatteria: per ogni lancio cos&#236; effettuato pu&#242; aumentare di + 1 il valore di lancio del programma, fino aquando tutti i bersagli non hanno subito la chiamata lanciata.Se un bersaglio dichiara immune a ELETTRO! L&#39;abilit&#224; si interrompe immediatamente.(Esempio: Thug Sta lanciando il potere di distrazione su Erebron. Attende 10 secondi e poi dichiara&#8220;ELETTRO!CONFUSIONE! DIFESA 1!&#8221; ad Erebron, il quale dichiara IMMUNE! e prosegue in quello che stafacendo. Thug continua il conteggio dei 10 secondi successivi, per poi dichiarare&#8220;ELETTRO!CONFUSIONE! DIFESA 2!&#8221; ad Erebron, il quale risponde ancora IMMUNE! e prosegue nelle sueazioni. Thug continua il conteggio dei 10 secondi successivi, per poi dichiarare &#8220;ELETTRO!CONFUSIONE!DIFESA 3!&#8221; ad Erebron, il quale questa volta subisce la chiamata. Thug paga il costo in batteria, e potr&#224;fare nuove azioni.)',1,14,-4,'personale',0),(194,'militare','FARSI SCUDO','Se il personaggio impugna un Mitragliatore Pesante pu&#242; dichiarare IMMUNE! ad un colpo subito mal&#8217;arma subisce BLOCCO! eccezione fatta per la chiamata DISINTEGRAZIONE! Che viene comunquesubita, o MUTILAZIONE ! che pu&#242; essere parata in questo modo ma l&#8217;arma subisce la chiamataDISINTEGRAZIONE!.',1,14,NULL,'personale',0),(195,'militare','CONTROLLER &#8211; DISTRAZIONE','Il personaggio pu&#242; dichiarare ELETTRO 1! CONFUSIONE!Tempo hacking: 10 secondi.Costo in Cariche Batteria: 1',1,14,NULL,'10 metri',0),(196,'militare','CONTROLLER &#8211; DISARMARE','Il personaggio pu&#242; dichiarare ELETTRO 1! DISARMO !Tempo hacking: 10 secondi.Costo in Cariche Batteria:1',1,14,NULL,'10 metri',0),(197,'militare','CONTROLLER &#8211; DOLORE','Il personaggio pu&#242; dichiarare ELETTRO 1! DOLORE !Tempo hacking: 10 secondi.Costo in Cariche Batteria: 1',1,14,NULL,'10 metri',0),(198,'militare','CONTROLLER &#8211; ROTTURA','Il personaggio pu&#242; dichiarare ELETTRO 1! CRASH! Shield.Tempo hacking: 10 secondi.Costo in Cariche Batteria: 1(N.b. Questa abilit&#224; ha effetto solo sullo shield)',1,14,NULL,'10 metri',0),(199,'militare','CONTROLLER &#8211; BLOCCO','Il personaggio pu&#242; dichiarare ELETTRO 1! BLOCCO!Tempo hacking: 10 secondi.Costo in Cariche Batteria: 2',1,14,NULL,'10 metri',0),(200,'militare','CONTROLLER &#8211; PARALISI','Il personaggio pu&#242; dichiarare ELETTRO 1! PARALISI !Tempo hacking : 10 secondi.Costo in Cariche Batteria:1',1,14,NULL,'10 metri',0),(201,'militare','SCHERMATURA CEREBRALE','Il valore di Difesa mentale del personaggio aumenta di +1.',1,14,NULL,'personale',0),(202,'militare','HACKING AD AREA','Il personaggio pu&#242; usare una qualsiasi abilit&#224; del Controller spendendo 20 Secondi + il tempo previstodal Programma selezionato, modificando l&#8217;estensione a IN QUEST&#8217;AREA! e subendo quindiBRUCIACARICA!, CRASH! e BLOCCO! CONTINUO! TEMPO 5 MINUTI! allo Shield.(NOTA: l&#8217;angolo formato dalle braccia per determinare l&#8217;area d&#8217;effetto DEVE essere massimo 90&#176;.)',1,14,-1,'personale',1),(203,'militare','BATTERIA AVANZATA','Il personaggio aumenta di un ulteriore +1 il suo valore di batteria.',1,15,NULL,'personale',0),(204,'militare','AMPLIFICAZIONE DELL&#8217;AREA','Il personaggio quando usa una granata pu&#242; aumentare di +2 i metri del raggio della granata.',1,15,NULL,'personale',0),(205,'militare','SCHERMATURA CEREBRALE AVANZATA','Il valore di Difesa del personaggio aumenta di +2. (Sostituisce il bonus dato da Schermatura avanzata)',1,15,172,'personale',0),(206,'militare','CONTROLLER &#8211; SOVRACCARICO ELETTROMAGNETICO','Il personaggio pu&#242; dichiarare ELETTRO 1! TRIPLO! TRIPLO! TRIPLO!Tempo hacking : 10 secondi.Costo in Cariche Batteria: 3(N.B. Non pu&#242; mai essere utilizzata con Hacking ad area)',1,15,NULL,'10 Metri',0),(207,'militare','CONTROLLER &#8211; SMORZAMENTO NEURALE','Il personaggio pu&#242; dichiarare ELETTRO 1! BONUS! MENO 1 DANNI!Tempo hacking : 10 secondi.Costo in Cariche Batteria: 2',1,15,NULL,'10 metri',0),(208,'militare','GRANATA CONGELANTE','Il personaggio pu&#242; aggiungere la chiamata GELO! Al prossimo colpo con il lanciagranate, al costo di 2cariche.',1,15,204,'personale',0),(209,'militare','FUOCO DI COPERTURA','Il personaggio pu&#242;, al costo di 2 cariche, dichiarare PAURA! IN QUEST&#39;AREA! Se impugna unmitragliatore pesante e sta gi&#224; sparando nella stessa direzione. Il personaggio dovr&#224; continuare asparare nella direzione generica in cui ha effettuato la dichiarazione, fermandosi solo quando avr&#224;terminato il caricatore o sar&#224; in qualche modo incapacitato.(NOTA: l&#8217;angolo formato dalle braccia per determinare l&#8217;area d&#8217;effetto DEVE essere massimo 90&#176;.)',1,15,NULL,'personale',0),(210,'militare','COLPO DI SPONDA','Dopo aver sparato un colpo con il lanciagranate, se il colpo non ha colpito nessuno, il personaggio potr&#224;dichiarare a dito, ad un bersaglio entro 1 metro da dove &#232; caduto il colpo a vuoto, il danno del suolanciagranate scalato di uno secondo la normale scala.',1,15,208,'personale',0),(211,'militare','CONFETTONE','Il personaggio pu&#242;, strappando il cartellino di una granata da lancio, effettuare la stessa chiamata(senza dichiarare GRANATA! RAGGIO X!) con il prossimo colpo che sparer&#224; con il lanciagranate, al costodi 1 carica.',1,15,208,'personale',0),(212,'militare','CONTROLLER &#8211; ALTERARE PERCEZIONI','Il personaggio pu&#242; dichiarare ELETTRO 1! COMANDO! UCCIDILO!Tempo hacking : 10 secondi.Costo in Cariche Batteria: 2(N.B. Non pu&#242; essere utilizzata con Hacking ad area)',1,15,NULL,'10 Metri',0),(213,'militare','CONTROLLER &#8211; SVANIRE DALLA MENTE','Il personaggio pu&#242; dichiarare ELETTRO 1! COMANDO! IGNORAMI!Tempo hacking : 10 secondi.Costo in Cariche Batteria: 2',1,15,212,'10 Metri',0),(214,'militare','CONTROLLER &#8211; FOTOGRAFIA','Il personaggio pu&#242; dichiarare ELETTRO 1! PARALISI! TEMPO 1 Minuto!Tempo hacking : 10 secondi.Costo in Cariche Batteria: 3',1,15,213,'10 Metri',0),(215,'militare','CONTROLLER &#8211; BLOCCO TOTALE','Il personaggio pu&#242; dichiarare ELETTRO1! CRASH! BLOCCO!Tempo hacking : 10 secondi.Costo in Cariche Batteria: 2',1,15,NULL,'10 Metri',0),(216,'militare','CONTROLLER &#8211; CORTOCIRCUITO','Il personaggio pu&#242; dichiarare ELETTRO 1! BRUCIACARICA!Tempo hacking : 10 secondi.Costo in Cariche Batteria: 3',1,15,213,'10 Metri',0),(217,'militare','SATURARE L&#39;AREA','Il personaggio pu&#242;, al costo di 2 cariche, aggiungere la chiamata IN QUEST&#39;AREA! al danno base dellasua arma se impugna un mitragliatore pesante. Fino a quando continua a sparare, potr&#224; ripetere ladichiarazione IN QUEST&#39;AREA! Una volta ogni cinque secondi, senza un nuovo costo in cariche, fino aquando non si muover&#224; o non sia incapacitato.(NOTA: l&#8217;angolo formato dalle braccia per determinare l&#8217;area d&#8217;effetto DEVE essere massimo 90&#176;.)',1,15,209,'personale',0),(218,'militare','FRONT TOWARD ENEMY','Il personaggio pu&#242;, subendo la chiamata CRASH! Alla locazione vitale, strappare un cartellino granata efare la dichiarazione della granata sostituendo la chiamata GRANATA! RAGGIO X! con la chiamata INQUEST&#39;AREA!(NOTA: l&#8217;angolo formato dalle braccia per determinare l&#8217;area d&#8217;effetto DEVE obbligatoriamente esserecompreso tra 90&#176; e 180&#176;.)',1,15,-1,'personale',0);
/*!40000 ALTER TABLE `abilita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classi`
--

DROP TABLE IF EXISTS `classi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classi` (
  `id_classe` int(255) NOT NULL AUTO_INCREMENT,
  `tipo_classe` set('civile','militare') COLLATE utf8_unicode_ci NOT NULL,
  `nome_classe` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prerequisito_classe` int(255) DEFAULT NULL,
  PRIMARY KEY (`id_classe`),
  KEY `fk_classi_prerequisiti_idx` (`prerequisito_classe`),
  CONSTRAINT `fk_classi_prerequisiti` FOREIGN KEY (`prerequisito_classe`) REFERENCES `classi` (`id_classe`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classi`
--

LOCK TABLES `classi` WRITE;
/*!40000 ALTER TABLE `classi` DISABLE KEYS */;
INSERT INTO `classi` VALUES (1,'civile','Sportivo',NULL),(2,'civile','Giornalista',NULL),(3,'civile','Netrunner',NULL),(4,'civile','Tecnico',NULL),(5,'civile','Biomedico',NULL),(6,'civile','Guardia di Sicurezza',NULL),(7,'civile','Sciacallo',NULL),(8,'militare','Guardiano Base',NULL),(9,'militare','Guardiano Avanzata',8),(10,'militare','Assaltatore Base',NULL),(11,'militare','Assaltatore Avanzata',10),(12,'militare','Supporto Base',NULL),(13,'militare','Supporto Avanzata',12),(14,'militare','Guastatore Base',NULL),(15,'militare','Guastatore Avanzata',14);
/*!40000 ALTER TABLE `classi` ENABLE KEYS */;
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
  `costo_componente` int(255) NOT NULL,
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
  `email_giocatore` varchar(255) NOT NULL,
  `password_giocatore` varchar(255) NOT NULL,
  `nome_giocatore` varchar(255) NOT NULL,
  `cognome_giocatore` varchar(255) NOT NULL,
  `data_registrazione_giocatore` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `note_giocatore` text,
  `note_staff_giocatore` text,
  `ruoli_id_ruolo` int(255) NOT NULL DEFAULT '4',
  PRIMARY KEY (`email_giocatore`),
  KEY `fk_giocatori_ruoli1_idx` (`ruoli_id_ruolo`),
  CONSTRAINT `fk_giocatori_ruoli1` FOREIGN KEY (`ruoli_id_ruolo`) REFERENCES `ruoli` (`id_ruolo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giocatori`
--

LOCK TABLES `giocatori` WRITE;
/*!40000 ALTER TABLE `giocatori` DISABLE KEYS */;
INSERT INTO `giocatori` VALUES ('b-teo-90@libero.it','1e4e888ac66f8dd41e00c5a7ac36a32a9950d271','Matteo','Barbieri','2017-11-15 22:51:24',NULL,NULL,3),('ehi@la.it','f10e2821bbbea527ea02200352313bc059445190','Gna','Gnino','2017-11-26 20:24:53','',NULL,3),('miroku_87@yahoo.it','1e4e888ac66f8dd41e00c5a7ac36a32a9950d271','Andrea','Silvestri','2017-11-15 22:51:24',NULL,NULL,1),('porco.riccio@riccissimo.it','7bf5975c693842d9b73defe8a764f1a426944cce','Porco','Riccio','2017-11-15 22:52:14','sdfs',NULL,4);
/*!40000 ALTER TABLE `giocatori` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `reboot_live`.`giocatori_BEFORE_INSERT` BEFORE INSERT ON `giocatori` FOR EACH ROW
BEGIN
	IF 
		( SELECT COUNT(*) FROM giocatori WHERE email_giocatore = NEW.email_giocatore ) > 0
    THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Esiste gi&agrave; un giocatore con questa email. Per favore controllare.';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grants`
--

LOCK TABLES `grants` WRITE;
/*!40000 ALTER TABLE `grants` DISABLE KEYS */;
INSERT INTO `grants` VALUES (1,'mostraPersonaggi_proprio','L\'utente potrà visualizzare la pagina dei suoi personaggi.'),(2,'visualizza_pagina_componenti','L\'utente potrà visualizzare la pagina con la lista dei componenti.'),(3,'visualizza_pagina_ricette','L\'utente potrà visualizzare la pagina con la lista delle ricette.'),(4,'visualizza_pagina_gestione_eventi','L\'utente potrà visualizzare la pagina di gestione degli eventi.'),(5,'visualizza_pagina_eventi','L\'utente potrà visualizzare la pagina con la lista degli eventi.'),(6,'visualizza_pagina_giocatori','L\'utente potrà visualizzare la pagina con la lista dei giocatori iscritti.'),(7,'mostraPersonaggi_altri','L\'utente potrà visualizzare i personaggi creati dagli altri utenti.'),(8,'creaPG','L\'utente può creare un nuovo personaggio.'),(9,'modificaPG_background_personaggio_altri','L\'utente può modificare il background di un personaggio qualsiasi.'),(10,'cancellaPG_altri','L\'utente può eliminare definitivamente un qualsiasi personaggio dal database.'),(22,'aggiungiClassiAlPG_altri','L\'utente può assegnare nuove classi a personaggi non suoi.'),(23,'aggiungiAbilitaAlPG_altri','L\'utente può assegnare nuove abilità a personaggi non suoi.'),(24,'visualizza_pagina_main','L\'utente può visualizzare la pagina principale del sito.'),(25,'visualizza_pagina_lista_pg','L\'utente può visualizzare la pagina con la lista dei personaggi.'),(26,'visualizza_pagina_crea_pg','L\'utente può visualizzare la pagina per creare un personaggio.'),(27,'visualizza_pagina_scheda_pg','L\'utente può visualizzare la pagina con i dettagli di un personaggio.'),(28,'modificaBackground','L\'utente può modificare il background di un personaggio.'),(29,'visualizza_pagina_negozio_abilita','L\'utente può acquistare abilità'),(30,'modificaPG_background_personaggio_proprio','L\'utente può modificare il background di un proprio personaggio'),(31,'aggiungiClassiAlPG_proprio','L\'utente può assegnare nuove classi a un proprio personaggio.'),(32,'aggiungiAbilitaAlPG_proprio','L\'utente può assegnare nuove abilità a un proprio personaggio.'),(33,'cancellaPG_proprio','L\'utente può eliminare definitivamente un proprio personaggio dal database.'),(34,'rimuoviClassePG_altri','L\'utente può eliminare la classe di un personaggio non suo.'),(35,'rimuoviClassePG_proprio','L\'utente può eliminare la classe di un proprio personaggio.'),(36,'rimuoviAbilitaPG_altri','L\'utente può eliminare una abilità di un personaggio non suo.'),(37,'rimuoviAbilitaPG_proprio','L\'utente può eliminare una abilità di un proprio personaggio.'),(38,'loginPG_proprio','L\'utente può loggarsi con un proprio pg.'),(39,'loginPG_altri','L\'utente può loggarsi con il pg di altri utenti.'),(40,'recuperaStorico_proprio','L\'utente può guardare tutte le azioni compiute sul personaggio selezionato.'),(41,'recuperaStorico_altri','L\'utente può guardare tutte le azioni compiute sui personaggi degli altri.'),(42,'modificaPG_background_personaggio_proprio','L\'utente può modificare il proprio background.'),(43,'visualizza_pagina_gestione_eventi','L\'utente può entrare nella sezione per la gestione degli eventi.'),(44,'visualizza_pagina_gestione_giocatori','L\'utente può entrare nella sezione per la modifica dei dati dei giocatori.'),(45,'modificaPG_note_master_personaggio_altri','L\'utente può inserire delle note master.'),(46,'modificaPG_note_master_personaggio_proprio','L\'utente può inserire delle note master ai propri pg'),(47,'visualizza_pagina_messaggi','L\'utente può accedere alla sezione messaggi'),(48,'recuperaMessaggi_proprio','L\'utente può visualizzare i propri messaggi.'),(49,'recuperaMessaggi_altri','L\'utente può visualizzare i messaggi degli altri giocatori.'),(50,'recuperaMessaggioSingolo_proprio','L\'utente può visualizzare il testo di un proprio messaggio.'),(51,'recuperaMessaggioSingolo_altri','L\'utente può visualizzare il testo di un messaggio di altri.'),(52,'inviaMessaggio','L\'utente può inviare messaggi.');
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
-- Table structure for table `messaggi_fuorigioco`
--

DROP TABLE IF EXISTS `messaggi_fuorigioco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messaggi_fuorigioco` (
  `id_messaggio` int(255) NOT NULL AUTO_INCREMENT,
  `mittente_messaggio` varchar(255) NOT NULL,
  `destinatario_messaggio` varchar(255) NOT NULL,
  `oggetto_messaggio` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `testo_messaggio` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `letto_messaggio` tinyint(1) NOT NULL DEFAULT '0',
  `data_messaggio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `risposta_a_messaggio` int(255) DEFAULT NULL,
  PRIMARY KEY (`id_messaggio`),
  KEY `fk_mittente_fg_idx` (`mittente_messaggio`),
  KEY `fk_destinatario_fg_idx` (`destinatario_messaggio`),
  CONSTRAINT `fk_destinatario_fg` FOREIGN KEY (`destinatario_messaggio`) REFERENCES `giocatori` (`email_giocatore`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_mittente_fg` FOREIGN KEY (`mittente_messaggio`) REFERENCES `giocatori` (`email_giocatore`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messaggi_fuorigioco`
--

LOCK TABLES `messaggi_fuorigioco` WRITE;
/*!40000 ALTER TABLE `messaggi_fuorigioco` DISABLE KEYS */;
INSERT INTO `messaggi_fuorigioco` VALUES (1,'miroku_87@yahoo.it','b-teo-90@libero.it','Prova','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec metus eleifend, maximus tortor vitae, tristique lectus. In hac habitasse platea dictumst. Nulla volutpat enim arcu, et viverra ipsum condimentum a. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec consequat suscipit congue. Phasellus in arcu a sem lacinia molestie ut ac tortor. Suspendisse egestas ex odio, id sodales sem dictum sit amet. Nunc vitae ipsum a nisl viverra lobortis eget eget dolor.',0,'2018-03-04 16:54:20',NULL),(2,'b-teo-90@libero.it','miroku_87@yahoo.it','Re: Prova','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec metus eleifend, maximus tortor vitae, tristique lectus. In hac habitasse platea dictumst. Nulla volutpat enim arcu, et viverra ipsum condimentum a. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec consequat suscipit congue. Phasellus in arcu a sem lacinia molestie ut ac tortor. Suspendisse egestas ex odio, id sodales sem dictum sit amet. Nunc vitae ipsum a nisl viverra lobortis eget eget dolor.',1,'2018-03-04 16:54:20',1),(3,'ehi@la.it','b-teo-90@libero.it','test','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec metus eleifend, maximus tortor vitae, tristique lectus. In hac habitasse platea dictumst. Nulla volutpat enim arcu, et viverra ipsum condimentum a. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec consequat suscipit congue. Phasellus in arcu a sem lacinia molestie ut ac tortor. Suspendisse egestas ex odio, id sodales sem dictum sit amet. Nunc vitae ipsum a nisl viverra lobortis eget eget dolor.',0,'2018-03-04 16:55:01',NULL),(4,'miroku_87@yahoo.it','b-teo-90@libero.it','aaaaaaaaaa','bbbbbbbbb',0,'2018-03-07 00:31:36',NULL),(5,'miroku_87@yahoo.it','ehi@la.it','eeee','qqqqq',0,'2018-03-07 00:34:57',NULL),(6,'miroku_87@yahoo.it','b-teo-90@libero.it','4444','1111111111111',0,'2018-03-07 00:35:47',NULL),(7,'miroku_87@yahoo.it','b-teo-90@libero.it','Re: Prova','PROVA!',0,'2018-03-07 01:16:43',2),(8,'miroku_87@yahoo.it','ehi@la.it','sdfrttt','1234',0,'2018-03-07 01:18:22',NULL);
/*!40000 ALTER TABLE `messaggi_fuorigioco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messaggi_ingioco`
--

DROP TABLE IF EXISTS `messaggi_ingioco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messaggi_ingioco` (
  `id_messaggio` int(255) NOT NULL AUTO_INCREMENT,
  `mittente_messaggio` int(255) NOT NULL,
  `destinatario_messaggio` int(255) NOT NULL,
  `oggetto_messaggio` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `testo_messaggio` text COLLATE utf8_unicode_ci NOT NULL,
  `letto_messaggio` tinyint(1) NOT NULL DEFAULT '0',
  `data_messaggio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `risposta_a_messaggio` int(255) DEFAULT NULL,
  PRIMARY KEY (`id_messaggio`),
  KEY `fk_mittente_idx` (`mittente_messaggio`),
  KEY `fk_destinatario_idx` (`destinatario_messaggio`),
  CONSTRAINT `fk_destinatario_ig` FOREIGN KEY (`destinatario_messaggio`) REFERENCES `personaggi` (`id_personaggio`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_mittente_ig` FOREIGN KEY (`mittente_messaggio`) REFERENCES `personaggi` (`id_personaggio`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messaggi_ingioco`
--

LOCK TABLES `messaggi_ingioco` WRITE;
/*!40000 ALTER TABLE `messaggi_ingioco` DISABLE KEYS */;
INSERT INTO `messaggi_ingioco` VALUES (1,38,42,'Yeah','Aenean id eleifend sapien. Ut tortor sem, iaculis et risus in, rutrum tincidunt eros. Nam vulputate finibus arcu at ultricies. Sed aliquam, enim sodales dapibus tincidunt, ipsum ipsum aliquet orci, a pharetra nulla elit sit amet neque. Phasellus sed nisl eget purus sagittis dapibus ullamcorper et libero. Aliquam id lacus in ante interdum euismod. Pellentesque luctus mauris non velit suscipit, a feugiat nibh vestibulum. Mauris eros justo, ultrices sed tortor id, vehicula pellentesque magna. Nullam molestie consectetur massa, id venenatis enim mattis nec. Donec scelerisque est in orci vehicula semper. Suspendisse placerat ex in erat sagittis, in dignissim ipsum posuere. Nam at mi eget lectus rutrum vestibulum.',0,'2018-03-04 16:59:37',NULL),(2,38,43,'What','Aenean id eleifend sapien. Ut tortor sem, iaculis et risus in, rutrum tincidunt eros. Nam vulputate finibus arcu at ultricies. Sed aliquam, enim sodales dapibus tincidunt, ipsum ipsum aliquet orci, a pharetra nulla elit sit amet neque. Phasellus sed nisl eget purus sagittis dapibus ullamcorper et libero. Aliquam id lacus in ante interdum euismod. Pellentesque luctus mauris non velit suscipit, a feugiat nibh vestibulum. Mauris eros justo, ultrices sed tortor id, vehicula pellentesque magna. Nullam molestie consectetur massa, id venenatis enim mattis nec. Donec scelerisque est in orci vehicula semper. Suspendisse placerat ex in erat sagittis, in dignissim ipsum posuere. Nam at mi eget lectus rutrum vestibulum.',0,'2018-03-04 16:59:37',NULL),(3,42,38,'Non dirlo a nessuno','Aenean id eleifend sapien. Ut tortor sem, iaculis et risus in, rutrum tincidunt eros. Nam vulputate finibus arcu at ultricies. Sed aliquam, enim sodales dapibus tincidunt, ipsum ipsum aliquet orci, a pharetra nulla elit sit amet neque. Phasellus sed nisl eget purus sagittis dapibus ullamcorper et libero. Aliquam id lacus in ante interdum euismod. Pellentesque luctus mauris non velit suscipit, a feugiat nibh vestibulum. Mauris eros justo, ultrices sed tortor id, vehicula pellentesque magna. Nullam molestie consectetur massa, id venenatis enim mattis nec. Donec scelerisque est in orci vehicula semper. Suspendisse placerat ex in erat sagittis, in dignissim ipsum posuere. Nam at mi eget lectus rutrum vestibulum.',0,'2018-03-04 16:59:37',NULL),(4,43,38,'Re: What','AAAAA',0,'2018-03-07 01:12:53',2);
/*!40000 ALTER TABLE `messaggi_ingioco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifiche`
--

DROP TABLE IF EXISTS `notifiche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifiche` (
  `giocatori_email_giocatore` varchar(255) NOT NULL,
  `storico_azioni_id_azione` int(255) NOT NULL,
  `notifica_letta` tinyint(1) NOT NULL DEFAULT '0',
  KEY `fk_giocatori_has_storico_azioni_storico_azioni1_idx` (`storico_azioni_id_azione`),
  KEY `fk_giocatori_has_storico_azioni_giocatori1_idx` (`giocatori_email_giocatore`),
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
  `credito_personaggio` bigint(255) NOT NULL DEFAULT '0',
  `data_creazione_personaggio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `note_master_personaggio` text,
  `giocatori_email_giocatore` varchar(255) NOT NULL,
  PRIMARY KEY (`id_personaggio`),
  KEY `fk_giocatore_personaggio_idx` (`giocatori_email_giocatore`),
  CONSTRAINT `fk_giocatore_pg` FOREIGN KEY (`giocatori_email_giocatore`) REFERENCES `giocatori` (`email_giocatore`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personaggi`
--

LOCK TABLES `personaggi` WRITE;
/*!40000 ALTER TABLE `personaggi` DISABLE KEYS */;
INSERT INTO `personaggi` VALUES (38,'John Doe',NULL,NULL,100,18,0,'2017-12-04 23:53:45',NULL,'miroku_87@yahoo.it'),(39,'MArco rossi',NULL,NULL,100,18,0,'2017-12-13 22:05:30',NULL,'miroku_87@yahoo.it'),(42,'Test 123',NULL,NULL,100,18,0,'2018-02-20 23:11:10',NULL,'b-teo-90@libero.it'),(43,'Nuovo PG',NULL,'Prova%20di%20%3Cb%3EHTML%3C%2Fb%3E.%20YEEEE1111',100,18,0,'2018-02-20 23:32:14','sdfsa%2034%202','miroku_87@yahoo.it');
/*!40000 ALTER TABLE `personaggi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personaggi_has_abilita`
--

DROP TABLE IF EXISTS `personaggi_has_abilita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personaggi_has_abilita` (
  `personaggi_id_personaggio` int(255) NOT NULL,
  `abilita_id_abilita` int(255) NOT NULL,
  PRIMARY KEY (`personaggi_id_personaggio`,`abilita_id_abilita`),
  KEY `fk_abilita_idx` (`abilita_id_abilita`),
  CONSTRAINT `fk_abilita` FOREIGN KEY (`abilita_id_abilita`) REFERENCES `abilita` (`id_abilita`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_personaggio` FOREIGN KEY (`personaggi_id_personaggio`) REFERENCES `personaggi` (`id_personaggio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personaggi_has_abilita`
--

LOCK TABLES `personaggi_has_abilita` WRITE;
/*!40000 ALTER TABLE `personaggi_has_abilita` DISABLE KEYS */;
INSERT INTO `personaggi_has_abilita` VALUES (38,1),(38,2),(38,3),(38,91),(38,92),(38,93),(38,94),(38,95),(38,96),(38,97),(38,98),(38,99),(38,100),(38,101),(38,102),(38,103),(38,104),(38,105),(38,106),(39,70),(39,71),(39,155),(39,160),(39,161),(42,1),(42,91),(43,1),(43,91),(43,92),(43,93),(43,94),(43,95),(43,96),(43,97);
/*!40000 ALTER TABLE `personaggi_has_abilita` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `reboot_live`.`personaggi_has_abilita_BEFORE_INSERT` BEFORE INSERT ON `personaggi_has_abilita` FOR EACH ROW
BEGIN
	CALL controllaPrerequisitoAbilita( NEW.personaggi_id_personaggio, NEW.abilita_id_abilita );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `reboot_live`.`personaggi_has_abilita_BEFORE_UPDATE` BEFORE UPDATE ON `personaggi_has_abilita` FOR EACH ROW
BEGIN
	CALL controllaPrerequisitoAbilita( NEW.personaggi_id_personaggio, NEW.abilita_id_abilita );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `personaggi_has_classi`
--

DROP TABLE IF EXISTS `personaggi_has_classi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personaggi_has_classi` (
  `personaggi_id_personaggio` int(255) NOT NULL,
  `classi_id_classe` int(255) NOT NULL,
  PRIMARY KEY (`personaggi_id_personaggio`,`classi_id_classe`),
  KEY `fk_classe_idx` (`classi_id_classe`),
  CONSTRAINT `fk_classe` FOREIGN KEY (`classi_id_classe`) REFERENCES `classi` (`id_classe`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_personaggi` FOREIGN KEY (`personaggi_id_personaggio`) REFERENCES `personaggi` (`id_personaggio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personaggi_has_classi`
--

LOCK TABLES `personaggi_has_classi` WRITE;
/*!40000 ALTER TABLE `personaggi_has_classi` DISABLE KEYS */;
INSERT INTO `personaggi_has_classi` VALUES (38,1),(38,8),(38,9),(39,6),(39,12),(39,13),(42,1),(42,2),(42,8),(43,1),(43,2),(43,8);
/*!40000 ALTER TABLE `personaggi_has_classi` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `reboot_live`.`personaggi_has_classi_BEFORE_INSERT` BEFORE INSERT ON `personaggi_has_classi` FOR EACH ROW
BEGIN
	CALL controllaPrerequisitoClassi( NEW.personaggi_id_personaggio, NEW.classi_id_classe );
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `reboot_live`.`personaggi_has_classi_BEFORE_UPDATE` BEFORE UPDATE ON `personaggi_has_classi` FOR EACH ROW
BEGIN
	CALL controllaPrerequisitoClassi( NEW.personaggi_id_personaggio, NEW.classi_id_classe );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  CONSTRAINT `fk_ruoli_has_grants_grants1` FOREIGN KEY (`grants_id_grant`) REFERENCES `grants` (`id_grant`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ruoli_has_grants_ruoli1` FOREIGN KEY (`ruoli_id_ruolo`) REFERENCES `ruoli` (`id_ruolo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruoli_has_grants`
--

LOCK TABLES `ruoli_has_grants` WRITE;
/*!40000 ALTER TABLE `ruoli_has_grants` DISABLE KEYS */;
INSERT INTO `ruoli_has_grants` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,34),(1,35),(1,36),(1,37),(1,38),(1,39),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,52),(3,1),(3,2),(3,3),(3,5),(3,8),(3,22),(3,23);
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
  `giocatori_email_giocatore` varchar(255) NOT NULL,
  `data_azione` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo_azione` set('UPDATE','DELETE','INSERT') NOT NULL,
  `tabella_azione` varchar(255) NOT NULL,
  `campo_azione` varchar(255) NOT NULL,
  `valore_vecchio_azione` text,
  `valore_nuovo_azione` text,
  PRIMARY KEY (`id_azione`),
  KEY `fk_esecutore_idx` (`giocatori_email_giocatore`),
  CONSTRAINT `fk_esecutore` FOREIGN KEY (`giocatori_email_giocatore`) REFERENCES `giocatori` (`email_giocatore`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storico_azioni`
--

LOCK TABLES `storico_azioni` WRITE;
/*!40000 ALTER TABLE `storico_azioni` DISABLE KEYS */;
INSERT INTO `storico_azioni` VALUES (12,43,'miroku_87@yahoo.it','2018-02-24 18:21:10','UPDATE','personaggi','background_personaggio','Prova%20di%20%3Cb%3EHTML%3C%2Fb%3E.%20','Prova%20di%20%3Cb%3EHTML%3C%2Fb%3E.%20YEEEE'),(13,43,'miroku_87@yahoo.it','2018-02-24 18:22:54','UPDATE','personaggi','background_personaggio','Prova%20di%20%3Cb%3EHTML%3C%2Fb%3E.%20YEEEE','Prova%20di%20%3Cb%3EHTML%3C%2Fb%3E.%20YEEEE1111'),(14,43,'miroku_87@yahoo.it','2018-02-26 22:30:01','UPDATE','personaggi','note_master_personaggio',NULL,''),(15,43,'miroku_87@yahoo.it','2018-02-26 22:30:54','UPDATE','personaggi','note_master_personaggio','',''),(16,43,'miroku_87@yahoo.it','2018-02-26 22:33:14','UPDATE','personaggi','note_master_personaggio','',''),(17,43,'miroku_87@yahoo.it','2018-02-26 22:34:40','UPDATE','personaggi','note_master_personaggio','',''),(18,43,'miroku_87@yahoo.it','2018-02-26 22:35:22','UPDATE','personaggi','background_personaggio','Prova%20di%20%3Cb%3EHTML%3C%2Fb%3E.%20YEEEE1111','Prova%20di%20%3Cb%3EHTML%3C%2Fb%3E.%20YEEEE1111'),(19,43,'miroku_87@yahoo.it','2018-02-26 22:37:04','UPDATE','personaggi','note_master_personaggio','','sdfsa%2034%202');
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
/*!50003 DROP PROCEDURE IF EXISTS `controllaPrerequisitoAbilita` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `controllaPrerequisitoAbilita`( _id_pg INT, _id_abilita INT )
BEGIN
	-- Trigger che controlla se il pg ha i prerequisiti necessari
	-- Solitamente nel campo prerequisito_abilita c'e' l'id
	-- dell'abilita necessaria, ma esistono degli id d'eccezione:
	--  -1: servono tutte le abilta della classe dell'abilita che si sta cercando di inserire
	--  -2: servono FUOCO A TERRA e TIRATORE SCELTO (id 44 e 39)
	--  -3: servono almeno 5 abilita di Supporto Base
	--  -4: servono almeno 3 abilita "CONTROLLER"
    --  -5: servono almeno 4 abilita da Sportivo
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
				abilita_id_abilita IN (
					SELECT id_abilita
						FROM abilita
                        WHERE nome_abilita = 'FUOCO A TERRA' OR
							nome_abilita = 'TIRATORE SCELTO'
                )
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
                        WHERE classi_id_classe = @classe
                )
		) < 5
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '@@@Non puoi acquistare questa abilit&agrave; senza almeno 5 abilità di Supporto Base.@@@';
        
	ELSEIF @prerequisito = -4 AND (
		SELECT COUNT(*) AS num_abilita 
			FROM personaggi_has_abilita 
            WHERE personaggi_id_personaggio = _id_pg AND
				abilita_id_abilita IN (
					SELECT id_abilita
						FROM abilita
                        WHERE nome_abilita LIKE '%CONTROLLER%'
                )
		) < 3
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '@@@Non puoi acquistare questa abilit&agrave; senza almeno 3 abilità CONTROLLER.@@@';
        
	ELSEIF @prerequisito = -5 AND (
		SELECT COUNT(*) AS num_abilita 
			FROM personaggi_has_abilita
            WHERE personaggi_id_personaggio = _id_pg AND
				abilita_id_abilita IN (
					SELECT id_abilita
						FROM abilita
                        WHERE classi_id_classe = @classe
                )
		) < 4
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '@@@Non puoi acquistare questa abilit&agrave; senza almeno 4 abilità da Sportivo.@@@';
        
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `controllaPrerequisitoClassi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `controllaPrerequisitoClassi`( _id_pg INT, _id_classe INT )
BEGIN
	SELECT prerequisito_classe INTO @prerequisito 
		FROM classi 
		WHERE id_classe = _id_classe;
        
	IF @prerequisito > 0 AND (
		SELECT COUNT(*) AS num_classi
			FROM personaggi_has_classi
            WHERE personaggi_id_personaggio = _id_pg AND
				classi_id_classe = @prerequisito
        ) = 0
	THEN
		SELECT nome_classe INTO @nome_classe FROM classi WHERE id_classe = @prerequisito;
        SET @message = CONCAT('@@@Non puoi acquistare questa classe senza aver prima acquistato ', CAST(@nome_classe AS CHAR),'@@@');
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @message;
        
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registraAzione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registraAzione`( _id_pg VARCHAR(255), _email_giocatore VARCHAR(255), _azione VARCHAR(255), _vecchio VARCHAR(255), _nuovo VARCHAR(255) )
BEGIN
	INSERT INTO storico_azioni (id_personaggio_azione, giocatori_email_giocatore, tipo_azione, valore_vecchio_azione, valore_nuovo_azione) 
		VALUES ( _id_pg, _email_giocatore, _azione, _vecchio, _nuovo );
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

-- Dump completed on 2018-03-07  1:21:53
