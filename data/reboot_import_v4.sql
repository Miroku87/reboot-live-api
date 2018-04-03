CREATE DATABASE  IF NOT EXISTS `reboot_live` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `reboot_live`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: lhcp1135.webapps.net    Database: bl2o7rd1_reboot_live_beta
-- ------------------------------------------------------
-- Server version	5.6.38-log

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
  `effetto_abilita` set('attivo','passivo') COLLATE utf8_unicode_ci DEFAULT NULL,
  `offset_pf_abilita` int(5) DEFAULT '0',
  `offset_shield_abilita` int(5) DEFAULT '0',
  `offset_mente_abilita` int(5) DEFAULT '0',
  `abilitacol` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_abilita`),
  KEY `fk_abilita_classi_idx` (`classi_id_classe`),
  CONSTRAINT `fk_abilita_classi` FOREIGN KEY (`classi_id_classe`) REFERENCES `classi` (`id_classe`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abilita`
--

LOCK TABLES `abilita` WRITE;
/*!40000 ALTER TABLE `abilita` DISABLE KEYS */;
INSERT INTO `abilita` VALUES (1,'civile','Glitch','Una volta per vita, se il personaggio entra in uno dei punti di Respawn viene teletrasportato a un altro. ',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL,0,0,0,NULL),(2,'civile','Lag','Una volta per vita , il personaggio se si muove a scatti dichiara IMMUNE! al primo danno che subisce. ',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL,0,0,0,NULL),(3,'civile','Barra spaziatrice','Se il personaggio si muove saltellando dichiara IMMUNE! ai danni delle chiamate ad area e raggio. ',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL,0,0,0,NULL),(4,'civile','Tea bag','Se al primo avversario abbattuto il personaggio esulta in modo evidente al pubblico, guadagna automaticamente 1 punto in classifica nelle partite DEATHMATCH. ',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL,0,0,0,NULL),(5,'civile','Conoscenza mappe','Il personaggio ha tempo 15 secondi per girare la mappa prima di giocare la partita',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL,0,0,0,NULL),(6,'civile','Akimbo','Il personaggio può giocare usando 2 pistole',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL,0,0,0,NULL),(7,'civile','Aim bot','Una volta per Vita il personaggio può fare la dichiarazione di danno a dito indicando la vittima',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL,0,0,0,NULL),(8,'civile','Autokill','Il personaggio può suicidarsi per non dare punti al nemico. ',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL,0,0,0,NULL),(9,'civile','Lancia la bandiera','Se il personaggio in un match \"cattura la bandiera\" è equipaggiato con la sua arma base e tiene la bandiera la può lanciare. ',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL,0,0,0,NULL),(10,'civile','Finto morto','Il personaggio può fingersi morto per 30 secondi consecutivi. ',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL,0,0,0,NULL),(11,'civile','Camperone','Ogni volta che il personaggio sta fermo in un posto per sparare almeno per 3 secondi può dichiarare al primo colpo che spara + 1 alla chiamata secondo lo schema SINGOLO!, DOPPIO! TRIPLO, QUADRUPLO',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL,0,0,0,NULL),(12,'civile','Idolo della folla','Se il personaggio ha appena vinto ( o fa parte della squadra che ha  vinto) una partita  può richiedere allo sponsor un extra del 25% del suo ingaggio dichiarando SONO L\'IDOLO DELLA FOLLA.',40,1,-5,'Utilizzabile solo durante una partita di Deathmatch',NULL,0,0,0,NULL),(13,'civile','Coca e mignotte','Il personaggio sceglie tra una di queste due opzioni:<br>DROGA: il personaggio ha passato la sua vita a sniffare, risulta immune agli effetti negativi  fisici delle droghe da inalazione.<br>CONTATTO: il personaggio ha passato la sua vita a contatto con sostanze schifose, risulta immune agli effetti negativi delle droghe da contatto.',70,1,12,'Utilizzabile solo durante una partita di Deathmatch',NULL,0,0,0,NULL),(14,'civile','Stalker','I numerosi successi sportivi e mondani del personaggio hanno attirato l\'attenzione di uno Stalker che lo seguirà dall\'ombra e potrà fornire qualche aiuto, ma anche delle complicazioni, al personaggio.',20,1,12,'Utilizzabile solo durante una partita di Deathmatch',NULL,0,0,0,NULL),(15,'civile','Gavetta','Tra un evento e il successivo il personaggio può inviare 1 articolo per farlo pubblicare, se questo avviene guadagna Bit aggiuntivi che gli saranno consegnati al prossimo evento.',20,2,NULL,'',NULL,0,0,0,NULL),(16,'civile','Ottimo scrittore','I compensi degli articoli pubblicati aumentano del 30%.',40,2,15,'',NULL,0,0,0,NULL),(17,'civile','Campo di specializzazione 1','Il personaggio deve scegliere tra i seguenti campi: cronaca nera, cronaca rosa, sport, economica, politica, giornalismo spazzatura.<br>Scrivendo nel campo selezionato può mandare un articolo aggiuntivo.',40,2,NULL,'',NULL,0,0,0,NULL),(18,'civile','Campo di specializzazione 2','Il personaggio deve scegliere tra i seguenti campi: cronaca nera, cronaca rosa, sport, economica, politica, giornalismo spazzatura.<br>Scrivendo nel campo selezionato può mandare un articolo aggiuntivo.',40,2,NULL,'',NULL,0,0,0,NULL),(19,'civile','Campo di specializzazione 3','Il personaggio deve scegliere tra i seguenti campi: cronaca nera, cronaca rosa, sport, economica, politica, giornalismo spazzatura.<br>Scrivendo nel campo selezionato può mandare un articolo aggiuntivo.',40,2,NULL,'',NULL,0,0,0,NULL),(20,'civile','Campo di specializzazione 4','Il personaggio deve scegliere tra i seguenti campi: cronaca nera, cronaca rosa, sport, economica, politica, giornalismo spazzatura.<br>Scrivendo nel campo selezionato può mandare un articolo aggiuntivo.',40,2,NULL,'',NULL,0,0,0,NULL),(21,'civile','Foto scottanti','Il personaggio ha contatti per vendere facilmente e a un buon prezzo foto compromettenti (se le deve comunque procurare in gioco).',30,2,NULL,'',NULL,0,0,0,NULL),(22,'civile','Clicca qui','Il personaggio ha un sito dove vende informazioni spazzatura per allocchi, questo gli garantisce il 25% in più del tuo attuale stipendio.',40,2,NULL,'',NULL,0,0,0,NULL),(23,'civile','Disinformazione','Il personaggio può far pubblicare informazioni palesemente false anche sui canali di informazione regolari.',30,2,22,'',NULL,0,0,0,NULL),(24,'civile','Deviare l\'attenzione','Il personaggio può scrivere un articolo \"realistico \"che devi l\'attenzione da un altro evento che vuole nascondere ( questa abilità blocca un articolo già uscito fino all\'evento successivo).',40,2,NULL,'',NULL,0,0,0,NULL),(25,'civile','Servo del sistema','Il personaggio guadagna il 75% in più del suo stipendio MA non potrà mai utilizzare le seguenti abilità: DISINFORMAZIONE, DEVIARE L\'ATTENZIONE, CLICCA QUI.',140,2,NULL,'',NULL,0,0,0,NULL),(26,'civile','Informazioni prelibate','Il personaggio ottiene informazioni commerciali preferenziali sull\'apposita sezione del Ravnet.',30,2,NULL,'',NULL,0,0,0,NULL),(27,'civile','Bunga bunga','Il personaggio può investire una quantità di Bit a sua discrezione per ottenere informazioni su personaggi di spicco della politica.',30,2,NULL,'',NULL,0,0,0,NULL),(28,'civile','Voci di strada ','Il personaggio ottiene informazioni di quello che accade nelle strade in ambiti legati a Guardie di vigilanza o malavita tra un live e l\'altro inoltrando allo staff una mail con la domanda.',30,2,NULL,'',NULL,0,0,0,NULL),(29,'civile','Programmare','Il personaggio può assemblare stringhe di codice per creare programmi singoli.',20,3,NULL,'',NULL,0,0,0,NULL),(30,'civile','Programmazione avanzata','Il personaggio può assemblare due programmi assieme; i bonus dei singoli programmi sono accorpati. I programmi così assemblati non possono più essere separati e verranno consumati contemporaneamente.',40,3,29,'',NULL,0,0,0,NULL),(31,'civile','Programmazione totale','Il personaggio può assemblare fino a 4 programmi assieme; i bonus dei singoli programmi sono accorpati. I programmi così assemblati non possono più essere separati e verranno consumati contemporaneamente.',60,3,30,'',NULL,0,0,0,NULL),(32,'civile','Riallocazione codice','Nella programmazione il giocatore può modificare di +/- 1 uno dei parametri numerici di un singolo programma prima del Debug finale.',50,3,NULL,'',NULL,0,0,0,NULL),(33,'civile','Ctrl-c, Ctrl-v','Il giocatore può richiedere allo staff una copia di un programma in suo possesso una volta per evento.',50,3,NULL,'',NULL,0,0,0,NULL),(34,'civile','Tutto da solo','Il giocatore in possesso di una singola stringa di codice può compilare un programma di massimo due righe utilizzando due volte la stessa stringa di codice.',60,3,NULL,'',NULL,0,0,0,NULL),(35,'civile','Cancellazione programma','Il personaggio mentre è nella rete può decidere di cancellare un qualsiasi  programma che ha equipaggiato per ottenere uno spazio vuoto.',30,3,NULL,'',NULL,0,0,0,NULL),(36,'civile','Bruciare il supporto','Il personaggio può chiedere allo staff un cartellino \"CRIPT-LOCK®\" . ',50,3,NULL,'',NULL,0,0,0,NULL),(37,'civile','Multitasking','Il personaggio può caricare fino ad un numero di programmi pari alla metà delle abilità da netrunner che possiede (arrotondate per difetto, con un minimo di 2) prima di entrare nella rete.',30,3,NULL,'',NULL,0,0,0,NULL),(38,'civile','Zerg rush','Il  personaggio può, avvisando un membro staff, prima di entrare nella rete creare un proprio \"clone\" ogni 2 cartellini codice che sacrifica (con profilo base e senza programmi) fino a un massimo di 10 cloni. Questi cloni non sono altri che \"vite\" aggiuntive che il giocatore utilizzerà prima del suo ingresso effettivo nella rete.',50,3,37,'',NULL,0,0,0,NULL),(39,'civile','Strada sicura','Il personaggio 1 volta per accesso alla rete può inviare in modo sicuro un pacchetto dati a una sua casella \"sicura\". In termini di gioco può prendere un singolo cartellino dati in suo possesso all\'interno della rete e consegnarlo a un membro staff presente e richiederlo alla sua uscita dalla rete. ',60,3,NULL,'',NULL,0,0,0,NULL),(40,'civile','Neuro armatura','Il personaggio ha installato un programma di protezione latente, se non equipaggiato con programmi di armatura il suo avatar ha 6 punti ferita. ',30,3,NULL,'',NULL,0,0,0,NULL),(41,'civile','Sistema di sicurezza integrato','Il personaggio nella rete virtuale può dichiare DISINTEGRAZIONE! su se stesso anche se non è cosciente.',50,3,38,'',NULL,0,0,0,NULL),(42,'civile','Guerriglia informatica','Il personaggio può, quando entra nella rete, dichiarare BONUS! +X DANNI! RAGGIO 5! oppure dichiarare BONUS! +X PUNTI FERITA! RAGGIO 5! (in entrambi i casi X è pari alla metà dei personaggi che sono entrati insieme a lui nella rete virtuale).',40,3,37,'',NULL,0,0,0,NULL),(43,'civile','Alter ego','Il personaggio può, se vuole, modificare il proprio costume prima di entrare nella rete. Se la modifica al costume è totale, non è possibile riconoscere il personaggio.',30,3,37,'',NULL,0,0,0,NULL),(44,'civile','Riparare','Il personaggio può dichiarare RIPARAZIONE 1 dopo 5 Minuti di lavoro.',30,4,NULL,'',NULL,0,0,0,NULL),(45,'civile','Riparazione veloce','Il personaggio riduce il tempo TOTALE di applicazione dell\'abilità RIPARARE di 1 minuto (fino ad un minimo di 1 minuto).',40,4,44,'',NULL,0,0,0,NULL),(46,'civile','Mago della brugola','Il personaggio aggiunge sempre + 1 al suo valore di RIPARAZIONE! Dato dall\'abilità Riparare.',50,4,NULL,'',NULL,0,0,0,NULL),(47,'civile','Lavoro di squadra','Il personaggio se lavora con un altro personaggio con questa abilità dimezza i tempi di riparazione (approssimati per eccesso) e aggiunge +1 al valore della chiamata. Questa abilità non può essere usata assieme a RIPARAZIONE VELOCE.',40,4,NULL,'',NULL,0,0,0,NULL),(48,'civile','Specializzazione-Armi','Il personaggio può scegliere tra i progetti fattibili qualsiasi tipologia da arma.',40,4,45,'',NULL,0,0,0,NULL),(49,'civile','Specializzazione-Protesi','Il personaggio può scegliere tra i progetti fattibili qualsiasi tipologia di protesi.',40,4,45,'',NULL,0,0,0,NULL),(50,'civile','Specializzazione-Gadget e Shield','Il personaggio può scegliere tra i progetti fattibili qualsiasi tipologia di gadget e Shield.',40,4,45,'',NULL,0,0,0,NULL),(51,'civile','Specializzazione-Esoscheletri e scudi','Il personaggio può scegliere tra i progetti fattibili qualsiasi tipologia di potenziamento per tutte le tipologie di esoscheletro e scudi.',40,4,45,'',NULL,0,0,0,NULL),(52,'civile','Specializzazione avanzata-Esoscheletri','Il personaggio può progettare esoscheletri completi.',40,4,51,'',NULL,0,0,0,NULL),(53,'civile','Specializzazione avanzata-Gadget','Il personaggio può progettare gadget complessi.',40,4,50,'',NULL,0,0,0,NULL),(54,'civile','Scansione schemi','Il personaggio può demolire un oggetto per scoprire il suo esatto schema di realizzazione',80,4,NULL,'',NULL,0,0,0,NULL),(55,'civile','Smontaggio veloce','Il personaggio può smontare qualsiasi oggetto dotato di cartellino Azzurro recuperando la componente più facile da ottenere, mimando di smontare l\'oggetto per 1 minuti e riconsegnando l\'oggetto demolito allo Staff.',70,4,NULL,'',NULL,0,0,0,NULL),(56,'civile','Ricerca mirata','Il personaggio può demolire un oggetto Bianco per ottenere un suo componente. Il personaggio deve consegnare l\'oggetto allo staff specificando quale parte vuole ottenere tra le seguenti tipologie: struttura, batteria, applicativo.',60,4,55,'',NULL,0,0,0,NULL),(57,'civile','Macchinari specialistici','',20,4,NULL,'',NULL,0,0,0,NULL),(58,'civile','Squadra di aiutanti','Il personaggio può farsi aiutare da altri personaggi (da uno ad un massimo pari alla metà delle abilità di Tecnico che possiede, arrotondate per difetto) nel compiere le operazioni di riparazione. Se lui, i suoi aiutanti e l\'oggetto da riparare sono in un raggio di 5 metri, può utilizzare le abilità di riparazione riducendo di 30 SECONDI i tempi per ogni aiutante, fino ad un minimo di 1 minuto per operazione.',40,4,NULL,'',NULL,0,0,0,NULL),(59,'civile','Impiantologia cibernetica','Il personaggio è in grado di montare protesi a un personaggio se opera in un struttura adeguata. L\'operazione deve essere mimata per 10 minuti. Al termine dichiara NEUTRALIZZA! MUTILAZIONE!',20,5,NULL,'',NULL,0,0,0,NULL),(60,'civile','Impiantologia cibernetica migliorata','Il personaggio è in grado di montare protesi a un personaggio se opera in un struttura adeguata. L\'operazione deve essere mimata per 5 minuti.',40,5,59,'',NULL,0,0,0,NULL),(61,'civile','Prime cure','Il personaggio può, dopo 10 secondi di lavoro, allungare il tempo di coma del bersaglio di ulteriori 5 minuti. Può essere utilizzata solo una volta sullo stesso bersaglio, anche da diversi Biomedici. Il giocatore dovrà spiegare al bersaglio gli effetti di questa abilità.',20,5,NULL,'',NULL,0,0,0,NULL),(62,'civile','Cure intensive','Il personaggio può dichiarare GUARIGIONE! X! (dove X è pari alla metà delle abilità di medicina che possiede) dopo aver mimato la procedura per 5 minuti ad un personaggio che non sia in stato di coma.',30,5,NULL,'',NULL,0,0,0,NULL),(63,'civile','Cure avanzatre','Il personaggio può dichiarare GUARIGIONE! X! (dove X è pari alla metà delle abilità di medicina che possiede) su un personaggio in coma dopo aver mimato la procedura per 5 minuti.',40,5,62,'',NULL,0,0,0,NULL),(64,'civile','Sintesi e analisi chimica','Il personaggio è in grado di analizzare e produrre sostanze chimiche tramite la specifica sezione del database medico e dello strumento di sintesi preposto.',20,5,NULL,'',NULL,0,0,0,NULL),(65,'civile','Produzione migliorata','Durante la sintesi chimica un personaggio ottiene il doppio dei prodotti normalmente ottenibili.',60,5,NULL,'',NULL,0,0,0,NULL),(66,'civile','Equipe medica','Il personaggio se lavora con un altro personaggio con questa abilità aggiunge +1 al valore della chiamata per ogni personaggio con cui collabora.',40,5,NULL,'',NULL,0,0,0,NULL),(67,'civile','Gestire gli aiutanti','Il personaggio può farsi aiutare da altri personaggi (da uno ad un massimo pari alla metà delle abilità di medicina che possiede, arrotondate per difetto ) nel compiere le operazioni mediche. Se lui, i suoi aiutanti e i pazienti sono in un raggio di 5 metri, può utilizzare le abilità \"Prime Cure\", \"Cure Intensive\" e \"Cure Avanzate\" su un paziente aggiuntivo per ogni aiutante.<br><br>(N.B. : Si intende \"Paziente\" il personaggio sottoposto a cure, \"Aiutante\" la persona, anche non medico, che sta aiutando chi usa l\'abilità. L\'Aiutante non può in nessun caso essere anche un paziente, e non potrà utilizzare altre abilità mentre aiuta il personaggio. L\'uso di questa abilità esclude l\'utilizzo dell\'abilità \"Gestire i Tempi\")',60,5,NULL,'',NULL,0,0,0,NULL),(68,'civile','Gestire i tempi','Il personaggio può farsi aiutare da altri personaggi (da uno ad un massimo pari alla metà delle abilità di medicina che possiede, arrotondate per difetto) nel compiere le operazioni mediche. Se lui, i suoi aiutanti e il paziente sono in un raggio di 5 metri, può utilizzare le abilità \"Prime Cure\", \"Cure Intensive\" e \"Cure Avanzate\" riducendo di 1 minuto i tempi per ogni aiutante, fino a dimezzare le tempistiche.<br><br>(N.B. : Si intende \"Paziente\" il personaggio sottoposto a cure, \"Aiutante\" la persona, anche non medico, che sta aiutando chi usa l\'abilità. L\'Aiutante non può in nessun caso essere anche un paziente, e non potrà utilizzare altre abilità mentre aiuta il personaggio. L\'uso di questa abilità esclude l\'utilizzo dell\'abilità \"Gestire gli aiutanti\").<br><br>N.b. Quando il medico sta operando su un altro personaggio, il conteggio di coma del ferito si interrompe.',60,5,NULL,'',NULL,0,0,0,NULL),(69,'civile','Non puoi ingrandirla di più?','Il personaggio può ottenere informazioni aggiuntive tramite la Ravnet, su prove che sono già state analizzate.',20,6,NULL,'',NULL,0,0,0,NULL),(70,'civile','Grissom è amico mio','Il personaggio ottiene informazioni aggiunte nei cartellini \"Interazione\".',20,6,NULL,'',NULL,0,0,0,NULL),(71,'civile','Linguaggio del corpo','Il personaggio, dopo aver parlato almeno 5 minuti con una persona può dichiarare SINCERITA\'!: MI HAI MENTITO SU QUALCOSA IN QUESTI ULTIMI 5 MINUTI?. Non è possibile interrogare con questa abilità la stessa persona più volte nell\'arco di un ora.',40,6,NULL,'',NULL,0,0,0,NULL),(72,'civile','Direzione dei colpi','Il personaggio se in presenza di un cadavere può chiedere allo staff la direzione, il numero di colpi e la tipologia dell\'arma che ha ucciso la persona.',20,6,NULL,'',NULL,0,0,0,NULL),(73,'civile','Interrogatorio','Durante un interrogatorio il personaggio può, dopo aver posto allo stesso un bersaglio 5 domande sullo stesso argomento, dichiarare SINCERITA\'! HAI MENTITO IN QUALCUNA DELLE RISPOSTE CHE MI HAI DATO?. Non è possibile interrogare con questa abilità la stessa persona più volte nell\'arco di un ora.',60,6,NULL,'',NULL,0,0,0,NULL),(74,'civile','Poliziotto buono e Poliziotto cattivo','Se 2 giocatori hanno l\'abilità INTERROGATORIO possono interrogare lo stesso soggetto in contemporanea anche sullo stesso argomento. Viene richiesto ai due giocatori di interpretare correttamente la cosa con uno dei due \"buono\" e l\'altro \"cattivo\".',60,6,NULL,'',NULL,0,0,0,NULL),(75,'civile','Contatti nell\'Ago','Il personaggio ha contatti nell\'Ago e ottiene accesso all\'apposita sezione nel Ravnet.',40,6,NULL,'',NULL,0,0,0,NULL),(76,'civile','Chiuderemo un occhio','La prima volta che il personaggio fa qualche errore grosso e si ritrova il dipartimento disciplinare può dichiarare a un membro staff l\'uso di questa abilità e il suo problema verrà ignorato solo per quella volta. Il favore può essere recuperato in gioco.  ',80,6,NULL,'',NULL,0,0,0,NULL),(77,'civile','Contatti nella malavita','Il personaggio ha contatti nella malavita e ottiene accesso all\'apposita sezione nel Ravnet.',40,6,NULL,'',NULL,0,0,0,NULL),(78,'civile','Nemesi','Il personaggio nel suo passato si è creato un nemico giurato con cui si è andato a creare una strana simbiosi, il suo nemico cercherà di ostacolarlo ma non ucciderlo, non lo aiuterà ma potrebbe salvarlo da situazioni estreme solo perché \"è una questione personale\".',60,6,NULL,'',NULL,0,0,0,NULL),(79,'civile','Torturare','Durante un interrogatorio e dopo aver causato dei danni al bersaglio, il personaggio può, dopo aver posto allo stesso bersaglio 5 domande sullo stesso argomento, dichiarare SINCERITA\'! HAI MENTITO IN QUALCUNA DELLE RISPOSTE CHE MI HAI DATO?. Non è possibile interrogare con questa abilità la stessa persona più volte nell\'arco di un ora.',50,7,NULL,'',NULL,0,0,0,NULL),(80,'civile','Baciamo le mani','Il personaggio ha contatti che gli garantiscono informazioni sui movimenti delle guardie corporative e ottiene accesso all\'apposita sezione nel Ravnet.',80,7,NULL,'',NULL,0,0,0,NULL),(81,'civile','Contatti tra gli sbirri','Il personaggio ha contatti che gli garantiscono informazioni sui movimenti delle guardie corporative e ottiene accesso all\'apposita sezione nel Ravnet.',40,7,NULL,'',NULL,0,0,0,NULL),(82,'civile','Contatti nella famiglia','Il personaggio ha contatti nella malavita e ottiene accesso all\'apposita sezione nel Ravnet.',40,7,NULL,'',NULL,0,0,0,NULL),(83,'civile','Inquinare le prove','Il personaggio può interagire su Cartellini Interazione \"Prove\" chiedendo allo staff di modificarli permanentemente.',40,7,NULL,'',NULL,0,0,0,NULL),(84,'civile','Scassinare','Il personaggio può mimare di scassinare una serratura e aprirla dopo 1 minuto di interazione per ogni livello di difficoltà della serratura.',40,7,NULL,'',NULL,0,0,0,NULL),(85,'civile','Ricettare merce','Il personaggio può \"vendere\" alla segreteria oggetti in suo possesso e ottenerne il 50 % del valore.',40,7,NULL,'',NULL,0,0,0,NULL),(86,'civile','Menù del Continental','Il personaggio ottiene prima del live una lista di prodotti ottenibili sul mercato nero ma deve trovare qualcuno che gli venda l\'oggetto del suo desiderio.',30,7,NULL,'',NULL,0,0,0,NULL),(87,'civile','Consierge del Continental','Il personaggio sapendo cosa vendono al Continental può acquistare prima del live uno o più beni (sempre se possiede i Bit necessari per farlo).',80,7,86,'',NULL,0,0,0,NULL),(88,'civile','Allibratore','Se il personaggio perde giocando a delle scommesse ufficiali recupera il 25% del valore perso.',40,7,NULL,'',NULL,0,0,0,NULL),(89,'civile','Vita allo sbando','Il personaggio sceglie tra una di queste due opzioni:<br><br>ALCOLISMO: il personaggio ha passato la sua vita a bere, risulta immune agli effetti negativi fisici delle droghe da ingestione.<br>INIEZIONE: il personaggio ha passato la sua vita a bucarsi, risulta immune agli effetti negativi delle droghe da iniezione.<br><br>Tuttavia, se subisce la chiamata SINCERITA\' mentre è sotto l\'effetto della tipologia da lui selezionata dovrà rispondere a 3 domande dicendo la verità .',60,7,NULL,'',NULL,0,0,0,NULL),(90,'civile','Conversione sicura','Il personaggio può convertire Bit in Platino e viceversa senza problemi andando in sala staff.',70,7,NULL,'',NULL,0,0,0,NULL),(91,'civile','Riconoscere droghe e sostanze illegali','Il personaggio è in grado di riconoscere sostanze illegali non identificate se appartengono alla categoria \"Droghe\".',20,7,NULL,'',NULL,0,0,0,NULL),(92,'militare','Istinto omicida','Se il personaggio è sotto l\'effetto di CONFUSIONE! può comunque attaccare colpendo col danno base<br>dell\'arma usata ridotto di 1 seguendo la normale catena:<br>COMA! - A ZERO! - CRASH! - QUADRUPLO! - TRIPLO! - DOPPIO! - SINGOLO!.',1,8,NULL,'personale','passivo',0,0,0,NULL),(93,'militare','Istinto di sopravvivenza','Se il personaggio è sotto effetto della chiamata DOLORE! può comunque muoversi arrancando per tutta<br>la durata della chiamata, senza compiere nessun\'altra azione.',1,8,NULL,'personale','passivo',0,0,0,NULL),(94,'militare','Scudo umano','Il personaggio può dichiarare NEUTRALIZZA GRANATA! Il personaggio deve mimare di coprire la granata<br>col proprio corpo (NOTA: è sufficiente essere entro un raggio massimo di 1 metro dalla granata)<br>subendo però ARTEFATTO COMA! nel caso in cui la granata causi danno o ARTEFATTO SHOCK! nel caso<br>in cui sia una qualunque chiamata di effetto. Quest\'abilità non funziona se non si è coscienti.',1,8,NULL,'personale','passivo',0,0,0,NULL),(95,'militare','Posizione difensiva','Il personaggio può rilocare un danno subito dalla locazione vitale ad un arto o viceversa.<br>ESEMPIO: un colpo alla gamba può essere spostato sul torso ma non sulle braccia; un colpo al torso può<br>essere spostato dove si vuole.',1,8,93,'personale','passivo',0,0,0,NULL),(96,'militare','Difesa mentale 1','Il punteggio di Difesa Mentale del personaggio è aumentato permanentemente di 1.',1,8,NULL,'personale','passivo',0,0,1,NULL),(97,'militare','Addestramento fisico 1','I Punti Ferita del personaggio aumentano permanentemente di 1.',1,8,NULL,'personale','passivo',1,0,0,NULL),(98,'militare','Shield MK2','Se il personaggio ha almeno un Punto Shield base, guadagna +2 punti al suo valore globale.',1,8,NULL,'personale','passivo',0,2,0,NULL),(99,'militare','Resistere alla paura','Il personaggio può dichiarare IMMUNE! Alla chiamata PAURA!.',1,8,95,'personale','attivo',0,0,0,NULL),(100,'militare','Tuta corazzata MK2','Il valore base dei punti Shield garantiti dalle locazioni equipaggiate con una tuta da combattimento<br>corazzata (come indicato a pag. 17) è moltiplicato per 1,5.',1,8,NULL,'personale','passivo',0,0,0,NULL),(101,'militare','Tuta corazzata MK3','Il valore base dei punti Shield garantiti dalle locazioni equipaggiate con una tuta da combattimento<br>corazzata (come indicato a pag. 17) è raddoppiato. Questa abilità sostituisce TUTA CORAZZATA MK2.',1,8,100,'personale','passivo',0,0,0,NULL),(102,'militare','Shield MK3','Se il personaggio ha almeno un Punto Shield base, guadagna +4 punti al suo valore globale. Questa<br>abilità sostituisce SHIELD MK2.',1,8,98,'personale','passivo',0,4,0,NULL),(103,'militare','Braccio di ferro','Il personaggio può dichiarare IMMUNE! alla chiamata DISARMO!.',1,8,NULL,'personale','attivo',0,0,0,NULL),(104,'militare','Fuciliere','Il personaggio può aumentare di 2 i danni causati col Fucile d\'Assalto per il prossimo colpo sparato in<br>base alla seguente scala: SINGOLO! - DOPPIO! - TRIPLO! - QUADRUPLO! - CRASH! - A ZERO!.',1,8,105,'personale','attivo',0,0,0,NULL),(105,'militare','Presa ferma','Il personaggio può impugnare armi di categoria Fucile d\'Assalto con una sola mano se nell\'altra impugna<br>uno Scudo.',1,8,103,'personale','passivo',0,0,0,NULL),(106,'militare','Testa dura','Il personaggio può dichiarare IMMUNE! alla chiamata SHOCK!',1,8,NULL,'personale','attivo',0,0,0,NULL),(107,'militare','Scarica d\'adrenalina','Il personaggio quando entra in stato di COMA può, simulando un \"urlo belluino\" (o altro effetto<br>scenografico simile ad alto tasso di testosterone), subire BLOCCO! TEMPO 1 ORA! alla batteria e ritorna<br>a pieni punti ferita e punteggio Shield al massimo.',1,8,-1,'personale','attivo',0,0,0,NULL),(108,'militare','Farsi scudo','Se il personaggio impugna un Mitragliatore Pesante può dichiarare IMMUNE! ad un colpo subito ma<br>l\'arma subisce l\'effetto BLOCCO! Eccezioni sono le chiamate DISINTEGRAZIONE! (applicata comunque al<br>bersaglio) e le chiamate MUTILAZIONE! o CREPA! che infliggono all\'arma che la subisce<br>DISINTEGRAZIONE! Invece di BLOCCO!.',1,9,NULL,'personale','passivo',0,0,0,NULL),(109,'militare','Addestramento fisico 2','I Punti ferita del personaggio aumentano permanentemente di 2 (questa abilità sostituisce<br>ADDESTRAMENTO FISICO I).',1,9,97,'personale','passivo',2,0,0,NULL),(110,'militare','Difendere gli altri','Il personaggio può dichiarare IMMUNE! ad una chiamata subita da un bersaglio entro 1 metro da lui,<br>subendo la chiamata al suo posto.',1,9,NULL,'personale','passivo',0,0,0,NULL),(111,'militare','Inarrestabile','Il personaggio può dichiarare IMMUNE! a una qualsiasi delle seguenti chiamate:<br>PARALISI! - CONFUSIONE! - SHOCK! - DISARMO! - SPINTA!.',1,9,112,'personale','attivo',0,0,0,NULL),(112,'militare','E\' solo un graffietto','Il personaggio può dichiarare IMMUNE! alla chiamata DOLORE!',1,9,93,'personale','passivo',0,0,0,NULL),(113,'militare','Bunker semovente','Il personaggio utilizzando un\'arma di classe Mitragliatore Pesante può, se appostato dietro un riparo,<br>camminare per un massimo di 10 metri fino a posizionarsi dietro un altro riparo contando come se fosse<br>stazionario e appostato ai fini del prerequisito \"Posizionamento\" per questa classe d\'arma.<br>(N.B. Puoi quindi sparare con un mitragliatore pesante mentre cammini tra un riparo e l\'altro.)',1,9,111,'personale','passivo',0,0,0,NULL),(114,'militare','Tempesta di metallo','Il personaggio, se sta già sparando con un\'arma di classe Mitragliatore Pesante, può dichiarare la prossima chiamata base dell\'arma aggiungendo IN QUEST\'AREA!.',1,9,NULL,'Area 10 metri','attivo',0,0,0,NULL),(115,'militare','Fuoco difensivo','Il personaggio se sta usando un\'arma di classe Mitragliatore pesante, dopo aver sparato ininterrottamente sullo stesso bersaglio ostile per 10 secondi, subisce BONUS! + 4 PUNTI SHIELD!<br><br>(N.b. Non è possibile cambiare bersaglio, ma è possibile sospendere il conteggio per cambiare caricatore, riprendendo quindi a sparare sullo stesso bersaglio)',1,9,114,'personale','passivo',0,0,0,NULL),(116,'militare','Ricarica scudo d\'emergenza','Quando il personaggio arriva a 0 punti Shield può subire la chiamata BONUS! +8 PUNTI SHIELD.',1,9,102,'personale','attivo',0,0,0,NULL),(117,'militare','Feel no pain','Se il personaggio subisce la chiamata MUTILAZIONE! ad un arto ignora la chiamata ARTEFATTO COMA! associata; l\'arto è comunque da sostituire e deve simulare il dolore estremo.',1,9,112,'personale','passivo',0,0,0,NULL),(118,'militare','Barricata','Il personaggio può imbracciare uno scudo di dimensione minima 140x80 e massima 200x100; se il personaggio poggia lo scudo e un ginocchio a terra, questo scudo permette di parare chiamate di danno fino a CRASH! compreso; qualora intercetti chiamate superiori, lo scudo subisce DISINTEGRAZIONE! ma la chiamata non viene comunque subita.<br>Qualora il personaggio non sia posizionato, funziona come un normale scudo. ',1,9,108,'personale','passivo',0,0,0,NULL),(119,'militare','Fortezza della solitudine','Il massimale base del valore di Shield del personaggio non è mai inferiore a 3 punti quando indossa una tuta da combattimento corazzata, neanche a seguito di oggetti equipaggiati.',1,9,NULL,'personale','passivo',0,0,0,NULL),(120,'militare','Interfacce protesiche avanzate','Se il personaggio viene colpito ad una locazione sintetica dalle chiamate COMA! o CREPA! può, subendo BLOCCO! alla batteria ed alla protesi interessata dal colpo, declassare la chiamata COMA! ad ARTEFATTO! A ZERO! oppure può declassare la chiamata CREPA! ad ARTEFATTO! MUTILAZIONE!.<br>Questa abilità non può essere utilizzata con una protesi d\'emergenza.<br><br>(NOTA: le chiamate sostitutive si ritengono da applicarsi SEMPRE alla locazione originale dell\'impatto, non possono essere deviate o rilocate su un\'altra parte del corpo o su un altro bersaglio.)',1,9,117,'personale','passivo',0,0,0,NULL),(121,'militare','Ultima parola','Il personaggio, dopo aver subito la chiamata CREPA! (non è sufficiente entrare in status Morto per conteggio) può rialzarsi con 50 Punti Ferita alocazionali, ma il suo Shield e la sua Batteria subiscono la chiamata BLOCCO! CONTINUO! Questo stato dura 1 minuto, durante i quali subisce tutte le chiamate di danno fino a QUADRUPLO come 1 singolo danno, le altre chiamate come 5 danni eccetto CREPA! e DISINTEGRAZIONE! che subisce normalmente. Passato il minuto o esauriti i Punti Ferita subisce la chiamata ARTEFATTO CREPA! e non può più utilizzare questa abilità.',1,9,NULL,'personale','passivo',0,0,0,NULL),(122,'militare','Yippie kay yay','Il personaggio dopo avere subito per almeno 10 secondi la chiamata DOLORE (senza quindi aver dichiarato IMMUNE o aver subito NEUTRALIZZA) può alzare di due la prossima chiamata di danno secondo la normale scala, fino ad A ZERO!',1,9,NULL,'personale','passivo',0,0,0,NULL),(123,'militare','Last man standing','Il personaggio per 1 minuto può dichiarare IMMUNE! a PARALISI! - PAURA! - CONFUSIONE! - SHOCK! - DISARMO! - DOLORE!, i suoi punti Shield vengono raddoppiati, i suoi Punti Ferita vengono raddoppiati e i suoi talenti attivi non avviano il Cooldown. Passato il minuto il personaggio subisce ARTEFATTO COMA!; una volta curato, subisce tutte le chiamate di status per il doppio del tempo e i suoi punti ferita sono dimezzati (arrotondati per difetto) fino alla fine della giornata di gioco.<br><br>Nota: se un personaggio con questi malus arriva ad avere Punti Ferita pari o inferiori a 0 (calcolo effettuato in base ai punti ferita standard, non quelli temporanei dovuti all\'abilità) il personaggio si considera aver avuto un collasso multiorgano e subisce immediatamente la chiamata ARTEFATTO CREPA!',1,9,-1,'personale','attivo',0,0,0,NULL),(124,'militare','Batteria aumentata','Il personaggio può utilizzare un massimo di 2 abilità Attive contemporaneamente invece di 1 sola per ogni attivazione. Così facendo somma i tempi di Cooldown.<br><br>NOTA: si può applicare questa abilità solo ai talenti da Assaltatore (sia Base che Avanzato)',1,10,NULL,'personale','passivo',0,0,0,NULL),(125,'militare','Tuta da combattimento MK2','Il punteggio di Shield totale garantito dalla tuta da combattimento equipaggiata aumenta di 1, se la tuta fornisce al personaggio almeno un punto Shield Base.',1,10,NULL,'personale','passivo',0,1,0,NULL),(126,'militare','Pistolero','Il personaggio se combatte impugnando contemporaneamente due armi di classe Pistola può sostituire il danno base dell\'arma con la chiamata SINGOLO! CONFUSIONE! Al prossimo colpo sparato (o solo CONFUSIONE! Nel caso il danno base dell\'arma fosse già SINGOLO!).',1,10,NULL,'personale','attivo',0,0,0,NULL),(127,'militare','Hotshot','Il personaggio utilizza la sua batteria per sovraccaricare la pistola sparando un colpo molto più potente.<br>Il personaggio può aumentare di 2 il danno del suo prossimo colpo (fino a COMA! compreso). L\'abilità è utilizzabile solo con pistole ad energia. Dopo aver sparato, la Batteria e la pistola subiscono la chiamata BLOCCO! CONTINUO!.',1,10,126,'personale','attivo',0,0,0,NULL),(128,'militare','Ambidestria','Il personaggio può impugnare un\'arma a una mano (pistola, arma da mischia corta se può utilizzarla) per mano e combattere utilizzando la mano secondaria.',1,10,NULL,'personale','passivo',0,0,0,NULL),(129,'militare','Addestramento fisico','I Punti Ferita del personaggio aumentano permanentemente di 1.',1,10,NULL,'personale','passivo',1,0,0,NULL),(130,'militare','Tiratore scelto','Il personaggio con le armi di classe Fucile di Precisione può aumentare di 1 il danno del prossimo colpo sparato. L\'abilità viene \"spesa\" anche se il colpo manca il bersaglio.<br><br>(NOTA: i potenziamenti seguono la normale scala di danno:<br>SINGOLO! - DOPPIO! - TRIPLO! - QUADRUPLO! - CRASH! - A ZERO!)',1,10,NULL,'personale','attivo',0,0,0,NULL),(131,'militare','Non a me, a lui!','Il personaggio se subisce PAURA! Può considerare qualunque personaggio cosciente e consenziente come riparo fisso per gli effetti della chiamata.',1,10,NULL,'personale','passivo',0,0,0,NULL),(132,'militare','Colpo perforante','Il personaggio, utilizzando un Fucile di Precisione, deve dichiarare CRASH! con il suo prossimo colpo.',1,10,138,'personale','attivo',0,0,0,NULL),(133,'militare','Braccia robuste','Il Personaggio può sparare con Shotgun e Fucili d\'Assalto impugnandoli con una sola mano.',1,10,-1,'personale','passivo',0,0,0,NULL),(134,'militare','Proiettili incendiari','Il personaggio se utilizza un Fucile di Precisione può aggiungere la chiamata FUOCO! al prossimo colpo sparato.',1,10,NULL,'personale','attivo',0,0,0,NULL),(135,'militare','Fuoco a terra','Il personaggio, se utilizza un Fucile di Precisione od uno Shotgun, può dichiarare per il prossimo colpo SPINTA X! al posto del danno dell\'arma, dove X corrisponde al danno causato (se il danno è superiore a QUADRUPLO! X assume come valore 7).',1,10,NULL,'personale','attivo',0,0,0,NULL),(136,'militare','Colpo non letale','Il personaggio può utilizzare la chiamata SHOCK! sparando con uno Shotgun con il prossimo colpo.',1,10,NULL,'personale','attivo',0,0,0,NULL),(137,'militare','Disarmare','Il personaggio può sostituire il danno effettuato con la chiamata DISARMO! con ogni arma da fuoco nella quale è competente. Il DISARMO! Si applica al prossimo colpo sparato.',1,10,NULL,'personale','attivo',0,0,0,NULL),(138,'militare','Mirare','Il personaggio, utilizzando un Fucile di Precisione, può dichiarare il prossimo colpo a dito su un bersaglio entro i 10 metri dopo aver simulato di mirare il suo obiettivo per 10 secondi.',1,10,-2,'10 metri','passivo',0,0,0,NULL),(139,'militare','Colpo sanguinante','Il personaggio può abbinare l\'effetto CONTINUO! al prossimo colpo.<br><br>(N.B. il tempo di Cooldown di questa abilità è 60 secondi e NON 30 secondi)',1,10,-1,'personale','attivo',0,0,0,NULL),(140,'militare','Arma selezionata','Il personaggio deve scegliere una tipologia di arma tra quelle in cui è addestrato. <br>Può aumentare di 1 il danno fatto con l\'arma prescelta secondo la scala <br>SINGOLO! - DOPPIO! - TRIPLO! - QUADRUPLO! - CRASH! - A ZERO!.<br>NOTA 1: non sono comprese nelle armi selezionabili le Granate.<br>NOTA 2: questo bonus è sommabile a qualunque altro bonus ai danni, eventualmente disponibile per il giocatore con l\'arma selezionata.',1,11,-6,'personale','passivo',0,0,0,NULL),(141,'militare','Pistola e coltello','Se il personaggio impugna un\'Arma da mischia corta e una Pistola, può dichiarare CONFUSIONE! con l\'arma da mischia ed aumentare di 1 le chiamate di danno effettuate con la pistola sul bersaglio confuso.<br><br>(NOTA: i potenziamenti seguono la seguente scala SINGOLO! - DOPPIO! - TRIPLO! - QUADRUPLO! - CRASH! - A ZERO!)',1,11,128,'personale','attivo',0,0,0,NULL),(142,'militare','Scarica accecante','Il personaggio può, utilizzando uno Shotgun, sostituire la sua prossima chiamata di danno con CONFUSIONE! IN QUEST\'AREA 3!.<br><br>(NOTA: l\'angolo formato dalle braccia per determinare l\'area d\'effetto DEVE essere 90°.)',1,11,136,'3 metri','attivo',0,0,0,NULL),(143,'militare','Gestione tattica','Quando il personaggio ha lo Shield ridotto a zero aumenta di 1 le chiamate fatte con le Armi da mischia.<br><br>(NOTA: i potenziamenti seguono la seguente scala SINGOLO! - DOPPIO! - TRIPLO! - QUADRUPLO! - CRASH! - A ZERO!)',1,11,NULL,'personale','passivo',0,0,0,NULL),(144,'militare','Resistere alla paura','Il personaggio può dichiarare IMMUNE! Alla chiamata PAURA!.',1,11,148,'personale','attivo',0,0,0,NULL),(145,'militare','Granate modificate','Il personaggio può aggiungere la chiamata CONFUSIONE! alla prossima granata lanciata.',1,11,NULL,'personale','attivo',0,0,0,NULL),(146,'militare','Bombe gemelle','Il personaggio può attaccare il cartellino Granata a una Granata che ne sia già fornita purché i cartellini delle due Granate siano identici, aumentando di 1 il danno base e aggiungendo 2 metri al raggio.',1,11,NULL,'personale','passivo',0,0,0,NULL),(147,'militare','Colpo di striscio','Dopo aver sparato un colpo con il fucile di precisione ad un bersaglio oltre i 10 metri, se il colpo è andato a vuoto, il personaggio potrà dichiarare a dito, su un bersaglio entro 1 metro da dove impatta il colpo, il danno scalato di uno secondo la scala:<br><br>SINGOLO! - DOPPIO! - TRIPLO! - QUADRUPLO! - CRASH! - A ZERO! - COMA!',1,11,138,'personale','attivo',0,0,0,NULL),(148,'militare','I morti non parlano','Se il personaggio ha subito almeno una ferita (Punti Ferita ridotti di almeno 1 punto a causa di danni) alla locazione vitale, può fingersi morto subendo CRASH! e BLOCCO! allo Shield. Se analizzato dichiara il suo status come CREPA!; tuttavia, se subisce una chiamata di danno, deve reagire muovendosi e rivelandosi.<br><br>(Nota Bene: Il Cooldown parte quando il personaggio si alza o compie altre azioni.)',1,11,152,'personale','attivo',0,0,0,NULL),(149,'militare','Colpo di mano','Il personaggio può dichiarare DISARMO! Con un colpo utilizzando un\'arma da mischia.',1,11,NULL,'personale','attivo',0,0,0,NULL),(150,'militare','Apriscatola','Il personaggio può aggiungere il descrittore DIRETTO! al prossimo colpo che sferrerà con un\'Arma da Mischia.',1,11,153,'personale','attivo',0,0,0,NULL),(151,'militare','Bomba adesiva','Il personaggio colpendo direttamente un Bersaglio con una granata può dichiarare la normale chiamata della granata, escludendo \"GRANATA!\" e \"RAGGIO X\". Se si manca fisicamente il bersaglio la granata è sprecata.',1,11,NULL,'personale','attivo',0,0,0,NULL),(152,'militare','Movimento occultato','Il personaggio è equipaggiato e addestrato all\'utilizzo di rifrattori ottici che gli permettono di restare invisibile per poco tempo. Quando attiva l\'abilità il personaggio può dichiarare su se stesso ATTENUAZIONE! Quante volte desidera per i prossimi 10 secondi. ',1,11,143,'personale','attivo',0,0,0,NULL),(153,'militare','Tempesta di lame','Il personaggio è un maestro nell\'uso di due lame in combattimento. Può utilizzare con il talento AMBIDESTRIA armi da mischia ad una mano di dimensione massime 130 cm.',1,11,128,'personale','passivo',0,0,0,NULL),(154,'militare','Bomba in buca','Il personaggio ha affinato il suo istinto di sopravvivenza: prima di essere colpito dagli effetti di GRANATA! può dichiarare IMMUNE! mimando di buttarsi a terra o dietro un riparo solido.',1,11,-1,'personale','attivo',0,0,0,NULL),(155,'militare','Gloria o morte','Il personaggio può attivare questa abilità urlando \"GLORIA O MORTE!\".<br>Da questo momento si considera avere punti ferita alocazionali pari ai punti ferita attuali della locazione vitale moltiplicati x 10 (fino ad un massimo di 40 punti ferita) e considera tutte le chiamate di danno come ARTEFATTO! TRIPLO! ad eccezione di CREPA! DISINTEGRAZIONE! E MUTILAZIONE! che subisce normalmente.<br>Il suo Shield, se presente, funziona normalmente.<br>Il personaggio deve lanciarsi in combattimento in mischia contro il più vicino bersaglio ostile.<br>Se tutti i bersagli ostili in vista sono morti prima di aver concluso i punti ferita il personaggio sviene e subisce ARTEFATTO COMA!; se viene abbattuto prima di aver terminato i bersagli ostili, o se non termina i bersagli entro 5 minuti, subisce invece ARTEFATTO! CREPA!<br><br><br>Ogni volta che utilizza questa abilità riduce il suo massimale di punti ferita di 1 per tutto l\'evento.',1,11,-8,'personale','attivo',0,0,0,NULL),(156,'militare','Opportunista','Quando il personaggio dichiara BONUS! su un bersaglio diverso da se stesso, può decidere di subire lo<br>stesso BONUS! a sua volta.',1,12,NULL,'personale','passivo',0,0,0,NULL),(157,'militare','Batteria ausiliare Medipack','Quando il personaggio utilizza un talento del Medipack, se il bersaglio dichiara IMMUNE! non fa partire il<br>Cooldown.',1,12,NULL,'personale','passivo',0,0,0,NULL),(158,'militare','Tuta da combattimento MK2','Il valore base dei punti Shield garantiti dalle locazioni equipaggiate con una tuta da combattimento<br>corazzata (come indicato a pag. 17) è moltiplicato per 1,5.',1,12,NULL,'personale','passivo',0,0,0,NULL),(159,'militare','Shield MK2','Se il personaggio ha almeno un Punto Shield base, guadagna +2 punti al suo valore globale.',1,12,NULL,'personale','passivo',0,2,0,NULL),(160,'militare','Controllo dello stress sul campo','Il personaggio può dichiarare NEUTRALIZZA! DOLORE! o NEUTRALIZZA! CONFUSIONE! su un bersaglio.',1,12,NULL,'10 metri','attivo',0,0,0,NULL),(161,'militare','Intervento d\'emergenza','Il personaggio può dichiarare RIMARGINAZIONE 1! su un bersaglio ferito dopo 30 secondi di interazione.',1,12,NULL,'Tocco','attivo',0,0,0,NULL),(162,'militare','Smuovere','Il personaggio può dichiarare NEUTRALIZZA SHOCK! Oppure NEUTRALIZZA PARALISI! toccando il<br>bersaglio.',1,12,NULL,'Tocco','attivo',0,0,0,NULL),(163,'militare','Medipack-Prime cure','Il personaggio può dichiarare BONUS! +3 PUNTI FERITA! toccando il bersaglio.',1,12,NULL,'Tocco','attivo',0,0,0,NULL),(164,'militare','Medipack-Antidolorifici ad alto spettro','Il valore di BONUS! Conferito con il Medipack è aumentato permanentemente di 1.',1,12,163,'personale','passivo',0,0,0,NULL),(165,'militare','Medipack-Nanochirurghi integrati','Il personaggio può dichiarare NEUTRALIZZA! MUTILAZIONE! Dopo 30 secondi di intervento simulato sul<br>bersaglio toccato.<br>(N.b. La locazione non ricresce miracolosamente: il bersaglio però potrà essere guarito anche se<br>necessita comunque di un innesto se vuole tornare ad usare la locazione colpita da mutilazione)',1,12,163,'Tocco','attivo',0,0,0,NULL),(166,'militare','Soccorritore di linea','Il personaggio, se sta impugnando solo una pistola e niente nell\'altra mano, può aumentare di 1 il danno<br>secondo la scala SINGOLO! - DOPPIO! - TRIPLO! - QUADRUPLO! - CRASH! - A ZERO!.<br>(NOTA: il bonus è sommabile a qualunque altro bonus disponibile per il giocatore con le pistole.)',1,12,-3,'personale','passivo',0,0,0,NULL),(167,'militare','Medipack-Resettare','Il personaggio può dichiarare NEUTRALIZZA! BONUS! ad un bersaglio non ostile.<br>Tempo Hacking: 10 secondi.',1,12,NULL,'Tocco','attivo',0,0,0,NULL),(168,'militare','Controller-Reinizializzazione dispositivi elettronici','Il personaggio può dichiarare NEUTRALIZZA! BLOCCO! su un qualunque impianto cibernetico (arto o<br>locazione vitale) che sta toccando.<br>Tempo Hacking: 10 secondi.',1,12,NULL,'Tocco','attivo',0,0,0,NULL),(169,'militare','Controller-Modifica frequenza shield','Il personaggio può dichiarare BONUS! +5 SHIELD! su un bersaglio equipaggiato con una Tuta da<br>Combattimento.<br>Tempo Hacking: 10 secondi.',1,12,NULL,'10 metri','attivo',0,0,0,NULL),(170,'militare','Controller-Miglioramento firmware innesti','Il personaggio può dichiarare BONUS! DIFESA MENTALE +1! Su un bersaglio.<br>Tempo Hacking: 10 secondi.<br>NOTA: se il bersaglio è privo di un qualunque tipo di innesto cerebrale DEVE dichiarare IMMUNE! Al<br>bonus sopra descritto.',1,12,NULL,'10 metri','attivo',0,0,0,NULL),(171,'militare','Controller-Campo difensivo','Il Personaggio può dichiarare BONUS! SHIELD +X! (dove X è il punteggio di Shield del personaggio)<br>RAGGIO 10!.<br>Tempo Hacking: 10 secondi.<br>Al termine, il personaggio subisce BLOCCO! CONTINUO! TEMPO 1 ORA! al proprio Controller.',1,12,-1,'Raggio 10 metri','attivo',0,0,0,NULL),(172,'militare','Protezione firmware avanzata','Il personaggio aumenta permanentemente di 1 il suo punteggio di Difesa Mentale.',1,13,NULL,'personale','passivo',0,0,1,NULL),(173,'militare','Schermatura celebrale','Il personaggio aumenta permanentemente di 2 il suo punteggio di Difesa Mentale (quest\'abilità va a<br>sostituire \"Protezione Firmware Avanzata\").',1,13,172,'personale','passivo',0,0,2,NULL),(174,'militare','Tuta corazzata \"\"Redentore\"\"','Il personaggio se equipaggiato con una tuta da combattimento corazzata aumenta di 2 il punteggio di<br>Shield ottenuto dalla suddetta tuta.<br>Una volta per giornata di gioco il personaggio, quando entra in status di Coma, può subire GUARIGIONE<br>5! Subendo quindi BLOCCO! CONTINUO! allo Shield.',1,13,NULL,'personale','passivo',0,2,0,NULL),(175,'militare','Angelo custode','Il personaggio, quando equipaggiato con uno Scudo e lo sta imbracciando, può dichiarare IMMUNE! Ad<br>una chiamata di danno su un bersaglio entro 1 metro da lui e subire quella chiamata sul suo Scudo.',1,13,NULL,'1 metro','attivo',0,0,0,NULL),(176,'militare','Non fa male! Non fa male!','Il personaggio quando armato con un Fucile d\'assalto può dichiarare DOLORE! in sostituzione al normale<br>danno portato dal colpo successivo.',1,13,NULL,'personale','attivo',0,0,0,NULL),(177,'militare','Controller-Stimolanti da battaglia','Il personaggio può dichiarare BONUS! DANNI +1!<br>Tempo Hacking: 10 secondi.',1,13,NULL,'10 metri','attivo',0,0,0,NULL),(178,'militare','Medico da battaglia','Il personaggio mentre è impegnato a prestare soccorso non può essere distratto da nessuno stimolo<br>inferiore ad una lesione fisica. Mentre sta utilizzando il Medipack per curare un bersaglio può dichiarare<br>IMMUNE! ai seguenti effetti: DOLORE! - PARALISI! - CONFUSIONE! - SHOCK! - DISARMO! - SPINTA!',1,13,179,'personale','passivo',0,0,0,NULL),(179,'militare','Mente razionale','Il personaggio può dichiarare IMMUNE! alla chiamata PAURA! su se stesso o NEUTRALIZZA PAURA!<br>toccando un altro bersaglio.',1,13,NULL,'personale/tocco','attivo',0,0,0,NULL),(180,'militare','Deviare energia','Il personaggio può spendere 6 Punti Shield per terminare un Cooldown attivo.',1,13,174,'personale','passivo',0,0,0,NULL),(181,'militare','Controller-Trasferimento energetico','Il personaggio può dichiarare BONUS! X SHIELD! (dove X sono i suoi punti Shield che vuole trasferire).<br>Tempo Hacking: 10 secondi.<br>NOTA: Il personaggio deve avere almeno 1 punto Shield attivo per poter effettuare il trasferimento.',1,13,NULL,'personale','attivo',0,0,0,NULL),(182,'militare','Controller-Potenziamento nanoriparatori','Il personaggio può dichiarare BONUS! +5 SHIELD! IMMUNE! a CRASH! su un qualunque bersaglio<br>equipaggiato con una tuta da combattimento.<br>Tempo Hacking: 10 secondi.',1,13,NULL,'10 metri','attivo',0,0,0,NULL),(183,'militare','Ultimo riparo','Il personaggio, se impugna uno scudo grande può dichiarare IMMUNE! ad una chiamata ad area o a<br>raggio; lo scudo impugnato subisce DISINTEGRAZIONE!',1,13,175,'personale','passivo',0,0,0,NULL),(184,'militare','Medipack-Vettore curativo aerodisperso','Il personaggio può, dopo 10 secondi di utilizzo del Medipack, dichiarare BONUS! +2 PUNTI FERITA!<br>RAGGIO 10!. Subisce quindi la dichiarazione BLOCCO! CONTINUO! TEMPO 5 MINUTI! al Medipack.',1,13,NULL,'Raggio 10 metri','attivo',0,0,0,NULL),(185,'militare','Medipack-Interfaccia biomeccanica di manutenzione e cura','Il personaggio può dichiarare BONUS! +2 PUNTI FERITA! e RIPARAZIONE 2! ad un bersaglio.<br>Tempo Hacking: 10 secondi.',1,13,NULL,'Tocco','attivo',0,0,0,NULL),(186,'militare','Medipack-Dispositivo di cura automatico d\'emergenza','Il personaggio, se cade in stato di Coma, può prima di cadere dichiarare BONUS! +1 PUNTO FERITA!<br>Raggio 10!. E subire BLOCCO! Al Medipack.',1,13,NULL,'personale','passivo',0,0,0,NULL),(187,'militare','Inganno della nera signora','Il personaggio può sostituire il danno della sua arma con la chiamata GUARIGIONE 2! VELENO! BONUS!<br>+ X PUNTI FERITA! Dove X è il danno che avrebbe causato, con un massimale di 4.<br>(N.B. il tempo di Cooldown di questa abilità è 60 secondi e NON 30 secondi)',1,13,-1,'personale','attivo',0,0,0,NULL),(188,'militare','Batteria schermata','Quando utilizzi un talento collegato al controller, se il bersaglio dichiara IMMUNE! ad ELETTRO!, il<br>Cooldown non viene attivato.',1,14,NULL,'personale','passivo',0,0,0,NULL),(189,'militare','Non a me, a lui!','Quando il personaggio subisce una chiamata di natura ELETTRO! può dichiarare IMMUNE! ma DEVE<br>ripetere la stessa chiamata (priva della natura ELETTRO!) su un bersaglio entro 10 metri a lui NON<br>ostile.',1,14,NULL,'personale','attivo',0,0,0,NULL),(190,'militare','Tuta da combattimento MK2','Il punteggio di Shield garantito da una tuta da combattimento equipaggiata aumenta di 1, se la tuta<br>fornisce al personaggio almeno un punto Shield Base.',1,14,NULL,'personale','passivo',0,1,0,NULL),(191,'militare','Shield MK2','Se il personaggio ha almeno un Punto Shield base, guadagna +2 punti al suo valore globale.',1,14,NULL,'personale','passivo',0,2,0,NULL),(192,'militare','Tempesta di piombo','Il personaggio può aggiungere PAURA! al prossimo colpo sparato con un mitragliatore pesante.',1,14,NULL,'personale','attivo',0,0,0,NULL),(193,'militare','Perfezionamento tattich d\'intrusione','Il personaggio ha + 1 permanente alle sue dichiarazioni di Hacking.',1,14,194,'personale','passivo',0,0,0,NULL),(194,'militare','Brute force','Il personaggio può ripetere il lancio di un programma di Hacking: per ogni lancio così effettuato può<br>aumentare di + 1 il valore di lancio del programma, fino a quando il bersaglio non ha subito la chiamata<br>lanciata o se il personaggio compie altre azioni.<br>Se un bersaglio dichiara immune a ELETTRO! L\'abilità si interrompe immediatamente.<br>(Esempio: Thug Sta lanciando il potere di distrazione su Erebron. Attende 10 secondi e poi dichiara<br>\"ELETTRO 1! CONFUSIONE!\" ad Erebron, il quale dichiara IMMUNE! e prosegue in quello che sta<br>facendo. Thug continua il conteggio dei 10 secondi successivi, per poi dichiarare \"ELETTRO 2!<br>CONFUSIONE!\" ad Erebron, il quale risponde ancora IMMUNE! e prosegue nelle sue azioni. Thug<br>continua il conteggio dei 10 secondi successivi, per poi dichiarare \"ELETTRO 3! CONFUSIONE!\" ad<br>Erebron, il quale questa volta subisce la chiamata. Il Cooldown di Thug inzierà ora, e lui potrà fare<br>nuove azioni.)',1,14,-4,'personale','passivo',0,0,0,NULL),(195,'militare','Farsi scudo','Se il personaggio impugna un Mitragliatore Pesante può dichiarare IMMUNE! ad un colpo subito ma<br>l\'arma subisce l\'effetto BLOCCO! Eccezioni sono le chiamate DISINTEGRAZIONE! (applicata comunque al<br>bersaglio) e le chiamate MUTILAZIONE! o CREPA! che infliggono all\'arma utilizzata la chiamata<br>DISINTEGRAZIONE! invece di BLOCCO!.',1,14,NULL,'personale','passivo',0,0,0,NULL),(196,'militare','Controller-Distrazione','Il personaggio può dichiarare ELETTRO 1! CONFUSIONE!<br>Tempo Hacking: 10 secondi.',1,14,NULL,'10 metri','attivo',0,0,0,NULL),(197,'militare','Controller-Disarmare','Il personaggio può dichiarare ELETTRO 1! DISARMO !<br>Tempo Hacking: 10 secondi.',1,14,NULL,'10 metri','attivo',0,0,0,NULL),(198,'militare','Controller-Dolore','Il personaggio può dichiarare ELETTRO 1! DOLORE!<br>Tempo Hacking: 10 secondi.',1,14,NULL,'10 metri','attivo',0,0,0,NULL),(199,'militare','Controller-Rottura','Il personaggio può dichiarare ELETTRO 1! CRASH! Shield.<br>Tempo Hacking: 10 secondi.<br>(N.b. Questa abilità ha effetto solo sullo Shield)',1,14,NULL,'10 metri','attivo',0,0,0,NULL),(200,'militare','Controller-Erosione','Il personaggio può dichiarare ELETTRO 1! SINGOLO! Su un bersaglio. Dopo averlo effettuato può<br>decidere di rimandare il cool-down standard e, dopo altri 10 secondi, può ripetere la chiamata sullo<br>stesso bersaglio. Può ripetere la stessa dichiarazione, sempre sullo stesso bersaglio e sempre ad<br>intervalli di 10 secondi, un numero di volte illimitato. Quando decide di interrompere la catena parte il<br>cool-down standard dell\'abilità. L\'abilità si considera interrotta se il personaggio è in status incapacitato.<br>Tempo Hacking: 10 secondi.',1,14,NULL,'10 metri','attivo',0,0,0,NULL),(201,'militare','Controller-Paralisi','Il personaggio può dichiarare ELETTRO 1! PARALISI!<br>Tempo Hacking : 10 secondi.',1,14,NULL,'10 metri','attivo',0,0,0,NULL),(202,'militare','Schermatura celebrale','Il valore di Difesa mentale del personaggio aumenta di 1.',1,14,NULL,'personale','passivo',0,0,1,NULL),(203,'militare','Hacking ad area','Il personaggio può, aumentando di 30 secondi il tempo di Hacking, aggiungere IN QUEST\'AREA! al<br>talento di Hacking che sta effettuando, alzando il valore di ELETTRO! a 4.<br>Dopo la dichiarazione subisce CRASH! e BLOCCO! CONTINUO! Alla Batteria.<br>(NOTA: l\'angolo formato dalle braccia per determinare l\'area d\'effetto DEVE essere massimo 90°.)<br>(N.B. Non può mai essere utilizzata con in combinazione con Brute-Force).',1,14,-1,'personale','passivo',0,0,0,NULL),(204,'militare','Parassita elettrico','Il personaggio mentre è in fase di cool-down può, toccando un bersaglio consenziente e non già sotto<br>BLOCCO!, dichiarare BLOCCO! Batteria! TEMPO 1 minuto! E abbreviare il suo cool-down attualmente<br>attivo di 30 secondi fino ad arrivare a minimo 0 secondi.',1,15,NULL,'Contatto','passivo',0,0,0,NULL),(205,'militare','Amplificazione dell\'area','Il personaggio quando usa una granata può aumentare di 2 metri il raggio della granata.',1,15,NULL,'personale','passivo',0,0,0,NULL),(206,'militare','Schermatura celebrale avanzata','Il valore di Difesa mentale del personaggio aumenta di 2. (Sostituisce il bonus dato da Schermatura Cerebrale)',1,15,173,'personale','passivo',0,0,2,NULL),(207,'militare','Controller-Sovraccarico elettromagnetico','Il personaggio può dichiarare ELETTRO 1! TRIPLO! su fino a 3 bersagli differenti.<br>Tempo Hacking : 10 secondi.<br>(N.B. Non può mai essere utilizzata con Hacking ad area)',1,15,NULL,'10 metri','attivo',0,0,0,NULL),(208,'militare','Controller-Smorzamento neurale','Il personaggio può dichiarare ELETTRO 1! BONUS! MENO -1 DANNI!<br>Tempo Hacking : 10 secondi.',1,15,NULL,'10 metri','attivo',0,0,0,NULL),(209,'militare','Granata congelante','Il personaggio può aggiungere la chiamata GELO! Al prossimo colpo con il lanciagranate.',1,15,205,'personale','attivo',0,0,0,NULL),(210,'militare','Fuoco di copertura','Il personaggio può dichiarare PAURA! IN QUEST\'AREA! Se impugna un mitragliatore pesante e sta già<br>sparando nella stessa direzione. Il personaggio dovrà continuare a sparare nella direzione generica in<br>cui ha effettuato la dichiarazione, fermandosi solo quando avrà terminato il caricatore o sarà in qualche<br>modo incapacitato.<br>(NOTA: l\'angolo formato dalle braccia per determinare l\'area d\'effetto DEVE essere massimo 90°.)',1,15,NULL,'personale','attivo',0,0,0,NULL),(211,'militare','Colpo di sponda','Dopo aver sparato un colpo con il lanciagranate, se il colpo manca il bersaglio il personaggio potrà<br>dichiarare a dito, su un bersaglio entro 1 metro da dove impatta il colpo, il danno scalato di uno secondo<br>la scala:<br>SINGOLO! - DOPPIO! - TRIPLO! - QUADRUPLO! - CRASH! - A ZERO! - COMA!',1,15,209,'personale','attivo',0,0,0,NULL),(212,'militare','Confettone','Il personaggio può, strappando il cartellino di una granata da lancio, effettuare la stessa chiamata<br>(senza dichiarare GRANATA! RAGGIO X!) con il prossimo colpo sparato con il lanciagranate.',1,15,209,'personale','attivo',0,0,0,NULL),(213,'militare','Controller-Alterare percezioni','Il personaggio può dichiarare ELETTRO 1! COMANDO! UCCIDILO!<br>Tempo Hacking : 10 secondi.<br>(N.B. Non può essere utilizzata con Hacking ad area)',1,15,NULL,'10 metri','attivo',0,0,0,NULL),(214,'militare','Controller-Svanire dalla mente','Il personaggio può dichiarare ELETTRO 1! COMANDO! IGNORAMI!<br>Tempo Hacking : 10 secondi.',1,15,213,'10 metri','attivo',0,0,0,NULL),(215,'militare','Controller-Fotografia','Il personaggio può dichiarare ELETTRO 1! PARALISI! TEMPO 1 Minuto!<br>Tempo Hacking : 10 secondi.',1,15,214,'10 metri','attivo',0,0,0,NULL),(216,'militare','Controller-Blocco totale','Il personaggio può dichiarare ELETTRO1! CRASH! BLOCCO!<br>Tempo Hacking : 10 secondi.<br>(N.B. Non può mai essere utilizzata con Hacking ad area)<br>(N.B. il tempo di Cooldown di questa abilità è 60 secondi e NON 30 secondi)',1,15,-7,'10 metri','attivo',0,0,0,NULL),(217,'militare','Controller-Cortocircuito','Il personaggio può dichiarare ELETTRO 1! NEUTRALIZZA BONUS!<br>Tempo Hacking : 10 secondi.',1,15,214,'10 metri','attivo',0,0,0,NULL),(218,'militare','Saturare l\'area','Il personaggio può aggiungere la chiamata IN QUEST\'AREA! al danno base della sua arma se impugna un mitragliatore pesante. Fino a quando continua a sparare può ripetere la dichiarazione IN QUEST\'AREA! Una volta ogni cinque secondi finchè non si muove o viene incapacitato.<br><br>(NOTA: l\'angolo formato dalle braccia per determinare l\'area d\'effetto DEVE essere massimo 90°.)',1,15,210,'personale','attivo',0,0,0,NULL),(219,'militare','Front toward enemy','Il personaggio, subendo la chiamata CRASH!, può strappare un cartellino Granata e fare la dichiarazione della granata sostituendo la chiamata GRANATA! RAGGIO X! con la chiamata IN QUEST\'AREA!<br><br>(NOTA: l\'angolo formato dalle braccia per determinare l\'area d\'effetto DEVE obbligatoriamente essere compreso tra 90° e 180°.)',1,15,-1,'personale','attivo',0,0,0,NULL);
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
  `mente_base_classe` int(5) NOT NULL DEFAULT '0',
  `shield_max_base_classe` int(5) NOT NULL DEFAULT '0',
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
INSERT INTO `classi` VALUES (1,'civile','Sportivo',0,0,NULL),(2,'civile','Giornalista',0,0,NULL),(3,'civile','Netrunner',0,0,NULL),(4,'civile','Tecnico',0,0,NULL),(5,'civile','Biomedico',0,0,NULL),(6,'civile','Guardia di Sicurezza',0,0,NULL),(7,'civile','Sciacallo',0,0,NULL),(8,'militare','Guardiano Base',1,6,NULL),(9,'militare','Guardiano Avanzata',0,0,8),(10,'militare','Assaltatore Base',0,3,NULL),(11,'militare','Assaltatore Avanzata',0,0,10),(12,'militare','Supporto Base',1,6,NULL),(13,'militare','Supporto Avanzata',0,0,12),(14,'militare','Guastatore Base',2,3,NULL),(15,'militare','Guastatore Avanzata',0,0,14);
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
  `titolo_evento` varchar(255) NOT NULL,
  `data_inizio_evento` date NOT NULL,
  `ora_inizio_evento` time NOT NULL,
  `data_fine_evento` date NOT NULL,
  `ora_fine_evento` time NOT NULL,
  `luogo_evento` varchar(255) NOT NULL,
  `costo_evento` decimal(7,2) NOT NULL,
  `costo_maggiorato_evento` decimal(7,2) NOT NULL,
  `pubblico_evento` tinyint(1) NOT NULL DEFAULT '0',
  `punti_assegnati_evento` tinyint(1) NOT NULL DEFAULT '0',
  `creatore_evento` varchar(255) NOT NULL,
  `note_evento` text,
  PRIMARY KEY (`id_evento`),
  KEY `fk_creatori_evento_idx` (`creatore_evento`),
  CONSTRAINT `fk_creatori_evento` FOREIGN KEY (`creatore_evento`) REFERENCES `giocatori` (`email_giocatore`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventi`
--

LOCK TABLES `eventi` WRITE;
/*!40000 ALTER TABLE `eventi` DISABLE KEYS */;
INSERT INTO `eventi` VALUES (2,'Test','2018-03-27','14:00:00','2018-03-28','16:00:00','Veano, PC, Italia',50.00,75.00,1,1,'Rebootlivebg@gmail.com','Test'),(4,'Test 2','2018-03-29','14:00:00','2018-03-31','16:00:00','Vietnam',2.00,2.00,1,0,'Rebootlivebg@gmail.com','2222'),(5,'test 3','2018-03-28','11:00:00','2018-03-28','11:30:00','Casablanca, Marocco',22.00,22.00,0,0,'Rebootlivebg@gmail.com','222'),(7,'Prova accapi','2018-04-06','14:00:00','2018-04-07','16:00:00','Tokyo, Giappone',30.00,40.00,0,0,'miroku_87@yahoo.it','PRov<br />\nad<br />\n<br />\nandare <br />\naccapo');
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
  `eliminato_giocatore` tinyint(1) NOT NULL DEFAULT '0',
  `ruoli_nome_ruolo` varchar(255) NOT NULL DEFAULT 'giocatore',
  `note_giocatore` text,
  `note_staff_giocatore` text,
  PRIMARY KEY (`email_giocatore`),
  KEY `fk_ruolo_idx` (`ruoli_nome_ruolo`),
  CONSTRAINT `fk_ruolo` FOREIGN KEY (`ruoli_nome_ruolo`) REFERENCES `ruoli` (`nome_ruolo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giocatori`
--

LOCK TABLES `giocatori` WRITE;
/*!40000 ALTER TABLE `giocatori` DISABLE KEYS */;
INSERT INTO `giocatori` VALUES ('andrea.silvestri87@yahoo.it','1e4e888ac66f8dd41e00c5a7ac36a32a9950d271','Andrea','Test','2018-03-15 22:09:19',0,'giocatore','',NULL),('ciminieraster@gmail.com','d33ba56c90e57f324abe30f2e805b822f49388c5','Matteo','Rossi','2018-03-15 23:33:24',0,'giocatore','',NULL),('fabio.cozzi151085@gmail.com','8ce3ed3af51b927207587973a66b345b41ae19f8','Fabio','Cozzi','2018-03-16 22:16:51',0,'giocatore','ho problemi mentali scemi.',NULL),('federico.case@gmail.com','ae342475c4e32236dcacf3363f43926bf5f3faf1','Federico ','Casé','2018-03-15 22:12:01',0,'giocatore','No',NULL),('giuliperru@gmail.com','889f56388d2d0c8e0afed3e7b7d0386250ac0a10','Giulia ','Perrucci','2018-03-16 13:43:56',0,'giocatore','',NULL),('larpworkshop@outlook.it','d6c27489dce1910792135f01622541e4a313f14e','Mirko','Mangone ','2018-03-19 14:42:26',0,'giocatore','No ',NULL),('mag87@outlook.it','a7657749b6d237ffb8428aff6f86001a5c2e68b0','Margherita','Tunesi','2018-03-19 13:52:22',0,'giocatore','',NULL),('miroku_87@yahoo.it','59791082241d06f557c340325be6d34b8b0172ea','Andrea','Silvestri','2018-03-15 01:07:38',0,'admin','',NULL),('Rebootlivebg@gmail.com','e2f44ea50aa6211d502c5f2818482ce02cdca473','Reboot','Admin','2018-03-15 22:07:29',0,'admin','',NULL),('stefy.bancone@gmail.com','5183a55cd8a9602c8ef44802bcb69e0498c46b62','Stefania','Bancone','2018-03-15 23:49:50',0,'giocatore','',NULL);
/*!40000 ALTER TABLE `giocatori` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 */ /*!50003 TRIGGER `giocatori_BEFORE_INSERT` BEFORE INSERT ON `giocatori` FOR EACH ROW
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
  `nome_grant` varchar(255) NOT NULL,
  `descrizione_grant` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nome_grant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grants`
--

LOCK TABLES `grants` WRITE;
/*!40000 ALTER TABLE `grants` DISABLE KEYS */;
INSERT INTO `grants` VALUES ('aggiungiAbilitaAlPG_altri','L\'utente può assegnare nuove abilità a personaggi non suoi.'),('aggiungiAbilitaAlPG_proprio','L\'utente può assegnare nuove abilità a un proprio personaggio.'),('aggiungiClassiAlPG_altri','L\'utente può assegnare nuove classi a personaggi non suoi.'),('aggiungiClassiAlPG_proprio','L\'utente può assegnare nuove classi a un proprio personaggio.'),('aggiungiOpzioniAbilita_altri','L\'utente può aggiungere opzioni alle abilità di altri.'),('aggiungiOpzioniAbilita_proprio','L\'utente può aggiungere opzioni alle proprie abilità.'),('associaPermessi','L\'utente può associare il permesso di compiere un\'azione ad un dato ruolo.'),('creaEvento','L\'utente può creare eventi di gioco.'),('creaPG','L\'utente può creare un nuovo personaggio.'),('creaRuolo','L\'utente può creare un nuovo ruolo.'),('disiscriviPG_altri','L\'utente può disicrivere un personaggio non suo.'),('disiscriviPG_proprio','L\'utente può disiscrivere un suo personaggio.'),('eliminaEvento','L\'utente può eliminare un evento precedentemente creato.'),('eliminaGiocatore','L\'utente può eliminare altri giocatori.'),('eliminaPG_altri','L\'utente può eliminare un personaggio di altri.'),('eliminaPG_proprio','L\'utente può eliminare un proprio personaggio.'),('eliminaRuolo','L\'utente può eliminare un ruolo già esistente.'),('inviaMessaggio','L\'utente può inviare messaggi.'),('iscriviPg_altri','L\'utente può iscrivere pg di altri a un evento live.'),('iscriviPg_proprio','L\'utente può iscrivere il proprio pg a un evento live.'),('loginPG_altri','L\'utente può loggarsi con il pg di altri utenti.'),('loginPG_proprio','L\'utente può loggarsi con un proprio pg.'),('modificaEvento','L\'utente può modificare i dati di un evento già esistente.'),('modificaIscrizionePG_note_iscrizione_altri','L\'utene può modificare le note dell\'\'iscrizione ad un evento di un pg di altri.'),('modificaIscrizionePG_note_iscrizione_proprio','L\'utene può modificare le note dell\'\'iscrizione ad un evento di un suo pg.'),('modificaIscrizionePG_pagato_iscrizione_altri','L\'utente può modificare lo stato di pagato di un pg altrui per l\'iscrizione a un evento.'),('modificaIscrizionePG_pagato_iscrizione_proprio','L\'utente può modificare lo stato di pagato di un suo pg per l\'iscrizione a un evento.'),('modificaPG_anno_nascita_personaggio_altri','L\'utente può modificare l\'anno di nascita di un pg altrui.'),('modificaPG_anno_nascita_personaggio_proprio','L\'utente può modificare l\'anno di nascita di un proprio pg.'),('modificaPG_background_personaggio_altri','L\'utente può modificare il background di un personaggio qualsiasi.'),('modificaPG_background_personaggio_proprio','L\'utente può modificare il proprio background.'),('modificaPG_contattabile_personaggio_altri','L\'utente può rendere un utente non suo contattabile o meno.'),('modificaPG_contattabile_personaggio_proprio','L\'utente può rendere un utente suo contattabile o meno.'),('modificaPG_credito_personaggio_altri','L\'utente può modificare il credito degli altri personaggi.'),('modificaPG_credito_personaggio_proprio','L\'utente può modificare il credito del proprio personaggio.'),('modificaPG_nome_personaggio_altri','L\'utente può modificare il nome degli altri personaggi.'),('modificaPG_nome_personaggio_proprio','L\'utente può modificare il nome del proprio personaggio.'),('modificaPG_note_master_personaggio_altri','L\'utente può inserire delle note master.'),('modificaPG_note_master_personaggio_proprio','L\'utente può inserire delle note master ai propri pg'),('modificaPG_pc_personaggio_altri','L\'utente può modificare i punti combattimento di altri PG.'),('modificaPG_pc_personaggio_proprio','L\'utente può modificare i propri punti combattimento.'),('modificaPG_px_personaggio_altri','L\'utente può modificare i punti esperienza di altri PG.'),('modificaPG_px_personaggio_proprio','L\'utente può modificare i propri punti esperienza.'),('modificaUtente_note_giocatore_altri','L\'utente può modificare le note di altri utenti.'),('modificaUtente_note_giocatore_proprio','L\'utente può modificare le proprie note.'),('modificaUtente_password_giocatore_altri','L\'utente può modificare la password di altri utenti.'),('modificaUtente_password_giocatore_proprio','L\'utente può modificare la propria password.'),('mostraPersonaggi_altri','L\'utente potrà visualizzare i personaggi creati dagli altri utenti.'),('mostraPersonaggi_proprio','L\'utente potrà visualizzare la pagina dei suoi personaggi.'),('pubblicaEvento','L\'utente può rendere pubblico a tutti i giocatori un evento creato in precedenza.'),('recuperaEventi','L\'utente può leggere gli eventi inseriti a database.'),('recuperaListaEventi','L\'utente può vedere tutti gli eventi inseriti nel database.'),('recuperaListaGiocatori','L\'utente può visualizzare una lista di tutti i giocatori iscritti.'),('recuperaListaIscrittiAvanzato','L\'utente può vedere le informazioni base e di pagamento dei pg iscritit all\'evento live.'),('recuperaListaIscrittiBase','L\'utente può vedere le informaizoni base dei pg iscritti all\'evento live.'),('recuperaListaPermessi','L\'utente può scaricare dal database la lista di permessi presenti.'),('recuperaMessaggi','L\'utente può recuperare i propri messaggi e quelli del pg loggato.'),('recuperaMessaggioSingolo_altri','L\'utente può visualizzare il testo di un messaggio di altri.'),('recuperaMessaggioSingolo_proprio','L\'utente può visualizzare il testo di un proprio messaggio.'),('recuperaMessaggi_altri','L\'utente può visualizzare i messaggi degli altri giocatori.'),('recuperaMessaggi_proprio','L\'utente può visualizzare i propri messaggi.'),('recuperaNoteMaster_altri','L\'utente può visualizzare le note master degli altri giocatori.'),('recuperaNoteMaster_proprio','L\'utente può visualizzare le proprie note master.'),('recuperaNoteUtente_altri','L\'utente può leggere le note di altri utenti.'),('recuperaNoteUtente_proprio','L\'utente può leggere le proprie note.'),('recuperaOpzioniAbilita','L\'utente può recuperare dal db le opzioni extra di varie abilità.'),('recuperaPermessiDeiRuoli','L\'utente può scaricare da database i permessi associati ad ogni ruolo.'),('recuperaRuoli','L\'utente può recuperare una lista di tutti i ruoli esistenti.'),('recuperaStorico_altri','L\'utente può guardare tutte le azioni compiute sui personaggi degli altri.'),('recuperaStorico_proprio','L\'utente può guardare tutte le azioni compiute sul personaggio selezionato.'),('rimuoviAbilitaPG_altri','L\'utente può eliminare una abilità di un personaggio non suo.'),('rimuoviAbilitaPG_proprio','L\'utente può eliminare una abilità di un proprio personaggio.'),('rimuoviClassePG_altri','L\'utente può eliminare la classe di un personaggio non suo.'),('rimuoviClassePG_proprio','L\'utente può eliminare la classe di un proprio personaggio.'),('ritiraEvento','L\'utente può ritrare un evento pubblicato.'),('stampaCartelliniPG','L\'utente può stampare i cartellini dei personaggi.'),('visualizza_pagina_crea_evento','L\'utente può accedere alla pagina che permette di creare un evento.'),('visualizza_pagina_crea_pg','L\'utente può visualizzare la pagina per creare un personaggio.'),('visualizza_pagina_gestione_eventi','L\'utente può entrare nella sezione per la gestione degli eventi.'),('visualizza_pagina_gestione_giocatori','L\'utente può entrare nella sezione per la modifica dei dati dei giocatori.'),('visualizza_pagina_gestione_oggetti_ingioco','L\'utente può entrare nella sezione per la creazione, modifica e stampa degli oggetti in gioco.'),('visualizza_pagina_gestione_permessi','L\'utente può entrare nella sezione per la creazione e modifica dei ruoli e dei permessi ad essi associati.'),('visualizza_pagina_lista_pg','L\'utente può visualizzare la pagina con la lista dei personaggi.'),('visualizza_pagina_main','L\'utente può visualizzare la pagina principale del sito.'),('visualizza_pagina_messaggi','L\'utente può accedere alla sezione messaggi.'),('visualizza_pagina_negozio_abilita','L\'utente può acquistare abilità'),('visualizza_pagina_profilo','L\'utente può visualizzare la pagina del proprio profilo.'),('visualizza_pagina_scheda_pg','L\'utente può visualizzare la pagina con i dettagli di un personaggio.'),('visualizza_pagina_stampa','L\'utente può accedere alla pagina di stampa dei cartellini.');
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
  `pagato_iscrizione` tinyint(1) NOT NULL,
  `tipo_pagamento_iscrizione` set('Manuale','PayPal','PostePay','Bonifico') NOT NULL,
  `note_iscrizione` text,
  PRIMARY KEY (`eventi_id_evento`,`personaggi_id_personaggio`),
  KEY `fk_eventi_has_personaggi_personaggi1_idx` (`personaggi_id_personaggio`),
  KEY `fk_eventi_has_personaggi_eventi1_idx` (`eventi_id_evento`),
  CONSTRAINT `fk_eventi_has_personaggi_eventi1` FOREIGN KEY (`eventi_id_evento`) REFERENCES `eventi` (`id_evento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_eventi_has_personaggi_personaggi1` FOREIGN KEY (`personaggi_id_personaggio`) REFERENCES `personaggi` (`id_personaggio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iscrizione_personaggi`
--

LOCK TABLES `iscrizione_personaggi` WRITE;
/*!40000 ALTER TABLE `iscrizione_personaggi` DISABLE KEYS */;
INSERT INTO `iscrizione_personaggi` VALUES (2,79,1,'Manuale','Io'),(4,54,0,'',''),(4,79,1,'',''),(4,81,1,'',''),(4,83,1,'',''),(4,85,1,'','');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messaggi_fuorigioco`
--

LOCK TABLES `messaggi_fuorigioco` WRITE;
/*!40000 ALTER TABLE `messaggi_fuorigioco` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messaggi_ingioco`
--

LOCK TABLES `messaggi_ingioco` WRITE;
/*!40000 ALTER TABLE `messaggi_ingioco` DISABLE KEYS */;
INSERT INTO `messaggi_ingioco` VALUES (5,58,60,'Prova','Prova',0,'2018-03-16 09:54:49',NULL),(6,84,79,'test','2222',0,'2018-03-27 22:11:40',NULL);
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
-- Table structure for table `opzioni_abilita`
--

DROP TABLE IF EXISTS `opzioni_abilita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opzioni_abilita` (
  `abilita_id_abilita` int(255) NOT NULL,
  `opzione` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`abilita_id_abilita`,`opzione`),
  CONSTRAINT `fk_id_abilita` FOREIGN KEY (`abilita_id_abilita`) REFERENCES `abilita` (`id_abilita`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opzioni_abilita`
--

LOCK TABLES `opzioni_abilita` WRITE;
/*!40000 ALTER TABLE `opzioni_abilita` DISABLE KEYS */;
INSERT INTO `opzioni_abilita` VALUES (13,'Contatto'),(13,'Droga'),(17,'Cronaca Nera'),(17,'Cronaca Rosa'),(17,'Economia'),(17,'Giornalismo Spazzatura'),(17,'Politica'),(17,'Sport'),(18,'Cronaca Nera'),(18,'Cronaca Rosa'),(18,'Economia'),(18,'Giornalismo Spazzatura'),(18,'Politica'),(18,'Sport'),(19,'Cronaca Nera'),(19,'Cronaca Rosa'),(19,'Economia'),(19,'Giornalismo Spazzatura'),(19,'Politica'),(19,'Sport'),(20,'Cronaca Nera'),(20,'Cronaca Rosa'),(20,'Economia'),(20,'Giornalismo Spazzatura'),(20,'Politica'),(20,'Sport'),(89,'Alcolismo'),(89,'Iniezione'),(140,'Armi da Mischia'),(140,'Fucile d\'Assalto'),(140,'Fucile di Precisione'),(140,'Pistola'),(140,'Shotgun');
/*!40000 ALTER TABLE `opzioni_abilita` ENABLE KEYS */;
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
  `anno_nascita_personaggio` int(11) NOT NULL DEFAULT '271',
  `data_creazione_personaggio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `contattabile_personaggio` tinyint(1) NOT NULL DEFAULT '1',
  `eliminato_personaggio` tinyint(1) NOT NULL DEFAULT '0',
  `giocatori_email_giocatore` varchar(255) NOT NULL,
  `note_master_personaggio` text,
  PRIMARY KEY (`id_personaggio`),
  KEY `fk_giocatore_personaggio_idx` (`giocatori_email_giocatore`),
  CONSTRAINT `fk_giocatore_pg` FOREIGN KEY (`giocatori_email_giocatore`) REFERENCES `giocatori` (`email_giocatore`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personaggi`
--

LOCK TABLES `personaggi` WRITE;
/*!40000 ALTER TABLE `personaggi` DISABLE KEYS */;
INSERT INTO `personaggi` VALUES (54,'John Doe',NULL,NULL,153,16,0,247,'2018-03-15 16:24:22',1,0,'miroku_87@yahoo.it',NULL),(58,'Seamus Archer ',NULL,NULL,101,5,0,271,'2018-03-15 22:30:28',1,0,'federico.case@gmail.com',NULL),(59,'Anthony Corallo',NULL,'Reclutato%20in%20giovane%20et%C3%A0%2C%20si%20occupa%20ora%20di%20piccoli%20spacci%20e%20reclutamenti.%0AFedele%20alla%20famiglia%2C%20cerca%20in%20ogni%20modo%20di%20portare%20benefici%2C%20cercando%20soprattutto%20guadagni%20a%20lungo%20termine.%0ASegue%20da%20qualche%20anno%20i%20reclutamenti%20delle%20sgc%2Cfacendosi%20bocciare%20apposta%20al%20limite%20%2Cvendendo%20suggerimenti%20sulle%20prove%20in%20cambio%20di%20favori%20futuri.',101,5,200,271,'2018-03-15 23:37:37',1,0,'ciminieraster@gmail.com',NULL),(60,'Test Dummy',NULL,NULL,100,4,0,271,'2018-03-16 09:50:30',1,1,'federico.case@gmail.com',NULL),(61,'Alec Leonhart',NULL,NULL,101,5,0,271,'2018-03-16 22:25:52',1,0,'fabio.cozzi151085@gmail.com',NULL),(62,'Tinker',NULL,NULL,101,5,5,271,'2018-03-16 22:27:27',1,0,'fabio.cozzi151085@gmail.com',NULL),(63,'Black Phillip',NULL,NULL,201,5,0,271,'2018-03-17 18:09:45',1,0,'federico.case@gmail.com',NULL),(64,'Bran O\'Connor',NULL,NULL,101,5,0,271,'2018-03-17 18:18:08',1,0,'federico.case@gmail.com',NULL),(65,'Victor sinclair',NULL,NULL,100,4,0,271,'2018-03-19 17:44:02',1,0,'larpworkshop@outlook.it',NULL),(66,'Pandora Colt',NULL,NULL,100,4,0,271,'2018-03-19 18:05:21',1,0,'mag87@outlook.it',NULL),(78,'Test Opzioni',NULL,NULL,100,104,0,238,'2018-03-21 02:51:05',1,0,'miroku_87@yahoo.it',NULL),(79,'Test Testerson II',NULL,NULL,120,16,80,246,'2018-03-23 12:43:58',1,0,'Rebootlivebg@gmail.com',NULL),(80,'Opzioner',NULL,NULL,100,54,0,217,'2018-03-26 00:35:19',1,0,'miroku_87@yahoo.it',NULL),(81,'Xx',NULL,NULL,120,24,0,245,'2018-03-27 10:50:38',1,0,'Rebootlivebg@gmail.com',NULL),(82,'123',NULL,NULL,100,4,0,244,'2018-03-27 12:49:41',1,0,'Rebootlivebg@gmail.com',NULL),(83,'456',NULL,NULL,100,4,0,243,'2018-03-27 12:52:10',1,0,'Rebootlivebg@gmail.com',NULL),(84,'asgfd',NULL,NULL,100,4,1000,242,'2018-03-27 16:07:52',1,0,'Rebootlivebg@gmail.com',NULL),(85,'ZTJSH',NULL,NULL,100,4,0,241,'2018-03-27 16:24:30',1,0,'Rebootlivebg@gmail.com',NULL),(86,'Test Gibo',NULL,NULL,120,4,0,243,'2018-03-29 15:32:51',1,0,'miroku_87@yahoo.it',NULL);
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
INSERT INTO `personaggi_has_abilita` VALUES (80,1),(79,17),(78,18),(79,18),(63,29),(66,29),(84,29),(63,32),(66,35),(66,36),(61,40),(62,40),(60,44),(65,44),(82,44),(60,45),(65,45),(82,45),(60,57),(65,57),(85,62),(54,69),(54,70),(54,71),(83,71),(64,72),(61,75),(64,79),(59,80),(86,84),(58,88),(81,89),(86,89),(59,91),(86,91),(60,92),(78,92),(60,94),(81,96),(85,96),(81,97),(82,97),(84,97),(81,98),(82,98),(81,100),(81,101),(81,102),(65,124),(79,124),(80,124),(61,125),(79,125),(80,125),(65,126),(79,126),(80,126),(61,128),(64,128),(79,128),(79,129),(79,130),(79,140),(80,140),(79,143),(79,145),(79,146),(59,159),(63,159),(59,160),(59,163),(66,188),(66,189),(58,191),(54,197),(54,199),(54,200),(62,202),(83,202),(85,202),(86,205),(86,209);
/*!40000 ALTER TABLE `personaggi_has_abilita` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 */ /*!50003 TRIGGER `personaggi_has_abilita_BEFORE_INSERT` BEFORE INSERT ON `personaggi_has_abilita` FOR EACH ROW
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
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 */ /*!50003 TRIGGER `personaggi_has_abilita_BEFORE_UPDATE` BEFORE UPDATE ON `personaggi_has_abilita` FOR EACH ROW
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
INSERT INTO `personaggi_has_classi` VALUES (80,1),(78,2),(79,2),(61,3),(62,3),(63,3),(66,3),(84,3),(60,4),(65,4),(82,4),(85,5),(54,6),(61,6),(64,6),(83,6),(58,7),(59,7),(64,7),(81,7),(86,7),(60,8),(78,8),(81,8),(82,8),(84,8),(85,8),(81,9),(82,9),(61,10),(64,10),(65,10),(79,10),(80,10),(84,10),(64,11),(65,11),(79,11),(80,11),(59,12),(60,12),(63,12),(83,12),(54,14),(58,14),(62,14),(66,14),(83,14),(85,14),(86,14),(58,15),(66,15),(86,15);
/*!40000 ALTER TABLE `personaggi_has_classi` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 */ /*!50003 TRIGGER `personaggi_has_classi_BEFORE_INSERT` BEFORE INSERT ON `personaggi_has_classi` FOR EACH ROW
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
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 */ /*!50003 TRIGGER `personaggi_has_classi_BEFORE_UPDATE` BEFORE UPDATE ON `personaggi_has_classi` FOR EACH ROW
BEGIN
	CALL controllaPrerequisitoClassi( NEW.personaggi_id_personaggio, NEW.classi_id_classe );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `personaggi_has_opzioni_abilita`
--

DROP TABLE IF EXISTS `personaggi_has_opzioni_abilita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personaggi_has_opzioni_abilita` (
  `personaggi_id_personaggio` int(11) NOT NULL,
  `abilita_id_abilita` int(11) NOT NULL,
  `opzioni_abilita_opzione` varchar(255) NOT NULL,
  PRIMARY KEY (`personaggi_id_personaggio`,`abilita_id_abilita`,`opzioni_abilita_opzione`),
  KEY `fk_phoa_id_abilita_idx` (`abilita_id_abilita`),
  KEY `fk_phoa_opzione_idx` (`opzioni_abilita_opzione`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personaggi_has_opzioni_abilita`
--

LOCK TABLES `personaggi_has_opzioni_abilita` WRITE;
/*!40000 ALTER TABLE `personaggi_has_opzioni_abilita` DISABLE KEYS */;
INSERT INTO `personaggi_has_opzioni_abilita` VALUES (78,18,'Economia'),(79,17,'Economia'),(79,18,'Giornalismo Spazzatura'),(79,140,'Shotgun'),(80,140,'Fucile di Precisione'),(81,89,'Iniezione'),(86,89,'Alcolismo');
/*!40000 ALTER TABLE `personaggi_has_opzioni_abilita` ENABLE KEYS */;
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
  `nome_ruolo` varchar(255) NOT NULL,
  PRIMARY KEY (`nome_ruolo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruoli`
--

LOCK TABLES `ruoli` WRITE;
/*!40000 ALTER TABLE `ruoli` DISABLE KEYS */;
INSERT INTO `ruoli` VALUES ('admin'),('giocatore'),('ospite'),('staff');
/*!40000 ALTER TABLE `ruoli` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 */ /*!50003 TRIGGER `ruoli_BEFORE_DELETE` BEFORE DELETE ON `ruoli` FOR EACH ROW
BEGIN
	IF OLD.nome_ruolo = 'admin' THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '@@@Non puoi eliminare il ruolo admin.@@@';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ruoli_has_grants`
--

DROP TABLE IF EXISTS `ruoli_has_grants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ruoli_has_grants` (
  `ruoli_nome_ruolo` varchar(255) NOT NULL,
  `grants_nome_grant` varchar(255) NOT NULL,
  PRIMARY KEY (`ruoli_nome_ruolo`,`grants_nome_grant`),
  KEY `fk_ruoli_has_grants_ruoli1_idx` (`ruoli_nome_ruolo`),
  KEY `fk_nome_grant_idx` (`grants_nome_grant`),
  CONSTRAINT `fk_nome_grant` FOREIGN KEY (`grants_nome_grant`) REFERENCES `grants` (`nome_grant`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_nome_ruolo` FOREIGN KEY (`ruoli_nome_ruolo`) REFERENCES `ruoli` (`nome_ruolo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruoli_has_grants`
--

LOCK TABLES `ruoli_has_grants` WRITE;
/*!40000 ALTER TABLE `ruoli_has_grants` DISABLE KEYS */;
INSERT INTO `ruoli_has_grants` VALUES ('admin','aggiungiAbilitaAlPG_altri'),('admin','aggiungiAbilitaAlPG_proprio'),('admin','aggiungiClassiAlPG_altri'),('admin','aggiungiClassiAlPG_proprio'),('admin','aggiungiOpzioniAbilita_altri'),('admin','aggiungiOpzioniAbilita_proprio'),('admin','associaPermessi'),('admin','creaEvento'),('admin','creaPG'),('admin','creaRuolo'),('admin','disiscriviPG_altri'),('admin','disiscriviPG_proprio'),('admin','eliminaEvento'),('admin','eliminaGiocatore'),('admin','eliminaPG_altri'),('admin','eliminaPG_proprio'),('admin','eliminaRuolo'),('admin','inviaMessaggio'),('admin','iscriviPg_altri'),('admin','iscriviPg_proprio'),('admin','loginPG_altri'),('admin','loginPG_proprio'),('admin','modificaEvento'),('admin','modificaIscrizionePG_note_iscrizione_altri'),('admin','modificaIscrizionePG_note_iscrizione_proprio'),('admin','modificaIscrizionePG_pagato_iscrizione_altri'),('admin','modificaIscrizionePG_pagato_iscrizione_proprio'),('admin','modificaPG_anno_nascita_personaggio_altri'),('admin','modificaPG_anno_nascita_personaggio_proprio'),('admin','modificaPG_background_personaggio_altri'),('admin','modificaPG_background_personaggio_proprio'),('admin','modificaPG_contattabile_personaggio_altri'),('admin','modificaPG_contattabile_personaggio_proprio'),('admin','modificaPG_credito_personaggio_altri'),('admin','modificaPG_credito_personaggio_proprio'),('admin','modificaPG_nome_personaggio_altri'),('admin','modificaPG_nome_personaggio_proprio'),('admin','modificaPG_note_master_personaggio_altri'),('admin','modificaPG_note_master_personaggio_proprio'),('admin','modificaPG_pc_personaggio_altri'),('admin','modificaPG_pc_personaggio_proprio'),('admin','modificaPG_px_personaggio_altri'),('admin','modificaPG_px_personaggio_proprio'),('admin','modificaUtente_note_giocatore_altri'),('admin','modificaUtente_note_giocatore_proprio'),('admin','modificaUtente_password_giocatore_altri'),('admin','modificaUtente_password_giocatore_proprio'),('admin','mostraPersonaggi_altri'),('admin','mostraPersonaggi_proprio'),('admin','pubblicaEvento'),('admin','recuperaEventi'),('admin','recuperaListaEventi'),('admin','recuperaListaGiocatori'),('admin','recuperaListaIscrittiAvanzato'),('admin','recuperaListaIscrittiBase'),('admin','recuperaListaPermessi'),('admin','recuperaMessaggi'),('admin','recuperaMessaggioSingolo_altri'),('admin','recuperaMessaggioSingolo_proprio'),('admin','recuperaMessaggi_altri'),('admin','recuperaMessaggi_proprio'),('admin','recuperaNoteMaster_altri'),('admin','recuperaNoteMaster_proprio'),('admin','recuperaNoteUtente_altri'),('admin','recuperaNoteUtente_proprio'),('admin','recuperaOpzioniAbilita'),('admin','recuperaPermessiDeiRuoli'),('admin','recuperaRuoli'),('admin','recuperaStorico_altri'),('admin','recuperaStorico_proprio'),('admin','rimuoviAbilitaPG_altri'),('admin','rimuoviAbilitaPG_proprio'),('admin','rimuoviClassePG_altri'),('admin','rimuoviClassePG_proprio'),('admin','ritiraEvento'),('admin','stampaCartelliniPG'),('admin','visualizza_pagina_crea_evento'),('admin','visualizza_pagina_crea_pg'),('admin','visualizza_pagina_gestione_eventi'),('admin','visualizza_pagina_gestione_giocatori'),('admin','visualizza_pagina_gestione_oggetti_ingioco'),('admin','visualizza_pagina_gestione_permessi'),('admin','visualizza_pagina_lista_pg'),('admin','visualizza_pagina_main'),('admin','visualizza_pagina_messaggi'),('admin','visualizza_pagina_negozio_abilita'),('admin','visualizza_pagina_profilo'),('admin','visualizza_pagina_scheda_pg'),('admin','visualizza_pagina_stampa'),('giocatore','aggiungiAbilitaAlPG_proprio'),('giocatore','aggiungiClassiAlPG_proprio'),('giocatore','aggiungiOpzioniAbilita_proprio'),('giocatore','creaPG'),('giocatore','eliminaPG_proprio'),('giocatore','inviaMessaggio'),('giocatore','iscriviPg_proprio'),('giocatore','loginPG_proprio'),('giocatore','modificaPG_anno_nascita_personaggio_proprio'),('giocatore','modificaPG_background_personaggio_proprio'),('giocatore','modificaUtente_note_giocatore_proprio'),('giocatore','modificaUtente_password_giocatore_proprio'),('giocatore','mostraPersonaggi_proprio'),('giocatore','recuperaEventi'),('giocatore','recuperaListaIscrittiBase'),('giocatore','recuperaMessaggi'),('giocatore','recuperaMessaggioSingolo_proprio'),('giocatore','recuperaMessaggi_proprio'),('giocatore','recuperaNoteUtente_proprio'),('giocatore','recuperaOpzioniAbilita'),('giocatore','visualizza_pagina_crea_pg'),('giocatore','visualizza_pagina_gestione_eventi'),('giocatore','visualizza_pagina_lista_pg'),('giocatore','visualizza_pagina_main'),('giocatore','visualizza_pagina_messaggi'),('giocatore','visualizza_pagina_negozio_abilita'),('giocatore','visualizza_pagina_profilo'),('giocatore','visualizza_pagina_scheda_pg');
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
  KEY `fk_bersaglio_idx` (`id_personaggio_azione`),
  CONSTRAINT `fk_bersaglio` FOREIGN KEY (`id_personaggio_azione`) REFERENCES `personaggi` (`id_personaggio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_esecutore` FOREIGN KEY (`giocatori_email_giocatore`) REFERENCES `giocatori` (`email_giocatore`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=517 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storico_azioni`
--

LOCK TABLES `storico_azioni` WRITE;
/*!40000 ALTER TABLE `storico_azioni` DISABLE KEYS */;
INSERT INTO `storico_azioni` VALUES (89,54,'miroku_87@yahoo.it','2018-03-15 16:24:22','INSERT','personaggi','nome',NULL,'John Doe'),(90,54,'miroku_87@yahoo.it','2018-03-15 16:24:22','INSERT','personaggi','px',NULL,'100'),(91,54,'miroku_87@yahoo.it','2018-03-15 16:24:22','INSERT','personaggi','pc',NULL,'4'),(92,54,'miroku_87@yahoo.it','2018-03-15 16:24:22','INSERT','personaggi','email_giocatore',NULL,'miroku_87@yahoo.it'),(93,54,'miroku_87@yahoo.it','2018-03-15 16:24:22','INSERT','classi_personaggio','classe',NULL,'Guardia di Sicurezza'),(94,54,'miroku_87@yahoo.it','2018-03-15 16:24:22','INSERT','classi_personaggio','classe',NULL,'Guastatore Base'),(95,54,'miroku_87@yahoo.it','2018-03-15 16:24:22','INSERT','abilita_personaggio','abilita',NULL,'Non puoi ingrandirla di più?'),(96,54,'miroku_87@yahoo.it','2018-03-15 16:24:22','INSERT','abilita_personaggio','abilita',NULL,'Grissom è amico mio'),(97,54,'miroku_87@yahoo.it','2018-03-15 16:24:22','INSERT','abilita_personaggio','abilita',NULL,'Linguaggio del corpo'),(98,54,'miroku_87@yahoo.it','2018-03-15 16:24:22','INSERT','abilita_personaggio','abilita',NULL,'Controller-Disarmare'),(99,54,'miroku_87@yahoo.it','2018-03-15 16:24:22','INSERT','abilita_personaggio','abilita',NULL,'Controller-Rottura'),(100,54,'miroku_87@yahoo.it','2018-03-15 16:24:22','INSERT','abilita_personaggio','abilita',NULL,'Controller-Erosione'),(101,54,'miroku_87@yahoo.it','2018-03-15 18:14:27','DELETE','abilita_personaggio','abilita','Controller-Erosione',NULL),(102,54,'miroku_87@yahoo.it','2018-03-15 18:15:00','INSERT','abilita_personaggio','abilita',NULL,'Controller-Erosione'),(115,58,'federico.case@gmail.com','2018-03-15 22:30:28','INSERT','personaggi','nome',NULL,'Seamus Archer '),(116,58,'federico.case@gmail.com','2018-03-15 22:30:28','INSERT','personaggi','PX',NULL,'100'),(117,58,'federico.case@gmail.com','2018-03-15 22:30:28','INSERT','personaggi','PC',NULL,'4'),(118,58,'federico.case@gmail.com','2018-03-15 22:30:28','INSERT','personaggi','email',NULL,'federico.case@gmail.com'),(119,58,'federico.case@gmail.com','2018-03-15 22:30:28','INSERT','classi_personaggio','classe',NULL,'Sciacallo'),(120,58,'federico.case@gmail.com','2018-03-15 22:30:28','INSERT','classi_personaggio','classe',NULL,'Guastatore Base'),(121,58,'federico.case@gmail.com','2018-03-15 22:30:28','INSERT','classi_personaggio','classe',NULL,'Guastatore Avanzata'),(122,58,'federico.case@gmail.com','2018-03-15 22:30:28','INSERT','abilita_personaggio','abilita',NULL,'Allibratore'),(123,58,'federico.case@gmail.com','2018-03-15 22:30:28','INSERT','abilita_personaggio','abilita',NULL,'Shield MK2'),(124,59,'ciminieraster@gmail.com','2018-03-15 23:37:37','INSERT','personaggi','nome',NULL,'Anthony Corallo'),(125,59,'ciminieraster@gmail.com','2018-03-15 23:37:37','INSERT','personaggi','PX',NULL,'100'),(126,59,'ciminieraster@gmail.com','2018-03-15 23:37:37','INSERT','personaggi','PC',NULL,'4'),(127,59,'ciminieraster@gmail.com','2018-03-15 23:37:37','INSERT','personaggi','email',NULL,'ciminieraster@gmail.com'),(128,59,'ciminieraster@gmail.com','2018-03-15 23:37:37','INSERT','classi_personaggio','classe',NULL,'Sciacallo'),(129,59,'ciminieraster@gmail.com','2018-03-15 23:37:37','INSERT','classi_personaggio','classe',NULL,'Supporto Base'),(130,59,'ciminieraster@gmail.com','2018-03-15 23:37:37','INSERT','abilita_personaggio','abilita',NULL,'Baciamo le mani'),(131,59,'ciminieraster@gmail.com','2018-03-15 23:37:37','INSERT','abilita_personaggio','abilita',NULL,'Riconoscere droghe e sostanze illegali'),(132,59,'ciminieraster@gmail.com','2018-03-15 23:37:37','INSERT','abilita_personaggio','abilita',NULL,'Shield MK2'),(133,59,'ciminieraster@gmail.com','2018-03-15 23:37:37','INSERT','abilita_personaggio','abilita',NULL,'Controllo dello stress sul campo'),(134,59,'ciminieraster@gmail.com','2018-03-15 23:37:37','INSERT','abilita_personaggio','abilita',NULL,'Medipack-Prime cure'),(135,59,'ciminieraster@gmail.com','2018-03-15 23:38:43','UPDATE','personaggi','background_personaggio',NULL,'Reclutato%20in%20giovane%20et%C3%A0%2C%20si%20occupa%20ora%20di%20piccoli%20spacci%20e%20reclutamenti.%0AFedele%20alla%20famiglia%2C%20cerca%20in%20ogni%20modo%20di%20portare%20benefici%2C%20cercando%20soprattutto%20guadagni%20a%20lungo%20termine.%0ASegue%20da%20qualche%20anno%20i%20reclutamenti%20delle%20sgc%2Cfacendosi%20bocciare%20apposta%20al%20limite%20%2Cvendendo%20suggerimenti%20sulle%20prove%20in%20cambio%20di%20favori%20futuri.'),(136,60,'federico.case@gmail.com','2018-03-16 09:50:30','INSERT','personaggi','nome',NULL,'Test Dummy'),(137,60,'federico.case@gmail.com','2018-03-16 09:50:30','INSERT','personaggi','PX',NULL,'100'),(138,60,'federico.case@gmail.com','2018-03-16 09:50:30','INSERT','personaggi','PC',NULL,'4'),(139,60,'federico.case@gmail.com','2018-03-16 09:50:30','INSERT','personaggi','email',NULL,'federico.case@gmail.com'),(140,60,'federico.case@gmail.com','2018-03-16 09:50:30','INSERT','classi_personaggio','classe',NULL,'Tecnico'),(141,60,'federico.case@gmail.com','2018-03-16 09:50:30','INSERT','classi_personaggio','classe',NULL,'Guardiano Base'),(142,60,'federico.case@gmail.com','2018-03-16 09:50:30','INSERT','classi_personaggio','classe',NULL,'Supporto Base'),(143,60,'federico.case@gmail.com','2018-03-16 09:50:30','INSERT','abilita_personaggio','abilita',NULL,'Riparare'),(144,60,'federico.case@gmail.com','2018-03-16 09:50:30','INSERT','abilita_personaggio','abilita',NULL,'Istinto omicida'),(145,60,'federico.case@gmail.com','2018-03-16 09:50:30','INSERT','abilita_personaggio','abilita',NULL,'Scudo umano'),(146,60,'federico.case@gmail.com','2018-03-16 09:50:30','INSERT','abilita_personaggio','abilita',NULL,'Riparazione veloce'),(147,60,'federico.case@gmail.com','2018-03-16 09:51:03','INSERT','abilita_personaggio','abilita',NULL,'Macchinari specialistici'),(148,61,'fabio.cozzi151085@gmail.com','2018-03-16 22:25:52','INSERT','personaggi','nome',NULL,'Alec Leonhart'),(149,61,'fabio.cozzi151085@gmail.com','2018-03-16 22:25:52','INSERT','personaggi','PX',NULL,'100'),(150,61,'fabio.cozzi151085@gmail.com','2018-03-16 22:25:52','INSERT','personaggi','PC',NULL,'4'),(151,61,'fabio.cozzi151085@gmail.com','2018-03-16 22:25:52','INSERT','personaggi','email',NULL,'fabio.cozzi151085@gmail.com'),(152,61,'fabio.cozzi151085@gmail.com','2018-03-16 22:25:52','INSERT','classi_personaggio','classe',NULL,'Netrunner'),(153,61,'fabio.cozzi151085@gmail.com','2018-03-16 22:25:52','INSERT','classi_personaggio','classe',NULL,'Guardia di Sicurezza'),(154,61,'fabio.cozzi151085@gmail.com','2018-03-16 22:25:52','INSERT','classi_personaggio','classe',NULL,'Assaltatore Base'),(155,61,'fabio.cozzi151085@gmail.com','2018-03-16 22:25:52','INSERT','abilita_personaggio','abilita',NULL,'Neuro armatura'),(156,61,'fabio.cozzi151085@gmail.com','2018-03-16 22:25:52','INSERT','abilita_personaggio','abilita',NULL,'Contatti nell\'Ago'),(157,61,'fabio.cozzi151085@gmail.com','2018-03-16 22:25:52','INSERT','abilita_personaggio','abilita',NULL,'Tuta da combattimento MK2'),(158,61,'fabio.cozzi151085@gmail.com','2018-03-16 22:25:52','INSERT','abilita_personaggio','abilita',NULL,'Ambidestria'),(159,62,'fabio.cozzi151085@gmail.com','2018-03-16 22:27:27','INSERT','personaggi','nome',NULL,'Tinker'),(160,62,'fabio.cozzi151085@gmail.com','2018-03-16 22:27:27','INSERT','personaggi','PX',NULL,'100'),(161,62,'fabio.cozzi151085@gmail.com','2018-03-16 22:27:27','INSERT','personaggi','PC',NULL,'4'),(162,62,'fabio.cozzi151085@gmail.com','2018-03-16 22:27:27','INSERT','personaggi','email',NULL,'fabio.cozzi151085@gmail.com'),(163,62,'fabio.cozzi151085@gmail.com','2018-03-16 22:27:27','INSERT','classi_personaggio','classe',NULL,'Netrunner'),(164,62,'fabio.cozzi151085@gmail.com','2018-03-16 22:27:27','INSERT','classi_personaggio','classe',NULL,'Guastatore Base'),(165,62,'fabio.cozzi151085@gmail.com','2018-03-16 22:27:27','INSERT','abilita_personaggio','abilita',NULL,'Neuro armatura'),(166,62,'fabio.cozzi151085@gmail.com','2018-03-16 22:27:27','INSERT','abilita_personaggio','abilita',NULL,'Schermatura celebrale'),(167,60,'federico.case@gmail.com','2018-03-17 18:09:11','DELETE','personaggi','eliminato_personaggio','0','1'),(168,63,'federico.case@gmail.com','2018-03-17 18:09:45','INSERT','personaggi','nome',NULL,'Black Phillip'),(169,63,'federico.case@gmail.com','2018-03-17 18:09:45','INSERT','personaggi','PX',NULL,'100'),(170,63,'federico.case@gmail.com','2018-03-17 18:09:45','INSERT','personaggi','PC',NULL,'4'),(171,63,'federico.case@gmail.com','2018-03-17 18:09:45','INSERT','personaggi','email',NULL,'federico.case@gmail.com'),(172,63,'federico.case@gmail.com','2018-03-17 18:09:45','INSERT','classi_personaggio','classe',NULL,'Netrunner'),(173,63,'federico.case@gmail.com','2018-03-17 18:09:45','INSERT','classi_personaggio','classe',NULL,'Supporto Base'),(174,63,'federico.case@gmail.com','2018-03-17 18:09:45','INSERT','abilita_personaggio','abilita',NULL,'Programmare'),(175,63,'federico.case@gmail.com','2018-03-17 18:09:45','INSERT','abilita_personaggio','abilita',NULL,'Shield MK2'),(176,63,'federico.case@gmail.com','2018-03-17 18:11:44','INSERT','abilita_personaggio','abilita',NULL,'Riallocazione codice'),(177,64,'federico.case@gmail.com','2018-03-17 18:18:08','INSERT','personaggi','nome',NULL,'Bran O\'Connor'),(178,64,'federico.case@gmail.com','2018-03-17 18:18:08','INSERT','personaggi','PX',NULL,'100'),(179,64,'federico.case@gmail.com','2018-03-17 18:18:08','INSERT','personaggi','PC',NULL,'4'),(180,64,'federico.case@gmail.com','2018-03-17 18:18:08','INSERT','personaggi','email',NULL,'federico.case@gmail.com'),(181,64,'federico.case@gmail.com','2018-03-17 18:18:08','INSERT','classi_personaggio','classe',NULL,'Guardia di Sicurezza'),(182,64,'federico.case@gmail.com','2018-03-17 18:18:08','INSERT','classi_personaggio','classe',NULL,'Sciacallo'),(183,64,'federico.case@gmail.com','2018-03-17 18:18:08','INSERT','classi_personaggio','classe',NULL,'Assaltatore Base'),(184,64,'federico.case@gmail.com','2018-03-17 18:18:08','INSERT','abilita_personaggio','abilita',NULL,'Torturare'),(185,64,'federico.case@gmail.com','2018-03-17 18:18:08','INSERT','abilita_personaggio','abilita',NULL,'Ambidestria'),(186,64,'federico.case@gmail.com','2018-03-17 18:23:06','INSERT','abilita_personaggio','abilita',NULL,'Direzione dei colpi'),(187,64,'federico.case@gmail.com','2018-03-17 18:48:59','INSERT','classi_personaggio','classe',NULL,'Assaltatore Avanzata'),(188,64,'miroku_87@yahoo.it','2018-03-17 21:36:19','UPDATE','personaggi','pc_personaggio','4','5'),(189,64,'miroku_87@yahoo.it','2018-03-17 21:36:19','UPDATE','personaggi','px_personaggio','100','101'),(190,63,'miroku_87@yahoo.it','2018-03-17 21:36:19','UPDATE','personaggi','pc_personaggio','4','5'),(191,63,'miroku_87@yahoo.it','2018-03-17 21:36:19','UPDATE','personaggi','px_personaggio','100','101'),(192,62,'miroku_87@yahoo.it','2018-03-17 21:36:19','UPDATE','personaggi','pc_personaggio','4','5'),(193,62,'miroku_87@yahoo.it','2018-03-17 21:36:19','UPDATE','personaggi','px_personaggio','100','101'),(194,61,'miroku_87@yahoo.it','2018-03-17 21:36:19','UPDATE','personaggi','pc_personaggio','4','5'),(195,61,'miroku_87@yahoo.it','2018-03-17 21:36:19','UPDATE','personaggi','px_personaggio','100','101'),(196,59,'miroku_87@yahoo.it','2018-03-17 21:36:19','UPDATE','personaggi','pc_personaggio','4','5'),(197,59,'miroku_87@yahoo.it','2018-03-17 21:36:19','UPDATE','personaggi','px_personaggio','100','101'),(198,58,'miroku_87@yahoo.it','2018-03-17 21:36:19','UPDATE','personaggi','pc_personaggio','4','5'),(199,58,'miroku_87@yahoo.it','2018-03-17 21:36:19','UPDATE','personaggi','px_personaggio','100','101'),(200,54,'miroku_87@yahoo.it','2018-03-17 21:36:19','UPDATE','personaggi','pc_personaggio','4','5'),(201,54,'miroku_87@yahoo.it','2018-03-17 21:36:19','UPDATE','personaggi','px_personaggio','100','101'),(202,63,'Rebootlivebg@gmail.com','2018-03-17 22:02:10','UPDATE','personaggi','pc_personaggio','5','5'),(203,63,'Rebootlivebg@gmail.com','2018-03-17 22:02:10','UPDATE','personaggi','px_personaggio','101','201'),(204,54,'miroku_87@yahoo.it','2018-03-18 11:30:26','UPDATE','personaggi','pc_personaggio','5','7'),(205,54,'miroku_87@yahoo.it','2018-03-18 11:30:26','UPDATE','personaggi','px_personaggio','101','103'),(206,62,'miroku_87@yahoo.it','2018-03-18 23:50:50','UPDATE','personaggi','credito_personaggio','0','5'),(207,62,'miroku_87@yahoo.it','2018-03-19 00:07:29','UPDATE','personaggi','contattabile_personaggio','1','0'),(208,62,'miroku_87@yahoo.it','2018-03-19 00:07:37','UPDATE','personaggi','contattabile_personaggio','0','1'),(209,59,'Rebootlivebg@gmail.com','2018-03-19 10:21:27','UPDATE','personaggi','credito_personaggio','0','200'),(210,65,'larpworkshop@outlook.it','2018-03-19 17:44:02','INSERT','personaggi','nome',NULL,'Victor sinclair'),(211,65,'larpworkshop@outlook.it','2018-03-19 17:44:02','INSERT','personaggi','PX',NULL,'100'),(212,65,'larpworkshop@outlook.it','2018-03-19 17:44:02','INSERT','personaggi','PC',NULL,'4'),(213,65,'larpworkshop@outlook.it','2018-03-19 17:44:02','INSERT','personaggi','email',NULL,'larpworkshop@outlook.it'),(214,65,'larpworkshop@outlook.it','2018-03-19 17:44:02','INSERT','classi_personaggio','classe',NULL,'Tecnico'),(215,65,'larpworkshop@outlook.it','2018-03-19 17:44:02','INSERT','classi_personaggio','classe',NULL,'Assaltatore Base'),(216,65,'larpworkshop@outlook.it','2018-03-19 17:44:02','INSERT','classi_personaggio','classe',NULL,'Assaltatore Avanzata'),(217,65,'larpworkshop@outlook.it','2018-03-19 17:44:02','INSERT','abilita_personaggio','abilita',NULL,'Riparare'),(218,65,'larpworkshop@outlook.it','2018-03-19 17:44:02','INSERT','abilita_personaggio','abilita',NULL,'Macchinari specialistici'),(219,65,'larpworkshop@outlook.it','2018-03-19 17:44:02','INSERT','abilita_personaggio','abilita',NULL,'Batteria aumentata'),(220,65,'larpworkshop@outlook.it','2018-03-19 17:44:02','INSERT','abilita_personaggio','abilita',NULL,'Pistolero'),(221,65,'larpworkshop@outlook.it','2018-03-19 17:44:02','INSERT','abilita_personaggio','abilita',NULL,'Riparazione veloce'),(222,66,'mag87@outlook.it','2018-03-19 18:05:21','INSERT','personaggi','nome',NULL,'Pandora Colt'),(223,66,'mag87@outlook.it','2018-03-19 18:05:21','INSERT','personaggi','PX',NULL,'100'),(224,66,'mag87@outlook.it','2018-03-19 18:05:21','INSERT','personaggi','PC',NULL,'4'),(225,66,'mag87@outlook.it','2018-03-19 18:05:21','INSERT','personaggi','email',NULL,'mag87@outlook.it'),(226,66,'mag87@outlook.it','2018-03-19 18:05:21','INSERT','classi_personaggio','classe',NULL,'Netrunner'),(227,66,'mag87@outlook.it','2018-03-19 18:05:21','INSERT','classi_personaggio','classe',NULL,'Guastatore Base'),(228,66,'mag87@outlook.it','2018-03-19 18:05:21','INSERT','classi_personaggio','classe',NULL,'Guastatore Avanzata'),(229,66,'mag87@outlook.it','2018-03-19 18:05:21','INSERT','abilita_personaggio','abilita',NULL,'Programmare'),(230,66,'mag87@outlook.it','2018-03-19 18:05:21','INSERT','abilita_personaggio','abilita',NULL,'Cancellazione programma'),(231,66,'mag87@outlook.it','2018-03-19 18:05:21','INSERT','abilita_personaggio','abilita',NULL,'Bruciare il supporto'),(232,66,'mag87@outlook.it','2018-03-19 18:05:21','INSERT','abilita_personaggio','abilita',NULL,'Batteria schermata'),(233,66,'mag87@outlook.it','2018-03-19 18:05:21','INSERT','abilita_personaggio','abilita',NULL,'Non a me, a lui!'),(356,78,'miroku_87@yahoo.it','2018-03-21 02:51:05','INSERT','personaggi','nome',NULL,'Test Opzioni'),(357,78,'miroku_87@yahoo.it','2018-03-21 02:51:05','INSERT','personaggi','PX',NULL,'100'),(358,78,'miroku_87@yahoo.it','2018-03-21 02:51:05','INSERT','personaggi','PC',NULL,'4'),(359,78,'miroku_87@yahoo.it','2018-03-21 02:51:05','INSERT','personaggi','email',NULL,'miroku_87@yahoo.it'),(360,78,'miroku_87@yahoo.it','2018-03-21 02:51:05','INSERT','classi_personaggio','classe',NULL,'Giornalista'),(361,78,'miroku_87@yahoo.it','2018-03-21 02:51:05','INSERT','classi_personaggio','classe',NULL,'Guardiano Base'),(362,78,'miroku_87@yahoo.it','2018-03-21 02:51:05','INSERT','abilita_personaggio','abilita',NULL,'Campo di specializzazione 1'),(363,78,'miroku_87@yahoo.it','2018-03-21 02:51:05','INSERT','abilita_personaggio','abilita',NULL,'Campo di specializzazione 2'),(364,78,'miroku_87@yahoo.it','2018-03-21 02:51:05','INSERT','abilita_personaggio','abilita',NULL,'Istinto omicida'),(365,78,'miroku_87@yahoo.it','2018-03-21 02:51:05','INSERT','opzioni_abilita','abilita - opzione',NULL,'Campo di specializzazione 1 - Cronaca Nera'),(366,78,'miroku_87@yahoo.it','2018-03-21 02:51:05','INSERT','opzioni_abilita','abilita - opzione',NULL,'Campo di specializzazione 2 - Economia'),(367,78,'miroku_87@yahoo.it','2018-03-21 03:14:17','DELETE','abilita_personaggio','abilita','Campo di specializzazione 1',NULL),(368,79,'Rebootlivebg@gmail.com','2018-03-23 12:43:58','INSERT','personaggi','nome',NULL,'Test Testerson II'),(369,79,'Rebootlivebg@gmail.com','2018-03-23 12:43:58','INSERT','personaggi','PX',NULL,'100'),(370,79,'Rebootlivebg@gmail.com','2018-03-23 12:43:58','INSERT','personaggi','PC',NULL,'4'),(371,79,'Rebootlivebg@gmail.com','2018-03-23 12:43:58','INSERT','personaggi','email',NULL,'Rebootlivebg@gmail.com'),(372,79,'Rebootlivebg@gmail.com','2018-03-23 12:43:58','INSERT','classi_personaggio','classe',NULL,'Giornalista'),(373,79,'Rebootlivebg@gmail.com','2018-03-23 12:43:58','INSERT','classi_personaggio','classe',NULL,'Assaltatore Base'),(374,79,'Rebootlivebg@gmail.com','2018-03-23 12:43:58','INSERT','classi_personaggio','classe',NULL,'Assaltatore Avanzata'),(375,79,'Rebootlivebg@gmail.com','2018-03-23 12:43:58','INSERT','abilita_personaggio','abilita',NULL,'Campo di specializzazione 1'),(376,79,'Rebootlivebg@gmail.com','2018-03-23 12:43:58','INSERT','abilita_personaggio','abilita',NULL,'Batteria aumentata'),(377,79,'Rebootlivebg@gmail.com','2018-03-23 12:43:58','INSERT','abilita_personaggio','abilita',NULL,'Tuta da combattimento MK2'),(378,79,'Rebootlivebg@gmail.com','2018-03-23 12:43:58','INSERT','opzioni_abilita','abilita - opzione',NULL,'Campo di specializzazione 1 - Economia'),(379,79,'Rebootlivebg@gmail.com','2018-03-23 12:44:12','UPDATE','personaggi','pc_personaggio','4','14'),(380,79,'Rebootlivebg@gmail.com','2018-03-23 12:44:12','UPDATE','personaggi','px_personaggio','100','100'),(381,79,'Rebootlivebg@gmail.com','2018-03-23 12:44:26','INSERT','abilita_personaggio','abilita',NULL,'Pistolero'),(382,79,'Rebootlivebg@gmail.com','2018-03-23 12:45:13','INSERT','abilita_personaggio','abilita',NULL,'Ambidestria'),(383,79,'Rebootlivebg@gmail.com','2018-03-23 12:45:13','INSERT','abilita_personaggio','abilita',NULL,'Addestramento fisico'),(384,79,'Rebootlivebg@gmail.com','2018-03-23 12:45:13','INSERT','abilita_personaggio','abilita',NULL,'Tiratore scelto'),(385,79,'Rebootlivebg@gmail.com','2018-03-23 12:45:26','INSERT','abilita_personaggio','abilita',NULL,'Gestione tattica'),(386,79,'Rebootlivebg@gmail.com','2018-03-23 12:45:26','INSERT','abilita_personaggio','abilita',NULL,'Granate modificate'),(387,79,'Rebootlivebg@gmail.com','2018-03-23 12:45:26','INSERT','abilita_personaggio','abilita',NULL,'Bombe gemelle'),(388,79,'Rebootlivebg@gmail.com','2018-03-23 12:45:58','INSERT','abilita_personaggio','abilita',NULL,'Campo di specializzazione 2'),(389,79,'Rebootlivebg@gmail.com','2018-03-23 12:45:58','INSERT','opzioni_abilita','abilita - opzione',NULL,'Campo di specializzazione 2 - Giornalismo Spazzatura'),(390,78,'miroku_87@yahoo.it','2018-03-23 12:53:58','UPDATE','personaggi','pc_personaggio','4','104'),(391,78,'miroku_87@yahoo.it','2018-03-23 12:53:58','UPDATE','personaggi','px_personaggio','100','100'),(392,80,'miroku_87@yahoo.it','2018-03-26 00:35:19','INSERT','personaggi','nome',NULL,'Opzioner'),(393,80,'miroku_87@yahoo.it','2018-03-26 00:35:19','INSERT','personaggi','PX',NULL,'100'),(394,80,'miroku_87@yahoo.it','2018-03-26 00:35:19','INSERT','personaggi','PC',NULL,'4'),(395,80,'miroku_87@yahoo.it','2018-03-26 00:35:19','INSERT','personaggi','email',NULL,'miroku_87@yahoo.it'),(396,80,'miroku_87@yahoo.it','2018-03-26 00:35:19','INSERT','classi_personaggio','classe',NULL,'Sportivo'),(397,80,'miroku_87@yahoo.it','2018-03-26 00:35:19','INSERT','classi_personaggio','classe',NULL,'Assaltatore Base'),(398,80,'miroku_87@yahoo.it','2018-03-26 00:35:19','INSERT','abilita_personaggio','abilita',NULL,'Glitch'),(399,80,'miroku_87@yahoo.it','2018-03-26 00:35:19','INSERT','abilita_personaggio','abilita',NULL,'Batteria aumentata'),(400,80,'miroku_87@yahoo.it','2018-03-26 00:35:46','UPDATE','personaggi','pc_personaggio','4','54'),(401,80,'miroku_87@yahoo.it','2018-03-26 00:35:46','UPDATE','personaggi','px_personaggio','100','100'),(402,80,'miroku_87@yahoo.it','2018-03-26 00:39:25','INSERT','classi_personaggio','classe',NULL,'Assaltatore Avanzata'),(403,80,'miroku_87@yahoo.it','2018-03-26 00:39:25','INSERT','abilita_personaggio','abilita',NULL,'Tuta da combattimento MK2'),(404,80,'miroku_87@yahoo.it','2018-03-26 00:39:25','INSERT','abilita_personaggio','abilita',NULL,'Pistolero'),(405,80,'miroku_87@yahoo.it','2018-03-26 00:39:39','INSERT','abilita_personaggio','abilita',NULL,'Arma selezionata'),(406,80,'miroku_87@yahoo.it','2018-03-26 00:39:40','INSERT','opzioni_abilita','abilita - opzione',NULL,'Arma selezionata - Fucile di Precisione'),(407,80,'miroku_87@yahoo.it','2018-03-26 00:39:40','INSERT','opzioni_abilita','abilita - opzione',NULL,'Arma selezionata - Fucile di Precisione'),(408,79,'Rebootlivebg@gmail.com','2018-03-26 11:46:36','INSERT','abilita_personaggio','abilita',NULL,'Arma selezionata'),(409,79,'Rebootlivebg@gmail.com','2018-03-26 11:46:36','INSERT','opzioni_abilita','abilita - opzione',NULL,'Arma selezionata - Shotgun'),(410,79,'Rebootlivebg@gmail.com','2018-03-26 11:46:36','INSERT','opzioni_abilita','abilita - opzione',NULL,'Arma selezionata - Shotgun'),(411,79,'Rebootlivebg@gmail.com','2018-03-27 10:40:23','UPDATE','personaggi','credito_personaggio','0','100'),(412,81,'Rebootlivebg@gmail.com','2018-03-27 10:50:38','INSERT','personaggi','nome',NULL,'Xx'),(413,81,'Rebootlivebg@gmail.com','2018-03-27 10:50:38','INSERT','personaggi','PX',NULL,'100'),(414,81,'Rebootlivebg@gmail.com','2018-03-27 10:50:38','INSERT','personaggi','PC',NULL,'4'),(415,81,'Rebootlivebg@gmail.com','2018-03-27 10:50:38','INSERT','personaggi','email',NULL,'Rebootlivebg@gmail.com'),(416,81,'Rebootlivebg@gmail.com','2018-03-27 10:50:38','INSERT','classi_personaggio','classe',NULL,'Sciacallo'),(417,81,'Rebootlivebg@gmail.com','2018-03-27 10:50:38','INSERT','classi_personaggio','classe',NULL,'Guardiano Base'),(418,81,'Rebootlivebg@gmail.com','2018-03-27 10:50:38','INSERT','classi_personaggio','classe',NULL,'Guardiano Avanzata'),(419,81,'Rebootlivebg@gmail.com','2018-03-27 10:50:38','INSERT','abilita_personaggio','abilita',NULL,'Vita allo sbando'),(420,81,'Rebootlivebg@gmail.com','2018-03-27 10:50:38','INSERT','abilita_personaggio','abilita',NULL,'Shield MK2'),(421,81,'Rebootlivebg@gmail.com','2018-03-27 10:50:38','INSERT','abilita_personaggio','abilita',NULL,'Shield MK3'),(422,81,'Rebootlivebg@gmail.com','2018-03-27 10:50:38','INSERT','opzioni_abilita','abilita - opzione',NULL,'Vita allo sbando - Iniezione'),(423,81,'Rebootlivebg@gmail.com','2018-03-27 10:50:38','INSERT','opzioni_abilita','abilita - opzione',NULL,'Vita allo sbando - Iniezione'),(424,81,'Rebootlivebg@gmail.com','2018-03-27 10:50:52','UPDATE','personaggi','pc_personaggio','4','4'),(425,81,'Rebootlivebg@gmail.com','2018-03-27 10:50:52','UPDATE','personaggi','px_personaggio','100','120'),(426,81,'Rebootlivebg@gmail.com','2018-03-27 10:54:32','UPDATE','personaggi','pc_personaggio','4','24'),(427,81,'Rebootlivebg@gmail.com','2018-03-27 10:54:32','UPDATE','personaggi','px_personaggio','120','120'),(428,81,'Rebootlivebg@gmail.com','2018-03-27 10:54:54','INSERT','abilita_personaggio','abilita',NULL,'Difesa mentale 1'),(429,81,'Rebootlivebg@gmail.com','2018-03-27 10:54:54','INSERT','abilita_personaggio','abilita',NULL,'Addestramento fisico 1'),(430,82,'Rebootlivebg@gmail.com','2018-03-27 12:49:41','INSERT','personaggi','nome',NULL,'123'),(431,82,'Rebootlivebg@gmail.com','2018-03-27 12:49:41','INSERT','personaggi','PX',NULL,'100'),(432,82,'Rebootlivebg@gmail.com','2018-03-27 12:49:41','INSERT','personaggi','PC',NULL,'4'),(433,82,'Rebootlivebg@gmail.com','2018-03-27 12:49:41','INSERT','personaggi','email',NULL,'Rebootlivebg@gmail.com'),(434,82,'Rebootlivebg@gmail.com','2018-03-27 12:49:41','INSERT','classi_personaggio','classe',NULL,'Tecnico'),(435,82,'Rebootlivebg@gmail.com','2018-03-27 12:49:41','INSERT','classi_personaggio','classe',NULL,'Guardiano Base'),(436,82,'Rebootlivebg@gmail.com','2018-03-27 12:49:41','INSERT','classi_personaggio','classe',NULL,'Guardiano Avanzata'),(437,82,'Rebootlivebg@gmail.com','2018-03-27 12:49:41','INSERT','abilita_personaggio','abilita',NULL,'Riparare'),(438,82,'Rebootlivebg@gmail.com','2018-03-27 12:49:41','INSERT','abilita_personaggio','abilita',NULL,'Addestramento fisico 1'),(439,82,'Rebootlivebg@gmail.com','2018-03-27 12:49:41','INSERT','abilita_personaggio','abilita',NULL,'Riparazione veloce'),(440,82,'Rebootlivebg@gmail.com','2018-03-27 12:50:32','INSERT','abilita_personaggio','abilita',NULL,'Shield MK2'),(441,81,'Rebootlivebg@gmail.com','2018-03-27 12:51:15','INSERT','abilita_personaggio','abilita',NULL,'Tuta corazzata MK2'),(442,83,'Rebootlivebg@gmail.com','2018-03-27 12:52:10','INSERT','personaggi','nome',NULL,'456'),(443,83,'Rebootlivebg@gmail.com','2018-03-27 12:52:10','INSERT','personaggi','PX',NULL,'100'),(444,83,'Rebootlivebg@gmail.com','2018-03-27 12:52:10','INSERT','personaggi','PC',NULL,'4'),(445,83,'Rebootlivebg@gmail.com','2018-03-27 12:52:10','INSERT','personaggi','email',NULL,'Rebootlivebg@gmail.com'),(446,83,'Rebootlivebg@gmail.com','2018-03-27 12:52:10','INSERT','classi_personaggio','classe',NULL,'Guardia di Sicurezza'),(447,83,'Rebootlivebg@gmail.com','2018-03-27 12:52:10','INSERT','classi_personaggio','classe',NULL,'Supporto Base'),(448,83,'Rebootlivebg@gmail.com','2018-03-27 12:52:10','INSERT','classi_personaggio','classe',NULL,'Guastatore Base'),(449,83,'Rebootlivebg@gmail.com','2018-03-27 12:52:10','INSERT','abilita_personaggio','abilita',NULL,'Linguaggio del corpo'),(450,83,'Rebootlivebg@gmail.com','2018-03-27 12:52:10','INSERT','abilita_personaggio','abilita',NULL,'Schermatura celebrale'),(451,79,'miroku_87@yahoo.it','2018-03-27 13:25:35','UPDATE','personaggi','credito_personaggio','100','80'),(452,81,'Rebootlivebg@gmail.com','2018-03-27 16:01:34','DELETE','abilita_personaggio','abilita','Shield MK3',NULL),(453,81,'Rebootlivebg@gmail.com','2018-03-27 16:01:57','DELETE','abilita_personaggio','abilita','Tuta corazzata MK2',NULL),(454,81,'Rebootlivebg@gmail.com','2018-03-27 16:02:32','DELETE','abilita_personaggio','abilita','Shield MK2',NULL),(455,81,'Rebootlivebg@gmail.com','2018-03-27 16:02:44','INSERT','abilita_personaggio','abilita',NULL,'Shield MK2'),(456,81,'Rebootlivebg@gmail.com','2018-03-27 16:02:56','INSERT','abilita_personaggio','abilita',NULL,'Shield MK3'),(457,81,'Rebootlivebg@gmail.com','2018-03-27 16:03:27','INSERT','abilita_personaggio','abilita',NULL,'Tuta corazzata MK2'),(458,81,'Rebootlivebg@gmail.com','2018-03-27 16:04:09','INSERT','abilita_personaggio','abilita',NULL,'Tuta corazzata MK3'),(459,84,'Rebootlivebg@gmail.com','2018-03-27 16:07:52','INSERT','personaggi','nome',NULL,'asgfd'),(460,84,'Rebootlivebg@gmail.com','2018-03-27 16:07:52','INSERT','personaggi','PX',NULL,'100'),(461,84,'Rebootlivebg@gmail.com','2018-03-27 16:07:52','INSERT','personaggi','PC',NULL,'4'),(462,84,'Rebootlivebg@gmail.com','2018-03-27 16:07:52','INSERT','personaggi','email',NULL,'Rebootlivebg@gmail.com'),(463,84,'Rebootlivebg@gmail.com','2018-03-27 16:07:52','INSERT','classi_personaggio','classe',NULL,'Netrunner'),(464,84,'Rebootlivebg@gmail.com','2018-03-27 16:07:52','INSERT','classi_personaggio','classe',NULL,'Guardiano Base'),(465,84,'Rebootlivebg@gmail.com','2018-03-27 16:07:52','INSERT','classi_personaggio','classe',NULL,'Assaltatore Base'),(466,84,'Rebootlivebg@gmail.com','2018-03-27 16:07:52','INSERT','abilita_personaggio','abilita',NULL,'Programmare'),(467,84,'Rebootlivebg@gmail.com','2018-03-27 16:07:52','INSERT','abilita_personaggio','abilita',NULL,'Addestramento fisico 1'),(468,84,'Rebootlivebg@gmail.com','2018-03-27 16:08:40','UPDATE','personaggi','credito_personaggio','0','1000'),(469,85,'Rebootlivebg@gmail.com','2018-03-27 16:24:30','INSERT','personaggi','nome',NULL,'ZTJSH'),(470,85,'Rebootlivebg@gmail.com','2018-03-27 16:24:30','INSERT','personaggi','PX',NULL,'100'),(471,85,'Rebootlivebg@gmail.com','2018-03-27 16:24:30','INSERT','personaggi','PC',NULL,'4'),(472,85,'Rebootlivebg@gmail.com','2018-03-27 16:24:30','INSERT','personaggi','email',NULL,'Rebootlivebg@gmail.com'),(473,85,'Rebootlivebg@gmail.com','2018-03-27 16:24:30','INSERT','classi_personaggio','classe',NULL,'Biomedico'),(474,85,'Rebootlivebg@gmail.com','2018-03-27 16:24:30','INSERT','classi_personaggio','classe',NULL,'Guardiano Base'),(475,85,'Rebootlivebg@gmail.com','2018-03-27 16:24:30','INSERT','classi_personaggio','classe',NULL,'Guastatore Base'),(476,85,'Rebootlivebg@gmail.com','2018-03-27 16:24:30','INSERT','abilita_personaggio','abilita',NULL,'Cure intensive'),(477,85,'Rebootlivebg@gmail.com','2018-03-27 16:24:30','INSERT','abilita_personaggio','abilita',NULL,'Difesa mentale 1'),(478,85,'Rebootlivebg@gmail.com','2018-03-27 16:24:30','INSERT','abilita_personaggio','abilita',NULL,'Schermatura celebrale'),(479,80,'miroku_87@yahoo.it','2018-03-28 03:05:41','UPDATE','personaggi','anno_nascita_personaggio','271','217'),(480,54,'miroku_87@yahoo.it','2018-03-28 03:05:41','UPDATE','personaggi','anno_nascita_personaggio','271','247'),(481,78,'miroku_87@yahoo.it','2018-03-28 03:05:41','UPDATE','personaggi','anno_nascita_personaggio','271','238'),(482,79,'miroku_87@yahoo.it','2018-03-28 03:06:25','UPDATE','personaggi','pc_personaggio','14','16'),(483,79,'miroku_87@yahoo.it','2018-03-28 03:06:25','UPDATE','personaggi','px_personaggio','100','120'),(484,81,'Rebootlivebg@gmail.com','2018-03-28 10:31:10','UPDATE','personaggi','anno_nascita_personaggio','271','245'),(485,85,'Rebootlivebg@gmail.com','2018-03-28 10:31:10','UPDATE','personaggi','anno_nascita_personaggio','271','241'),(486,83,'Rebootlivebg@gmail.com','2018-03-28 10:31:10','UPDATE','personaggi','anno_nascita_personaggio','271','243'),(487,82,'Rebootlivebg@gmail.com','2018-03-28 10:31:10','UPDATE','personaggi','anno_nascita_personaggio','271','244'),(488,84,'Rebootlivebg@gmail.com','2018-03-28 10:31:11','UPDATE','personaggi','anno_nascita_personaggio','271','242'),(489,79,'Rebootlivebg@gmail.com','2018-03-28 10:31:11','UPDATE','personaggi','anno_nascita_personaggio','271','246'),(490,54,'miroku_87@yahoo.it','2018-03-28 23:19:30','UPDATE','personaggi','pc_personaggio','7','9'),(491,54,'miroku_87@yahoo.it','2018-03-28 23:19:30','UPDATE','personaggi','px_personaggio','103','105'),(492,54,'miroku_87@yahoo.it','2018-03-28 23:26:59','UPDATE','personaggi','pc_personaggio','7','9'),(493,54,'miroku_87@yahoo.it','2018-03-28 23:26:59','UPDATE','personaggi','px_personaggio','103','105'),(494,54,'miroku_87@yahoo.it','2018-03-29 08:07:17','UPDATE','personaggi','pc_personaggio','9','11'),(495,54,'miroku_87@yahoo.it','2018-03-29 08:07:17','UPDATE','personaggi','px_personaggio','105','103'),(496,54,'miroku_87@yahoo.it','2018-03-29 08:09:47','UPDATE','personaggi','pc_personaggio','11','16'),(497,54,'miroku_87@yahoo.it','2018-03-29 08:09:47','UPDATE','personaggi','px_personaggio','103','153'),(498,86,'miroku_87@yahoo.it','2018-03-29 15:32:51','INSERT','personaggi','nome',NULL,'Test Gibo'),(499,86,'miroku_87@yahoo.it','2018-03-29 15:32:51','INSERT','personaggi','PX',NULL,'100'),(500,86,'miroku_87@yahoo.it','2018-03-29 15:32:51','INSERT','personaggi','PC',NULL,'4'),(501,86,'miroku_87@yahoo.it','2018-03-29 15:32:51','INSERT','personaggi','email',NULL,'miroku_87@yahoo.it'),(502,86,'miroku_87@yahoo.it','2018-03-29 15:32:51','INSERT','classi_personaggio','classe',NULL,'Sciacallo'),(503,86,'miroku_87@yahoo.it','2018-03-29 15:32:51','INSERT','classi_personaggio','classe',NULL,'Guastatore Base'),(504,86,'miroku_87@yahoo.it','2018-03-29 15:32:51','INSERT','classi_personaggio','classe',NULL,'Guastatore Avanzata'),(505,86,'miroku_87@yahoo.it','2018-03-29 15:32:51','INSERT','abilita_personaggio','abilita',NULL,'Scassinare'),(506,86,'miroku_87@yahoo.it','2018-03-29 15:32:51','INSERT','abilita_personaggio','abilita',NULL,'Riconoscere droghe e sostanze illegali'),(507,86,'miroku_87@yahoo.it','2018-03-29 15:32:51','INSERT','abilita_personaggio','abilita',NULL,'Amplificazione dell\'area'),(508,86,'miroku_87@yahoo.it','2018-03-29 15:32:51','INSERT','abilita_personaggio','abilita',NULL,'Granata congelante'),(509,86,'miroku_87@yahoo.it','2018-03-29 15:33:49','UPDATE','personaggi','pc_personaggio','4','4'),(510,86,'miroku_87@yahoo.it','2018-03-29 15:33:49','UPDATE','personaggi','px_personaggio','100','120'),(511,86,'miroku_87@yahoo.it','2018-03-29 15:34:10','INSERT','opzioni_abilita','abilita - opzione',NULL,' - '),(512,86,'miroku_87@yahoo.it','2018-03-29 15:40:15','INSERT','opzioni_abilita','abilita - opzione',NULL,' - '),(513,86,'miroku_87@yahoo.it','2018-03-29 16:02:03','INSERT','abilita_personaggio','abilita',NULL,'Vita allo sbando'),(514,86,'miroku_87@yahoo.it','2018-03-29 16:04:25','INSERT','abilita_personaggio','abilita',NULL,'Vita allo sbando'),(515,86,'miroku_87@yahoo.it','2018-03-29 16:04:25','INSERT','opzioni_abilita','abilita - opzione',NULL,'Vita allo sbando - Alcolismo'),(516,86,'miroku_87@yahoo.it','2018-03-29 16:04:25','INSERT','opzioni_abilita','abilita - opzione',NULL,'Vita allo sbando - Alcolismo');
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
    --  -8: servono almeno 3 talenti da Assaltatore-Avanzato (id 11)
    
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
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '@@@Non puoi acquistare questa abilit&agrave; senza almeno 4 abilit&agrave; da Guastatore Avanzato.@@@';
        
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
CREATE PROCEDURE `controllaPrerequisitoClassi`( _id_pg INT, _id_classe INT )
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

--
-- Dumping events for database 'bl2o7rd1_reboot_live_beta'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-30 12:36:10
