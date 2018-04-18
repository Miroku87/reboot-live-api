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
  `effetto_abilita` set('attivo','passivo') COLLATE utf8_unicode_ci DEFAULT NULL,
  `offset_pf_abilita` int(5) DEFAULT NULL,
  `offset_shield_abilita` int(5) DEFAULT NULL,
  `offset_mente_abilita` int(5) DEFAULT NULL,
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
INSERT INTO `abilita` VALUES (1,'civile','Glitch','Una volta per vita, se il personaggio entra in uno dei punti di Respawn viene teletrasportato a un altro. ',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL,NULL,NULL,NULL),(2,'civile','Lag','Una volta per vita , il personaggio se si muove a scatti dichiara IMMUNE! al primo danno che subisce. ',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL,NULL,NULL,NULL),(3,'civile','Barra spaziatrice','Se il personaggio si muove saltellando dichiara IMMUNE! ai danni delle chiamate ad area e raggio. ',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL,NULL,NULL,NULL),(4,'civile','Tea bag','Se al primo avversario abbattuto il personaggio esulta in modo evidente al pubblico, guadagna automaticamente 1 punto in classifica nelle partite DEATHMATCH. ',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL,NULL,NULL,NULL),(5,'civile','Conoscenza mappe','Il personaggio ha tempo 15 secondi per girare la mappa prima di giocare la partita',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL,NULL,NULL,NULL),(6,'civile','Akimbo','Il personaggio può giocare usando 2 pistole',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL,NULL,NULL,NULL),(7,'civile','Aim bot','Una volta per Vita il personaggio può fare la dichiarazione di danno a dito indicando la vittima',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL,NULL,NULL,NULL),(8,'civile','Autokill','Il personaggio può suicidarsi per non dare punti al nemico. ',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL,NULL,NULL,NULL),(9,'civile','Lancia la bandiera','Se il personaggio in un match \"cattura la bandiera\" è equipaggiato con la sua arma base e tiene la bandiera la può lanciare. ',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL,NULL,NULL,NULL),(10,'civile','Finto morto','Il personaggio può fingersi morto per 30 secondi consecutivi. ',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL,NULL,NULL,NULL),(11,'civile','Camperone','Ogni volta che il personaggio sta fermo in un posto per sparare almeno per 3 secondi può dichiarare al primo colpo che spara + 1 alla chiamata secondo lo schema SINGOLO!, DOPPIO! TRIPLO, QUADRUPLO',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL,NULL,NULL,NULL),(12,'civile','Idolo della folla','Se il personaggio ha appena vinto ( o fa parte della squadra che ha  vinto) una partita  può richiedere allo sponsor un extra del 25% del suo ingaggio dichiarando SONO L\'IDOLO DELLA FOLLA.',40,1,-5,'Utilizzabile solo durante una partita di Deathmatch',NULL,NULL,NULL,NULL),(13,'civile','Coca e mignotte','Il personaggio sceglie tra una di queste due opzioni:<br>DROGA: il personaggio ha passato la sua vita a sniffare, risulta immune agli effetti negativi  fisici delle droghe da inalazione.<br>CONTATTO: il personaggio ha passato la sua vita a contatto con sostanze schifose, risulta immune agli effetti negativi delle droghe da contatto.',70,1,12,'Utilizzabile solo durante una partita di Deathmatch',NULL,NULL,NULL,NULL),(14,'civile','Stalker','I numerosi successi sportivi e mondani del personaggio hanno attirato l\'attenzione di uno Stalker che lo seguirà dall\'ombra e potrà fornire qualche aiuto, ma anche delle complicazioni, al personaggio.',20,1,12,'Utilizzabile solo durante una partita di Deathmatch',NULL,NULL,NULL,NULL),(15,'civile','Gavetta','Tra un evento e il successivo il personaggio può inviare 1 articolo per farlo pubblicare, se questo avviene guadagna Bit aggiuntivi che gli saranno consegnati al prossimo evento.',20,2,NULL,'',NULL,NULL,NULL,NULL),(16,'civile','Ottimo scrittore','I compensi degli articoli pubblicati aumentano del 30%.',40,2,15,'',NULL,NULL,NULL,NULL),(17,'civile','Campo di specializzazione 1','Il personaggio deve scegliere tra i seguenti campi: cronaca nera, cronaca rosa, sport, economica, politica, giornalismo spazzatura.<br>Scrivendo nel campo selezionato può mandare un articolo aggiuntivo.',40,2,NULL,'',NULL,NULL,NULL,NULL),(18,'civile','Campo di specializzazione 2','Il personaggio deve scegliere tra i seguenti campi: cronaca nera, cronaca rosa, sport, economica, politica, giornalismo spazzatura.<br>Scrivendo nel campo selezionato può mandare un articolo aggiuntivo.',40,2,NULL,'',NULL,NULL,NULL,NULL),(19,'civile','Campo di specializzazione 3','Il personaggio deve scegliere tra i seguenti campi: cronaca nera, cronaca rosa, sport, economica, politica, giornalismo spazzatura.<br>Scrivendo nel campo selezionato può mandare un articolo aggiuntivo.',40,2,NULL,'',NULL,NULL,NULL,NULL),(20,'civile','Campo di specializzazione 4','Il personaggio deve scegliere tra i seguenti campi: cronaca nera, cronaca rosa, sport, economica, politica, giornalismo spazzatura.<br>Scrivendo nel campo selezionato può mandare un articolo aggiuntivo.',40,2,NULL,'',NULL,NULL,NULL,NULL),(21,'civile','Foto scottanti','Il personaggio ha contatti per vendere facilmente e a un buon prezzo foto compromettenti (se le deve comunque procurare in gioco).',30,2,NULL,'',NULL,NULL,NULL,NULL),(22,'civile','Clicca qui','Il personaggio ha un sito dove vende informazioni spazzatura per allocchi, questo gli garantisce il 25% in più del tuo attuale stipendio.',40,2,NULL,'',NULL,NULL,NULL,NULL),(23,'civile','Disinformazione','Il personaggio può far pubblicare informazioni palesemente false anche sui canali di informazione regolari.',30,2,22,'',NULL,NULL,NULL,NULL),(24,'civile','Deviare l\'attenzione','Il personaggio può scrivere un articolo \"realistico \"che devi l\'attenzione da un altro evento che vuole nascondere ( questa abilità blocca un articolo già uscito fino all\'evento successivo).',40,2,NULL,'',NULL,NULL,NULL,NULL),(25,'civile','Servo del sistema','Il personaggio guadagna il 75% in più del suo stipendio MA non potrà mai utilizzare le seguenti abilità: DISINFORMAZIONE, DEVIARE L\'ATTENZIONE, CLICCA QUI.',140,2,NULL,'',NULL,NULL,NULL,NULL),(26,'civile','Informazioni prelibate','Il personaggio ottiene informazioni commerciali preferenziali sull\'apposita sezione del Ravnet.',30,2,NULL,'',NULL,NULL,NULL,NULL),(27,'civile','Bunga bunga','Il personaggio può investire una quantità di Bit a sua discrezione per ottenere informazioni su personaggi di spicco della politica.',30,2,NULL,'',NULL,NULL,NULL,NULL),(28,'civile','Voci di strada ','Il personaggio ottiene informazioni di quello che accade nelle strade in ambiti legati a Guardie di vigilanza o malavita tra un live e l\'altro inoltrando allo staff una mail con la domanda.',30,2,NULL,'',NULL,NULL,NULL,NULL),(29,'civile','Programmare','Il personaggio può assemblare stringhe di codice per creare programmi singoli.',20,3,NULL,'',NULL,NULL,NULL,NULL),(30,'civile','Programmazione avanzata','Il personaggio può assemblare due programmi assieme; i bonus dei singoli programmi sono accorpati. I programmi così assemblati non possono più essere separati e verranno consumati contemporaneamente.',40,3,29,'',NULL,NULL,NULL,NULL),(31,'civile','Programmazione totale','Il personaggio può assemblare fino a 4 programmi assieme; i bonus dei singoli programmi sono accorpati. I programmi così assemblati non possono più essere separati e verranno consumati contemporaneamente.',60,3,30,'',NULL,NULL,NULL,NULL),(32,'civile','Riallocazione codice','Nella programmazione il giocatore può modificare di +/- 1 uno dei parametri numerici di un singolo programma prima del Debug finale.',50,3,NULL,'',NULL,NULL,NULL,NULL),(33,'civile','Ctrl-c, Ctrl-v','Il giocatore può richiedere allo staff una copia di un programma in suo possesso una volta per evento.',50,3,NULL,'',NULL,NULL,NULL,NULL),(34,'civile','Tutto da solo','Il giocatore in possesso di una singola stringa di codice può compilare un programma di massimo due righe utilizzando due volte la stessa stringa di codice.',60,3,NULL,'',NULL,NULL,NULL,NULL),(35,'civile','Cancellazione programma','Il personaggio mentre è nella rete può decidere di cancellare un qualsiasi  programma che ha equipaggiato per ottenere uno spazio vuoto.',30,3,NULL,'',NULL,NULL,NULL,NULL),(36,'civile','Bruciare il supporto','Il personaggio può chiedere allo staff un cartellino \"CRIPT-LOCK®\" . ',50,3,NULL,'',NULL,NULL,NULL,NULL),(37,'civile','Multitasking','Il personaggio può caricare fino ad un numero di programmi pari alla metà delle abilità da netrunner che possiede (arrotondate per difetto, con un minimo di 2) prima di entrare nella rete.',30,3,NULL,'',NULL,NULL,NULL,NULL),(38,'civile','Zerg rush','Il  personaggio può, avvisando un membro staff, prima di entrare nella rete creare un proprio \"clone\" ogni 2 cartellini codice che sacrifica (con profilo base e senza programmi) fino a un massimo di 10 cloni. Questi cloni non sono altri che \"vite\" aggiuntive che il giocatore utilizzerà prima del suo ingresso effettivo nella rete.',50,3,37,'',NULL,NULL,NULL,NULL),(39,'civile','Strada sicura','Il personaggio 1 volta per accesso alla rete può inviare in modo sicuro un pacchetto dati a una sua casella \"sicura\". In termini di gioco può prendere un singolo cartellino dati in suo possesso all\'interno della rete e consegnarlo a un membro staff presente e richiederlo alla sua uscita dalla rete. ',60,3,NULL,'',NULL,NULL,NULL,NULL),(40,'civile','Neuro armatura','Il personaggio ha installato un programma di protezione latente, se non equipaggiato con programmi di armatura il suo avatar ha 6 punti ferita. ',30,3,NULL,'',NULL,NULL,NULL,NULL),(41,'civile','Sistema di sicurezza integrato','Il personaggio nella rete virtuale può dichiare DISINTEGRAZIONE! su se stesso anche se non è cosciente.',50,3,38,'',NULL,NULL,NULL,NULL),(42,'civile','Guerriglia informatica','Il personaggio può, quando entra nella rete, dichiarare BONUS! +X DANNI! RAGGIO 5! oppure dichiarare BONUS! +X PUNTI FERITA! RAGGIO 5! (in entrambi i casi X è pari alla metà dei personaggi che sono entrati insieme a lui nella rete virtuale).',40,3,37,'',NULL,NULL,NULL,NULL),(43,'civile','Alter ego','Il personaggio può, se vuole, modificare il proprio costume prima di entrare nella rete. Se la modifica al costume è totale, non è possibile riconoscere il personaggio.',30,3,37,'',NULL,NULL,NULL,NULL),(44,'civile','Riparare','Il personaggio può dichiarare RIPARAZIONE 1 dopo 5 Minuti di lavoro.',30,4,NULL,'',NULL,NULL,NULL,NULL),(45,'civile','Riparazione veloce','Il personaggio riduce il tempo TOTALE di applicazione dell\'abilità RIPARARE di 1 minuto (fino ad un minimo di 1 minuto).',40,4,44,'',NULL,NULL,NULL,NULL),(46,'civile','Mago della brugola','Il personaggio aggiunge sempre + 1 al suo valore di RIPARAZIONE! Dato dall\'abilità Riparare.',50,4,NULL,'',NULL,NULL,NULL,NULL),(47,'civile','Lavoro di squadra','Il personaggio se lavora con un altro personaggio con questa abilità dimezza i tempi di riparazione (approssimati per eccesso) e aggiunge +1 al valore della chiamata. Questa abilità non può essere usata assieme a RIPARAZIONE VELOCE.',40,4,NULL,'',NULL,NULL,NULL,NULL),(48,'civile','Specializzazione-Armi','Il personaggio può scegliere tra i progetti fattibili qualsiasi tipologia da arma.',40,4,45,'',NULL,NULL,NULL,NULL),(49,'civile','Specializzazione-Protesi','Il personaggio può scegliere tra i progetti fattibili qualsiasi tipologia di protesi.',40,4,45,'',NULL,NULL,NULL,NULL),(50,'civile','Specializzazione-Gadget e Shield','Il personaggio può scegliere tra i progetti fattibili qualsiasi tipologia di gadget e Shield.',40,4,45,'',NULL,NULL,NULL,NULL),(51,'civile','Specializzazione-Esoscheletri e scudi','Il personaggio può scegliere tra i progetti fattibili qualsiasi tipologia di potenziamento per tutte le tipologie di esoscheletro e scudi.',40,4,45,'',NULL,NULL,NULL,NULL),(52,'civile','Specializzazione avanzata-Esoscheletri','Il personaggio può progettare esoscheletri completi.',40,4,51,'',NULL,NULL,NULL,NULL),(53,'civile','Specializzazione avanzata-Gadget','Il personaggio può progettare gadget complessi.',40,4,50,'',NULL,NULL,NULL,NULL),(54,'civile','Scansione schemi','Il personaggio può demolire un oggetto per scoprire il suo esatto schema di realizzazione',80,4,NULL,'',NULL,NULL,NULL,NULL),(55,'civile','Smontaggio veloce','Il personaggio può smontare qualsiasi oggetto dotato di cartellino Azzurro recuperando la componente più facile da ottenere, mimando di smontare l\'oggetto per 1 minuti e riconsegnando l\'oggetto demolito allo Staff.',70,4,NULL,'',NULL,NULL,NULL,NULL),(56,'civile','Ricerca mirata','Il personaggio può demolire un oggetto Bianco per ottenere un suo componente. Il personaggio deve consegnare l\'oggetto allo staff specificando quale parte vuole ottenere tra le seguenti tipologie: struttura, batteria, applicativo.',60,4,55,'',NULL,NULL,NULL,NULL),(57,'civile','Macchinari specialistici','',20,4,NULL,'',NULL,NULL,NULL,NULL),(58,'civile','Squadra di aiutanti','Il personaggio può farsi aiutare da altri personaggi (da uno ad un massimo pari alla metà delle abilità di Tecnico che possiede, arrotondate per difetto) nel compiere le operazioni di riparazione. Se lui, i suoi aiutanti e l\'oggetto da riparare sono in un raggio di 5 metri, può utilizzare le abilità di riparazione riducendo di 30 SECONDI i tempi per ogni aiutante, fino ad un minimo di 1 minuto per operazione.',40,4,NULL,'',NULL,NULL,NULL,NULL),(59,'civile','Impiantologia cibernetica','Il personaggio è in grado di montare protesi a un personaggio se opera in un struttura adeguata. L\'operazione deve essere mimata per 10 minuti. Al termine dichiara NEUTRALIZZA! MUTILAZIONE!',20,5,NULL,'',NULL,NULL,NULL,NULL),(60,'civile','Impiantologia cibernetica migliorata','Il personaggio è in grado di montare protesi a un personaggio se opera in un struttura adeguata. L\'operazione deve essere mimata per 5 minuti.',40,5,59,'',NULL,NULL,NULL,NULL),(61,'civile','Prime cure','Il personaggio può, dopo 10 secondi di lavoro, allungare il tempo di coma del bersaglio di ulteriori 5 minuti. Può essere utilizzata solo una volta sullo stesso bersaglio, anche da diversi Biomedici. Il giocatore dovrà spiegare al bersaglio gli effetti di questa abilità.',20,5,NULL,'',NULL,NULL,NULL,NULL),(62,'civile','Cure intensive','Il personaggio può dichiarare GUARIGIONE! X! (dove X è pari alla metà delle abilità di medicina che possiede) dopo aver mimato la procedura per 5 minuti ad un personaggio che non sia in stato di coma.',30,5,NULL,'',NULL,NULL,NULL,NULL),(63,'civile','Cure avanzatre','Il personaggio può dichiarare GUARIGIONE! X! (dove X è pari alla metà delle abilità di medicina che possiede) su un personaggio in coma dopo aver mimato la procedura per 5 minuti.',40,5,62,'',NULL,NULL,NULL,NULL),(64,'civile','Sintesi e analisi chimica','Il personaggio è in grado di analizzare e produrre sostanze chimiche tramite la specifica sezione del database medico e dello strumento di sintesi preposto.',20,5,NULL,'',NULL,NULL,NULL,NULL),(65,'civile','Produzione migliorata','Durante la sintesi chimica un personaggio ottiene il doppio dei prodotti normalmente ottenibili.',60,5,65,'',NULL,NULL,NULL,NULL),(66,'civile','Equipe medica','Il personaggio se lavora con un altro personaggio con questa abilità aggiunge +1 al valore della chiamata per ogni personaggio con cui collabora.',40,5,NULL,'',NULL,NULL,NULL,NULL),(67,'civile','Gestire gli aiutanti','Il personaggio può farsi aiutare da altri personaggi (da uno ad un massimo pari alla metà delle abilità di medicina che possiede, arrotondate per difetto ) nel compiere le operazioni mediche. Se lui, i suoi aiutanti e i pazienti sono in un raggio di 5 metri, può utilizzare le abilità \"Prime Cure\", \"Cure Intensive\" e \"Cure Avanzate\" su un paziente aggiuntivo per ogni aiutante.<br><br>(N.B. : Si intende \"Paziente\" il personaggio sottoposto a cure, \"Aiutante\" la persona, anche non medico, che sta aiutando chi usa l\'abilità. L\'Aiutante non può in nessun caso essere anche un paziente, e non potrà utilizzare altre abilità mentre aiuta il personaggio. L\'uso di questa abilità esclude l\'utilizzo dell\'abilità \"Gestire i Tempi\")',60,5,NULL,'',NULL,NULL,NULL,NULL),(68,'civile','Gestire i tempi','Il personaggio può farsi aiutare da altri personaggi (da uno ad un massimo pari alla metà delle abilità di medicina che possiede, arrotondate per difetto) nel compiere le operazioni mediche. Se lui, i suoi aiutanti e il paziente sono in un raggio di 5 metri, può utilizzare le abilità \"Prime Cure\", \"Cure Intensive\" e \"Cure Avanzate\" riducendo di 1 minuto i tempi per ogni aiutante, fino a dimezzare le tempistiche.<br><br>(N.B. : Si intende \"Paziente\" il personaggio sottoposto a cure, \"Aiutante\" la persona, anche non medico, che sta aiutando chi usa l\'abilità. L\'Aiutante non può in nessun caso essere anche un paziente, e non potrà utilizzare altre abilità mentre aiuta il personaggio. L\'uso di questa abilità esclude l\'utilizzo dell\'abilità \"Gestire gli aiutanti\").<br><br>N.b. Quando il medico sta operando su un altro personaggio, il conteggio di coma del ferito si interrompe.',60,5,NULL,'',NULL,NULL,NULL,NULL),(69,'civile','Non puoi ingrandirla di più?','Il personaggio può ottenere informazioni aggiuntive tramite la Ravnet, su prove che sono già state analizzate.',20,6,NULL,'',NULL,NULL,NULL,NULL),(70,'civile','Grissom è amico mio','Il personaggio ottiene informazioni aggiunte nei cartellini \"Interazione\".',20,6,NULL,'',NULL,NULL,NULL,NULL),(71,'civile','Linguaggio del corpo','Il personaggio, dopo aver parlato almeno 5 minuti con una persona può dichiarare SINCERITA\'!: MI HAI MENTITO SU QUALCOSA IN QUESTI ULTIMI 5 MINUTI?. Non è possibile interrogare con questa abilità la stessa persona più volte nell\'arco di un ora.',40,6,NULL,'',NULL,NULL,NULL,NULL),(72,'civile','Direzione dei colpi','Il personaggio se in presenza di un cadavere può chiedere allo staff la direzione, il numero di colpi e la tipologia dell\'arma che ha ucciso la persona.',20,6,NULL,'',NULL,NULL,NULL,NULL),(73,'civile','Interrogatorio','Durante un interrogatorio il personaggio può, dopo aver posto allo stesso un bersaglio 5 domande sullo stesso argomento, dichiarare SINCERITA\'! HAI MENTITO IN QUALCUNA DELLE RISPOSTE CHE MI HAI DATO?. Non è possibile interrogare con questa abilità la stessa persona più volte nell\'arco di un ora.',60,6,NULL,'',NULL,NULL,NULL,NULL),(74,'civile','Poliziotto buono e Poliziotto cattivo','Se 2 giocatori hanno l\'abilità INTERROGATORIO possono interrogare lo stesso soggetto in contemporanea anche sullo stesso argomento. Viene richiesto ai due giocatori di interpretare correttamente la cosa con uno dei due \"buono\" e l\'altro \"cattivo\".',60,6,NULL,'',NULL,NULL,NULL,NULL),(75,'civile','Contatti nell\'Ago','Il personaggio ha contatti nell\'Ago e ottiene accesso all\'apposita sezione nel Ravnet.',40,6,NULL,'',NULL,NULL,NULL,NULL),(76,'civile','Chiuderemo un occhio','La prima volta che il personaggio fa qualche errore grosso e si ritrova il dipartimento disciplinare può dichiarare a un membro staff l\'uso di questa abilità e il suo problema verrà ignorato solo per quella volta. Il favore può essere recuperato in gioco.  ',80,6,NULL,'',NULL,NULL,NULL,NULL),(77,'civile','Contatti nella malavita','Il personaggio ha contatti nella malavita e ottiene accesso all\'apposita sezione nel Ravnet.',40,6,NULL,'',NULL,NULL,NULL,NULL),(78,'civile','Nemesi','Il personaggio nel suo passato si è creato un nemico giurato con cui si è andato a creare una strana simbiosi, il suo nemico cercherà di ostacolarlo ma non ucciderlo, non lo aiuterà ma potrebbe salvarlo da situazioni estreme solo perché \"è una questione personale\".',60,6,NULL,'',NULL,NULL,NULL,NULL),(79,'civile','Torturare','Durante un interrogatorio e dopo aver causato dei danni al bersaglio, il personaggio può, dopo aver posto allo stesso bersaglio 5 domande sullo stesso argomento, dichiarare SINCERITA\'! HAI MENTITO IN QUALCUNA DELLE RISPOSTE CHE MI HAI DATO?. Non è possibile interrogare con questa abilità la stessa persona più volte nell\'arco di un ora.',50,7,NULL,'',NULL,NULL,NULL,NULL),(80,'civile','Baciamo le mani','Il personaggio ha contatti che gli garantiscono informazioni sui movimenti delle guardie corporative e ottiene accesso all\'apposita sezione nel Ravnet.',80,7,NULL,'',NULL,NULL,NULL,NULL),(81,'civile','Contatti tra gli sbirri','Il personaggio ha contatti che gli garantiscono informazioni sui movimenti delle guardie corporative e ottiene accesso all\'apposita sezione nel Ravnet.',40,7,NULL,'',NULL,NULL,NULL,NULL),(82,'civile','Contatti nella famiglia','Il personaggio ha contatti nella malavita e ottiene accesso all\'apposita sezione nel Ravnet.',40,7,NULL,'',NULL,NULL,NULL,NULL),(83,'civile','Inquinare le prove','Il personaggio può interagire su Cartellini Interazione \"Prove\" chiedendo allo staff di modificarli permanentemente.',40,7,NULL,'',NULL,NULL,NULL,NULL),(84,'civile','Scassinare','Il personaggio può mimare di scassinare una serratura e aprirla dopo 1 minuto di interazione per ogni livello di difficoltà della serratura.',40,7,NULL,'',NULL,NULL,NULL,NULL),(85,'civile','Ricettare merce','Il personaggio può \"vendere\" alla segreteria oggetti in suo possesso e ottenerne il 50 % del valore.',40,7,NULL,'',NULL,NULL,NULL,NULL),(86,'civile','Menù del Continental','Il personaggio ottiene prima del live una lista di prodotti ottenibili sul mercato nero ma deve trovare qualcuno che gli venda l\'oggetto del suo desiderio.',30,7,NULL,'',NULL,NULL,NULL,NULL),(87,'civile','Consierge del Continental','Il personaggio sapendo cosa vendono al Continental può acquistare prima del live uno o più beni (sempre se possiede i Bit necessari per farlo).',80,7,86,'',NULL,NULL,NULL,NULL),(88,'civile','Allibratore','Se il personaggio perde giocando a delle scommesse ufficiali recupera il 25% del valore perso.',40,7,NULL,'',NULL,NULL,NULL,NULL),(89,'civile','Vita allo sbando','Il personaggio sceglie tra una di queste due opzioni:<br><br>ALCOLISMO: il personaggio ha passato la sua vita a bere, risulta immune agli effetti negativi fisici delle droghe da ingestione.<br>INIEZIONE: il personaggio ha passato la sua vita a bucarsi, risulta immune agli effetti negativi delle droghe da iniezione.<br><br>Tuttavia, se subisce la chiamata SINCERITA\' mentre è sotto l\'effetto della tipologia da lui selezionata dovrà rispondere a 3 domande dicendo la verità .',60,7,NULL,'',NULL,NULL,NULL,NULL),(90,'civile','Conversione sicura','Il personaggio può convertire Bit in Platino e viceversa senza problemi andando in sala staff.',70,7,NULL,'',NULL,NULL,NULL,NULL),(91,'civile','Riconoscere droghe e sostanze illegali','Il personaggio è in grado di riconoscere sostanze illegali non identificate se appartengono alla categoria \"Droghe\".',20,7,NULL,'',NULL,NULL,NULL,NULL),(92,'militare','Istinto omicida','Se il personaggio è sotto l\'effetto di CONFUSIONE! può comunque attaccare colpendo col danno base<br>dell\'arma usata ridotto di 1 seguendo la normale catena:<br>COMA! - A ZERO! - CRASH! - QUADRUPLO! - TRIPLO! - DOPPIO! - SINGOLO!.',1,8,NULL,'personale','passivo',NULL,NULL,NULL),(93,'militare','Istinto di sopravvivenza','Se il personaggio è sotto effetto della chiamata DOLORE! può comunque muoversi arrancando per tutta<br>la durata della chiamata, senza compiere nessun\'altra azione.',1,8,NULL,'personale','passivo',NULL,NULL,NULL),(94,'militare','Scudo umano','Il personaggio può dichiarare NEUTRALIZZA GRANATA! Il personaggio deve mimare di coprire la granata<br>col proprio corpo (NOTA: è sufficiente essere entro un raggio massimo di 1 metro dalla granata)<br>subendo però ARTEFATTO COMA! nel caso in cui la granata causi danno o ARTEFATTO SHOCK! nel caso<br>in cui sia una qualunque chiamata di effetto. Quest\'abilità non funziona se non si è coscienti.',1,8,NULL,'personale','passivo',NULL,NULL,NULL),(95,'militare','Posizione difensiva','Il personaggio può rilocare un danno subito dalla locazione vitale ad un arto o viceversa.<br>ESEMPIO: un colpo alla gamba può essere spostato sul torso ma non sulle braccia; un colpo al torso può<br>essere spostato dove si vuole.',1,8,93,'personale','passivo',NULL,NULL,NULL),(96,'militare','Difesa mentale 1','Il punteggio di Difesa Mentale del personaggio è aumentato permanentemente di 1.',1,8,NULL,'personale','passivo',NULL,NULL,1),(97,'militare','Addestramento fisico 1','I Punti Ferita del personaggio aumentano permanentemente di 1.',1,8,NULL,'personale','passivo',1,NULL,NULL),(98,'militare','Shield MK2','Se il personaggio ha almeno un Punto Shield base, guadagna +2 punti al suo valore globale.',1,8,NULL,'personale','passivo',NULL,2,NULL),(99,'militare','Resistere alla paura','Il personaggio può dichiarare IMMUNE! Alla chiamata PAURA!.',1,8,95,'personale','attivo',NULL,NULL,NULL),(100,'militare','Tuta corazzata MK2','Il valore base dei punti Shield garantiti dalle locazioni equipaggiate con una tuta da combattimento<br>corazzata (come indicato a pag. 17) è moltiplicato per 1,5.',1,8,NULL,'personale','passivo',NULL,NULL,NULL),(101,'militare','Tuta corazzata MK3','Il valore base dei punti Shield garantiti dalle locazioni equipaggiate con una tuta da combattimento<br>corazzata (come indicato a pag. 17) è raddoppiato. Questa abilità sostituisce TUTA CORAZZATA MK2.',1,8,100,'personale','passivo',NULL,NULL,NULL),(102,'militare','Shield MK3','Se il personaggio ha almeno un Punto Shield base, guadagna +4 punti al suo valore globale. Questa<br>abilità sostituisce SHIELD MK2.',1,8,98,'personale','passivo',NULL,4,NULL),(103,'militare','Braccio di ferro','Il personaggio può dichiarare IMMUNE! alla chiamata DISARMO!.',1,8,NULL,'personale','attivo',NULL,NULL,NULL),(104,'militare','Fuciliere','Il personaggio può aumentare di 2 i danni causati col Fucile d\'Assalto per il prossimo colpo sparato in<br>base alla seguente scala: SINGOLO! - DOPPIO! - TRIPLO! - QUADRUPLO! - CRASH! - A ZERO!.',1,8,105,'personale','attivo',NULL,NULL,NULL),(105,'militare','Presa ferma','Il personaggio può impugnare armi di categoria Fucile d\'Assalto con una sola mano se nell\'altra impugna<br>uno Scudo.',1,8,103,'personale','passivo',NULL,NULL,NULL),(106,'militare','Testa dura','Il personaggio può dichiarare IMMUNE! alla chiamata SHOCK!',1,8,NULL,'personale','attivo',NULL,NULL,NULL),(107,'militare','Scarica d\'adrenalina','Il personaggio quando entra in stato di COMA può, simulando un \"urlo belluino\" (o altro effetto<br>scenografico simile ad alto tasso di testosterone), subire BLOCCO! TEMPO 1 ORA! alla batteria e ritorna<br>a pieni punti ferita e punteggio Shield al massimo.',1,8,-1,'personale','attivo',NULL,NULL,NULL),(108,'militare','Farsi scudo','Se il personaggio impugna un Mitragliatore Pesante può dichiarare IMMUNE! ad un colpo subito ma<br>l\'arma subisce l\'effetto BLOCCO! Eccezioni sono le chiamate DISINTEGRAZIONE! (applicata comunque al<br>bersaglio) e le chiamate MUTILAZIONE! o CREPA! che infliggono all\'arma che la subisce<br>DISINTEGRAZIONE! Invece di BLOCCO!.',1,9,NULL,'personale','passivo',NULL,NULL,NULL),(109,'militare','Addestramento fisico 2','I Punti ferita del personaggio aumentano permanentemente di 2 (questa abilità sostituisce<br>ADDESTRAMENTO FISICO I).',1,9,97,'personale','passivo',2,NULL,NULL),(110,'militare','Difendere gli altri','Il personaggio può dichiarare IMMUNE! ad una chiamata subita da un bersaglio entro 1 metro da lui,<br>subendo la chiamata al suo posto.',1,9,NULL,'personale','passivo',NULL,NULL,NULL),(111,'militare','Inarrestabile','Il personaggio può dichiarare IMMUNE! a una qualsiasi delle seguenti chiamate:<br>PARALISI! - CONFUSIONE! - SHOCK! - DISARMO! - SPINTA!.',1,9,112,'personale','attivo',NULL,NULL,NULL),(112,'militare','E\' solo un graffietto','Il personaggio può dichiarare IMMUNE! alla chiamata DOLORE!',1,9,93,'personale','passivo',NULL,NULL,NULL),(113,'militare','Bunker semovente','Il personaggio utilizzando un\'arma di classe Mitragliatore Pesante può, se appostato dietro un riparo,<br>camminare per un massimo di 10 metri fino a posizionarsi dietro un altro riparo contando come se fosse<br>stazionario e appostato ai fini del prerequisito \"Posizionamento\" per questa classe d\'arma.<br>(N.B. Puoi quindi sparare con un mitragliatore pesante mentre cammini tra un riparo e l\'altro.)',1,9,111,'personale','passivo',NULL,NULL,NULL),(114,'militare','Tempesta di metallo','Il personaggio, se sta già sparando con un\'arma di classe Mitragliatore Pesante, può dichiarare la prossima chiamata base dell\'arma aggiungendo IN QUEST\'AREA!.',1,9,NULL,'Area 10 metri','attivo',NULL,NULL,NULL),(115,'militare','Fuoco difensivo','Il personaggio se sta usando un\'arma di classe Mitragliatore pesante, dopo aver sparato ininterrottamente sullo stesso bersaglio ostile per 10 secondi, subisce BONUS! + 4 PUNTI SHIELD!<br><br>(N.b. Non è possibile cambiare bersaglio, ma è possibile sospendere il conteggio per cambiare caricatore, riprendendo quindi a sparare sullo stesso bersaglio)',1,9,114,'personale','passivo',NULL,NULL,NULL),(116,'militare','Ricarica scudo d\'emergenza','Quando il personaggio arriva a 0 punti Shield può subire la chiamata BONUS! +8 PUNTI SHIELD.',1,9,102,'personale','attivo',NULL,NULL,NULL),(117,'militare','Feel no pain','Se il personaggio subisce la chiamata MUTILAZIONE! ad un arto ignora la chiamata ARTEFATTO COMA! associata; l\'arto è comunque da sostituire e deve simulare il dolore estremo.',1,9,112,'personale','passivo',NULL,NULL,NULL),(118,'militare','Barricata','Il personaggio può imbracciare uno scudo di dimensione minima 140x80 e massima 200x100; se il personaggio poggia lo scudo e un ginocchio a terra, questo scudo permette di parare chiamate di danno fino a CRASH! compreso; qualora intercetti chiamate superiori, lo scudo subisce DISINTEGRAZIONE! ma la chiamata non viene comunque subita.<br>Qualora il personaggio non sia posizionato, funziona come un normale scudo. ',1,9,108,'personale','passivo',NULL,NULL,NULL),(119,'militare','Fortezza della solitudine','Il massimale base del valore di Shield del personaggio non è mai inferiore a 3 punti quando indossa una tuta da combattimento corazzata, neanche a seguito di oggetti equipaggiati.',1,9,NULL,'personale','passivo',NULL,NULL,NULL),(120,'militare','Interfacce protesiche avanzate','Se il personaggio viene colpito ad una locazione sintetica dalle chiamate COMA! o CREPA! può, subendo BLOCCO! alla batteria ed alla protesi interessata dal colpo, declassare la chiamata COMA! ad ARTEFATTO! A ZERO! oppure può declassare la chiamata CREPA! ad ARTEFATTO! MUTILAZIONE!.<br>Questa abilità non può essere utilizzata con una protesi d\'emergenza.<br><br>(NOTA: le chiamate sostitutive si ritengono da applicarsi SEMPRE alla locazione originale dell\'impatto, non possono essere deviate o rilocate su un\'altra parte del corpo o su un altro bersaglio.)',1,9,117,'personale','passivo',NULL,NULL,NULL),(121,'militare','Ultima parola','Il personaggio, dopo aver subito la chiamata CREPA! (non è sufficiente entrare in status Morto per conteggio) può rialzarsi con 50 Punti Ferita alocazionali, ma il suo Shield e la sua Batteria subiscono la chiamata BLOCCO! CONTINUO! Questo stato dura 1 minuto, durante i quali subisce tutte le chiamate di danno fino a QUADRUPLO come 1 singolo danno, le altre chiamate come 5 danni eccetto CREPA! e DISINTEGRAZIONE! che subisce normalmente. Passato il minuto o esauriti i Punti Ferita subisce la chiamata ARTEFATTO CREPA! e non può più utilizzare questa abilità.',1,9,NULL,'personale','passivo',NULL,NULL,NULL),(122,'militare','Yippie kay yay','Il personaggio dopo avere subito per almeno 10 secondi la chiamata DOLORE (senza quindi aver dichiarato IMMUNE o aver subito NEUTRALIZZA) può alzare di due la prossima chiamata di danno secondo la normale scala, fino ad A ZERO!',1,9,NULL,'personale','passivo',NULL,NULL,NULL),(123,'militare','Last man standing','Il personaggio per 1 minuto può dichiarare IMMUNE! a PARALISI! - PAURA! - CONFUSIONE! - SHOCK! - DISARMO! - DOLORE!, i suoi punti Shield vengono raddoppiati, i suoi Punti Ferita vengono raddoppiati e i suoi talenti attivi non avviano il Cooldown. Passato il minuto il personaggio subisce ARTEFATTO COMA!; una volta curato, subisce tutte le chiamate di status per il doppio del tempo e i suoi punti ferita sono dimezzati (arrotondati per difetto) fino alla fine della giornata di gioco.<br><br>Nota: se un personaggio con questi malus arriva ad avere Punti Ferita pari o inferiori a 0 (calcolo effettuato in base ai punti ferita standard, non quelli temporanei dovuti all\'abilità) il personaggio si considera aver avuto un collasso multiorgano e subisce immediatamente la chiamata ARTEFATTO CREPA!',1,9,-1,'personale','attivo',NULL,NULL,NULL),(124,'militare','Batteria aumentata','Il personaggio può utilizzare un massimo di 2 abilità Attive contemporaneamente invece di 1 sola per ogni attivazione. Così facendo somma i tempi di Cooldown.<br><br>NOTA: si può applicare questa abilità solo ai talenti da Assaltatore (sia Base che Avanzato)',1,10,NULL,'personale','passivo',NULL,NULL,NULL),(125,'militare','Tuta da combattimento MK2','Il punteggio di Shield totale garantito dalla tuta da combattimento equipaggiata aumenta di 1, se la tuta fornisce al personaggio almeno un punto Shield Base.',1,10,NULL,'personale','passivo',NULL,1,NULL),(126,'militare','Pistolero','Il personaggio se combatte impugnando contemporaneamente due armi di classe Pistola può sostituire il danno base dell\'arma con la chiamata SINGOLO! CONFUSIONE! Al prossimo colpo sparato (o solo CONFUSIONE! Nel caso il danno base dell\'arma fosse già SINGOLO!).',1,10,NULL,'personale','attivo',NULL,NULL,NULL),(127,'militare','Hotshot','Il personaggio utilizza la sua batteria per sovraccaricare la pistola sparando un colpo molto più potente.<br>Il personaggio può aumentare di 2 il danno del suo prossimo colpo (fino a COMA! compreso). L\'abilità è utilizzabile solo con pistole ad energia. Dopo aver sparato, la Batteria e la pistola subiscono la chiamata BLOCCO! CONTINUO!.',1,10,126,'personale','attivo',NULL,NULL,NULL),(128,'militare','Ambidestria','Il personaggio può impugnare un\'arma a una mano (pistola, arma da mischia corta se può utilizzarla) per mano e combattere utilizzando la mano secondaria.',1,10,NULL,'personale','passivo',NULL,NULL,NULL),(129,'militare','Addestramento fisico','I Punti Ferita del personaggio aumentano permanentemente di 1.',1,10,NULL,'personale','passivo',1,NULL,NULL),(130,'militare','Tiratore scelto','Il personaggio con le armi di classe Fucile di Precisione può aumentare di 1 il danno del prossimo colpo sparato. L\'abilità viene \"spesa\" anche se il colpo manca il bersaglio.<br><br>(NOTA: i potenziamenti seguono la normale scala di danno:<br>SINGOLO! - DOPPIO! - TRIPLO! - QUADRUPLO! - CRASH! - A ZERO!)',1,10,NULL,'personale','attivo',NULL,NULL,NULL),(131,'militare','Non a me, a lui!','Il personaggio se subisce PAURA! Può considerare qualunque personaggio cosciente e consenziente come riparo fisso per gli effetti della chiamata.',1,10,NULL,'personale','passivo',NULL,NULL,NULL),(132,'militare','Colpo perforante','Il personaggio, utilizzando un Fucile di Precisione, deve dichiarare CRASH! con il suo prossimo colpo.',1,10,138,'personale','attivo',NULL,NULL,NULL),(133,'militare','Braccia robuste','Il Personaggio può sparare con Shotgun e Fucili d\'Assalto impugnandoli con una sola mano.',1,10,-1,'personale','passivo',NULL,NULL,NULL),(134,'militare','Proiettili incendiari','Il personaggio se utilizza un Fucile di Precisione può aggiungere la chiamata FUOCO! al prossimo colpo sparato.',1,10,NULL,'personale','attivo',NULL,NULL,NULL),(135,'militare','Fuoco a terra','Il personaggio, se utilizza un Fucile di Precisione od uno Shotgun, può dichiarare per il prossimo colpo SPINTA X! al posto del danno dell\'arma, dove X corrisponde al danno causato (se il danno è superiore a QUADRUPLO! X assume come valore 7).',1,10,NULL,'personale','attivo',NULL,NULL,NULL),(136,'militare','Colpo non letale','Il personaggio può utilizzare la chiamata SHOCK! sparando con uno Shotgun con il prossimo colpo.',1,10,NULL,'personale','attivo',NULL,NULL,NULL),(137,'militare','Disarmare','Il personaggio può sostituire il danno effettuato con la chiamata DISARMO! con ogni arma da fuoco nella quale è competente. Il DISARMO! Si applica al prossimo colpo sparato.',1,10,NULL,'personale','attivo',NULL,NULL,NULL),(138,'militare','Mirare','Il personaggio, utilizzando un Fucile di Precisione, può dichiarare il prossimo colpo a dito su un bersaglio entro i 10 metri dopo aver simulato di mirare il suo obiettivo per 10 secondi.',1,10,-2,'10 metri','passivo',NULL,NULL,NULL),(139,'militare','Colpo sanguinante','Il personaggio può abbinare l\'effetto CONTINUO! al prossimo colpo.<br><br>(N.B. il tempo di Cooldown di questa abilità è 60 secondi e NON 30 secondi)',1,10,-1,'personale','attivo',NULL,NULL,NULL),(140,'militare','Arma selezionata','Il personaggio deve scegliere una tipologia di arma tra quelle in cui è addestrato. <br>Può aumentare di 1 il danno fatto con l\'arma prescelta secondo la scala <br>SINGOLO! - DOPPIO! - TRIPLO! - QUADRUPLO! - CRASH! - A ZERO!.<br>NOTA 1: non sono comprese nelle armi selezionabili le Granate.<br>NOTA 2: questo bonus è sommabile a qualunque altro bonus ai danni, eventualmente disponibile per il giocatore con l\'arma selezionata.',1,11,-6,'personale','passivo',NULL,NULL,NULL),(141,'militare','Pistola e coltello','Se il personaggio impugna un\'Arma da mischia corta e una Pistola, può dichiarare CONFUSIONE! con l\'arma da mischia ed aumentare di 1 le chiamate di danno effettuate con la pistola sul bersaglio confuso.<br><br>(NOTA: i potenziamenti seguono la seguente scala SINGOLO! - DOPPIO! - TRIPLO! - QUADRUPLO! - CRASH! - A ZERO!)',1,11,128,'personale','attivo',NULL,NULL,NULL),(142,'militare','Scarica accecante','Il personaggio può, utilizzando uno Shotgun, sostituire la sua prossima chiamata di danno con CONFUSIONE! IN QUEST\'AREA 3!.<br><br>(NOTA: l\'angolo formato dalle braccia per determinare l\'area d\'effetto DEVE essere 90°.)',1,11,136,'3 metri','attivo',NULL,NULL,NULL),(143,'militare','Gestione tattica','Quando il personaggio ha lo Shield ridotto a zero aumenta di 1 le chiamate fatte con le Armi da mischia.<br><br>(NOTA: i potenziamenti seguono la seguente scala SINGOLO! - DOPPIO! - TRIPLO! - QUADRUPLO! - CRASH! - A ZERO!)',1,11,NULL,'personale','passivo',NULL,NULL,NULL),(144,'militare','Resistere alla paura','Il personaggio può dichiarare IMMUNE! Alla chiamata PAURA!.',1,11,148,'personale','attivo',NULL,NULL,NULL),(145,'militare','Granate modificate','Il personaggio può aggiungere la chiamata CONFUSIONE! alla prossima granata lanciata.',1,11,NULL,'personale','attivo',NULL,NULL,NULL),(146,'militare','Bombe gemelle','Il personaggio può attaccare il cartellino Granata a una Granata che ne sia già fornita purché i cartellini delle due Granate siano identici, aumentando di 1 il danno base e aggiungendo 2 metri al raggio.',1,11,NULL,'personale','passivo',NULL,NULL,NULL),(147,'militare','Colpo di striscio','Dopo aver sparato un colpo con il fucile di precisione ad un bersaglio oltre i 10 metri, se il colpo è andato a vuoto, il personaggio potrà dichiarare a dito, su un bersaglio entro 1 metro da dove impatta il colpo, il danno scalato di uno secondo la scala:<br><br>SINGOLO! - DOPPIO! - TRIPLO! - QUADRUPLO! - CRASH! - A ZERO! - COMA!',1,11,138,'personale','attivo',NULL,NULL,NULL),(148,'militare','I morti non parlano','Se il personaggio ha subito almeno una ferita (Punti Ferita ridotti di almeno 1 punto a causa di danni) alla locazione vitale, può fingersi morto subendo CRASH! e BLOCCO! allo Shield. Se analizzato dichiara il suo status come CREPA!; tuttavia, se subisce una chiamata di danno, deve reagire muovendosi e rivelandosi.<br><br>(Nota Bene: Il Cooldown parte quando il personaggio si alza o compie altre azioni.)',1,11,152,'personale','attivo',NULL,NULL,NULL),(149,'militare','Colpo di mano','Il personaggio può dichiarare DISARMO! Con un colpo utilizzando un\'arma da mischia.',1,11,NULL,'personale','attivo',NULL,NULL,NULL),(150,'militare','Apriscatola','Il personaggio può aggiungere il descrittore DIRETTO! al prossimo colpo che sferrerà con un\'Arma da Mischia.',1,11,153,'personale','attivo',NULL,NULL,NULL),(151,'militare','Bomba adesiva','Il personaggio colpendo direttamente un Bersaglio con una granata può dichiarare la normale chiamata della granata, escludendo \"GRANATA!\" e \"RAGGIO X\". Se si manca fisicamente il bersaglio la granata è sprecata.',1,11,NULL,'personale','attivo',NULL,NULL,NULL),(152,'militare','Movimento occultato','Il personaggio è equipaggiato e addestrato all\'utilizzo di rifrattori ottici che gli permettono di restare invisibile per poco tempo. Quando attiva l\'abilità il personaggio può dichiarare su se stesso ATTENUAZIONE! Quante volte desidera per i prossimi 10 secondi. ',1,11,143,'personale','attivo',NULL,NULL,NULL),(153,'militare','Tempesta di lame','Il personaggio è un maestro nell\'uso di due lame in combattimento. Può utilizzare con il talento AMBIDESTRIA armi da mischia ad una mano di dimensione massime 130 cm.',1,11,128,'personale','passivo',NULL,NULL,NULL),(154,'militare','Bomba in buca','Il personaggio ha affinato il suo istinto di sopravvivenza: prima di essere colpito dagli effetti di GRANATA! può dichiarare IMMUNE! mimando di buttarsi a terra o dietro un riparo solido.',1,11,-1,'personale','attivo',NULL,NULL,NULL),(155,'militare','Gloria o morte','Il personaggio può attivare questa abilità urlando \"GLORIA O MORTE!\".<br>Da questo momento si considera avere punti ferita alocazionali pari ai punti ferita attuali della locazione vitale moltiplicati x 10 (fino ad un massimo di 40 punti ferita) e considera tutte le chiamate di danno come ARTEFATTO! TRIPLO! ad eccezione di CREPA! DISINTEGRAZIONE! E MUTILAZIONE! che subisce normalmente.<br>Il suo Shield, se presente, funziona normalmente.<br>Il personaggio deve lanciarsi in combattimento in mischia contro il più vicino bersaglio ostile.<br>Se tutti i bersagli ostili in vista sono morti prima di aver concluso i punti ferita il personaggio sviene e subisce ARTEFATTO COMA!; se viene abbattuto prima di aver terminato i bersagli ostili, o se non termina i bersagli entro 5 minuti, subisce invece ARTEFATTO! CREPA!<br><br><br>Ogni volta che utilizza questa abilità riduce il suo massimale di punti ferita di 1 per tutto l\'evento.',1,11,-8,'personale','attivo',NULL,NULL,NULL),(156,'militare','Opportunista','Quando il personaggio dichiara BONUS! su un bersaglio diverso da se stesso, può decidere di subire lo<br>stesso BONUS! a sua volta.',1,12,NULL,'personale','passivo',NULL,NULL,NULL),(157,'militare','Batteria ausiliare Medipack','Quando il personaggio utilizza un talento del Medipack, se il bersaglio dichiara IMMUNE! non fa partire il<br>Cooldown.',1,12,NULL,'personale','passivo',NULL,NULL,NULL),(158,'militare','Tuta da combattimento MK2','Il valore base dei punti Shield garantiti dalle locazioni equipaggiate con una tuta da combattimento<br>corazzata (come indicato a pag. 17) è moltiplicato per 1,5.',1,12,NULL,'personale','passivo',NULL,NULL,NULL),(159,'militare','Shield MK2','Se il personaggio ha almeno un Punto Shield base, guadagna +2 punti al suo valore globale.',1,12,NULL,'personale','passivo',NULL,2,NULL),(160,'militare','Controllo dello stress sul campo','Il personaggio può dichiarare NEUTRALIZZA! DOLORE! o NEUTRALIZZA! CONFUSIONE! su un bersaglio.',1,12,NULL,'10 metri','attivo',NULL,NULL,NULL),(161,'militare','Intervento d\'emergenza','Il personaggio può dichiarare RIMARGINAZIONE 1! su un bersaglio ferito dopo 30 secondi di interazione.',1,12,NULL,'Tocco','attivo',NULL,NULL,NULL),(162,'militare','Smuovere','Il personaggio può dichiarare NEUTRALIZZA SHOCK! Oppure NEUTRALIZZA PARALISI! toccando il<br>bersaglio.',1,12,NULL,'Tocco','attivo',NULL,NULL,NULL),(163,'militare','Medipack-Prime cure','Il personaggio può dichiarare BONUS! +3 PUNTI FERITA! toccando il bersaglio.',1,12,NULL,'Tocco','attivo',NULL,NULL,NULL),(164,'militare','Medipack-Antidolorifici ad alto spettro','Il valore di BONUS! Conferito con il Medipack è aumentato permanentemente di 1.',1,12,163,'personale','passivo',NULL,NULL,NULL),(165,'militare','Medipack-Nanochirurghi integrati','Il personaggio può dichiarare NEUTRALIZZA! MUTILAZIONE! Dopo 30 secondi di intervento simulato sul<br>bersaglio toccato.<br>(N.b. La locazione non ricresce miracolosamente: il bersaglio però potrà essere guarito anche se<br>necessita comunque di un innesto se vuole tornare ad usare la locazione colpita da mutilazione)',1,12,163,'Tocco','attivo',NULL,NULL,NULL),(166,'militare','Soccorritore di linea','Il personaggio, se sta impugnando solo una pistola e niente nell\'altra mano, può aumentare di 1 il danno<br>secondo la scala SINGOLO! - DOPPIO! - TRIPLO! - QUADRUPLO! - CRASH! - A ZERO!.<br>(NOTA: il bonus è sommabile a qualunque altro bonus disponibile per il giocatore con le pistole.)',1,12,-3,'personale','passivo',NULL,NULL,NULL),(167,'militare','Medipack-Resettare','Il personaggio può dichiarare NEUTRALIZZA! BONUS! ad un bersaglio non ostile.<br>Tempo Hacking: 10 secondi.',1,12,NULL,'Tocco','attivo',NULL,NULL,NULL),(168,'militare','Controller-Reinizializzazione dispositivi elettronici','Il personaggio può dichiarare NEUTRALIZZA! BLOCCO! su un qualunque impianto cibernetico (arto o<br>locazione vitale) che sta toccando.<br>Tempo Hacking: 10 secondi.',1,12,NULL,'Tocco','attivo',NULL,NULL,NULL),(169,'militare','Controller-Modifica frequenza shield','Il personaggio può dichiarare BONUS! +5 SHIELD! su un bersaglio equipaggiato con una Tuta da<br>Combattimento.<br>Tempo Hacking: 10 secondi.',1,12,NULL,'10 metri','attivo',NULL,NULL,NULL),(170,'militare','Controller-Miglioramento firmware innesti','Il personaggio può dichiarare BONUS! DIFESA MENTALE +1! Su un bersaglio.<br>Tempo Hacking: 10 secondi.<br>NOTA: se il bersaglio è privo di un qualunque tipo di innesto cerebrale DEVE dichiarare IMMUNE! Al<br>bonus sopra descritto.',1,12,NULL,'10 metri','attivo',NULL,NULL,NULL),(171,'militare','Controller-Campo difensivo','Il Personaggio può dichiarare BONUS! SHIELD +X! (dove X è il punteggio di Shield del personaggio)<br>RAGGIO 10!.<br>Tempo Hacking: 10 secondi.<br>Al termine, il personaggio subisce BLOCCO! CONTINUO! TEMPO 1 ORA! al proprio Controller.',1,12,-1,'Raggio 10 metri','attivo',NULL,NULL,NULL),(172,'militare','Protezione firmware avanzata','Il personaggio aumenta permanentemente di 1 il suo punteggio di Difesa Mentale.',1,13,NULL,'personale','passivo',NULL,NULL,1),(173,'militare','Schermatura celebrale','Il personaggio aumenta permanentemente di 2 il suo punteggio di Difesa Mentale (quest\'abilità va a<br>sostituire \"Protezione Firmware Avanzata\").',1,13,172,'personale','passivo',NULL,NULL,2),(174,'militare','Tuta corazzata \"\"Redentore\"\"','Il personaggio se equipaggiato con una tuta da combattimento corazzata aumenta di 2 il punteggio di<br>Shield ottenuto dalla suddetta tuta.<br>Una volta per giornata di gioco il personaggio, quando entra in status di Coma, può subire GUARIGIONE<br>5! Subendo quindi BLOCCO! CONTINUO! allo Shield.',1,13,NULL,'personale','passivo',NULL,2,NULL),(175,'militare','Angelo custode','Il personaggio, quando equipaggiato con uno Scudo e lo sta imbracciando, può dichiarare IMMUNE! Ad<br>una chiamata di danno su un bersaglio entro 1 metro da lui e subire quella chiamata sul suo Scudo.',1,13,NULL,'1 metro','attivo',NULL,NULL,NULL),(176,'militare','Non fa male! Non fa male!','Il personaggio quando armato con un Fucile d\'assalto può dichiarare DOLORE! in sostituzione al normale<br>danno portato dal colpo successivo.',1,13,NULL,'personale','attivo',NULL,NULL,NULL),(177,'militare','Controller-Stimolanti da battaglia','Il personaggio può dichiarare BONUS! DANNI +1!<br>Tempo Hacking: 10 secondi.',1,13,NULL,'10 metri','attivo',NULL,NULL,NULL),(178,'militare','Medico da battaglia','Il personaggio mentre è impegnato a prestare soccorso non può essere distratto da nessuno stimolo<br>inferiore ad una lesione fisica. Mentre sta utilizzando il Medipack per curare un bersaglio può dichiarare<br>IMMUNE! ai seguenti effetti: DOLORE! - PARALISI! - CONFUSIONE! - SHOCK! - DISARMO! - SPINTA!',1,13,179,'personale','passivo',NULL,NULL,NULL),(179,'militare','Mente razionale','Il personaggio può dichiarare IMMUNE! alla chiamata PAURA! su se stesso o NEUTRALIZZA PAURA!<br>toccando un altro bersaglio.',1,13,NULL,'personale/tocco','attivo',NULL,NULL,NULL),(180,'militare','Deviare energia','Il personaggio può spendere 6 Punti Shield per terminare un Cooldown attivo.',1,13,174,'personale','passivo',NULL,NULL,NULL),(181,'militare','Controller-Trasferimento energetico','Il personaggio può dichiarare BONUS! X SHIELD! (dove X sono i suoi punti Shield che vuole trasferire).<br>Tempo Hacking: 10 secondi.<br>NOTA: Il personaggio deve avere almeno 1 punto Shield attivo per poter effettuare il trasferimento.',1,13,NULL,'personale','attivo',NULL,NULL,NULL),(182,'militare','Controller-Potenziamento nanoriparatori','Il personaggio può dichiarare BONUS! +5 SHIELD! IMMUNE! a CRASH! su un qualunque bersaglio<br>equipaggiato con una tuta da combattimento.<br>Tempo Hacking: 10 secondi.',1,13,NULL,'10 metri','attivo',NULL,NULL,NULL),(183,'militare','Ultimo riparo','Il personaggio, se impugna uno scudo grande può dichiarare IMMUNE! ad una chiamata ad area o a<br>raggio; lo scudo impugnato subisce DISINTEGRAZIONE!',1,13,175,'personale','passivo',NULL,NULL,NULL),(184,'militare','Medipack-Vettore curativo aerodisperso','Il personaggio può, dopo 10 secondi di utilizzo del Medipack, dichiarare BONUS! +2 PUNTI FERITA!<br>RAGGIO 10!. Subisce quindi la dichiarazione BLOCCO! CONTINUO! TEMPO 5 MINUTI! al Medipack.',1,13,NULL,'Raggio 10 metri','attivo',NULL,NULL,NULL),(185,'militare','Medipack-Interfaccia biomeccanica di manutenzione e cura','Il personaggio può dichiarare BONUS! +2 PUNTI FERITA! e RIPARAZIONE 2! ad un bersaglio.<br>Tempo Hacking: 10 secondi.',1,13,NULL,'Tocco','attivo',NULL,NULL,NULL),(186,'militare','Medipack-Dispositivo di cura automatico d\'emergenza','Il personaggio, se cade in stato di Coma, può prima di cadere dichiarare BONUS! +1 PUNTO FERITA!<br>Raggio 10!. E subire BLOCCO! Al Medipack.',1,13,NULL,'personale','passivo',NULL,NULL,NULL),(187,'militare','Inganno della nera signora','Il personaggio può sostituire il danno della sua arma con la chiamata GUARIGIONE 2! VELENO! BONUS!<br>+ X PUNTI FERITA! Dove X è il danno che avrebbe causato, con un massimale di 4.<br>(N.B. il tempo di Cooldown di questa abilità è 60 secondi e NON 30 secondi)',1,13,-1,'personale','attivo',NULL,NULL,NULL),(188,'militare','Batteria schermata','Quando utilizzi un talento collegato al controller, se il bersaglio dichiara IMMUNE! ad ELETTRO!, il<br>Cooldown non viene attivato.',1,14,NULL,'personale','passivo',NULL,NULL,NULL),(189,'militare','Non a me, a lui!','Quando il personaggio subisce una chiamata di natura ELETTRO! può dichiarare IMMUNE! ma DEVE<br>ripetere la stessa chiamata (priva della natura ELETTRO!) su un bersaglio entro 10 metri a lui NON<br>ostile.',1,14,NULL,'personale','attivo',NULL,NULL,NULL),(190,'militare','Tuta da combattimento MK2','Il punteggio di Shield garantito da una tuta da combattimento equipaggiata aumenta di 1, se la tuta<br>fornisce al personaggio almeno un punto Shield Base.',1,14,NULL,'personale','passivo',NULL,1,NULL),(191,'militare','Shield MK2','Se il personaggio ha almeno un Punto Shield base, guadagna +2 punti al suo valore globale.',1,14,NULL,'personale','passivo',NULL,2,NULL),(192,'militare','Tempesta di piombo','Il personaggio può aggiungere PAURA! al prossimo colpo sparato con un mitragliatore pesante.',1,14,NULL,'personale','attivo',NULL,NULL,NULL),(193,'militare','Perfezionamento tattich d\'intrusione','Il personaggio ha + 1 permanente alle sue dichiarazioni di Hacking.',1,14,194,'personale','passivo',NULL,NULL,NULL),(194,'militare','Brute force','Il personaggio può ripetere il lancio di un programma di Hacking: per ogni lancio così effettuato può<br>aumentare di + 1 il valore di lancio del programma, fino a quando il bersaglio non ha subito la chiamata<br>lanciata o se il personaggio compie altre azioni.<br>Se un bersaglio dichiara immune a ELETTRO! L\'abilità si interrompe immediatamente.<br>(Esempio: Thug Sta lanciando il potere di distrazione su Erebron. Attende 10 secondi e poi dichiara<br>\"ELETTRO 1! CONFUSIONE!\" ad Erebron, il quale dichiara IMMUNE! e prosegue in quello che sta<br>facendo. Thug continua il conteggio dei 10 secondi successivi, per poi dichiarare \"ELETTRO 2!<br>CONFUSIONE!\" ad Erebron, il quale risponde ancora IMMUNE! e prosegue nelle sue azioni. Thug<br>continua il conteggio dei 10 secondi successivi, per poi dichiarare \"ELETTRO 3! CONFUSIONE!\" ad<br>Erebron, il quale questa volta subisce la chiamata. Il Cooldown di Thug inzierà ora, e lui potrà fare<br>nuove azioni.)',1,14,-4,'personale','passivo',NULL,NULL,NULL),(195,'militare','Farsi scudo','Se il personaggio impugna un Mitragliatore Pesante può dichiarare IMMUNE! ad un colpo subito ma<br>l\'arma subisce l\'effetto BLOCCO! Eccezioni sono le chiamate DISINTEGRAZIONE! (applicata comunque al<br>bersaglio) e le chiamate MUTILAZIONE! o CREPA! che infliggono all\'arma utilizzata la chiamata<br>DISINTEGRAZIONE! invece di BLOCCO!.',1,14,NULL,'personale','passivo',NULL,NULL,NULL),(196,'militare','Controller-Distrazione','Il personaggio può dichiarare ELETTRO 1! CONFUSIONE!<br>Tempo Hacking: 10 secondi.',1,14,NULL,'10 metri','attivo',NULL,NULL,NULL),(197,'militare','Controller-Disarmare','Il personaggio può dichiarare ELETTRO 1! DISARMO !<br>Tempo Hacking: 10 secondi.',1,14,NULL,'10 metri','attivo',NULL,NULL,NULL),(198,'militare','Controller-Dolore','Il personaggio può dichiarare ELETTRO 1! DOLORE!<br>Tempo Hacking: 10 secondi.',1,14,NULL,'10 metri','attivo',NULL,NULL,NULL),(199,'militare','Controller-Rottura','Il personaggio può dichiarare ELETTRO 1! CRASH! Shield.<br>Tempo Hacking: 10 secondi.<br>(N.b. Questa abilità ha effetto solo sullo Shield)',1,14,NULL,'10 metri','attivo',NULL,NULL,NULL),(200,'militare','Controller-Erosione','Il personaggio può dichiarare ELETTRO 1! SINGOLO! Su un bersaglio. Dopo averlo effettuato può<br>decidere di rimandare il cool-down standard e, dopo altri 10 secondi, può ripetere la chiamata sullo<br>stesso bersaglio. Può ripetere la stessa dichiarazione, sempre sullo stesso bersaglio e sempre ad<br>intervalli di 10 secondi, un numero di volte illimitato. Quando decide di interrompere la catena parte il<br>cool-down standard dell\'abilità. L\'abilità si considera interrotta se il personaggio è in status incapacitato.<br>Tempo Hacking: 10 secondi.',1,14,NULL,'10 metri','attivo',NULL,NULL,NULL),(201,'militare','Controller-Paralisi','Il personaggio può dichiarare ELETTRO 1! PARALISI!<br>Tempo Hacking : 10 secondi.',1,14,NULL,'10 metri','attivo',NULL,NULL,NULL),(202,'militare','Schermatura celebrale','Il valore di Difesa mentale del personaggio aumenta di 1.',1,14,NULL,'personale','passivo',NULL,NULL,1),(203,'militare','Hacking ad area','Il personaggio può, aumentando di 30 secondi il tempo di Hacking, aggiungere IN QUEST\'AREA! al<br>talento di Hacking che sta effettuando, alzando il valore di ELETTRO! a 4.<br>Dopo la dichiarazione subisce CRASH! e BLOCCO! CONTINUO! Alla Batteria.<br>(NOTA: l\'angolo formato dalle braccia per determinare l\'area d\'effetto DEVE essere massimo 90°.)<br>(N.B. Non può mai essere utilizzata con in combinazione con Brute-Force).',1,14,-1,'personale','passivo',NULL,NULL,NULL),(204,'militare','Parassita elettrico','Il personaggio mentre è in fase di cool-down può, toccando un bersaglio consenziente e non già sotto<br>BLOCCO!, dichiarare BLOCCO! Batteria! TEMPO 1 minuto! E abbreviare il suo cool-down attualmente<br>attivo di 30 secondi fino ad arrivare a minimo 0 secondi.',1,15,NULL,'Contatto','passivo',NULL,NULL,NULL),(205,'militare','Amplificazione dell\'area','Il personaggio quando usa una granata può aumentare di 2 metri il raggio della granata.',1,15,NULL,'personale','passivo',NULL,NULL,NULL),(206,'militare','Schermatura celebrale avanzata','Il valore di Difesa mentale del personaggio aumenta di 2. (Sostituisce il bonus dato da Schermatura Cerebrale)',1,15,173,'personale','passivo',NULL,NULL,2),(207,'militare','Controller-Sovraccarico elettromagnetico','Il personaggio può dichiarare ELETTRO 1! TRIPLO! su fino a 3 bersagli differenti.<br>Tempo Hacking : 10 secondi.<br>(N.B. Non può mai essere utilizzata con Hacking ad area)',1,15,NULL,'10 metri','attivo',NULL,NULL,NULL),(208,'militare','Controller-Smorzamento neurale','Il personaggio può dichiarare ELETTRO 1! BONUS! MENO -1 DANNI!<br>Tempo Hacking : 10 secondi.',1,15,NULL,'10 metri','attivo',NULL,NULL,NULL),(209,'militare','Granata congelante','Il personaggio può aggiungere la chiamata GELO! Al prossimo colpo con il lanciagranate.',1,15,205,'personale','attivo',NULL,NULL,NULL),(210,'militare','Fuoco di copertura','Il personaggio può dichiarare PAURA! IN QUEST\'AREA! Se impugna un mitragliatore pesante e sta già<br>sparando nella stessa direzione. Il personaggio dovrà continuare a sparare nella direzione generica in<br>cui ha effettuato la dichiarazione, fermandosi solo quando avrà terminato il caricatore o sarà in qualche<br>modo incapacitato.<br>(NOTA: l\'angolo formato dalle braccia per determinare l\'area d\'effetto DEVE essere massimo 90°.)',1,15,NULL,'personale','attivo',NULL,NULL,NULL),(211,'militare','Colpo di sponda','Dopo aver sparato un colpo con il lanciagranate, se il colpo manca il bersaglio il personaggio potrà<br>dichiarare a dito, su un bersaglio entro 1 metro da dove impatta il colpo, il danno scalato di uno secondo<br>la scala:<br>SINGOLO! - DOPPIO! - TRIPLO! - QUADRUPLO! - CRASH! - A ZERO! - COMA!',1,15,209,'personale','attivo',NULL,NULL,NULL),(212,'militare','Confettone','Il personaggio può, strappando il cartellino di una granata da lancio, effettuare la stessa chiamata<br>(senza dichiarare GRANATA! RAGGIO X!) con il prossimo colpo sparato con il lanciagranate.',1,15,209,'personale','attivo',NULL,NULL,NULL),(213,'militare','Controller-Alterare percezioni','Il personaggio può dichiarare ELETTRO 1! COMANDO! UCCIDILO!<br>Tempo Hacking : 10 secondi.<br>(N.B. Non può essere utilizzata con Hacking ad area)',1,15,NULL,'10 metri','attivo',NULL,NULL,NULL),(214,'militare','Controller-Svanire dalla mente','Il personaggio può dichiarare ELETTRO 1! COMANDO! IGNORAMI!<br>Tempo Hacking : 10 secondi.',1,15,213,'10 metri','attivo',NULL,NULL,NULL),(215,'militare','Controller-Fotografia','Il personaggio può dichiarare ELETTRO 1! PARALISI! TEMPO 1 Minuto!<br>Tempo Hacking : 10 secondi.',1,15,214,'10 metri','attivo',NULL,NULL,NULL),(216,'militare','Controller-Blocco totale','Il personaggio può dichiarare ELETTRO1! CRASH! BLOCCO!<br>Tempo Hacking : 10 secondi.<br>(N.B. Non può mai essere utilizzata con Hacking ad area)<br>(N.B. il tempo di Cooldown di questa abilità è 60 secondi e NON 30 secondi)',1,15,-7,'10 metri','attivo',NULL,NULL,NULL),(217,'militare','Controller-Cortocircuito','Il personaggio può dichiarare ELETTRO 1! NEUTRALIZZA BONUS!<br>Tempo Hacking : 10 secondi.',1,15,214,'10 metri','attivo',NULL,NULL,NULL),(218,'militare','Saturare l\'area','Il personaggio può aggiungere la chiamata IN QUEST\'AREA! al danno base della sua arma se impugna un mitragliatore pesante. Fino a quando continua a sparare può ripetere la dichiarazione IN QUEST\'AREA! Una volta ogni cinque secondi finchè non si muove o viene incapacitato.<br><br>(NOTA: l\'angolo formato dalle braccia per determinare l\'area d\'effetto DEVE essere massimo 90°.)',1,15,210,'personale','attivo',NULL,NULL,NULL),(219,'militare','Front toward enemy','Il personaggio, subendo la chiamata CRASH!, può strappare un cartellino Granata e fare la dichiarazione della granata sostituendo la chiamata GRANATA! RAGGIO X! con la chiamata IN QUEST\'AREA!<br><br>(NOTA: l\'angolo formato dalle braccia per determinare l\'area d\'effetto DEVE obbligatoriamente essere compreso tra 90° e 180°.)',1,15,-1,'personale','attivo',NULL,NULL,NULL);
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
  `id_componente` varchar(255) NOT NULL,
  `nome_componente` varchar(255) NOT NULL,
  `tipo_crafting_componente` set('tecnico','programmazione','chimico') NOT NULL,
  `tipo_componente` set('parametro_x','parametro_y','parametro_z','struttura','batteria','applicativo','supporto','cerotto','fiala','solido','sostanza') NOT NULL,
  `costo_attuale_componente` int(255) DEFAULT NULL,
  `costo_vecchio_componente` int(255) DEFAULT NULL,
  `fcc_componente` int(11) DEFAULT NULL,
  `valore_param_componente` int(11) DEFAULT NULL,
  `volume_componente` int(11) DEFAULT NULL,
  `energia_componente` int(11) DEFAULT NULL,
  `fattore_legame_componente` varchar(255) DEFAULT NULL,
  `curativo_primario_componente` varchar(255) DEFAULT NULL,
  `psicotropo_primario_componente` varchar(255) DEFAULT NULL,
  `tossico_primario_componente` varchar(255) DEFAULT NULL,
  `curativo_secondario_componente` varchar(255) DEFAULT NULL,
  `psicotropo_secondario_componente` varchar(255) DEFAULT NULL,
  `tossico_secondario_componente` varchar(255) DEFAULT NULL,
  `possibilita_dipendeza_componente` varchar(255) DEFAULT NULL,
  `effetto_sicuro_componente` varchar(255) DEFAULT NULL,
  `descrizione_componente` text,
  PRIMARY KEY (`id_componente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componenti_crafting`
--

LOCK TABLES `componenti_crafting` WRITE;
/*!40000 ALTER TABLE `componenti_crafting` DISABLE KEYS */;
INSERT INTO `componenti_crafting` VALUES ('A001','Emettitore laser mk1','tecnico','applicativo',50,43,1,NULL,-1,-30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore laser di bassa qualità'),('A002','Emettitore laser mk2','tecnico','applicativo',70,81,1,NULL,-1,-25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore laser standard'),('A003','Emettitore laser mk3','tecnico','applicativo',90,115,1,NULL,-1,-20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore laser di alta qualità'),('A004','Emettitore plasma mk1','tecnico','applicativo',60,70,1,NULL,-1,-35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore plasma di bassa qualità'),('A005','Emettitore plasma mk2','tecnico','applicativo',90,96,1,NULL,-1,-40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore plasma standard'),('A006','Emettitore plasma mk3','tecnico','applicativo',120,92,1,NULL,-1,-45,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore plasma di alta qualità'),('A007','Emettitore  fusore mk1','tecnico','applicativo',80,96,1,NULL,-1,-40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore fusore di bassa qualità'),('A008','Emettitore  fusore mk2','tecnico','applicativo',120,115,1,NULL,-1,-35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore fusore standard'),('A009','Emettitore  fusore mk3','tecnico','applicativo',160,180,1,NULL,-1,-30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore fusore di alta qualità'),('A010','Emettitore laser per pistola mk1','tecnico','applicativo',25,21,1,NULL,-1,-30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore laser di bassa qualità'),('A011','Emettitore laser per pistola mk2','tecnico','applicativo',20,15,1,NULL,-1,-25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore laser standard'),('A012','Emettitore laser per pistola mk3','tecnico','applicativo',15,10,1,NULL,-1,-20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore laser di alta qualità'),('A013','Emettitore laser per fucile d\'assalto mk1','tecnico','applicativo',30,26,1,NULL,-1,-30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore laser di bassa qualità'),('A014','Emettitore laser per fucile d\'assalto mk2','tecnico','applicativo',35,31,1,NULL,-1,-25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore laser standard'),('A015','Emettitore laser per fucile d\'assalto mk3','tecnico','applicativo',40,44,1,NULL,-1,-20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore laser di alta qualità'),('A016','Emettitore laser per shotgun mk1','tecnico','applicativo',30,33,1,NULL,-1,-30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore laser di bassa qualità'),('A017','Emettitore laser per shotgun mk2','tecnico','applicativo',35,33,1,NULL,-1,-25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore laser standard'),('A018','Emettitore laser per shotgun mk3','tecnico','applicativo',40,45,1,NULL,-1,-20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore laser di alta qualità'),('A019','Emettitore laser per mitragliatore mk1','tecnico','applicativo',30,29,1,NULL,-1,-30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore laser di bassa qualità'),('A020','Emettitore laser per mitragliatore mk2','tecnico','applicativo',35,32,1,NULL,-1,-25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore laser standard'),('A021','Emettitore laser per mitragliatore mk3','tecnico','applicativo',40,52,1,NULL,-1,-20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore laser di alta qualità'),('A022','Emettitore laser per fucile di precisione mk1','tecnico','applicativo',30,29,1,NULL,-1,-30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore laser di bassa qualità'),('A023','Emettitore laser per fucile di precisione mk2','tecnico','applicativo',35,35,1,NULL,-1,-25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore laser standard'),('A024','Emettitore laser per fucile di precisione mk3','tecnico','applicativo',40,51,1,NULL,-1,-20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore laser di alta qualità'),('A025','Emettitore plasma per pistola mk1','tecnico','applicativo',40,31,1,NULL,-1,-35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore plasma di bassa qualità'),('A026','Emettitore plasma per pistola mk2','tecnico','applicativo',45,41,1,NULL,-1,-30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore plasma standard'),('A027','Emettitore plasma per pistola mk3','tecnico','applicativo',50,56,1,NULL,-1,-25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore plasma di alta qualità'),('A028','Emettitore plasma per fucile d\'assalto mk1','tecnico','applicativo',40,38,1,NULL,-1,-35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore plasma di bassa qualità'),('A029','Emettitore plasma per fucile d\'assalto mk2','tecnico','applicativo',45,36,1,NULL,-1,-30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore plasma standard'),('A030','Emettitore plasma per fucile d\'assalto mk3','tecnico','applicativo',50,38,1,NULL,-1,-25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore plasma di alta qualità'),('A031','Emettitore plasma per shotgun mk1','tecnico','applicativo',40,38,1,NULL,-1,-35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore plasma di bassa qualità'),('A032','Emettitore plasma per shotgun mk2','tecnico','applicativo',45,35,1,NULL,-1,-30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore plasma standard'),('A033','Emettitore plasma per shotgun mk3','tecnico','applicativo',50,37,1,NULL,-1,-25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore plasma di alta qualità'),('A034','Emettitore plasma per fucile di precisione mk1','tecnico','applicativo',40,40,1,NULL,-1,-35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore plasma di bassa qualità'),('A035','Emettitore plasma per fucile di precisione mk2','tecnico','applicativo',45,52,1,NULL,-1,-30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore plasma standard'),('A036','Emettitore plasma per fucile di precisione mk3','tecnico','applicativo',50,61,1,NULL,-1,-25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore plasma di alta qualità'),('A037','Emettitore instabile plasma mk1','tecnico','applicativo',30,23,1,NULL,-1,-25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore che necessita di raffreddamento'),('A038','Emettitore instabile plasma mk2','tecnico','applicativo',35,31,1,NULL,-1,-20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore che necessita di raffreddamento'),('A039','Emettitore instabile fusore mk1','tecnico','applicativo',70,51,1,NULL,-1,-25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore che necessita di raffreddamento'),('A040','Emettitore instabile fusore mk2','tecnico','applicativo',65,80,1,NULL,-1,-30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore che necessita di raffreddamento'),('A041','Emettitore instabile plasma per pistola mk1','tecnico','applicativo',30,38,1,NULL,-1,-40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore che necessita di raffreddamento'),('A042','Emettitore instabile plasma per pistola mk2','tecnico','applicativo',35,29,1,NULL,-1,-40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore che necessita di raffreddamento'),('A043','Emettitore instabile plasma per fucile d\'assalto mk1','tecnico','applicativo',40,47,1,NULL,-1,-50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore che necessita di raffreddamento'),('A044','Emettitore instabile plasma per fucile d\'assalto mk2','tecnico','applicativo',45,57,1,NULL,-1,-45,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore che necessita di raffreddamento'),('A045','Emettitore instabile plasma per shotgun mk1','tecnico','applicativo',50,51,1,NULL,-1,-40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore che necessita di raffreddamento'),('A046','Emettitore instabile plasma per shotgun mk2','tecnico','applicativo',55,57,1,NULL,-1,-35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore che necessita di raffreddamento'),('A047','Emettitore instabile plasma per fucile di precisione mk1','tecnico','applicativo',60,72,1,NULL,-1,-30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore che necessita di raffreddamento'),('A048','Emettitore instabile plasma per fucile di precisione mk2','tecnico','applicativo',65,73,1,NULL,-1,-25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore che necessita di raffreddamento'),('A049','Emettitore sovralimentato adattivo mk1','tecnico','applicativo',7000,8680,1,NULL,-3,-35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore estremamente potente'),('A050','Emettitore sovralimentato adattivo mk2','tecnico','applicativo',8000,9440,1,NULL,-3,-25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore estremamente potente'),('A051','Emettitore sovralimentato per pistola mk1','tecnico','applicativo',5000,4400,1,NULL,-2,-35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore estremamente potente'),('A052','Emettitore sovralimentato per pistola mk2','tecnico','applicativo',6000,6000,1,NULL,-2,-25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore estremamente potente'),('A053','Emettitore sovralimentato per fucile d\'assalto mk1','tecnico','applicativo',5000,4250,1,NULL,-3,-35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore estremamente potente'),('A054','Emettitore sovralimentato per fucile d\'assalto mk2','tecnico','applicativo',6000,7020,1,NULL,-3,-25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore estremamente potente'),('A055','Emettitore sovralimentato per shotgun mk1','tecnico','applicativo',5000,4900,1,NULL,-3,-35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore estremamente potente'),('A056','Emettitore sovralimentato per shotgun mk2','tecnico','applicativo',6000,6000,1,NULL,-3,-25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore estremamente potente'),('A057','Emettitore sovralimentato per mitragliatore mk1','tecnico','applicativo',5000,5850,1,NULL,-3,-35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore estremamente potente'),('A058','Emettitore sovralimentato per mitragliatore mk2','tecnico','applicativo',6000,4260,1,NULL,-3,-25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore estremamente potente'),('A059','Emettitore sovralimentato per fucile di precisione mk1','tecnico','applicativo',5000,4600,1,NULL,-3,-35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore estremamente potente'),('A060','Emettitore sovralimentato per fucile di precisione mk2','tecnico','applicativo',6000,5340,1,NULL,-3,-25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Emettitore estremamente potente'),('A061','Alimentazione secondaria a gas','tecnico','applicativo',400,336,0,NULL,-1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Questo pezzo permette di alimentare  a gas tubi di lancio'),('A062','Tubo di lancio piccolo','tecnico','applicativo',400,352,1,NULL,-1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Questo pezzo permette di lanciare capsule di piccole dimensioni ma va alimentato a gas'),('A063','Tubo di lancio grosso','tecnico','applicativo',400,292,1,NULL,-1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Questo pezzo permette di lanciare capsule di grosse dimensioni ma va alimentato a gas'),('A064','Generatore di campo portatile','tecnico','applicativo',3000,3780,1,NULL,-1,-25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Questo componente genera un piccolo campo shield'),('A065','Generatore di campo portatile  migliorato','tecnico','applicativo',5000,3550,1,NULL,-1,-25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Questo componente genera un piccolo campo shield'),('A066','Dissipatore di energia','tecnico','applicativo',7000,5180,1,NULL,-1,-40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'questo componente, se applicato a un\'arma, causa colpi molto dolorosi'),('A067','Igniter','tecnico','applicativo',9000,8730,1,NULL,-1,-40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'permette alle armi di causare colpi incendiari'),('A068','Cooler','tecnico','applicativo',9000,9990,1,NULL,-1,-40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'permette alle armi di causare colpi congelanti'),('A069','Stasis','tecnico','applicativo',7000,7070,1,NULL,-2,-40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'permette di bloccare temporaneamente il nemico'),('A070','Camera di combustione per proiettili solidi da pistola','tecnico','applicativo',15000,17850,1,NULL,-2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'permette a una pistola di sparare proiettili solidi'),('A071','Camera di combustione per proiettili solidi da fucile d\'assalto','tecnico','applicativo',30000,32700,1,NULL,-4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'permette a un fucile d\'assalto di sparare proiettili solidi'),('A072','Camera di combustione per proiettili solidi da fucile di precisione','tecnico','applicativo',20000,15200,1,NULL,-4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'permette a un fucile di precisione di sparare proiettili solidi'),('A073','Camera di combustione per proiettili solidi da shotgun','tecnico','applicativo',20000,16200,1,NULL,-4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'permette a uno shotgun di sparare proiettili solidi'),('A074','Camera di combustione per proiettili solidi da mitragliatore','tecnico','applicativo',30000,23700,1,NULL,-4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'permette a un mitragliatore di sparare proiettili solidi'),('A075','Attuatore cinetico di bassa qualità per braccio','tecnico','applicativo',200,206,1,NULL,-1,-35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'arto artificiale di base non migliorabile'),('A076','Attuatore cinetico di media qualità per braccio','tecnico','applicativo',400,388,1,NULL,-1,-20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'arto artificiale di base non migliorabile'),('A077','Attuatore cinetico di alta qualità per braccio','tecnico','applicativo',1000,1010,0,NULL,-1,-20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'arto artificiale da implementare con sistemi ausiliari'),('A078','Attuatore cinetico di bassa qualità per gamba','tecnico','applicativo',200,140,1,NULL,-1,-35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'arto artificiale di base non migliorabile'),('A079','Attuatore cinetico di media qualità per gamba','tecnico','applicativo',400,360,1,NULL,-1,-20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'arto artificiale di base non migliorabile'),('A080','Attuatore cinetico di alta qualità per gamba','tecnico','applicativo',1000,900,0,NULL,-1,-20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'arto artificiale da implementare con sistemi ausiliari'),('A081','Rifrattore cinetico leggero per scudo','tecnico','applicativo',700,588,0,NULL,-2,-30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Montabile solo su uno scudo'),('A082','Rifrattore cinetico pesante per scudo','tecnico','applicativo',600,756,0,NULL,-2,-20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Montabile solo su uno scudo'),('A083','Moltiplicatore cinetico','tecnico','applicativo',7000,7910,1,NULL,-2,-20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'aumenta la forza fisica'),('A084','Moltiplicatore cinetico potenziato','tecnico','applicativo',5000,3500,1,NULL,-2,-40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'aumenta la forza fisica'),('A085','Stabilizzatore giroscopico','tecnico','applicativo',7000,9100,1,NULL,-2,-25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Garantisce maggiore stabilità in movimento'),('A086','Stabilizzatore inerziale','tecnico','applicativo',5000,4500,1,NULL,-2,-35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Garantisce al suo utilizzatore un equilibrio eccezionale'),('A087','Filtro per polveri e inquinanti','tecnico','applicativo',200,234,1,NULL,-1,-15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'il filtro riduce la potenza delle sostanze tossiche'),('A088','Filtro elettromagnetico per inquinanti','tecnico','applicativo',700,581,1,NULL,-1,-20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Il filtro protegge da inquinanti'),('A089','Memoria di massa da 1 T','tecnico','applicativo',30,30,1,NULL,-1,-10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Memoria di massa per programmi'),('A090','Memoria di massa da 2 T','tecnico','applicativo',50,36,1,NULL,-1,-5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Memoria di massa per programmi'),('A091','Memoria di massa da 3 T','tecnico','applicativo',70,88,1,NULL,-1,-5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Memoria di massa per programmi'),('A092','Memoria di massa da 4 T','tecnico','applicativo',90,109,1,NULL,-1,-10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Memoria di massa per programmi'),('A093','Memoria di massa da 5 T','tecnico','applicativo',100,77,1,NULL,-1,-10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Memoria di massa per programmi'),('A094','Memoria di massa da 6 T','tecnico','applicativo',120,127,1,NULL,-1,-15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Memoria di massa per programmi'),('A095','Memoria di massa da 7 T','tecnico','applicativo',150,121,1,NULL,-1,-15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Memoria di massa per programmi'),('A096','Pelle artificiale','tecnico','applicativo',400,320,1,NULL,-1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Tessuto sintetico che simula la pelle umana'),('A097','Indicatore GPS','tecnico','applicativo',50,48,1,NULL,-1,-5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Connettore per geo localizzazione'),('A098','Sistema di comunicazione  a lunga gittata','tecnico','applicativo',50,61,1,NULL,-1,-5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Permette di chiamare tramite apparecchi in remoto altri apparecchi'),('A100','Diffusore di particelle da  campo','tecnico','applicativo',500,595,1,NULL,-4,-60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Questo apparecchio diffonde sostanze nell\'aria'),('A101','Analizzatore meccanico','tecnico','applicativo',500,540,1,NULL,-1,-15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Analizza le condizioni di un oggetto meccanico'),('A102','Analizzatore biometrico','tecnico','applicativo',500,510,1,NULL,-1,-15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Analizza le condizioni di un corpo organico'),('A103','Meccanismo di cucitura organica','tecnico','applicativo',200,202,1,NULL,-1,-15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Permette di curare le persone'),('A104','Meccanismo di riparazione','tecnico','applicativo',200,158,1,NULL,-1,-15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Permette di riparare le cose'),('A105','Ripetitore di segnale di rete','tecnico','applicativo',100,73,1,NULL,-1,-15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Permette di collegarsi a segnali di connessione'),('A106','Placche rinforzate leggere','tecnico','applicativo',1500,1560,1,NULL,-2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Placche di rinforzo leggere'),('A107','Placche rinforzate pesanti','tecnico','applicativo',2500,2175,1,NULL,-4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Placche di rinforzo pesanti'),('A108','Generatore elettromagnetico da detonazione limitata','tecnico','applicativo',50,48,1,NULL,-1,-5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Genera un impulso che fa detonare il contenitore'),('A109','Generatore elettromagnetico da detonazione ','tecnico','applicativo',90,113,1,NULL,-1,-5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Genera un impulso che fa detonare il contenitore'),('A110','Generatore magnetico da dispersione a microonde','tecnico','applicativo',90,102,1,NULL,-1,-10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Causa la vaporizzazione del liquido contenuto'),('A111','Generatore a a carica residua','tecnico','applicativo',1500,1275,1,NULL,-3,-30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Generatore da campo che brucia batterie ricaricabili'),('A112','Accumulatore energetico per torcia plasma','tecnico','applicativo',1000,770,1,NULL,-1,-25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Torcia plasma da taglio'),('A113','Analizzatore biologico migliorato','tecnico','applicativo',500,575,1,NULL,-1,-15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Permette di curare con maggiore precisione'),('A114','Analizzatore meccanico migliorato','tecnico','applicativo',500,530,1,NULL,-1,-15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Permette di eseguire riparazioni con maggiore precisione'),('A115','Meccanismo di sutura veloce','tecnico','applicativo',1000,810,1,NULL,-1,-15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Permette di curare in tempi più brevi'),('A116','Meccanismo di saldatura rapida','tecnico','applicativo',1000,730,1,NULL,-1,-15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Permette di riparare in tempi più brevi'),('A117','Sistema ottico per videocamere notturne','tecnico','applicativo',200,172,1,NULL,-1,-5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Visore notturno'),('A118','Sisetema di ottiche avanzate da telecomunicazioni','tecnico','applicativo',200,226,1,NULL,-1,-5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Visore per videocamere'),('A119','Sistema di ottiche schermate da sovraesposizione luminosa','tecnico','applicativo',2000,2200,1,NULL,-1,-15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Immunità a confusione su protesi a occhi'),('A120','Labirinto elettronico','tecnico','applicativo',10000,9500,2,NULL,-1,-15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Rende difficile le intrusioni elettroniche mentali'),('A121','Dedalo Elettronico','tecnico','applicativo',20000,22400,2,NULL,-1,-15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Rende molto difficile le intrusioni elettroniche mentali'),('A122','Schermatura nervosa','tecnico','applicativo',1000,1070,1,NULL,-2,-30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Da montare in protesi o corazze riduce la percezione del dolore'),('A123','Inibitore nervoso','tecnico','applicativo',2000,1620,1,NULL,-1,-25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Inibitore del sistema nervoso ( solo protesi)'),('A124','Serraggio elettromagnetico','tecnico','applicativo',500,370,1,NULL,-2,-35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Sistema di serraggio elettromagnetico a morsa'),('A125','Placche rinforzate in Carbonio alterato','tecnico','applicativo',1500,1845,1,NULL,-2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Sistema di placche corazzate simili quelle montate sugli esoscheletri'),('A126','Protezione Ignifuga','tecnico','applicativo',5000,6150,2,NULL,-2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Il materiale con cui è fatto l\'oggetto viene reso ignifugo'),('A127','Protezione termica','tecnico','applicativo',5000,6350,2,NULL,-2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Il materiale con cui è fatto l\'oggetto viene reso refrattario al freddo'),('A128','Perforatore a frammentazione per coltelli da lancio','tecnico','applicativo',20,22,1,NULL,-1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Solo per coltelli, li frantuma all\'impatto'),('A129','Perforatore a dispersione per coltelli da lancio','tecnico','applicativo',50,56,1,NULL,-1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Capsula da dispersione di liquidi per coltelli da lancio'),('A130','Condesatore da soravvarico per coltelli','tecnico','applicativo',1000,810,1,NULL,-1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Condensatore elettromagnetico per coltelli da lancio'),('A131','Generatore di campo per corazze','tecnico','applicativo',100,93,1,NULL,-1,-30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Garantisce uno Shield a una corazza'),('A132','Generatore elettromagnetico da detonazione potenziato','tecnico','applicativo',200,166,1,NULL,-1,-5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Genera un impulso che fa detonare il contenitore'),('A133','Generatore di campo per corazze Potenziato','tecnico','applicativo',400,364,1,NULL,-1,-40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Garantisce uno Shield a una corazza'),('A134','Generatore di campo per corazze Maggiorato','tecnico','applicativo',800,936,1,NULL,-1,-50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Garantisce uno Shield a una corazza'),('B001','Batteria NRG  type A - 1','tecnico','batteria',10,7,0,NULL,-1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Batteria ricaricabile economica'),('B002','Batteria NRG  type A - 2','tecnico','batteria',15,19,0,NULL,-1,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Batteria ricaricabile economica'),('B003','Batteria NRG  type A - 3','tecnico','batteria',20,24,0,NULL,-2,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Batteria ricaricabile economica'),('B004','Batteria NRG  type A - 4','tecnico','batteria',40,49,0,NULL,-2,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Batteria ricaricabile economica'),('B005','Batteria NRG  type A - 5','tecnico','batteria',60,44,0,NULL,-3,50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Batteria ricaricabile economica'),('B006','Batteria Max Power 1','tecnico','batteria',200,162,0,NULL,-1,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Batteria ricaricabile potente'),('B007','Batteria Max power 2','tecnico','batteria',450,549,0,NULL,-1,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Batteria ricaricabile potente'),('B008','Batteria Max Power 5','tecnico','batteria',1600,1424,0,NULL,-2,100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Batteria ricaricabile potente'),('B009','Batteria Max Power  10','tecnico','batteria',300,381,0,NULL,-3,300,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Batteria ricaricabile potente'),('B010','Batteria monouso A -1','tecnico','batteria',5,6,0,NULL,-1,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Batteria da  1 carica usa e getta'),('B011','Batteria monouso A -2','tecnico','batteria',7,8,0,NULL,-1,15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Batteria da 1 carica usa e getta'),('B012','Batteria monouso A -3','tecnico','batteria',10,8,0,NULL,-2,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Batteria da  2 cariche usa e getta'),('B013','Batteria monouso A -4','tecnico','batteria',20,15,0,NULL,-3,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Batteria da 2 cariche usa e getta'),('B014','Batteria monouso A -5','tecnico','batteria',30,33,0,NULL,-3,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Batteria da 3 cariche usa e getta'),('B015','Batteria Hotshot  B-1','tecnico','batteria',7,8,0,NULL,-1,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Batteria da 2 cariche sovralimentata'),('B016','Batteria Hotshot  B-2','tecnico','batteria',11,12,0,NULL,-1,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Batteria da 3 cariche sovralimentata'),('B017','Batteria Hotshot  B-3','tecnico','batteria',15,18,0,NULL,-2,35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Batteria da 2 cariche sovralimentata'),('B018','Batteria Hotshot  B-4','tecnico','batteria',30,27,0,NULL,-3,40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Batteria da 3 cariche sovralimentata'),('B019','Alimentazione a rete','tecnico','batteria',10,10,0,NULL,-3,10000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'alimentazione a rete da collegare con cavo'),('D001','f - x 001','chimico','fiala',10,9,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','0','0','0',NULL,'liquido per fiala'),('D002','f - x 002','chimico','fiala',400,428,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','0','0','0','Aggiungi alla chiamata CONTINUO!','liquido per fiala ad assorbimento lento'),('D003','p - d 001','chimico','solido',10,13,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','0','0','0',NULL,'polvere  per composti '),('D004','p - d 002','chimico','solido',50,45,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','0','0','0','Ripeti la chiamata 2 volte','polvere ad assorbimento veloce'),('D005','gl - 001','chimico','cerotto',10,11,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','0','0','0',NULL,'emulsione'),('D006','gl - 002','chimico','cerotto',1200,1176,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','0','0','0','Ripeti 2 volte la chiamata e subisci CONTINUO!','emulsione massiccia e potente'),('S001','parti in plastica  -  S','tecnico','struttura',100,104,0,NULL,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Cassa di dimensione piccola standard'),('S002','parti in plastica -  M','tecnico','struttura',150,147,0,NULL,4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Cassa di dimensione media standard'),('S003','parti in plastica -  L','tecnico','struttura',250,252,0,NULL,6,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Cassa di dimensione grande standard'),('S004','parti in metallo  - S','tecnico','struttura',500,435,0,NULL,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Cassa di dimensione piccola robusta'),('S005','parti in metallo  - M','tecnico','struttura',750,637,0,NULL,4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Cassa di dimensione media robusta'),('S006','parti in metallo  - L','tecnico','struttura',1250,1550,0,NULL,6,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Cassa di dimensione grande robusta'),('S007','parti in resina - S','tecnico','struttura',50,50,0,NULL,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Cassa di dimensione piccola fragile'),('S008','parti in resina - M','tecnico','struttura',75,57,0,NULL,4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Cassa di dimensione media fragile'),('S009','parti in resina - L','tecnico','struttura',125,122,0,NULL,6,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Cassa di dimensione grande fragile'),('S010','parti di recupero -S','tecnico','struttura',10,12,0,NULL,2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Cassa di dimensione piccola di recupero'),('S011','parti di recupero – M','tecnico','struttura',15,18,0,NULL,4,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Cassa di dimensione media di recupero'),('S012','parti di recupero – L','tecnico','struttura',25,32,0,NULL,6,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Cassa di dimensione grande di recupero'),('S013','parti in Elettrolite – S','tecnico','struttura',2000,1880,0,NULL,2,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Cassa di dimensione piccola in Elettrolite'),('S014','parti in Elettrolite  -M','tecnico','struttura',3000,3180,0,NULL,4,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Cassa di dimensione media in Elettrolite'),('S015','parti in elettrolite – L','tecnico','struttura',5000,5400,0,NULL,6,100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Cassa di dimensione grande di Elettrolite'),('SS001','DX - 01','chimico','sostanza',20,25,NULL,NULL,NULL,NULL,NULL,'2','7','7','0,3','0,1','0,9','2',NULL,'molecola curativa '),('SS002','DX - 02','chimico','sostanza',60,70,NULL,NULL,NULL,NULL,NULL,'6','9','1','1','0,4','0,8','1',NULL,'molecola curativa '),('SS003','DX - 03','chimico','sostanza',20,18,NULL,NULL,NULL,NULL,NULL,'2','3','7','1,3','0,6','0,9','1',NULL,'molecola curativa '),('SS004','DX - 04','chimico','sostanza',100,120,NULL,NULL,NULL,NULL,NULL,'18','3','2','0,7','0,3','0,7','2',NULL,'molecola curativa '),('SS005','DX- 05','chimico','sostanza',60,47,NULL,NULL,NULL,NULL,NULL,'12','4','7','0,1','0,6','0,8','1',NULL,'molecola curativa '),('SS006','DX - 06','chimico','sostanza',20,24,NULL,NULL,NULL,NULL,NULL,'5','8','5','0,6','0,2','0,5','2',NULL,'molecola curativa '),('SS007','DX - 07','chimico','sostanza',80,64,NULL,NULL,NULL,NULL,NULL,'8','4','3','0,8','1','0,6','2',NULL,'molecola curativa '),('SS008','DX - 08','chimico','sostanza',60,57,NULL,NULL,NULL,NULL,NULL,'15','2','1','0,4','0,4','0,1','3',NULL,'molecola curativa '),('SS009','DX - 09','chimico','sostanza',60,72,NULL,NULL,NULL,NULL,NULL,'7','8','4','0,6','1','0,1','1',NULL,'molecola curativa '),('SS010','DX - 10','chimico','sostanza',20,16,NULL,NULL,NULL,NULL,NULL,'8','9','3','0,5','0,2','0,2','2',NULL,'molecola curativa '),('SS011','DX - 11','chimico','sostanza',100,100,NULL,NULL,NULL,NULL,NULL,'15','4','1','0,6','1','0,3','1',NULL,'molecola curativa '),('SS012','DX - 12','chimico','sostanza',80,88,NULL,NULL,NULL,NULL,NULL,'20','9','3','0,4','0,1','0,4','2',NULL,'molecola curativa '),('SS013','DX - 13','chimico','sostanza',80,68,NULL,NULL,NULL,NULL,NULL,'11','10','5','0,5','0,9','0,2','0',NULL,'molecola curativa '),('SS014','DX - 14','chimico','sostanza',60,57,NULL,NULL,NULL,NULL,NULL,'7','10','4','0,5','0,5','0,5','2',NULL,'molecola curativa '),('SS015','DX - 15','chimico','sostanza',30,27,NULL,NULL,NULL,NULL,NULL,'4','8','5','0,5','1','0,1','3',NULL,'molecola curativa '),('SS016','DX - 16','chimico','sostanza',80,68,NULL,NULL,NULL,NULL,NULL,'7','9','1','0,5','1','0,5','1',NULL,'molecola curativa '),('SS017','DX - 17','chimico','sostanza',80,87,NULL,NULL,NULL,NULL,NULL,'11','8','4','0,9','0,2','0,5','3',NULL,'molecola curativa '),('SS018','DX - 18','chimico','sostanza',20,22,NULL,NULL,NULL,NULL,NULL,'1','6','6','0,8','1','1','0',NULL,'molecola curativa '),('SS019','DX - 19','chimico','sostanza',20,23,NULL,NULL,NULL,NULL,NULL,'5','3','2','0,1','0,1','0,4','3',NULL,'molecola curativa '),('SS020','DX - 20','chimico','sostanza',20,15,NULL,NULL,NULL,NULL,NULL,'4','6','2','0,2','0,4','0,8','0',NULL,'molecola curativa '),('SS021','AX5 - 01','chimico','sostanza',70,58,NULL,NULL,NULL,NULL,NULL,'1','1','6','0,6','0,2','0,7','2',NULL,'molecola tossica '),('SS022','AX5 - 02','chimico','sostanza',100,127,NULL,NULL,NULL,NULL,NULL,'4','17','2','0,1','0,4','0,2','1',NULL,'molecola tossica'),('SS023','AX5 - 03','chimico','sostanza',70,74,NULL,NULL,NULL,NULL,NULL,'1','2','2','0,2','0,6','0,5','3',NULL,'molecola tossica '),('SS024','AX5 - 04','chimico','sostanza',300,384,NULL,NULL,NULL,NULL,NULL,'4','15','7','0,8','0,3','0,2','1',NULL,'molecola tossica'),('SS025','AX5 - 05','chimico','sostanza',100,86,NULL,NULL,NULL,NULL,NULL,'2','6','1','1','0,1','0,1','3',NULL,'molecola tossica '),('SS026','AX5 - 06','chimico','sostanza',300,375,NULL,NULL,NULL,NULL,NULL,'2','13','5','0,6','0,7','0,5','1',NULL,'molecola tossica'),('SS027','AX5 - 07','chimico','sostanza',100,73,NULL,NULL,NULL,NULL,NULL,'2','20','1','0,2','0,1','0,2','0',NULL,'molecola tossica '),('SS028','AX5 - 08','chimico','sostanza',250,252,NULL,NULL,NULL,NULL,NULL,'9','17','3','0,2','0,7','0,4','3',NULL,'molecola tossica'),('SS029','AX5 - 09','chimico','sostanza',150,156,NULL,NULL,NULL,NULL,NULL,'6','9','2','0,3','0,5','0,7','0',NULL,'molecola tossica '),('SS030','AX5 - 10','chimico','sostanza',300,324,NULL,NULL,NULL,NULL,NULL,'1','14','4','1','0,7','0,1','1',NULL,'molecola tossica'),('SS031','AX5 - 11','chimico','sostanza',300,222,NULL,NULL,NULL,NULL,NULL,'8','16','5','0,6','0,6','0,2','1',NULL,'molecola tossica '),('SS032','AX5 - 12','chimico','sostanza',300,387,NULL,NULL,NULL,NULL,NULL,'7','12','4','0,8','0,3','0,5','2',NULL,'molecola tossica'),('SS033','AX5 - 13','chimico','sostanza',600,636,NULL,NULL,NULL,NULL,NULL,'1','20','3','0,9','0,2','0,8','3',NULL,'molecola tossica '),('SS034','AX5 - 14','chimico','sostanza',300,243,NULL,NULL,NULL,NULL,NULL,'7','8','5','0,5','1','0,3','2',NULL,'molecola tossica'),('SS035','AX5 - 15','chimico','sostanza',300,315,NULL,NULL,NULL,NULL,NULL,'4','12','6','0,5','0,3','0,6','3',NULL,'molecola tossica '),('SS036','AX5 - 16','chimico','sostanza',100,74,NULL,NULL,NULL,NULL,NULL,'1','5','3','0,9','0,2','0,7','1',NULL,'molecola tossica'),('SS037','AX5 - 17','chimico','sostanza',100,70,NULL,NULL,NULL,NULL,NULL,'6','1','4','0,4','0,1','0,9','1',NULL,'molecola tossica '),('SS038','AX5 - 18','chimico','sostanza',500,395,NULL,NULL,NULL,NULL,NULL,'2','12','2','1','0,9','0,5','0',NULL,'molecola tossica'),('SS039','AX5 - 19','chimico','sostanza',300,285,NULL,NULL,NULL,NULL,NULL,'1','17','4','0,1','0,2','0,9','3',NULL,'molecola tossica '),('SS040','AX5 - 20','chimico','sostanza',100,75,NULL,NULL,NULL,NULL,NULL,'7','2','3','1','0,9','0,4','1',NULL,'molecola tossica'),('SS041','FW - 01','chimico','sostanza',1500,1845,NULL,NULL,NULL,NULL,NULL,'9','3','20','0,9','0,9','0,9','1',NULL,'molecola psicotropa'),('SS042','FW - 02','chimico','sostanza',250,265,NULL,NULL,NULL,NULL,NULL,'3','8','11','0,6','0,1','0,8','2',NULL,'molecola psicotropa'),('SS043','FW - 03','chimico','sostanza',700,700,NULL,NULL,NULL,NULL,NULL,'4','4','16','0,8','0,4','0,7','1',NULL,'molecola psicotropa'),('SS044','FW - 04','chimico','sostanza',300,378,NULL,NULL,NULL,NULL,NULL,'3','2','15','0,9','0,5','0,1','3',NULL,'molecola psicotropa'),('SS045','FW - 05','chimico','sostanza',300,387,NULL,NULL,NULL,NULL,NULL,'3','9','13','0,4','0,7','0,5','3',NULL,'molecola psicotropa'),('SS046','FW - 06','chimico','sostanza',300,330,NULL,NULL,NULL,NULL,NULL,'7','8','12','0,9','0,6','0,3','2',NULL,'molecola psicotropa'),('SS047','FW - 07','chimico','sostanza',300,315,NULL,NULL,NULL,NULL,NULL,'4','6','9','0,7','0,9','1','2',NULL,'molecola psicotropa'),('SS048','FW - 08','chimico','sostanza',250,212,NULL,NULL,NULL,NULL,NULL,'8','3','7','0,1','0,7','0,8','0',NULL,'molecola psicotropa'),('SS049','FW - 09','chimico','sostanza',200,232,NULL,NULL,NULL,NULL,NULL,'3','8','9','0,1','0,1','0,2','0',NULL,'molecola psicotropa'),('SS050','FW - 10','chimico','sostanza',250,305,NULL,NULL,NULL,NULL,NULL,'6','2','14','0,3','0,6','0,3','3',NULL,'molecola psicotropa'),('SS051','FW - 11','chimico','sostanza',250,217,NULL,NULL,NULL,NULL,NULL,'3','2','6','0,8','0,6','0,9','0',NULL,'molecola psicotropa'),('SS052','FW - 12','chimico','sostanza',300,231,NULL,NULL,NULL,NULL,NULL,'1','7','15','0,3','0,4','0,9','3',NULL,'molecola psicotropa'),('SS053','FW - 13','chimico','sostanza',800,656,NULL,NULL,NULL,NULL,NULL,'3','10','19','1','0,5','0,8','3',NULL,'molecola psicotropa'),('SS054','FW - 14','chimico','sostanza',250,232,NULL,NULL,NULL,NULL,NULL,'8','6','7','0,5','0,7','0,7','3',NULL,'molecola psicotropa'),('SS055','FW - 15','chimico','sostanza',250,287,NULL,NULL,NULL,NULL,NULL,'4','1','7','0,5','0,2','0,3','2',NULL,'molecola psicotropa'),('SS056','FW - 16','chimico','sostanza',300,351,NULL,NULL,NULL,NULL,NULL,'9','3','12','0,4','0,5','0,5','0',NULL,'molecola psicotropa'),('SS057','FW - 17','chimico','sostanza',600,756,NULL,NULL,NULL,NULL,NULL,'8','1','20','0,2','1','0,2','0',NULL,'molecola psicotropa'),('SS058','FW - 18','chimico','sostanza',250,257,NULL,NULL,NULL,NULL,NULL,'1','2','3','0,4','0,2','1','0',NULL,'molecola psicotropa'),('SS059','FW - 19','chimico','sostanza',900,1026,NULL,NULL,NULL,NULL,NULL,'5','3','19','0,6','1','0,4','2',NULL,'molecola psicotropa'),('SS060','FW - 20','chimico','sostanza',350,448,NULL,NULL,NULL,NULL,NULL,'8','5','11','0,5','1','0,7','3',NULL,'molecola psicotropa'),('X=0','X=0','programmazione','parametro_x',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('X=1','X=1','programmazione','parametro_x',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('X=2','X=2','programmazione','parametro_x',NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('X=3','X=3','programmazione','parametro_x',NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('X=4','X=4','programmazione','parametro_x',NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('X=5','X=5','programmazione','parametro_x',NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('X=6','X=6','programmazione','parametro_x',NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('X=7','X=7','programmazione','parametro_x',NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('X=8','X=8','programmazione','parametro_x',NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('X=9','X=9','programmazione','parametro_x',NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Y=0','Y=0','programmazione','parametro_y',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Y=1','Y=1','programmazione','parametro_y',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Y=2','Y=2','programmazione','parametro_y',NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Y=3','Y=3','programmazione','parametro_y',NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Y=4','Y=4','programmazione','parametro_y',NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Y=5','Y=5','programmazione','parametro_y',NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Y=6','Y=6','programmazione','parametro_y',NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Y=7','Y=7','programmazione','parametro_y',NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Y=8','Y=8','programmazione','parametro_y',NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Y=9','Y=9','programmazione','parametro_y',NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Z=0','Z=0','programmazione','parametro_z',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Z=1','Z=1','programmazione','parametro_z',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Z=2','Z=2','programmazione','parametro_z',NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Z=3','Z=3','programmazione','parametro_z',NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Z=4','Z=4','programmazione','parametro_z',NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Z=5','Z=5','programmazione','parametro_z',NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Z=6','Z=6','programmazione','parametro_z',NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Z=7','Z=7','programmazione','parametro_z',NULL,NULL,NULL,7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Z=8','Z=8','programmazione','parametro_z',NULL,NULL,NULL,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('Z=9','Z=9','programmazione','parametro_z',NULL,NULL,NULL,9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `componenti_crafting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componenti_ricetta`
--

DROP TABLE IF EXISTS `componenti_ricetta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `componenti_ricetta` (
  `id_componenti_ricetta` int(11) NOT NULL AUTO_INCREMENT,
  `componenti_crafting_id_componente` varchar(255) NOT NULL,
  `ricette_id_ricetta` int(11) NOT NULL,
  `ordine_crafting` int(11) DEFAULT '0',
  `ruolo_componente_ricetta` set('Principio Attivo','Sostanza Satellite','Base') DEFAULT NULL,
  PRIMARY KEY (`id_componenti_ricetta`),
  KEY `fk_ricetta_id_ricetta_idx` (`ricette_id_ricetta`),
  KEY `fk_componenti_id_componente_idx` (`componenti_crafting_id_componente`),
  CONSTRAINT `fk_componenti_id_componente` FOREIGN KEY (`componenti_crafting_id_componente`) REFERENCES `componenti_crafting` (`id_componente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ricetta_id_ricetta` FOREIGN KEY (`ricette_id_ricetta`) REFERENCES `ricette` (`id_ricetta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componenti_ricetta`
--

LOCK TABLES `componenti_ricetta` WRITE;
/*!40000 ALTER TABLE `componenti_ricetta` DISABLE KEYS */;
INSERT INTO `componenti_ricetta` VALUES (1,'B001',16,0,NULL),(2,'B003',16,0,NULL),(3,'S001',16,0,NULL),(4,'S001',16,0,NULL),(5,'A001',16,0,NULL),(6,'D002',17,0,'Base'),(7,'SS001',17,0,'Principio Attivo'),(8,'SS002',17,0,'Sostanza Satellite'),(9,'SS003',17,0,'Sostanza Satellite'),(10,'SS004',17,0,'Sostanza Satellite'),(11,'X=1',18,0,NULL),(12,'Y=2',18,0,NULL),(13,'Z=3',18,0,NULL),(14,'X=1',19,0,NULL),(15,'Y=2',19,0,NULL),(16,'Z=4',19,0,NULL);
/*!40000 ALTER TABLE `componenti_ricetta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crafting_chimico`
--

DROP TABLE IF EXISTS `crafting_chimico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crafting_chimico` (
  `id_crafting_chimico` int(2) NOT NULL,
  `cura_crafting_chimico` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tossico_crafting_chimico` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `psicotropo_crafting_chimico` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_crafting_chimico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crafting_chimico`
--

LOCK TABLES `crafting_chimico` WRITE;
/*!40000 ALTER TABLE `crafting_chimico` DISABLE KEYS */;
INSERT INTO `crafting_chimico` VALUES (1,NULL,NULL,NULL),(2,'RIMARGINAZIONE 1','SINGOLO','PARALISI'),(3,'RIMARGINAZIONE 2','SINGOLO','DISARMO'),(4,'RIMARGINAZIONE 3','DOPPIO','SPINTA 0'),(5,'RIMARGINAZIONE 4','DOPPIO','DOLORE'),(6,'RIMARGINAZIONE 5','TRIPLO','CONFUSIONE'),(7,'NEUTRALLIZZA PARALISI','TRIPLO',NULL),(8,'NEUTRALIZZA DOLORE',NULL,'SHOCK'),(9,'NEUTRALIZZA CONTINUO','CRASH','SINCERITÀ 1 DOMANDA'),(10,'NEUTRALLIZZA SHOK','QUADRUPLO','SHOCK 30'),(11,'NEUTRALLIZZA SONNO','SINGOLO','DOLORE 30'),(12,'NEUTRALIZZA VELENO','CRASH','SPINTA 0'),(13,'GUARIGIONE 1','QUADRUPLO','CONFUSIONE 30'),(14,'GUARIGIONE 3',NULL,'PAURA'),(15,'GUARIGIONE 5','A ZERO','DISARMO 30'),(16,'GUARIGIONE 7','A ZERO',NULL),(17,'GUARIGIONE 10','TRIPLO','PARALISI 30'),(18,NULL,'SINGOLO','COMANDO Prima Frase Imperativa'),(19,'NEUTRALIZZA MUTILAZIONE','COMA','SINCERITÀ 3 Domande'),(20,NULL,NULL,NULL);
/*!40000 ALTER TABLE `crafting_chimico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crafting_programmazione`
--

DROP TABLE IF EXISTS `crafting_programmazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crafting_programmazione` (
  `parametro_crafting` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `valore_parametro_crafting` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `effetto_valore_crafting` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `parametro_collegato_crafting` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`parametro_crafting`,`valore_parametro_crafting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crafting_programmazione`
--

LOCK TABLES `crafting_programmazione` WRITE;
/*!40000 ALTER TABLE `crafting_programmazione` DISABLE KEYS */;
INSERT INTO `crafting_programmazione` VALUES ('X1','0','ATTACCO','Y1'),('X1','1','ATTACCO','Y1'),('X1','2','DIFESA','Y1'),('X1','3','DIFESA','Y1'),('X1','4','ABILITA\'','Y2'),('X1','5','ABILITA\'','Y2'),('X1','6','ATTACCO','Y1'),('X1','7','DIFESA','Y1'),('X1','8','ABILITA\'','Y2'),('X1','9','ATTACCO','Y1'),('Y1','0','danno','Z1'),('Y1','1','status','Z2'),('Y1','2','danno','Z1'),('Y1','3','status','Z2'),('Y1','4','danno','Z1'),('Y1','5','status','Z2'),('Y1','6','danno','Z1'),('Y1','7','status','Z2'),('Y1','8','danno','Z1'),('Y1','9','status','Z2'),('Y2','0','1 uso','Z3'),('Y2','1','2 usi','Z3'),('Y2','2','1 uso','Z3'),('Y2','3','2 usi','Z3'),('Y2','4','3 usi','Z3'),('Y2','5','1 uso','Z3'),('Y2','6','2 usi','Z3'),('Y2','7','3 usi','Z3'),('Y2','8','4 usi ','Z3'),('Y2','9','1 uso','Z3'),('Z1','0','SINGOLO',NULL),('Z1','1','DOPPIO',NULL),('Z1','2','TRIPLO',NULL),('Z1','3','QUADRUPLO',NULL),('Z1','4','A ZERO',NULL),('Z1','5','DOPPIO',NULL),('Z1','6','TRIPLO',NULL),('Z1','7','QUADRUPLO',NULL),('Z1','8','DOPPIO',NULL),('Z1','9','TRIPLO',NULL),('Z2','0','DISARMO!',NULL),('Z2','1','CONFUSIONE!',NULL),('Z2','2','PARALISI!',NULL),('Z2','3','SPINTA 5 !',NULL),('Z2','4','SHOCK!',NULL),('Z2','5','DISARMO!',NULL),('Z2','6','CONFUSIONE!',NULL),('Z2','7','SPINTA 5 !',NULL),('Z2','8','SHOCK!',NULL),('Z2','9','PARALISI!',NULL),('Z3','0','COMANDO!',NULL),('Z3','1','SINCERITA\'!',NULL),('Z3','2','GUARIGIONE 5!',NULL),('Z3','3','RIPARARAZIONE 5!',NULL),('Z3','4','ATTENUAZIONE!',NULL),('Z3','5','COMANDO ! IGNORAMI',NULL),('Z3','6','VELENO!  GUARIGIONE 1! TEMPO 1 MINUTO',NULL),('Z3','7','RIFLESSO! ',NULL),('Z3','8','BONUS ! ATTENUAZIONE! RAGGIO 2 TEMPO 1 MINUTO',NULL),('Z3','9','NEUTRALIZZA ( associabile a qualsiasi effetto o status)',NULL);
/*!40000 ALTER TABLE `crafting_programmazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventi`
--

DROP TABLE IF EXISTS `eventi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eventi` (
  `id_evento` int(255) NOT NULL AUTO_INCREMENT,
  `titolo_evento` varchar(255) CHARACTER SET utf8 NOT NULL,
  `data_inizio_evento` date NOT NULL,
  `ora_inizio_evento` time NOT NULL,
  `data_fine_evento` date NOT NULL,
  `ora_fine_evento` time NOT NULL,
  `luogo_evento` varchar(255) CHARACTER SET utf8 NOT NULL,
  `costo_evento` decimal(7,2) NOT NULL,
  `costo_maggiorato_evento` decimal(7,2) NOT NULL,
  `pubblico_evento` tinyint(1) NOT NULL DEFAULT '0',
  `punti_assegnati_evento` tinyint(1) NOT NULL DEFAULT '0',
  `creatore_evento` varchar(255) CHARACTER SET utf8 NOT NULL,
  `note_evento` text CHARACTER SET utf8,
  PRIMARY KEY (`id_evento`),
  KEY `fk_creatori_evento_idx` (`creatore_evento`),
  CONSTRAINT `fk_creatore_evento` FOREIGN KEY (`creatore_evento`) REFERENCES `giocatori` (`email_giocatore`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventi`
--

LOCK TABLES `eventi` WRITE;
/*!40000 ALTER TABLE `eventi` DISABLE KEYS */;
INSERT INTO `eventi` VALUES (1,'Prova!!!','2018-03-24','14:00:00','2018-03-25','16:00:00','Villa Alberoni, Strada Veano, Vigolzone, PC, Italia',30.00,50.00,1,1,'miroku_87@yahoo.it','Venite tutti!!!!'),(2,'Prova Iscrizioni','2018-03-30','14:00:00','2018-03-31','16:00:00','Duomo di Milano, Piazza del Duomo, Milano, MI, Italia',200.00,300.00,0,0,'miroku_87@yahoo.it','ciao poveri!'),(3,'Prova accapi','2018-04-21','14:00:00','2018-04-22','16:00:00','Los Angeles, California, Stati Uniti',50.00,70.00,1,0,'miroku_87@yahoo.it','Io<br />\nvado <br />\nmolto accàpòòò<br />\nCIAO!');
/*!40000 ALTER TABLE `eventi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giocatori`
--

DROP TABLE IF EXISTS `giocatori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giocatori` (
  `email_giocatore` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password_giocatore` varchar(255) CHARACTER SET utf8 NOT NULL,
  `nome_giocatore` varchar(255) CHARACTER SET utf8 NOT NULL,
  `cognome_giocatore` varchar(255) CHARACTER SET utf8 NOT NULL,
  `data_registrazione_giocatore` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `eliminato_giocatore` tinyint(1) NOT NULL DEFAULT '0',
  `ruoli_nome_ruolo` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'giocatore',
  `note_giocatore` text CHARACTER SET utf8,
  `note_staff_giocatore` text CHARACTER SET utf8,
  PRIMARY KEY (`email_giocatore`),
  KEY `fk_ruolo_idx` (`ruoli_nome_ruolo`),
  CONSTRAINT `fk_ruolo` FOREIGN KEY (`ruoli_nome_ruolo`) REFERENCES `ruoli` (`nome_ruolo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giocatori`
--

LOCK TABLES `giocatori` WRITE;
/*!40000 ALTER TABLE `giocatori` DISABLE KEYS */;
INSERT INTO `giocatori` VALUES ('andrea.silvestri87@yahoo.it','2c6a8221ae6e1347e4fb67a4e84bbcc156c4db0d','Geno','Veffa','2018-03-11 23:39:53',0,'giocatore','Prova 2',NULL),('b-teo-90@libero.it','1e4e888ac66f8dd41e00c5a7ac36a32a9950d271','Matteo','Barbieri','2017-11-15 22:51:24',0,'giocatore',NULL,NULL),('ehi@la.it','f10e2821bbbea527ea02200352313bc059445190','Gna','Gnino','2017-11-26 20:24:53',0,'giocatore','',NULL),('miroku_87@yahoo.it','1e4e888ac66f8dd41e00c5a7ac36a32a9950d271','Andrea','Silvestri','2017-11-15 22:51:24',0,'admin','Test!',NULL),('porco.riccio@riccissimo.it','7bf5975c693842d9b73defe8a764f1a426944cce','Porco','Riccio','2017-11-15 22:52:14',0,'ospite','sdfs','Ciao%3Cbr%3Ebello%3Cbr%3E%26lt%3Bb%26gt%3Bbold%26lt%3B%2Fb%26gt%3B');
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
INSERT INTO `grants` VALUES ('aggiungiAbilitaAlPG_altri','L\'utente può assegnare nuove abilità a personaggi non suoi.'),('aggiungiAbilitaAlPG_proprio','L\'utente può assegnare nuove abilità a un proprio personaggio.'),('aggiungiClassiAlPG_altri','L\'utente può assegnare nuove classi a personaggi non suoi.'),('aggiungiClassiAlPG_proprio','L\'utente può assegnare nuove classi a un proprio personaggio.'),('aggiungiOpzioniAbilita_altri','L\'utente può aggiungere opzioni alle abilità di altri.'),('aggiungiOpzioniAbilita_proprio','L\'utente può aggiungere opzioni alle proprie abilità.'),('associaPermessi','L\'utente può associare il permesso di compiere un\'azione ad un dato ruolo.'),('creaEvento','L\'utente può creare eventi di gioco.'),('creaNotizia','L\'utente può creare nuove notizie'),('creaPG','L\'utente può creare un nuovo personaggio.'),('creaRuolo','L\'utente può creare un nuovo ruolo.'),('disiscriviPG_altri','L\'utente può disicrivere un personaggio non suo.'),('disiscriviPG_proprio','L\'utente può disiscrivere un suo personaggio.'),('eliminaEvento','L\'utente può eliminare un evento precedentemente creato.'),('eliminaGiocatore','L\'utente può eliminare altri giocatori.'),('eliminaPG_altri','L\'utente può eliminare un personaggio di altri.'),('eliminaPG_proprio','L\'utente può eliminare un proprio personaggio.'),('eliminaRuolo','L\'utente può eliminare un ruolo già esistente.'),('inviaMessaggio','L\'utente può inviare messaggi.'),('iscriviPg_altri','L\'utente può iscrivere pg di altri a un evento live.'),('iscriviPg_proprio','L\'utente può iscrivere il proprio pg a un evento live.'),('loginPG_altri','L\'utente può loggarsi con il pg di altri utenti.'),('loginPG_proprio','L\'utente può loggarsi con un proprio pg.'),('modificaEvento','L\'utente può modificare i dati di un evento già esistente.'),('modificaIscrizionePG_note_iscrizione_altri','L\'utene può modificare le note dell\'\'iscrizione ad un evento di un pg di altri.'),('modificaIscrizionePG_note_iscrizione_proprio','L\'utene può modificare le note dell\'\'iscrizione ad un evento di un suo pg.'),('modificaIscrizionePG_pagato_iscrizione_altri','L\'utente può modificare lo stato di pagato di un pg altrui per l\'iscrizione a un evento.'),('modificaIscrizionePG_pagato_iscrizione_proprio','L\'utente può modificare lo stato di pagato di un suo pg per l\'iscrizione a un evento.'),('modificaNotizia','L\'utente può modificare notizie esistenti'),('modificaPG_anno_nascita_personaggio_altri','L\'utente può modificare l\'anno di nascita di un pg altrui.'),('modificaPG_anno_nascita_personaggio_proprio','L\'utente può modificare l\'anno di nascita di un proprio pg.'),('modificaPG_background_personaggio_altri','L\'utente può modificare il background di un personaggio qualsiasi.'),('modificaPG_background_personaggio_proprio','L\'utente può modificare il proprio background.'),('modificaPG_contattabile_personaggio_altri','L\'utente può rendere un utente non suo contattabile o meno.'),('modificaPG_contattabile_personaggio_proprio','L\'utente può rendere un utente suo contattabile o meno.'),('modificaPG_credito_personaggio_altri','L\'utente può modificare il credito degli altri personaggi.'),('modificaPG_credito_personaggio_proprio','L\'utente può modificare il credito del proprio personaggio.'),('modificaPG_motivazioni_olocausto_inserite_personaggio_altri','L\'utente può modificare il flag che indica se ha scritto le motivazioni per l\'olocausto degli innocenti degli altri pg.'),('modificaPG_motivazioni_olocausto_inserite_personaggio_proprio','L\'utente può modificare il flag che indica se ha scritto le motivazioni per l\'olocausto degli innocenti del proprio pg.'),('modificaPG_nome_personaggio_altri','L\'utente può modificare il nome degli altri personaggi.'),('modificaPG_nome_personaggio_proprio','L\'utente può modificare il nome del proprio personaggio.'),('modificaPG_note_cartellino_personaggio_altri','L\'utente può modificare le note da stampare sul cartellino dei pg di altri giocatori.'),('modificaPG_note_cartellino_personaggio_proprio','L\'utente può modificare le note da stampare sul cartellino dei propri pg.'),('modificaPG_note_master_personaggio_altri','L\'utente può inserire delle note master.'),('modificaPG_note_master_personaggio_proprio','L\'utente può inserire delle note master ai propri pg'),('modificaPG_pc_personaggio_altri','L\'utente può modificare i punti combattimento di altri PG.'),('modificaPG_pc_personaggio_proprio','L\'utente può modificare i propri punti combattimento.'),('modificaPG_px_personaggio_altri','L\'utente può modificare i punti esperienza di altri PG.'),('modificaPG_px_personaggio_proprio','L\'utente può modificare i propri punti esperienza.'),('modificaRicetta','L\'utente può modificare una ricetta creata.'),('modificaUtente_cognome_giocatore_altri','L\'utente può modificare il cognome di un altro utente.'),('modificaUtente_cognome_giocatore_proprio','L\'utente può modificare il proprio cognome.'),('modificaUtente_email_giocatore_altri','L\'utente può modificare l\'email di un altro giocatore.'),('modificaUtente_email_giocatore_proprio','L\'utente può modificare la propria email.'),('modificaUtente_nome_giocatore_altri','L\'utente può modificare il nome di un altro utente.'),('modificaUtente_nome_giocatore_proprio','L\'utente può modificare il proprio nome.'),('modificaUtente_note_giocatore_altri','L\'utente può modificare le note di altri utenti.'),('modificaUtente_note_giocatore_proprio','L\'utente può modificare le proprie note.'),('modificaUtente_note_staff_giocatore_altri','L\'utente può modificare le note Staff di altri utenti.'),('modificaUtente_note_staff_giocatore_proprio','L\'utente può modificare le proprie note Staff.'),('modificaUtente_password_giocatore_altri','L\'utente può modificare la password di altri utenti.'),('modificaUtente_password_giocatore_proprio','L\'utente può modificare la propria password.'),('modificaUtente_ruoli_nome_ruolo_altri','L\'utente può modificare il ruolo di altri.'),('modificaUtente_ruoli_nome_ruolo_proprio','L\'utente può modificare il proprio ruolo.'),('mostraPersonaggi_altri','L\'utente potrà visualizzare i personaggi creati dagli altri utenti.'),('mostraPersonaggi_proprio','L\'utente potrà visualizzare la pagina dei suoi personaggi.'),('pubblicaEvento','L\'utente può rendere pubblico a tutti i giocatori un evento creato in precedenza.'),('pubblicaNotizia','L\'utente può pubblicare una notizia già creata'),('recuperaComponentiAvanzata','L\'utente può vedere tutti i dati riguardanti i componenti'),('recuperaComponentiBase','L\'utente può vedere la lista dei componenti durante i crafting e nel mercato'),('recuperaEventi','L\'utente può leggere gli eventi inseriti a database.'),('recuperaListaEventi','L\'utente può vedere tutti gli eventi inseriti nel database.'),('recuperaListaGiocatori','L\'utente può visualizzare una lista di tutti i giocatori iscritti.'),('recuperaListaIscrittiAvanzato','L\'utente può vedere le informazioni base e di pagamento dei pg iscritit all\'evento live.'),('recuperaListaIscrittiBase','L\'utente può vedere le informaizoni base dei pg iscritti all\'evento live.'),('recuperaListaPermessi','L\'utente può scaricare dal database la lista di permessi presenti.'),('recuperaMessaggi','L\'utente può recuperare i propri messaggi e quelli del pg loggato.'),('recuperaMessaggioSingolo_altri','L\'utente può visualizzare il testo di un messaggio di altri.'),('recuperaMessaggioSingolo_proprio','L\'utente può visualizzare il testo di un proprio messaggio.'),('recuperaMessaggi_altri','L\'utente può visualizzare i messaggi degli altri giocatori.'),('recuperaMessaggi_proprio','L\'utente può visualizzare i propri messaggi.'),('recuperaNoteCartellino_altri','L\'utente può leggere gli extra che verranno stampati sul cartellino di un PG non suo.'),('recuperaNoteCartellino_proprio','L\'utente può guardare le note extra che verranno stampate sul cartellino di un proprio pg.'),('recuperaNoteMaster_altri','L\'utente può visualizzare le note master degli altri giocatori.'),('recuperaNoteMaster_proprio','L\'utente può visualizzare le proprie note master.'),('recuperaNoteUtente_altri','L\'utente può leggere le note di altri utenti.'),('recuperaNoteUtente_proprio','L\'utente può leggere le proprie note.'),('recuperaNotizie','L\'utente può recuperare tutte le notizie create'),('recuperaNotiziePubbliche','L\'utente può recuperare le notizie che sono state pubblicate.'),('recuperaOpzioniAbilita','L\'utente può recuperare dal db le opzioni extra di varie abilità.'),('recuperaPermessiDeiRuoli','L\'utente può scaricare da database i permessi associati ad ogni ruolo.'),('recuperaRicette_altri','L\'utente può recuperare le ricette create da chiunque.'),('recuperaRicette_proprio','L\'utente può recuperare le ricette create da un suo personaggio.'),('recuperaRuoli','L\'utente può recuperare una lista di tutti i ruoli esistenti.'),('recuperaStorico_altri','L\'utente può guardare tutte le azioni compiute sui personaggi degli altri.'),('recuperaStorico_proprio','L\'utente può guardare tutte le azioni compiute sul personaggio selezionato.'),('rimuoviAbilitaPG_altri','L\'utente può eliminare una abilità di un personaggio non suo.'),('rimuoviAbilitaPG_proprio','L\'utente può eliminare una abilità di un proprio personaggio.'),('rimuoviClassePG_altri','L\'utente può eliminare la classe di un personaggio non suo.'),('rimuoviClassePG_proprio','L\'utente può eliminare la classe di un proprio personaggio.'),('ritiraEvento','L\'utente può ritrare un evento pubblicato.'),('ritiraNotizia','L\'utente può ritirare un articolo pubblicato.'),('stampaCartelliniPG','L\'utente può stampare i cartellini dei personaggi.'),('stampaListaIscritti','L\'utente può stampare la lista degli iscritti a un evento con tutte le loro informazioni.'),('visualizza_pagina_crafting_chimico','L\'utente, se loggato con un pg che ha le giuste abilità, potrà accedere alla sezione del crafting del Medico.'),('visualizza_pagina_crafting_ingegneria','L\'utente, se loggato con un pg che ha le giuste abilità, potrà accedere alla sezione del crafting da Tecnico.'),('visualizza_pagina_crafting_programmazione','L\'utente, se loggato con un pg che ha le giuste abilità, potrà accedere alla sezione del crafting di Netrunner.'),('visualizza_pagina_crea_evento','L\'utente può accedere alla pagina che permette di creare un evento.'),('visualizza_pagina_crea_pg','L\'utente può visualizzare la pagina per creare un personaggio.'),('visualizza_pagina_gestione_eventi','L\'utente può entrare nella sezione per la gestione degli eventi.'),('visualizza_pagina_gestione_giocatori','L\'utente può entrare nella sezione per la modifica dei dati dei giocatori.'),('visualizza_pagina_gestione_oggetti_ingioco','L\'utente può entrare nella sezione per la creazione, modifica e stampa degli oggetti in gioco.'),('visualizza_pagina_gestione_permessi','L\'utente può entrare nella sezione per la creazione e modifica dei ruoli e dei permessi ad essi associati.'),('visualizza_pagina_gestione_ricette','L\'utente può vedere la pagina di gestione delle ricette.'),('visualizza_pagina_lista_pg','L\'utente può visualizzare la pagina con la lista dei personaggi.'),('visualizza_pagina_main','L\'utente può visualizzare la pagina principale del sito con la lista dei pg creati.'),('visualizza_pagina_mercato','L\'utente può vedere la pagina che permette l\'acaquisto dei componenti.'),('visualizza_pagina_messaggi','L\'utente può accedere alla sezione messaggi.'),('visualizza_pagina_negozio_abilita','L\'utente può acquistare abilità'),('visualizza_pagina_notizie','L\'utente può accedere alla pagina delle notizie'),('visualizza_pagina_profilo','L\'utente può visualizzare la pagina del proprio profilo.'),('visualizza_pagina_scheda_pg','L\'utente può visualizzare la pagina con i dettagli di un personaggio.'),('visualizza_pagina_stampa_cartellini','L\'utente può accedere alla pagina che permette di stampare i cartellini pg.'),('visualizza_pagina_stampa_ricetta','L\'utente può accedere alla pagina che permette di stampare i cartellini delle ricette.'),('visualizza_pagina_stampa_tabella_iscritti','L\'utente può accedere alla pagina che permette di stampare la tabella dei pg iscritti.');
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
  `tipo_pagamento_iscrizione` set('Location','Manuale','PayPal','PostePay','Bonifico') NOT NULL,
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
INSERT INTO `iscrizione_personaggi` VALUES (1,38,1,'PostePay','Prova!!!'),(2,38,1,'Location',''),(3,38,0,'Location',''),(3,66,1,'PostePay','YEAH');
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
INSERT INTO `messaggi_fuorigioco` VALUES (1,'miroku_87@yahoo.it','b-teo-90@libero.it','Prova','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec metus eleifend, maximus tortor vitae, tristique lectus. In hac habitasse platea dictumst. Nulla volutpat enim arcu, et viverra ipsum condimentum a. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec consequat suscipit congue. Phasellus in arcu a sem lacinia molestie ut ac tortor. Suspendisse egestas ex odio, id sodales sem dictum sit amet. Nunc vitae ipsum a nisl viverra lobortis eget eget dolor.',0,'2018-03-04 16:54:20',NULL),(2,'b-teo-90@libero.it','miroku_87@yahoo.it','Re: Prova','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec metus eleifend, maximus tortor vitae, tristique lectus. In hac habitasse platea dictumst. Nulla volutpat enim arcu, et viverra ipsum condimentum a. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec consequat suscipit congue. Phasellus in arcu a sem lacinia molestie ut ac tortor. Suspendisse egestas ex odio, id sodales sem dictum sit amet. Nunc vitae ipsum a nisl viverra lobortis eget eget dolor.',0,'2018-03-04 16:54:20',1),(3,'ehi@la.it','b-teo-90@libero.it','test','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec metus eleifend, maximus tortor vitae, tristique lectus. In hac habitasse platea dictumst. Nulla volutpat enim arcu, et viverra ipsum condimentum a. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec consequat suscipit congue. Phasellus in arcu a sem lacinia molestie ut ac tortor. Suspendisse egestas ex odio, id sodales sem dictum sit amet. Nunc vitae ipsum a nisl viverra lobortis eget eget dolor.',0,'2018-03-04 16:55:01',NULL),(4,'miroku_87@yahoo.it','b-teo-90@libero.it','aaaaaaaaaa','bbbbbbbbb',0,'2018-03-07 00:31:36',NULL),(5,'miroku_87@yahoo.it','ehi@la.it','eeee','qqqqq',0,'2018-03-07 00:34:57',NULL),(6,'miroku_87@yahoo.it','b-teo-90@libero.it','4444','1111111111111',0,'2018-03-07 00:35:47',NULL),(7,'miroku_87@yahoo.it','b-teo-90@libero.it','Re: Prova','PROVA!',0,'2018-03-07 01:16:43',2),(8,'miroku_87@yahoo.it','ehi@la.it','sdfrttt','1234',0,'2018-03-07 01:18:22',NULL),(9,'miroku_87@yahoo.it','b-teo-90@libero.it','Gna','Sei%20brutto!',1,'2018-03-11 20:04:54',NULL),(10,'b-teo-90@libero.it','miroku_87@yahoo.it','Re%3A%20Gna','Non%20%C3%A8%20veruuuu',1,'2018-03-14 01:25:48',9);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messaggi_ingioco`
--

LOCK TABLES `messaggi_ingioco` WRITE;
/*!40000 ALTER TABLE `messaggi_ingioco` DISABLE KEYS */;
INSERT INTO `messaggi_ingioco` VALUES (1,38,42,'Yeah','Aenean id eleifend sapien. Ut tortor sem, iaculis et risus in, rutrum tincidunt eros. Nam vulputate finibus arcu at ultricies. Sed aliquam, enim sodales dapibus tincidunt, ipsum ipsum aliquet orci, a pharetra nulla elit sit amet neque. Phasellus sed nisl eget purus sagittis dapibus ullamcorper et libero. Aliquam id lacus in ante interdum euismod. Pellentesque luctus mauris non velit suscipit, a feugiat nibh vestibulum. Mauris eros justo, ultrices sed tortor id, vehicula pellentesque magna. Nullam molestie consectetur massa, id venenatis enim mattis nec. Donec scelerisque est in orci vehicula semper. Suspendisse placerat ex in erat sagittis, in dignissim ipsum posuere. Nam at mi eget lectus rutrum vestibulum.',0,'2018-03-04 16:59:37',NULL),(2,38,43,'What','Aenean id eleifend sapien. Ut tortor sem, iaculis et risus in, rutrum tincidunt eros. Nam vulputate finibus arcu at ultricies. Sed aliquam, enim sodales dapibus tincidunt, ipsum ipsum aliquet orci, a pharetra nulla elit sit amet neque. Phasellus sed nisl eget purus sagittis dapibus ullamcorper et libero. Aliquam id lacus in ante interdum euismod. Pellentesque luctus mauris non velit suscipit, a feugiat nibh vestibulum. Mauris eros justo, ultrices sed tortor id, vehicula pellentesque magna. Nullam molestie consectetur massa, id venenatis enim mattis nec. Donec scelerisque est in orci vehicula semper. Suspendisse placerat ex in erat sagittis, in dignissim ipsum posuere. Nam at mi eget lectus rutrum vestibulum.',0,'2018-03-04 16:59:37',NULL),(3,42,38,'Non dirlo a nessuno','Aenean id eleifend sapien. Ut tortor sem, iaculis et risus in, rutrum tincidunt eros. Nam vulputate finibus arcu at ultricies. Sed aliquam, enim sodales dapibus tincidunt, ipsum ipsum aliquet orci, a pharetra nulla elit sit amet neque. Phasellus sed nisl eget purus sagittis dapibus ullamcorper et libero. Aliquam id lacus in ante interdum euismod. Pellentesque luctus mauris non velit suscipit, a feugiat nibh vestibulum. Mauris eros justo, ultrices sed tortor id, vehicula pellentesque magna. Nullam molestie consectetur massa, id venenatis enim mattis nec. Donec scelerisque est in orci vehicula semper. Suspendisse placerat ex in erat sagittis, in dignissim ipsum posuere. Nam at mi eget lectus rutrum vestibulum.',0,'2018-03-04 16:59:37',NULL),(4,43,38,'Re: What','AAAAA',0,'2018-03-07 01:12:53',2),(9,67,38,'asdfas','asdfsa',0,'2018-04-12 22:16:44',NULL);
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
-- Table structure for table `notizie`
--

DROP TABLE IF EXISTS `notizie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notizie` (
  `id_notizia` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_notizia` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `titolo_notizia` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `autore_notizia` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data_ig_notizia` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '271',
  `data_pubblicazione_notizia` datetime DEFAULT NULL,
  `pubblica_notizia` tinyint(1) NOT NULL DEFAULT '0',
  `testo_notizia` text COLLATE utf8_unicode_ci NOT NULL,
  `data_creazione_notizia` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creatore_notizia` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_notizia`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notizie`
--

LOCK TABLES `notizie` WRITE;
/*!40000 ALTER TABLE `notizie` DISABLE KEYS */;
INSERT INTO `notizie` VALUES (2,'Informazioni Commerciali','Love love','Gino','271',NULL,1,'<p>Prova <strong>testooo</strong></p>\n\n<p><span style=\"color:#27ae60\">CIAO!</span></p>\n','2018-04-05 23:18:18','miroku_87@yahoo.it'),(3,'Contatti nell\'Ago','Phew Phew','Gino','271 giorno 2',NULL,1,'<p>Prova <strong>testooo</strong></p>\n\n<p><span style=\"color:#27ae60\">CIAO!</span></p>\n','2018-04-05 23:18:18','miroku_87@yahoo.it');
/*!40000 ALTER TABLE `notizie` ENABLE KEYS */;
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
  `nome_personaggio` varchar(255) CHARACTER SET utf8 NOT NULL,
  `cognome_personaggio` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `background_personaggio` longtext CHARACTER SET utf8,
  `px_personaggio` int(11) NOT NULL DEFAULT '0',
  `pc_personaggio` int(11) NOT NULL DEFAULT '0',
  `credito_personaggio` bigint(255) NOT NULL DEFAULT '0',
  `anno_nascita_personaggio` int(11) NOT NULL DEFAULT '271',
  `data_creazione_personaggio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `contattabile_personaggio` tinyint(1) NOT NULL DEFAULT '1',
  `eliminato_personaggio` tinyint(1) NOT NULL DEFAULT '0',
  `giocatori_email_giocatore` varchar(255) CHARACTER SET utf8 NOT NULL,
  `motivazioni_olocausto_inserite_personaggio` tinyint(1) NOT NULL DEFAULT '0',
  `note_master_personaggio` text CHARACTER SET utf8,
  `note_cartellino_personaggio` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_personaggio`),
  KEY `fk_giocatore_personaggio_idx` (`giocatori_email_giocatore`),
  CONSTRAINT `fk_giocatore_pg` FOREIGN KEY (`giocatori_email_giocatore`) REFERENCES `giocatori` (`email_giocatore`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personaggi`
--

LOCK TABLES `personaggi` WRITE;
/*!40000 ALTER TABLE `personaggi` DISABLE KEYS */;
INSERT INTO `personaggi` VALUES (38,'John Doe',NULL,'Prova%20Mail',382,127,3,249,'2017-12-04 23:53:45',1,0,'miroku_87@yahoo.it',0,NULL,NULL),(39,'MArco rossi',NULL,NULL,101,5,1,249,'2017-12-13 22:05:30',1,0,'miroku_87@yahoo.it',0,NULL,NULL),(42,'Test 123',NULL,'PRova%20BgGG%0A%0AOLOCOSO!!!',101,5,1,240,'2018-02-20 23:11:10',1,0,'b-teo-90@libero.it',1,NULL,NULL),(43,'Nuovo PG',NULL,'Prova%20di%20%3Cb%3EHTML%3C%2Fb%3E.%20YEEEE1111',101,5,1,238,'2018-02-20 23:32:14',1,0,'miroku_87@yahoo.it',0,'sdfsa%2034%202',NULL),(50,'Ciccio',NULL,NULL,101,5,1,246,'2018-03-12 00:46:08',1,0,'andrea.silvestri87@yahoo.it',0,NULL,'sdfasdf%3Cbr%3E%3Cbr%3E%26lt%3Bciao%26gt%3B'),(52,'test',NULL,NULL,103,1,4,260,'2018-03-15 22:27:38',1,0,'miroku_87@yahoo.it',0,NULL,NULL),(53,'Bellà',NULL,NULL,100,4,0,226,'2018-03-19 22:29:34',1,0,'miroku_87@yahoo.it',0,NULL,NULL),(54,'Papò',NULL,NULL,100,4,0,248,'2018-03-19 22:34:38',1,0,'miroku_87@yahoo.it',0,NULL,NULL),(55,'Bébé',NULL,NULL,100,4,0,250,'2018-03-19 22:36:57',1,0,'miroku_87@yahoo.it',0,NULL,NULL),(56,'Pòòòò',NULL,NULL,100,4,0,237,'2018-03-19 22:37:52',1,0,'miroku_87@yahoo.it',0,NULL,NULL),(57,'Pepperepé',NULL,NULL,100,4,0,217,'2018-03-19 23:28:58',1,0,'miroku_87@yahoo.it',0,NULL,NULL),(61,'Opzioni',NULL,NULL,1000,40,0,256,'2018-03-21 01:25:30',1,0,'miroku_87@yahoo.it',0,NULL,NULL),(64,'ritest opz',NULL,NULL,300,54,0,227,'2018-03-25 17:55:46',1,0,'miroku_87@yahoo.it',0,NULL,NULL),(65,'Test età',NULL,NULL,200,4,0,251,'2018-03-28 01:29:32',1,0,'miroku_87@yahoo.it',0,NULL,NULL),(66,'No Olo',NULL,'Noooooooooo%3Cbr%3Eo%20si%3F%26lt%3Bbr%26gt%3BLorem%20ipsum%20%26lt%3Bb%26gt%3Bdolor%26lt%3B%2Fb%26gt%3B%20sit%20amet%2C%20consectetur%20adipiscing%20elit%2C%20sed%20do%20eiusmod%20tempor%20incididunt%20ut%20labore%20et%20dolore%20magna%20aliqua.%20Ut%20enim%20ad%20minim%20veniam%2C%20quis%20nostrud%20exercitation%20ullamco%20laboris%20nisi%20ut%20aliquip%20ex%20ea%20commodo%20consequat.%20Duis%20aute%20irure%20dolor%20in%20reprehenderit%20in%20voluptate%20velit%20esse%20cillum%20dolore%20eu%20fugiat%20nulla%20pariatur.%20Excepteur%20sint%20occaecat%20cupidatat%20non%20proident%2C%20sunt%20in%20culpa%20qui%20officia%20deserunt%20mollit%20anim%20id%20est%20laborum.',100,4,0,240,'2018-03-30 23:42:01',1,0,'b-teo-90@libero.it',1,'Lorem%20ipsum%20dolor%20sit%20%26lt%3Bb%26gt%3Bamet%26lt%3B%2Fb%26gt%3B%2C%20%3Cbr%3Econsectetur%20adipiscing%20elit%2C%20sed%20do%20eiusmod%20tempor%20incididunt%20ut%20labore%20et%20dolore%20magna%20aliqua.%20Ut%20enim%20ad%20minim%20veniam%2C%20quis%20nostrud%20exercitation%20ullamco%20laboris%20nisi%20ut%20aliquip%20ex%20ea%20commodo%20consequat.%20%3Cbr%3E%3Cbr%3EDuis%20aute%20irure%20dolor%20in%20reprehenderit%20in%20voluptate%20velit%20esse%20cillum%20dolore%20eu%20fugiat%20nulla%20pariatur.%20Excepteur%20sint%20occaecat%20cupidatat%20non%20proident%2C%20sunt%20in%20culpa%20qui%20officia%20deserunt%20mollit%20anim%20id%20est%20laborum.',NULL),(67,'Test PF',NULL,NULL,100,6,0,248,'2018-04-12 01:53:22',1,0,'miroku_87@yahoo.it',0,NULL,NULL),(68,'Aggiusta Tutto',NULL,NULL,150,4,0,249,'2018-04-15 23:55:06',1,0,'miroku_87@yahoo.it',0,NULL,NULL),(69,'Doctor Who',NULL,NULL,100,4,0,-629,'2018-04-18 15:44:32',1,0,'miroku_87@yahoo.it',0,NULL,NULL);
/*!40000 ALTER TABLE `personaggi` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `reboot_live`.`personaggi_BEFORE_UPDATE` BEFORE UPDATE ON `personaggi` FOR EACH ROW
BEGIN
	IF NEW.pc_personaggio < 0 THEN
		SET NEW.pc_personaggio = 0;
	END IF;
    
	IF NEW.px_personaggio < 0 THEN
		SET NEW.px_personaggio = 0;    
	END IF;
    
	IF NEW.credito_personaggio < 0 THEN
		SET NEW.credito_personaggio = 0;    
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
INSERT INTO `personaggi_has_abilita` VALUES (38,1),(38,2),(38,3),(38,93),(42,92),(50,29),(50,33),(50,196),(50,197),(50,198),(52,2),(52,93),(53,1),(53,92),(54,29),(54,33),(54,130),(55,21),(55,130),(56,79),(56,129),(57,71),(57,92),(61,135),(61,136),(61,137),(64,1),(64,124),(65,75),(65,77),(65,156),(66,1),(66,92),(67,1),(67,97),(67,129),(68,44),(68,45),(68,48),(68,50),(68,92),(69,64),(69,92);
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
INSERT INTO `personaggi_has_classi` VALUES (38,1),(38,8),(38,9),(39,6),(39,12),(39,13),(42,1),(42,2),(42,8),(43,1),(43,2),(43,8),(50,3),(50,14),(52,1),(52,8),(53,1),(53,8),(54,3),(54,10),(55,2),(55,10),(56,7),(56,10),(57,6),(57,8),(61,10),(61,11),(64,1),(64,10),(65,4),(65,6),(65,7),(65,12),(65,14),(66,1),(66,8),(67,1),(67,8),(67,10),(68,4),(68,8),(69,5),(69,8);
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
-- Table structure for table `personaggi_has_opzioni_abilita`
--

DROP TABLE IF EXISTS `personaggi_has_opzioni_abilita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personaggi_has_opzioni_abilita` (
  `personaggi_id_personaggio` int(11) NOT NULL,
  `abilita_id_abilita` int(11) NOT NULL,
  `opzioni_abilita_opzione` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`personaggi_id_personaggio`,`abilita_id_abilita`,`opzioni_abilita_opzione`),
  KEY `fk_phoa_id_abilita_idx` (`abilita_id_abilita`),
  KEY `fl_phoa_opzione_idx` (`opzioni_abilita_opzione`),
  CONSTRAINT `fk_phoa_id_abilita` FOREIGN KEY (`abilita_id_abilita`) REFERENCES `opzioni_abilita` (`abilita_id_abilita`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_phoa_pg` FOREIGN KEY (`personaggi_id_personaggio`) REFERENCES `personaggi` (`id_personaggio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personaggi_has_opzioni_abilita`
--

LOCK TABLES `personaggi_has_opzioni_abilita` WRITE;
/*!40000 ALTER TABLE `personaggi_has_opzioni_abilita` DISABLE KEYS */;
/*!40000 ALTER TABLE `personaggi_has_opzioni_abilita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programmi_craftati`
--

DROP TABLE IF EXISTS `programmi_craftati`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programmi_craftati` (
  `id_programma` int(11) NOT NULL,
  `risultato_programma` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_programma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programmi_craftati`
--

LOCK TABLES `programmi_craftati` WRITE;
/*!40000 ALTER TABLE `programmi_craftati` DISABLE KEYS */;
/*!40000 ALTER TABLE `programmi_craftati` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ricette`
--

DROP TABLE IF EXISTS `ricette`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ricette` (
  `id_ricetta` int(11) NOT NULL AUTO_INCREMENT,
  `personaggi_id_personaggio` int(11) NOT NULL,
  `data_inserimento_ricetta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo_ricetta` set('Programmazione','Tecnico','Chimico') NOT NULL,
  `tipo_oggetto` set('Programma','Sostanza','Arma Mischia','Pistola','Fucile Assalto','Mitragliatore','Shotgun','Fucile Precisione','Gadget Normale','Gadget Avanzato','Protesi Generica','Protesi Braccio','Protesi Gamba','Esoscheletro') NOT NULL,
  `nome_ricetta` varchar(255) NOT NULL,
  `approvata_ricetta` tinyint(1) NOT NULL DEFAULT '0',
  `risultato_ricetta` varchar(255) DEFAULT NULL,
  `id_unico_risultato_ricetta` int(11) DEFAULT NULL,
  `note_ricetta` text,
  `note_pg_ricetta` text,
  `extra_cartellino_ricetta` text,
  PRIMARY KEY (`id_ricetta`),
  KEY `fk_ricette_personaggi1_idx` (`personaggi_id_personaggio`),
  CONSTRAINT `fk_ricette_personaggi1` FOREIGN KEY (`personaggi_id_personaggio`) REFERENCES `personaggi` (`id_personaggio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ricette`
--

LOCK TABLES `ricette` WRITE;
/*!40000 ALTER TABLE `ricette` DISABLE KEYS */;
INSERT INTO `ricette` VALUES (16,68,'2018-04-18 18:05:30','Tecnico','Arma Mischia','Granatina',0,'APPLICATIVO: Emettitore laser mk1;BATTERIA: Batteria NRG  type A - 1;BATTERIA: Batteria NRG  type A - 3;STRUTTURA: parti in plastica  -  S;STRUTTURA: parti in plastica  -  S',NULL,NULL,NULL,NULL),(17,69,'2018-04-18 18:10:45','Chimico','Sostanza','Mediciona',0,'PARALISI;Aggiungi alla chiamata CONTINUO!',NULL,NULL,NULL,NULL),(18,54,'2018-04-18 18:11:36','Programmazione','Programma','Test',0,'ATTACCO - danno - QUADRUPLO',1,NULL,NULL,NULL),(19,54,'2018-04-18 18:28:06','Programmazione','Programma','Ritest',0,'ATTACCO - danno - A ZERO',2,NULL,NULL,NULL);
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
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `reboot_live`.`ruoli_BEFORE_DELETE` BEFORE DELETE ON `ruoli` FOR EACH ROW
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
INSERT INTO `ruoli_has_grants` VALUES ('admin','aggiungiAbilitaAlPG_altri'),('admin','aggiungiAbilitaAlPG_proprio'),('admin','aggiungiClassiAlPG_altri'),('admin','aggiungiClassiAlPG_proprio'),('admin','aggiungiOpzioniAbilita_altri'),('admin','aggiungiOpzioniAbilita_proprio'),('admin','associaPermessi'),('admin','creaEvento'),('admin','creaNotizia'),('admin','creaPG'),('admin','creaRuolo'),('admin','disiscriviPG_altri'),('admin','disiscriviPG_proprio'),('admin','eliminaEvento'),('admin','eliminaGiocatore'),('admin','eliminaPG_altri'),('admin','eliminaPG_proprio'),('admin','eliminaRuolo'),('admin','inviaMessaggio'),('admin','iscriviPg_altri'),('admin','iscriviPg_proprio'),('admin','loginPG_altri'),('admin','loginPG_proprio'),('admin','modificaEvento'),('admin','modificaIscrizionePG_note_iscrizione_altri'),('admin','modificaIscrizionePG_note_iscrizione_proprio'),('admin','modificaIscrizionePG_pagato_iscrizione_altri'),('admin','modificaIscrizionePG_pagato_iscrizione_proprio'),('admin','modificaNotizia'),('admin','modificaPG_anno_nascita_personaggio_altri'),('admin','modificaPG_anno_nascita_personaggio_proprio'),('admin','modificaPG_background_personaggio_altri'),('admin','modificaPG_background_personaggio_proprio'),('admin','modificaPG_contattabile_personaggio_altri'),('admin','modificaPG_contattabile_personaggio_proprio'),('admin','modificaPG_credito_personaggio_altri'),('admin','modificaPG_credito_personaggio_proprio'),('admin','modificaPG_motivazioni_olocausto_inserite_personaggio_altri'),('admin','modificaPG_motivazioni_olocausto_inserite_personaggio_proprio'),('admin','modificaPG_nome_personaggio_altri'),('admin','modificaPG_nome_personaggio_proprio'),('admin','modificaPG_note_cartellino_personaggio_altri'),('admin','modificaPG_note_cartellino_personaggio_proprio'),('admin','modificaPG_note_master_personaggio_altri'),('admin','modificaPG_note_master_personaggio_proprio'),('admin','modificaPG_pc_personaggio_altri'),('admin','modificaPG_pc_personaggio_proprio'),('admin','modificaPG_px_personaggio_altri'),('admin','modificaPG_px_personaggio_proprio'),('admin','modificaRicetta'),('admin','modificaUtente_cognome_giocatore_altri'),('admin','modificaUtente_cognome_giocatore_proprio'),('admin','modificaUtente_email_giocatore_altri'),('admin','modificaUtente_email_giocatore_proprio'),('admin','modificaUtente_nome_giocatore_altri'),('admin','modificaUtente_nome_giocatore_proprio'),('admin','modificaUtente_note_giocatore_altri'),('admin','modificaUtente_note_giocatore_proprio'),('admin','modificaUtente_note_staff_giocatore_altri'),('admin','modificaUtente_note_staff_giocatore_proprio'),('admin','modificaUtente_password_giocatore_altri'),('admin','modificaUtente_password_giocatore_proprio'),('admin','modificaUtente_ruoli_nome_ruolo_altri'),('admin','modificaUtente_ruoli_nome_ruolo_proprio'),('admin','mostraPersonaggi_altri'),('admin','mostraPersonaggi_proprio'),('admin','pubblicaEvento'),('admin','pubblicaNotizia'),('admin','recuperaComponentiAvanzata'),('admin','recuperaComponentiBase'),('admin','recuperaEventi'),('admin','recuperaListaEventi'),('admin','recuperaListaGiocatori'),('admin','recuperaListaIscrittiAvanzato'),('admin','recuperaListaIscrittiBase'),('admin','recuperaListaPermessi'),('admin','recuperaMessaggi'),('admin','recuperaMessaggioSingolo_altri'),('admin','recuperaMessaggioSingolo_proprio'),('admin','recuperaMessaggi_altri'),('admin','recuperaMessaggi_proprio'),('admin','recuperaNoteCartellino_altri'),('admin','recuperaNoteCartellino_proprio'),('admin','recuperaNoteMaster_altri'),('admin','recuperaNoteMaster_proprio'),('admin','recuperaNoteUtente_altri'),('admin','recuperaNoteUtente_proprio'),('admin','recuperaNotizie'),('admin','recuperaNotiziePubbliche'),('admin','recuperaOpzioniAbilita'),('admin','recuperaPermessiDeiRuoli'),('admin','recuperaRicette_altri'),('admin','recuperaRicette_proprio'),('admin','recuperaRuoli'),('admin','recuperaStorico_altri'),('admin','recuperaStorico_proprio'),('admin','rimuoviAbilitaPG_altri'),('admin','rimuoviAbilitaPG_proprio'),('admin','rimuoviClassePG_altri'),('admin','rimuoviClassePG_proprio'),('admin','ritiraEvento'),('admin','ritiraNotizia'),('admin','stampaCartelliniPG'),('admin','stampaListaIscritti'),('admin','visualizza_pagina_crea_evento'),('admin','visualizza_pagina_crea_pg'),('admin','visualizza_pagina_gestione_eventi'),('admin','visualizza_pagina_gestione_giocatori'),('admin','visualizza_pagina_gestione_oggetti_ingioco'),('admin','visualizza_pagina_gestione_permessi'),('admin','visualizza_pagina_gestione_ricette'),('admin','visualizza_pagina_lista_pg'),('admin','visualizza_pagina_main'),('admin','visualizza_pagina_mercato'),('admin','visualizza_pagina_messaggi'),('admin','visualizza_pagina_negozio_abilita'),('admin','visualizza_pagina_notizie'),('admin','visualizza_pagina_profilo'),('admin','visualizza_pagina_scheda_pg'),('admin','visualizza_pagina_stampa_cartellini'),('admin','visualizza_pagina_stampa_ricetta'),('admin','visualizza_pagina_stampa_tabella_iscritti'),('giocatore','aggiungiAbilitaAlPG_proprio'),('giocatore','aggiungiClassiAlPG_proprio'),('giocatore','aggiungiOpzioniAbilita_proprio'),('giocatore','creaPG'),('giocatore','eliminaPG_proprio'),('giocatore','inviaMessaggio'),('giocatore','iscriviPg_proprio'),('giocatore','loginPG_proprio'),('giocatore','modificaPG_anno_nascita_personaggio_proprio'),('giocatore','modificaPG_background_personaggio_proprio'),('giocatore','modificaPG_motivazioni_olocausto_inserite_personaggio_proprio'),('giocatore','modificaUtente_note_giocatore_proprio'),('giocatore','modificaUtente_password_giocatore_proprio'),('giocatore','mostraPersonaggi_proprio'),('giocatore','recuperaComponentiBase'),('giocatore','recuperaEventi'),('giocatore','recuperaMessaggi'),('giocatore','recuperaMessaggioSingolo_proprio'),('giocatore','recuperaMessaggi_proprio'),('giocatore','recuperaNoteUtente_proprio'),('giocatore','recuperaNotiziePubbliche'),('giocatore','recuperaOpzioniAbilita'),('giocatore','recuperaRicette_proprio'),('giocatore','visualizza_pagina_crea_pg'),('giocatore','visualizza_pagina_gestione_eventi'),('giocatore','visualizza_pagina_lista_pg'),('giocatore','visualizza_pagina_main'),('giocatore','visualizza_pagina_messaggi'),('giocatore','visualizza_pagina_negozio_abilita'),('giocatore','visualizza_pagina_profilo'),('giocatore','visualizza_pagina_scheda_pg');
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
  CONSTRAINT `fk_esecutore` FOREIGN KEY (`giocatori_email_giocatore`) REFERENCES `giocatori` (`email_giocatore`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=393 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storico_azioni`
--

LOCK TABLES `storico_azioni` WRITE;
/*!40000 ALTER TABLE `storico_azioni` DISABLE KEYS */;
INSERT INTO `storico_azioni` VALUES (12,43,'miroku_87@yahoo.it','2018-02-24 18:21:10','UPDATE','personaggi','background_personaggio','Prova%20di%20%3Cb%3EHTML%3C%2Fb%3E.%20','Prova%20di%20%3Cb%3EHTML%3C%2Fb%3E.%20YEEEE'),(13,43,'miroku_87@yahoo.it','2018-02-24 18:22:54','UPDATE','personaggi','background_personaggio','Prova%20di%20%3Cb%3EHTML%3C%2Fb%3E.%20YEEEE','Prova%20di%20%3Cb%3EHTML%3C%2Fb%3E.%20YEEEE1111'),(14,43,'miroku_87@yahoo.it','2018-02-26 22:30:01','UPDATE','personaggi','note_master_personaggio',NULL,''),(15,43,'miroku_87@yahoo.it','2018-02-26 22:30:54','UPDATE','personaggi','note_master_personaggio','',''),(16,43,'miroku_87@yahoo.it','2018-02-26 22:33:14','UPDATE','personaggi','note_master_personaggio','',''),(17,43,'miroku_87@yahoo.it','2018-02-26 22:34:40','UPDATE','personaggi','note_master_personaggio','',''),(18,43,'miroku_87@yahoo.it','2018-02-26 22:35:22','UPDATE','personaggi','background_personaggio','Prova%20di%20%3Cb%3EHTML%3C%2Fb%3E.%20YEEEE1111','Prova%20di%20%3Cb%3EHTML%3C%2Fb%3E.%20YEEEE1111'),(19,43,'miroku_87@yahoo.it','2018-02-26 22:37:04','UPDATE','personaggi','note_master_personaggio','','sdfsa%2034%202'),(20,38,'miroku_87@yahoo.it','2018-03-11 18:16:21','INSERT','personaggi_has_abilita','abilita_id_abilita',NULL,'1'),(21,38,'miroku_87@yahoo.it','2018-03-11 18:16:21','INSERT','personaggi_has_abilita','abilita_id_abilita',NULL,'2'),(22,38,'miroku_87@yahoo.it','2018-03-11 18:16:21','INSERT','personaggi_has_abilita','abilita_id_abilita',NULL,'3'),(23,38,'miroku_87@yahoo.it','2018-03-11 18:16:21','INSERT','personaggi_has_abilita','abilita_id_abilita',NULL,'92'),(24,38,'miroku_87@yahoo.it','2018-03-11 18:16:21','INSERT','personaggi_has_abilita','abilita_id_abilita',NULL,'93'),(25,38,'miroku_87@yahoo.it','2018-03-11 18:40:03','DELETE','personaggi_has_abilita','abilita_id_abilita','92',NULL),(26,42,'miroku_87@yahoo.it','2018-03-11 21:56:28','DELETE','personaggi','eliminato_personaggio','0','1'),(27,42,'miroku_87@yahoo.it','2018-03-11 21:56:28','DELETE','personaggi','eliminato_personaggio','0','1'),(28,42,'miroku_87@yahoo.it','2018-03-11 21:57:05','DELETE','personaggi','eliminato_personaggio','0','1'),(29,42,'miroku_87@yahoo.it','2018-03-11 21:57:05','DELETE','personaggi','eliminato_personaggio','0','1'),(30,42,'miroku_87@yahoo.it','2018-03-11 21:58:31','DELETE','personaggi','eliminato_personaggio','0','1'),(31,42,'miroku_87@yahoo.it','2018-03-11 21:58:31','DELETE','personaggi','eliminato_personaggio','0','1'),(32,42,'miroku_87@yahoo.it','2018-03-11 22:00:19','DELETE','personaggi','eliminato_personaggio','0','1'),(33,42,'miroku_87@yahoo.it','2018-03-11 22:00:19','DELETE','personaggi','eliminato_personaggio','0','1'),(34,43,'miroku_87@yahoo.it','2018-03-11 22:00:41','DELETE','personaggi','eliminato_personaggio','0','1'),(35,43,'miroku_87@yahoo.it','2018-03-11 22:00:42','DELETE','personaggi','eliminato_personaggio','0','1'),(36,42,'miroku_87@yahoo.it','2018-03-11 22:12:28','DELETE','personaggi','eliminato_personaggio','0','1'),(37,39,'miroku_87@yahoo.it','2018-03-11 22:29:45','DELETE','personaggi','eliminato_personaggio','0','1'),(62,50,'andrea.silvestri87@yahoo.it','2018-03-12 00:46:08','INSERT','personaggi','nome_personaggio',NULL,'Ciccio'),(63,50,'andrea.silvestri87@yahoo.it','2018-03-12 00:46:09','INSERT','personaggi','px_personaggio',NULL,'100'),(64,50,'andrea.silvestri87@yahoo.it','2018-03-12 00:46:09','INSERT','personaggi','pc_personaggio',NULL,'4'),(65,50,'andrea.silvestri87@yahoo.it','2018-03-12 00:46:09','INSERT','personaggi','giocatori_email_giocatore',NULL,'andrea.silvestri87@yahoo.it'),(66,50,'andrea.silvestri87@yahoo.it','2018-03-12 00:46:09','INSERT','personaggi_has_classi','classi_id_classe',NULL,'3'),(67,50,'andrea.silvestri87@yahoo.it','2018-03-12 00:46:09','INSERT','personaggi_has_classi','classi_id_classe',NULL,'14'),(68,50,'andrea.silvestri87@yahoo.it','2018-03-12 00:46:10','INSERT','personaggi_has_abilita','abilita_id_abilita',NULL,'29'),(69,50,'andrea.silvestri87@yahoo.it','2018-03-12 00:46:10','INSERT','personaggi_has_abilita','abilita_id_abilita',NULL,'33'),(70,50,'andrea.silvestri87@yahoo.it','2018-03-12 00:46:10','INSERT','personaggi_has_abilita','abilita_id_abilita',NULL,'196'),(71,50,'andrea.silvestri87@yahoo.it','2018-03-12 00:46:10','INSERT','personaggi_has_abilita','abilita_id_abilita',NULL,'197'),(72,50,'andrea.silvestri87@yahoo.it','2018-03-12 00:46:10','INSERT','personaggi_has_abilita','abilita_id_abilita',NULL,'198'),(73,42,'b-teo-90@libero.it','2018-03-14 01:25:10','UPDATE','personaggi','background_personaggio',NULL,'PRova%20BgGG'),(74,42,'b-teo-90@libero.it','2018-03-14 01:25:28','INSERT','personaggi_has_abilita','abilita_id_abilita',NULL,'92'),(79,52,'miroku_87@yahoo.it','2018-03-15 22:27:38','INSERT','personaggi','nome',NULL,'test'),(80,52,'miroku_87@yahoo.it','2018-03-15 22:27:38','INSERT','personaggi','PX',NULL,'100'),(81,52,'miroku_87@yahoo.it','2018-03-15 22:27:38','INSERT','personaggi','PC',NULL,'4'),(82,52,'miroku_87@yahoo.it','2018-03-15 22:27:39','INSERT','personaggi','email',NULL,'miroku_87@yahoo.it'),(83,52,'miroku_87@yahoo.it','2018-03-15 22:27:39','INSERT','classi_personaggio','classe',NULL,'Sportivo'),(84,52,'miroku_87@yahoo.it','2018-03-15 22:27:39','INSERT','classi_personaggio','classe',NULL,'Guardiano Base'),(85,52,'miroku_87@yahoo.it','2018-03-15 22:27:39','INSERT','abilita_personaggio','abilita',NULL,'Lag'),(86,52,'miroku_87@yahoo.it','2018-03-15 22:27:39','INSERT','abilita_personaggio','abilita',NULL,'Istinto di sopravvivenza'),(87,52,'miroku_87@yahoo.it','2018-03-17 18:42:22','UPDATE','personaggi','pc_personaggio','4','2'),(88,52,'miroku_87@yahoo.it','2018-03-17 18:42:22','UPDATE','personaggi','px_personaggio','100','2'),(89,52,'miroku_87@yahoo.it','2018-03-17 18:46:05','UPDATE','personaggi','pc_personaggio','6','4'),(90,52,'miroku_87@yahoo.it','2018-03-17 18:46:05','UPDATE','personaggi','px_personaggio','102','100'),(91,52,'miroku_87@yahoo.it','2018-03-17 18:46:49','UPDATE','personaggi','pc_personaggio','4','5'),(92,52,'miroku_87@yahoo.it','2018-03-17 18:46:49','UPDATE','personaggi','px_personaggio','100','101'),(93,52,'miroku_87@yahoo.it','2018-03-17 18:46:49','UPDATE','personaggi','pc_personaggio','5','6'),(94,52,'miroku_87@yahoo.it','2018-03-17 18:46:49','UPDATE','personaggi','px_personaggio','101','102'),(95,52,'miroku_87@yahoo.it','2018-03-17 18:49:40','UPDATE','personaggi','pc_personaggio','6','4'),(96,52,'miroku_87@yahoo.it','2018-03-17 18:49:40','UPDATE','personaggi','px_personaggio','102','104'),(97,52,'miroku_87@yahoo.it','2018-03-17 18:50:04','UPDATE','personaggi','pc_personaggio','4','0'),(98,52,'miroku_87@yahoo.it','2018-03-17 18:50:04','UPDATE','personaggi','px_personaggio','104','104'),(99,52,'miroku_87@yahoo.it','2018-03-17 18:50:04','UPDATE','personaggi','pc_personaggio','0','-4'),(100,52,'miroku_87@yahoo.it','2018-03-17 18:50:04','UPDATE','personaggi','px_personaggio','104','104'),(101,52,'miroku_87@yahoo.it','2018-03-17 18:51:15','UPDATE','personaggi','pc_personaggio','-4','4'),(102,52,'miroku_87@yahoo.it','2018-03-17 18:51:15','UPDATE','personaggi','px_personaggio','104','104'),(103,52,'miroku_87@yahoo.it','2018-03-17 18:51:27','UPDATE','personaggi','pc_personaggio','4','4'),(104,52,'miroku_87@yahoo.it','2018-03-17 18:51:27','UPDATE','personaggi','px_personaggio','104','100'),(105,52,'miroku_87@yahoo.it','2018-03-17 18:51:27','UPDATE','personaggi','pc_personaggio','4','4'),(106,52,'miroku_87@yahoo.it','2018-03-17 18:51:27','UPDATE','personaggi','px_personaggio','100','96'),(107,52,'miroku_87@yahoo.it','2018-03-17 18:54:37','UPDATE','personaggi','pc_personaggio','4','4'),(108,52,'miroku_87@yahoo.it','2018-03-17 18:54:37','UPDATE','personaggi','px_personaggio','96','100'),(109,52,'miroku_87@yahoo.it','2018-03-17 18:56:16','UPDATE','personaggi','pc_personaggio','4','-1'),(110,52,'miroku_87@yahoo.it','2018-03-17 18:56:16','UPDATE','personaggi','px_personaggio','100','102'),(111,52,'miroku_87@yahoo.it','2018-03-17 18:56:28','UPDATE','personaggi','pc_personaggio','-1','2'),(112,52,'miroku_87@yahoo.it','2018-03-17 18:56:28','UPDATE','personaggi','px_personaggio','102','102'),(113,52,'miroku_87@yahoo.it','2018-03-17 19:02:23','UPDATE','personaggi','pc_personaggio','2','-1'),(114,52,'miroku_87@yahoo.it','2018-03-17 19:02:23','UPDATE','personaggi','px_personaggio','102','102'),(115,52,'miroku_87@yahoo.it','2018-03-17 20:32:17','UPDATE','personaggi','pc_personaggio','0','1'),(116,52,'miroku_87@yahoo.it','2018-03-17 20:32:17','UPDATE','personaggi','px_personaggio','102','103'),(117,50,'miroku_87@yahoo.it','2018-03-17 20:32:17','UPDATE','personaggi','pc_personaggio','4','5'),(118,50,'miroku_87@yahoo.it','2018-03-17 20:32:17','UPDATE','personaggi','px_personaggio','100','101'),(119,43,'miroku_87@yahoo.it','2018-03-17 20:32:17','UPDATE','personaggi','pc_personaggio','4','5'),(120,43,'miroku_87@yahoo.it','2018-03-17 20:32:17','UPDATE','personaggi','px_personaggio','100','101'),(121,42,'miroku_87@yahoo.it','2018-03-17 20:32:17','UPDATE','personaggi','pc_personaggio','4','5'),(122,42,'miroku_87@yahoo.it','2018-03-17 20:32:17','UPDATE','personaggi','px_personaggio','100','101'),(123,39,'miroku_87@yahoo.it','2018-03-17 20:32:17','UPDATE','personaggi','pc_personaggio','4','5'),(124,39,'miroku_87@yahoo.it','2018-03-17 20:32:17','UPDATE','personaggi','px_personaggio','100','101'),(125,38,'miroku_87@yahoo.it','2018-03-17 20:32:17','UPDATE','personaggi','pc_personaggio','4','5'),(126,38,'miroku_87@yahoo.it','2018-03-17 20:32:18','UPDATE','personaggi','px_personaggio','100','101'),(127,38,'miroku_87@yahoo.it','2018-03-18 11:24:28','UPDATE','personaggi','pc_personaggio','5','6'),(128,38,'miroku_87@yahoo.it','2018-03-18 11:24:28','UPDATE','personaggi','px_personaggio','101','102'),(129,52,'miroku_87@yahoo.it','2018-03-18 23:10:14','UPDATE','personaggi','contattabile_personaggio','1','0'),(130,52,'miroku_87@yahoo.it','2018-03-18 23:10:21','UPDATE','personaggi','contattabile_personaggio','0','1'),(131,50,'miroku_87@yahoo.it','2018-03-18 23:10:33','UPDATE','personaggi','contattabile_personaggio','1','0'),(132,50,'miroku_87@yahoo.it','2018-03-18 23:10:33','UPDATE','personaggi','contattabile_personaggio','0','1'),(133,50,'miroku_87@yahoo.it','2018-03-18 23:14:29','UPDATE','personaggi','contattabile_personaggio','1','0'),(134,50,'miroku_87@yahoo.it','2018-03-18 23:15:18','UPDATE','personaggi','contattabile_personaggio','0','1'),(135,38,'miroku_87@yahoo.it','2018-03-18 23:20:05','UPDATE','personaggi','credito_personaggio','0','2'),(136,38,'miroku_87@yahoo.it','2018-03-18 23:23:47','UPDATE','personaggi','background_personaggio',NULL,'Prova%20Mail'),(137,52,'miroku_87@yahoo.it','2018-03-18 23:48:17','UPDATE','personaggi','credito_personaggio','0','3'),(138,52,'miroku_87@yahoo.it','2018-03-18 23:48:24','UPDATE','personaggi','credito_personaggio','3','4'),(139,50,'miroku_87@yahoo.it','2018-03-18 23:48:24','UPDATE','personaggi','credito_personaggio','0','1'),(140,43,'miroku_87@yahoo.it','2018-03-18 23:48:24','UPDATE','personaggi','credito_personaggio','0','1'),(141,42,'miroku_87@yahoo.it','2018-03-18 23:48:24','UPDATE','personaggi','credito_personaggio','0','1'),(142,39,'miroku_87@yahoo.it','2018-03-18 23:48:24','UPDATE','personaggi','credito_personaggio','0','1'),(143,38,'miroku_87@yahoo.it','2018-03-18 23:48:24','UPDATE','personaggi','credito_personaggio','2','3'),(144,52,'miroku_87@yahoo.it','2018-03-18 23:57:32','UPDATE','personaggi','contattabile_personaggio','1','0'),(145,52,'miroku_87@yahoo.it','2018-03-18 23:57:33','UPDATE','personaggi','contattabile_personaggio','0','1'),(146,53,'miroku_87@yahoo.it','2018-03-19 22:29:34','INSERT','personaggi','nome',NULL,'BellÃ²'),(147,53,'miroku_87@yahoo.it','2018-03-19 22:29:34','INSERT','personaggi','PX',NULL,'100'),(148,53,'miroku_87@yahoo.it','2018-03-19 22:29:34','INSERT','personaggi','PC',NULL,'4'),(149,53,'miroku_87@yahoo.it','2018-03-19 22:29:34','INSERT','personaggi','email',NULL,'miroku_87@yahoo.it'),(150,53,'miroku_87@yahoo.it','2018-03-19 22:29:34','INSERT','classi_personaggio','classe',NULL,'Sportivo'),(151,53,'miroku_87@yahoo.it','2018-03-19 22:29:35','INSERT','classi_personaggio','classe',NULL,'Guardiano Base'),(152,53,'miroku_87@yahoo.it','2018-03-19 22:29:35','INSERT','abilita_personaggio','abilita',NULL,'Glitch'),(153,53,'miroku_87@yahoo.it','2018-03-19 22:29:35','INSERT','abilita_personaggio','abilita',NULL,'Istinto omicida'),(154,54,'miroku_87@yahoo.it','2018-03-19 22:34:38','INSERT','personaggi','nome',NULL,'PapÃƒÂ '),(155,54,'miroku_87@yahoo.it','2018-03-19 22:34:38','INSERT','personaggi','PX',NULL,'100'),(156,54,'miroku_87@yahoo.it','2018-03-19 22:34:38','INSERT','personaggi','PC',NULL,'4'),(157,54,'miroku_87@yahoo.it','2018-03-19 22:34:38','INSERT','personaggi','email',NULL,'miroku_87@yahoo.it'),(158,54,'miroku_87@yahoo.it','2018-03-19 22:34:38','INSERT','classi_personaggio','classe',NULL,'Netrunner'),(159,54,'miroku_87@yahoo.it','2018-03-19 22:34:38','INSERT','classi_personaggio','classe',NULL,'Assaltatore Base'),(160,54,'miroku_87@yahoo.it','2018-03-19 22:34:38','INSERT','abilita_personaggio','abilita',NULL,'Ctrl-c, Ctrl-v'),(161,54,'miroku_87@yahoo.it','2018-03-19 22:34:38','INSERT','abilita_personaggio','abilita',NULL,'Tiratore scelto'),(162,55,'miroku_87@yahoo.it','2018-03-19 22:36:57','INSERT','personaggi','nome',NULL,'BÃƒÂ©bÃƒÂ©'),(163,55,'miroku_87@yahoo.it','2018-03-19 22:36:57','INSERT','personaggi','PX',NULL,'100'),(164,55,'miroku_87@yahoo.it','2018-03-19 22:36:57','INSERT','personaggi','PC',NULL,'4'),(165,55,'miroku_87@yahoo.it','2018-03-19 22:36:57','INSERT','personaggi','email',NULL,'miroku_87@yahoo.it'),(166,55,'miroku_87@yahoo.it','2018-03-19 22:36:57','INSERT','classi_personaggio','classe',NULL,'Giornalista'),(167,55,'miroku_87@yahoo.it','2018-03-19 22:36:58','INSERT','classi_personaggio','classe',NULL,'Assaltatore Base'),(168,55,'miroku_87@yahoo.it','2018-03-19 22:36:58','INSERT','abilita_personaggio','abilita',NULL,'Foto scottanti'),(169,55,'miroku_87@yahoo.it','2018-03-19 22:36:58','INSERT','abilita_personaggio','abilita',NULL,'Tiratore scelto'),(170,56,'miroku_87@yahoo.it','2018-03-19 22:37:52','INSERT','personaggi','nome',NULL,'PÃ²Ã²Ã²'),(171,56,'miroku_87@yahoo.it','2018-03-19 22:37:52','INSERT','personaggi','PX',NULL,'100'),(172,56,'miroku_87@yahoo.it','2018-03-19 22:37:52','INSERT','personaggi','PC',NULL,'4'),(173,56,'miroku_87@yahoo.it','2018-03-19 22:37:52','INSERT','personaggi','email',NULL,'miroku_87@yahoo.it'),(174,56,'miroku_87@yahoo.it','2018-03-19 22:37:53','INSERT','classi_personaggio','classe',NULL,'Sciacallo'),(175,56,'miroku_87@yahoo.it','2018-03-19 22:37:53','INSERT','classi_personaggio','classe',NULL,'Assaltatore Base'),(176,56,'miroku_87@yahoo.it','2018-03-19 22:37:53','INSERT','abilita_personaggio','abilita',NULL,'Torturare'),(177,56,'miroku_87@yahoo.it','2018-03-19 22:37:53','INSERT','abilita_personaggio','abilita',NULL,'Addestramento fisico'),(178,57,'miroku_87@yahoo.it','2018-03-19 23:28:58','INSERT','personaggi','nome',NULL,'Pepperepé'),(179,57,'miroku_87@yahoo.it','2018-03-19 23:28:58','INSERT','personaggi','PX',NULL,'100'),(180,57,'miroku_87@yahoo.it','2018-03-19 23:28:58','INSERT','personaggi','PC',NULL,'4'),(181,57,'miroku_87@yahoo.it','2018-03-19 23:28:58','INSERT','personaggi','email',NULL,'miroku_87@yahoo.it'),(182,57,'miroku_87@yahoo.it','2018-03-19 23:28:58','INSERT','classi_personaggio','classe',NULL,'Guardia di Sicurezza'),(183,57,'miroku_87@yahoo.it','2018-03-19 23:28:58','INSERT','classi_personaggio','classe',NULL,'Guardiano Base'),(184,57,'miroku_87@yahoo.it','2018-03-19 23:28:59','INSERT','abilita_personaggio','abilita',NULL,'Linguaggio del corpo'),(185,57,'miroku_87@yahoo.it','2018-03-19 23:28:59','INSERT','abilita_personaggio','abilita',NULL,'Istinto omicida'),(224,61,'miroku_87@yahoo.it','2018-03-21 01:25:30','INSERT','personaggi','nome',NULL,'Opzioni'),(225,61,'miroku_87@yahoo.it','2018-03-21 01:25:30','INSERT','personaggi','PX',NULL,'1000'),(226,61,'miroku_87@yahoo.it','2018-03-21 01:25:30','INSERT','personaggi','PC',NULL,'40'),(227,61,'miroku_87@yahoo.it','2018-03-21 01:25:30','INSERT','personaggi','email',NULL,'miroku_87@yahoo.it'),(228,61,'miroku_87@yahoo.it','2018-03-21 01:25:30','INSERT','classi_personaggio','classe',NULL,'Giornalista'),(229,61,'miroku_87@yahoo.it','2018-03-21 01:25:30','INSERT','classi_personaggio','classe',NULL,'Assaltatore Base'),(230,61,'miroku_87@yahoo.it','2018-03-21 01:25:30','INSERT','classi_personaggio','classe',NULL,'Assaltatore Avanzata'),(231,61,'miroku_87@yahoo.it','2018-03-21 01:25:30','INSERT','abilita_personaggio','abilita',NULL,'Campo di specializzazione 1'),(232,61,'miroku_87@yahoo.it','2018-03-21 01:25:30','INSERT','abilita_personaggio','abilita',NULL,'Campo di specializzazione 2'),(233,61,'miroku_87@yahoo.it','2018-03-21 01:25:30','INSERT','abilita_personaggio','abilita',NULL,'Fuoco a terra'),(234,61,'miroku_87@yahoo.it','2018-03-21 01:25:30','INSERT','abilita_personaggio','abilita',NULL,'Colpo non letale'),(235,61,'miroku_87@yahoo.it','2018-03-21 01:25:31','INSERT','abilita_personaggio','abilita',NULL,'Disarmare'),(236,61,'miroku_87@yahoo.it','2018-03-21 01:25:31','INSERT','abilita_personaggio','abilita',NULL,'Arma selezionata'),(237,61,'miroku_87@yahoo.it','2018-03-21 01:25:31','INSERT','opzioni_abilita','abilita - opzione',NULL,'Campo di specializzazione 1 - Cronaca Nera'),(238,61,'miroku_87@yahoo.it','2018-03-21 01:25:31','INSERT','opzioni_abilita','abilita - opzione',NULL,'Campo di specializzazione 2 - Economia'),(239,61,'miroku_87@yahoo.it','2018-03-21 01:25:31','INSERT','opzioni_abilita','abilita - opzione',NULL,'Arma selezionata - Fucile d'),(240,61,'miroku_87@yahoo.it','2018-03-21 01:59:07','INSERT','abilita_personaggio','abilita',NULL,'Campo di specializzazione 3'),(241,61,'miroku_87@yahoo.it','2018-03-21 01:59:49','DELETE','abilita_personaggio','abilita','Campo di specializzazione 3',NULL),(242,61,'miroku_87@yahoo.it','2018-03-21 02:13:24','INSERT','abilita_personaggio','abilita',NULL,'Campo di specializzazione 3'),(243,61,'miroku_87@yahoo.it','2018-03-21 02:13:24','INSERT','opzioni_abilita','abilita - opzione',NULL,'Campo di specializzazione 3 - Cronaca Rosa'),(244,61,'miroku_87@yahoo.it','2018-03-21 03:02:04','INSERT','classi_personaggio','classe',NULL,'Giornalista'),(245,61,'miroku_87@yahoo.it','2018-03-21 03:07:08','INSERT','classi_personaggio','classe',NULL,'Giornalista'),(246,61,'miroku_87@yahoo.it','2018-03-21 03:08:07','INSERT','classi_personaggio','classe',NULL,'Giornalista'),(247,61,'miroku_87@yahoo.it','2018-03-21 03:09:20','INSERT','classi_personaggio','classe',NULL,'Giornalista'),(248,61,'miroku_87@yahoo.it','2018-03-21 03:09:28','DELETE','classi_personaggio','classe','Giornalista',NULL),(249,61,'miroku_87@yahoo.it','2018-03-21 03:09:28','DELETE','abilita_personaggio','abilita','Campo di specializzazione 1',NULL),(250,61,'miroku_87@yahoo.it','2018-03-21 03:09:28','DELETE','abilita_personaggio','abilita','Campo di specializzazione 2',NULL),(251,61,'miroku_87@yahoo.it','2018-03-21 03:09:28','DELETE','abilita_personaggio','abilita','Campo di specializzazione 3',NULL),(252,61,'miroku_87@yahoo.it','2018-03-21 03:09:57','DELETE','abilita_personaggio','abilita','Arma selezionata',NULL),(253,61,'miroku_87@yahoo.it','2018-03-21 03:11:33','DELETE','abilita_personaggio','abilita','Arma selezionata',NULL),(270,64,'miroku_87@yahoo.it','2018-03-25 17:55:46','INSERT','personaggi','nome',NULL,'ritest opz'),(271,64,'miroku_87@yahoo.it','2018-03-25 17:55:46','INSERT','personaggi','PX',NULL,'100'),(272,64,'miroku_87@yahoo.it','2018-03-25 17:55:46','INSERT','personaggi','PC',NULL,'4'),(273,64,'miroku_87@yahoo.it','2018-03-25 17:55:46','INSERT','personaggi','email',NULL,'miroku_87@yahoo.it'),(274,64,'miroku_87@yahoo.it','2018-03-25 17:55:46','INSERT','classi_personaggio','classe',NULL,'Sportivo'),(275,64,'miroku_87@yahoo.it','2018-03-25 17:55:46','INSERT','classi_personaggio','classe',NULL,'Guardiano Base'),(276,64,'miroku_87@yahoo.it','2018-03-25 17:55:46','INSERT','abilita_personaggio','abilita',NULL,'Glitch'),(277,64,'miroku_87@yahoo.it','2018-03-25 17:55:46','INSERT','abilita_personaggio','abilita',NULL,'Istinto omicida'),(278,64,'miroku_87@yahoo.it','2018-03-25 17:56:07','UPDATE','personaggi','pc_personaggio','4','54'),(279,64,'miroku_87@yahoo.it','2018-03-25 17:56:07','UPDATE','personaggi','px_personaggio','100','300'),(280,38,'miroku_87@yahoo.it','2018-03-28 00:56:57','UPDATE','personaggi','anno_nascita_personaggio','271','249'),(281,53,'miroku_87@yahoo.it','2018-03-28 00:56:57','UPDATE','personaggi','anno_nascita_personaggio','271','226'),(282,43,'miroku_87@yahoo.it','2018-03-28 00:56:57','UPDATE','personaggi','anno_nascita_personaggio','271','238'),(283,39,'miroku_87@yahoo.it','2018-03-28 00:56:57','UPDATE','personaggi','anno_nascita_personaggio','271','249'),(284,52,'miroku_87@yahoo.it','2018-03-28 00:56:57','UPDATE','personaggi','anno_nascita_personaggio','271','260'),(285,54,'miroku_87@yahoo.it','2018-03-28 00:56:57','UPDATE','personaggi','anno_nascita_personaggio','271','248'),(286,55,'miroku_87@yahoo.it','2018-03-28 00:56:57','UPDATE','personaggi','anno_nascita_personaggio','271','250'),(287,56,'miroku_87@yahoo.it','2018-03-28 00:56:57','UPDATE','personaggi','anno_nascita_personaggio','271','237'),(288,57,'miroku_87@yahoo.it','2018-03-28 00:56:58','UPDATE','personaggi','anno_nascita_personaggio','271','217'),(289,61,'miroku_87@yahoo.it','2018-03-28 00:56:58','UPDATE','personaggi','anno_nascita_personaggio','271','256'),(290,64,'miroku_87@yahoo.it','2018-03-28 00:56:58','UPDATE','personaggi','anno_nascita_personaggio','271','227'),(291,65,'miroku_87@yahoo.it','2018-03-28 01:29:32','INSERT','personaggi','nome',NULL,'Test età'),(292,65,'miroku_87@yahoo.it','2018-03-28 01:29:32','INSERT','personaggi','PX',NULL,'100'),(293,65,'miroku_87@yahoo.it','2018-03-28 01:29:33','INSERT','personaggi','PC',NULL,'4'),(294,65,'miroku_87@yahoo.it','2018-03-28 01:29:33','INSERT','personaggi','email',NULL,'miroku_87@yahoo.it'),(295,65,'miroku_87@yahoo.it','2018-03-28 01:29:33','INSERT','classi_personaggio','classe',NULL,'Tecnico'),(296,65,'miroku_87@yahoo.it','2018-03-28 01:29:33','INSERT','classi_personaggio','classe',NULL,'Supporto Base'),(297,65,'miroku_87@yahoo.it','2018-03-28 01:29:33','INSERT','classi_personaggio','classe',NULL,'Guastatore Base'),(298,65,'miroku_87@yahoo.it','2018-03-28 01:29:33','INSERT','abilita_personaggio','abilita',NULL,'Riparare'),(299,65,'miroku_87@yahoo.it','2018-03-28 01:29:33','INSERT','abilita_personaggio','abilita',NULL,'Opportunista'),(300,65,'miroku_87@yahoo.it','2018-03-28 01:29:33','INSERT','abilita_personaggio','abilita',NULL,'Riparazione veloce'),(301,38,'miroku_87@yahoo.it','2018-03-28 02:29:00','UPDATE','personaggi','pc_personaggio','6','7'),(302,38,'miroku_87@yahoo.it','2018-03-28 02:29:00','UPDATE','personaggi','px_personaggio','102','112'),(303,38,'miroku_87@yahoo.it','2018-03-28 02:43:05','UPDATE','personaggi','pc_personaggio','7','9'),(304,38,'miroku_87@yahoo.it','2018-03-28 02:43:06','UPDATE','personaggi','px_personaggio','112','114'),(305,38,'miroku_87@yahoo.it','2018-03-28 02:43:45','UPDATE','personaggi','pc_personaggio','9','14'),(306,38,'miroku_87@yahoo.it','2018-03-28 02:43:45','UPDATE','personaggi','px_personaggio','114','119'),(307,38,'miroku_87@yahoo.it','2018-03-28 02:47:18','UPDATE','personaggi','pc_personaggio','14','64'),(308,38,'miroku_87@yahoo.it','2018-03-28 02:47:18','UPDATE','personaggi','px_personaggio','119','319'),(309,38,'miroku_87@yahoo.it','2018-03-28 02:51:34','UPDATE','personaggi','pc_personaggio','64','84'),(310,38,'miroku_87@yahoo.it','2018-03-28 02:51:34','UPDATE','personaggi','px_personaggio','319','339'),(311,38,'miroku_87@yahoo.it','2018-03-28 02:52:06','UPDATE','personaggi','pc_personaggio','84','124'),(312,38,'miroku_87@yahoo.it','2018-03-28 02:52:06','UPDATE','personaggi','px_personaggio','339','379'),(313,38,'miroku_87@yahoo.it','2018-03-28 02:53:19','UPDATE','personaggi','pc_personaggio','124','127'),(314,38,'miroku_87@yahoo.it','2018-03-28 02:53:19','UPDATE','personaggi','px_personaggio','379','382'),(315,42,'b-teo-90@libero.it','2018-03-29 21:05:25','UPDATE','personaggi','anno_nascita_personaggio','271','263'),(316,42,'b-teo-90@libero.it','2018-03-30 23:19:02','UPDATE','personaggi','background_personaggio','PRova%20BgGG','PRova%20BgGG%0A%0AOLOCOSO!!!'),(317,42,'b-teo-90@libero.it','2018-03-30 23:19:03','UPDATE','personaggi','motivazioni_olocausto_inserite_personaggio','0','1'),(318,65,'miroku_87@yahoo.it','2018-03-30 23:35:05','UPDATE','personaggi','note_master_personaggio',NULL,''),(319,65,'miroku_87@yahoo.it','2018-03-30 23:41:16','UPDATE','personaggi','note_master_personaggio','','TEST'),(320,66,'b-teo-90@libero.it','2018-03-30 23:42:01','INSERT','personaggi','nome',NULL,'No Olo'),(321,66,'b-teo-90@libero.it','2018-03-30 23:42:02','INSERT','personaggi','PX',NULL,'100'),(322,66,'b-teo-90@libero.it','2018-03-30 23:42:02','INSERT','personaggi','PC',NULL,'4'),(323,66,'b-teo-90@libero.it','2018-03-30 23:42:02','INSERT','personaggi','email',NULL,'b-teo-90@libero.it'),(324,66,'b-teo-90@libero.it','2018-03-30 23:42:02','INSERT','classi_personaggio','classe',NULL,'Sportivo'),(325,66,'b-teo-90@libero.it','2018-03-30 23:42:02','INSERT','classi_personaggio','classe',NULL,'Guardiano Base'),(326,66,'b-teo-90@libero.it','2018-03-30 23:42:02','INSERT','abilita_personaggio','abilita',NULL,'Glitch'),(327,66,'b-teo-90@libero.it','2018-03-30 23:42:02','INSERT','abilita_personaggio','abilita',NULL,'Istinto omicida'),(328,66,'b-teo-90@libero.it','2018-03-30 23:42:17','UPDATE','personaggi','background_personaggio',NULL,'TEST'),(329,66,'b-teo-90@libero.it','2018-03-30 23:48:59','UPDATE','personaggi','background_personaggio',NULL,'TESTINO'),(330,66,'b-teo-90@libero.it','2018-03-30 23:53:14','UPDATE','personaggi','background_personaggio',NULL,'Noooooooooo'),(331,66,'b-teo-90@libero.it','2018-03-30 23:53:14','UPDATE','personaggi','motivazioni_olocausto_inserite_personaggio','0','1'),(332,66,'b-teo-90@libero.it','2018-03-30 23:54:08','UPDATE','personaggi','background_personaggio','Noooooooooo','Noooooooooo%0A%0Ao%20si%3F'),(333,66,'b-teo-90@libero.it','2018-03-30 23:54:08','UPDATE','personaggi','motivazioni_olocausto_inserite_personaggio','0','1'),(334,66,'b-teo-90@libero.it','2018-03-30 23:56:44','UPDATE','personaggi','background_personaggio','Noooooooooo%0A%0Ao%20si%3F','Noooooooooo%3Cbr%3E%0Ao%20si%3F'),(335,66,'b-teo-90@libero.it','2018-03-30 23:56:44','UPDATE','personaggi','motivazioni_olocausto_inserite_personaggio','0','1'),(336,66,'b-teo-90@libero.it','2018-03-30 23:59:48','UPDATE','personaggi','background_personaggio','Noooooooooo%3Cbr%3E%0Ao%20si%3F','Noooooooooo%3Cbr%3E%3Cbr%3Eo%20si%3F%0ALorem%20ipsum%20%3Cb%3Edolor%3C%2Fb%3E%20sit%20amet%2C%20consectetur%20adipiscing%20elit%2C%20sed%20do%20eiusmod%20tempor%20incididunt%20ut%20labore%20et%20dolore%20magna%20aliqua.%20Ut%20enim%20ad%20minim%20veniam%2C%20quis%20nostrud%20exercitation%20ullamco%20laboris%20nisi%20ut%20aliquip%20ex%20ea%20commodo%20consequat.%20Duis%20aute%20irure%20dolor%20in%20reprehenderit%20in%20voluptate%20velit%20esse%20cillum%20dolore%20eu%20fugiat%20nulla%20pariatur.%20Excepteur%20sint%20occaecat%20cupidatat%20non%20proident%2C%20sunt%20in%20culpa%20qui%20officia%20deserunt%20mollit%20anim%20id%20est%20laborum.'),(337,66,'b-teo-90@libero.it','2018-03-30 23:59:48','UPDATE','personaggi','motivazioni_olocausto_inserite_personaggio','0','1'),(338,66,'b-teo-90@libero.it','2018-03-31 00:06:51','UPDATE','personaggi','background_personaggio','Noooooooooo%3Cbr%3E%3Cbr%3Eo%20si%3F%0ALorem%20ipsum%20%3Cb%3Edolor%3C%2Fb%3E%20sit%20amet%2C%20consectetur%20adipiscing%20elit%2C%20sed%20do%20eiusmod%20tempor%20incididunt%20ut%20labore%20et%20dolore%20magna%20aliqua.%20Ut%20enim%20ad%20minim%20veniam%2C%20quis%20nostrud%20exercitation%20ullamco%20laboris%20nisi%20ut%20aliquip%20ex%20ea%20commodo%20consequat.%20Duis%20aute%20irure%20dolor%20in%20reprehenderit%20in%20voluptate%20velit%20esse%20cillum%20dolore%20eu%20fugiat%20nulla%20pariatur.%20Excepteur%20sint%20occaecat%20cupidatat%20non%20proident%2C%20sunt%20in%20culpa%20qui%20officia%20deserunt%20mollit%20anim%20id%20est%20laborum.','Noooooooooo%3Cbr%3Eo%20si%3F%0ALorem%20ipsum%20%26lt%3Bb%26gt%3Bdolor%26lt%3B%2Fb%26gt%3B%20sit%20amet%2C%20consectetur%20adipiscing%20elit%2C%20sed%20do%20eiusmod%20tempor%20incididunt%20ut%20labore%20et%20dolore%20magna%20aliqua.%20Ut%20enim%20ad%20minim%20veniam%2C%20quis%20nostrud%20exercitation%20ullamco%20laboris%20nisi%20ut%20aliquip%20ex%20ea%20commodo%20consequat.%20Duis%20aute%20irure%20dolor%20in%20reprehenderit%20in%20voluptate%20velit%20esse%20cillum%20dolore%20eu%20fugiat%20nulla%20pariatur.%20Excepteur%20sint%20occaecat%20cupidatat%20non%20proident%2C%20sunt%20in%20culpa%20qui%20officia%20deserunt%20mollit%20anim%20id%20est%20laborum.'),(339,66,'b-teo-90@libero.it','2018-03-31 00:06:51','UPDATE','personaggi','motivazioni_olocausto_inserite_personaggio','0','1'),(340,66,'b-teo-90@libero.it','2018-03-31 00:08:18','UPDATE','personaggi','background_personaggio','Noooooooooo%3Cbr%3Eo%20si%3F%0ALorem%20ipsum%20%26lt%3Bb%26gt%3Bdolor%26lt%3B%2Fb%26gt%3B%20sit%20amet%2C%20consectetur%20adipiscing%20elit%2C%20sed%20do%20eiusmod%20tempor%20incididunt%20ut%20labore%20et%20dolore%20magna%20aliqua.%20Ut%20enim%20ad%20minim%20veniam%2C%20quis%20nostrud%20exercitation%20ullamco%20laboris%20nisi%20ut%20aliquip%20ex%20ea%20commodo%20consequat.%20Duis%20aute%20irure%20dolor%20in%20reprehenderit%20in%20voluptate%20velit%20esse%20cillum%20dolore%20eu%20fugiat%20nulla%20pariatur.%20Excepteur%20sint%20occaecat%20cupidatat%20non%20proident%2C%20sunt%20in%20culpa%20qui%20officia%20deserunt%20mollit%20anim%20id%20est%20laborum.','Noooooooooo%0Ao%20si%3F%0ALorem%20ipsum%20%26lt%3Bb%26gt%3Bdolor%26lt%3B%2Fb%26gt%3B%20sit%20amet%2C%20consectetur%20adipiscing%20elit%2C%20sed%20do%20eiusmod%20tempor%20incididunt%20ut%20labore%20et%20dolore%20magna%20aliqua.%20Ut%20enim%20ad%20minim%20veniam%2C%20quis%20nostrud%20exercitation%20ullamco%20laboris%20nisi%20ut%20aliquip%20ex%20ea%20commodo%20consequat.%20Duis%20aute%20irure%20dolor%20in%20reprehenderit%20in%20voluptate%20velit%20esse%20cillum%20dolore%20eu%20fugiat%20nulla%20pariatur.%20Excepteur%20sint%20occaecat%20cupidatat%20non%20proident%2C%20sunt%20in%20culpa%20qui%20officia%20deserunt%20mollit%20anim%20id%20est%20laborum.'),(341,66,'b-teo-90@libero.it','2018-03-31 00:08:18','UPDATE','personaggi','motivazioni_olocausto_inserite_personaggio','0','1'),(342,66,'b-teo-90@libero.it','2018-03-31 00:10:29','UPDATE','personaggi','background_personaggio','Noooooooooo%0Ao%20si%3F%0ALorem%20ipsum%20%26lt%3Bb%26gt%3Bdolor%26lt%3B%2Fb%26gt%3B%20sit%20amet%2C%20consectetur%20adipiscing%20elit%2C%20sed%20do%20eiusmod%20tempor%20incididunt%20ut%20labore%20et%20dolore%20magna%20aliqua.%20Ut%20enim%20ad%20minim%20veniam%2C%20quis%20nostrud%20exercitation%20ullamco%20laboris%20nisi%20ut%20aliquip%20ex%20ea%20commodo%20consequat.%20Duis%20aute%20irure%20dolor%20in%20reprehenderit%20in%20voluptate%20velit%20esse%20cillum%20dolore%20eu%20fugiat%20nulla%20pariatur.%20Excepteur%20sint%20occaecat%20cupidatat%20non%20proident%2C%20sunt%20in%20culpa%20qui%20officia%20deserunt%20mollit%20anim%20id%20est%20laborum.','Noooooooooo%3Cbr%3Eo%20si%3F%3Cbr%3ELorem%20ipsum%20%26lt%3Bb%26gt%3Bdolor%26lt%3B%2Fb%26gt%3B%20sit%20amet%2C%20consectetur%20adipiscing%20elit%2C%20sed%20do%20eiusmod%20tempor%20incididunt%20ut%20labore%20et%20dolore%20magna%20aliqua.%20Ut%20enim%20ad%20minim%20veniam%2C%20quis%20nostrud%20exercitation%20ullamco%20laboris%20nisi%20ut%20aliquip%20ex%20ea%20commodo%20consequat.%20Duis%20aute%20irure%20dolor%20in%20reprehenderit%20in%20voluptate%20velit%20esse%20cillum%20dolore%20eu%20fugiat%20nulla%20pariatur.%20Excepteur%20sint%20occaecat%20cupidatat%20non%20proident%2C%20sunt%20in%20culpa%20qui%20officia%20deserunt%20mollit%20anim%20id%20est%20laborum.'),(343,66,'b-teo-90@libero.it','2018-03-31 00:10:29','UPDATE','personaggi','motivazioni_olocausto_inserite_personaggio','0','1'),(344,66,'miroku_87@yahoo.it','2018-03-31 00:12:09','UPDATE','personaggi','note_master_personaggio',NULL,'Lorem%20ipsum%20dolor%20sit%20%26lt%3Bb%26gt%3Bamet%26lt%3B%2Fb%26gt%3B%2C%20%3Cbr%3Econsectetur%20adipiscing%20elit%2C%20sed%20do%20eiusmod%20tempor%20incididunt%20ut%20labore%20et%20dolore%20magna%20aliqua.%20Ut%20enim%20ad%20minim%20veniam%2C%20quis%20nostrud%20exercitation%20ullamco%20laboris%20nisi%20ut%20aliquip%20ex%20ea%20commodo%20consequat.%20%3Cbr%3E%3Cbr%3EDuis%20aute%20irure%20dolor%20in%20reprehenderit%20in%20voluptate%20velit%20esse%20cillum%20dolore%20eu%20fugiat%20nulla%20pariatur.%20Excepteur%20sint%20occaecat%20cupidatat%20non%20proident%2C%20sunt%20in%20culpa%20qui%20officia%20deserunt%20mollit%20anim%20id%20est%20laborum.'),(345,66,'miroku_87@yahoo.it','2018-03-31 00:12:43','UPDATE','personaggi','background_personaggio','Noooooooooo%3Cbr%3Eo%20si%3F%3Cbr%3ELorem%20ipsum%20%26lt%3Bb%26gt%3Bdolor%26lt%3B%2Fb%26gt%3B%20sit%20amet%2C%20consectetur%20adipiscing%20elit%2C%20sed%20do%20eiusmod%20tempor%20incididunt%20ut%20labore%20et%20dolore%20magna%20aliqua.%20Ut%20enim%20ad%20minim%20veniam%2C%20quis%20nostrud%20exercitation%20ullamco%20laboris%20nisi%20ut%20aliquip%20ex%20ea%20commodo%20consequat.%20Duis%20aute%20irure%20dolor%20in%20reprehenderit%20in%20voluptate%20velit%20esse%20cillum%20dolore%20eu%20fugiat%20nulla%20pariatur.%20Excepteur%20sint%20occaecat%20cupidatat%20non%20proident%2C%20sunt%20in%20culpa%20qui%20officia%20deserunt%20mollit%20anim%20id%20est%20laborum.','Noooooooooo%3Cbr%3Eo%20si%3F%26lt%3Bbr%26gt%3BLorem%20ipsum%20%26lt%3Bb%26gt%3Bdolor%26lt%3B%2Fb%26gt%3B%20sit%20amet%2C%20consectetur%20adipiscing%20elit%2C%20sed%20do%20eiusmod%20tempor%20incididunt%20ut%20labore%20et%20dolore%20magna%20aliqua.%20Ut%20enim%20ad%20minim%20veniam%2C%20quis%20nostrud%20exercitation%20ullamco%20laboris%20nisi%20ut%20aliquip%20ex%20ea%20commodo%20consequat.%20Duis%20aute%20irure%20dolor%20in%20reprehenderit%20in%20voluptate%20velit%20esse%20cillum%20dolore%20eu%20fugiat%20nulla%20pariatur.%20Excepteur%20sint%20occaecat%20cupidatat%20non%20proident%2C%20sunt%20in%20culpa%20qui%20officia%20deserunt%20mollit%20anim%20id%20est%20laborum.'),(346,66,'miroku_87@yahoo.it','2018-03-31 00:12:43','UPDATE','personaggi','motivazioni_olocausto_inserite_personaggio','0','1'),(347,65,'miroku_87@yahoo.it','2018-04-04 23:46:06','DELETE','abilita_personaggio','abilita','Riparare',NULL),(348,65,'miroku_87@yahoo.it','2018-04-04 23:46:06','DELETE','abilita_personaggio','abilita','Riparazione veloce',NULL),(349,65,'miroku_87@yahoo.it','2018-04-04 23:48:56','INSERT','classi_personaggio','classe',NULL,'Guardia di Sicurezza'),(350,65,'miroku_87@yahoo.it','2018-04-04 23:48:56','INSERT','classi_personaggio','classe',NULL,'Sciacallo'),(351,65,'miroku_87@yahoo.it','2018-04-04 23:48:56','INSERT','abilita_personaggio','abilita',NULL,'Contatti nell\'Ago'),(352,65,'miroku_87@yahoo.it','2018-04-04 23:48:56','INSERT','abilita_personaggio','abilita',NULL,'Contatti nella malavita'),(353,54,'miroku_87@yahoo.it','2018-04-08 12:20:37','INSERT','abilita_personaggio','abilita',NULL,'Programmare'),(354,50,'miroku_87@yahoo.it','2018-04-12 01:36:53','UPDATE','personaggi','note_cartellino_personaggio',NULL,'Provaaaaaaaaa'),(355,50,'miroku_87@yahoo.it','2018-04-12 01:37:20','UPDATE','personaggi','note_cartellino_personaggio','Provaaaaaaaaa','sdfasdf'),(356,50,'miroku_87@yahoo.it','2018-04-12 01:40:13','UPDATE','personaggi','note_cartellino_personaggio','sdfasdf','sdfasdf%3Cbr%3E%3Cbr%3E%26lt%3Bciao%26gt%3B'),(357,67,'miroku_87@yahoo.it','2018-04-12 01:53:22','INSERT','personaggi','nome',NULL,'Test PF'),(358,67,'miroku_87@yahoo.it','2018-04-12 01:53:22','INSERT','personaggi','PX',NULL,'100'),(359,67,'miroku_87@yahoo.it','2018-04-12 01:53:22','INSERT','personaggi','PC',NULL,'4'),(360,67,'miroku_87@yahoo.it','2018-04-12 01:53:22','INSERT','personaggi','email',NULL,'miroku_87@yahoo.it'),(361,67,'miroku_87@yahoo.it','2018-04-12 01:53:22','INSERT','classi_personaggio','classe',NULL,'Sportivo'),(362,67,'miroku_87@yahoo.it','2018-04-12 01:53:22','INSERT','classi_personaggio','classe',NULL,'Guardiano Base'),(363,67,'miroku_87@yahoo.it','2018-04-12 01:53:22','INSERT','classi_personaggio','classe',NULL,'Assaltatore Base'),(364,67,'miroku_87@yahoo.it','2018-04-12 01:53:22','INSERT','abilita_personaggio','abilita',NULL,'Glitch'),(365,67,'miroku_87@yahoo.it','2018-04-12 01:53:23','INSERT','abilita_personaggio','abilita',NULL,'Addestramento fisico 1'),(366,67,'miroku_87@yahoo.it','2018-04-12 01:53:23','INSERT','abilita_personaggio','abilita',NULL,'Addestramento fisico'),(367,67,'miroku_87@yahoo.it','2018-04-12 01:55:01','UPDATE','personaggi','pc_personaggio','4','6'),(368,67,'miroku_87@yahoo.it','2018-04-12 01:55:01','UPDATE','personaggi','px_personaggio','100','100'),(369,50,'andrea.silvestri87@yahoo.it','2018-04-12 21:42:22','UPDATE','personaggi','anno_nascita_personaggio','271','246'),(370,68,'miroku_87@yahoo.it','2018-04-15 23:55:06','INSERT','personaggi','nome',NULL,'Aggiusta Tutto'),(371,68,'miroku_87@yahoo.it','2018-04-15 23:55:06','INSERT','personaggi','PX',NULL,'100'),(372,68,'miroku_87@yahoo.it','2018-04-15 23:55:06','INSERT','personaggi','PC',NULL,'4'),(373,68,'miroku_87@yahoo.it','2018-04-15 23:55:06','INSERT','personaggi','email',NULL,'miroku_87@yahoo.it'),(374,68,'miroku_87@yahoo.it','2018-04-15 23:55:06','INSERT','classi_personaggio','classe',NULL,'Tecnico'),(375,68,'miroku_87@yahoo.it','2018-04-15 23:55:06','INSERT','classi_personaggio','classe',NULL,'Guardiano Base'),(376,68,'miroku_87@yahoo.it','2018-04-15 23:55:06','INSERT','abilita_personaggio','abilita',NULL,'Riparare'),(377,68,'miroku_87@yahoo.it','2018-04-15 23:55:07','INSERT','abilita_personaggio','abilita',NULL,'Istinto omicida'),(378,68,'miroku_87@yahoo.it','2018-04-15 23:55:07','INSERT','abilita_personaggio','abilita',NULL,'Riparazione veloce'),(379,68,'miroku_87@yahoo.it','2018-04-15 23:55:29','UPDATE','personaggi','pc_personaggio','4','4'),(380,68,'miroku_87@yahoo.it','2018-04-15 23:55:29','UPDATE','personaggi','px_personaggio','100','150'),(381,68,'miroku_87@yahoo.it','2018-04-15 23:56:06','INSERT','abilita_personaggio','abilita',NULL,'Specializzazione-Armi'),(382,68,'miroku_87@yahoo.it','2018-04-15 23:56:07','INSERT','abilita_personaggio','abilita',NULL,'Specializzazione-Gadget e Shield'),(383,69,'miroku_87@yahoo.it','2018-04-18 15:44:32','INSERT','personaggi','nome',NULL,'Doctor Who'),(384,69,'miroku_87@yahoo.it','2018-04-18 15:44:32','INSERT','personaggi','PX',NULL,'100'),(385,69,'miroku_87@yahoo.it','2018-04-18 15:44:32','INSERT','personaggi','PC',NULL,'4'),(386,69,'miroku_87@yahoo.it','2018-04-18 15:44:32','INSERT','personaggi','email',NULL,'miroku_87@yahoo.it'),(387,69,'miroku_87@yahoo.it','2018-04-18 15:44:33','INSERT','classi_personaggio','classe',NULL,'Biomedico'),(388,69,'miroku_87@yahoo.it','2018-04-18 15:44:33','INSERT','classi_personaggio','classe',NULL,'Guardiano Base'),(389,69,'miroku_87@yahoo.it','2018-04-18 15:44:33','INSERT','abilita_personaggio','abilita',NULL,'Sintesi e analisi chimica'),(390,69,'miroku_87@yahoo.it','2018-04-18 15:44:33','INSERT','abilita_personaggio','abilita',NULL,'Istinto omicida'),(391,69,'miroku_87@yahoo.it','2018-04-18 18:46:24','UPDATE','personaggi','contattabile_personaggio','1','0'),(392,69,'miroku_87@yahoo.it','2018-04-18 18:46:24','UPDATE','personaggi','contattabile_personaggio','0','1');
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

-- Dump completed on 2018-04-18 19:24:18
