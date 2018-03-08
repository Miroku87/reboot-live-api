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
  `effetto_abilita` set('attiva','passiva') COLLATE utf8_unicode_ci DEFAULT NULL,
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
INSERT INTO `abilita` VALUES (1,'civile','Glitch','Una volta per vita, se il personaggio entra in uno dei punti di Respawn viene teletrasportato a un altro. ',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL),(2,'civile','Lag','Una volta per vita , il personaggio se si muove a scatti dichiara IMMUNE! al primo danno che subisce. ',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL),(3,'civile','Barra spaziatrice','Se il personaggio si muove saltellando dichiara IMMUNE! ai danni delle chiamate ad area e raggio. ',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL),(4,'civile','Tea bag','Se al primo avversario abbattuto il personaggio esulta in modo evidente al pubblico, guadagna automaticamente 1 punto in classifica nelle partite DEATHMATCH. ',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL),(5,'civile','Conoscenza mappe','Il personaggio ha tempo 15 secondi per girare la mappa prima di giocare la partita',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL),(6,'civile','Akimbo','Il personaggio può giocare usando 2 pistole',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL),(7,'civile','Aim bot','Una volta per Vita il personaggio può fare la dichiarazione di danno a dito indicando la vittima',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL),(8,'civile','Autokill','Il personaggio può suicidarsi per non dare punti al nemico. ',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL),(9,'civile','Lancia la bandiera','Se il personaggio in un match “ cattura la bandiera” è equipaggiato con la sua arma base e tiene la bandiera la può lanciare. ',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL),(10,'civile','Finto morto','Il personaggio può fingersi morto per 30 secondi consecutivi. ',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL),(11,'civile','Camperone','Ogni volta che il personaggio sta fermo in un posto per sparare almeno per 3 secondi può dichiarare al primo colpo che spara + 1 alla chiamata secondo lo schema SINGOLO!, DOPPIO! TRIPLO, QUADRUPLO',20,1,NULL,'Utilizzabile solo durante una partita di Deathmatch',NULL),(12,'civile','Idolo della folla','Se il personaggio ha appena vinto ( o fa parte della squadra che ha  vinto) una partita  può richiedere allo sponsor un extra del 25% del suo ingaggio dichiarando SONO L’IDOLO DELLA FOLLA.',40,1,-5,'Utilizzabile solo durante una partita di Deathmatch',NULL),(13,'civile','Coca e mignotte','Il personaggio sceglie tra una di queste due opzioni:<br>DROGA: il personaggio ha passato la sua vita a sniffare, risulta immune agli effetti negativi  fisici delle droghe da inalazione.<br>CONTATTO: il personaggio ha passato la sua vita a contatto con sostanze schifose, risulta immune agli effetti negativi delle droghe da contatto.',70,1,12,'Utilizzabile solo durante una partita di Deathmatch',NULL),(14,'civile','Stalker','I numerosi successi sportivi e mondani del personaggio hanno attirato l’attenzione di uno Stalker che lo seguirà dall’ombra e potrà fornire qualche aiuto, ma anche delle complicazioni, al personaggio.',20,1,12,'Utilizzabile solo durante una partita di Deathmatch',NULL),(15,'civile','Gavetta','Tra un evento e il successivo il personaggio può inviare 1 articolo per farlo pubblicare, se questo avviene guadagna Bit aggiuntivi che gli saranno consegnati al prossimo evento.',20,2,NULL,'',NULL),(16,'civile','Ottimo scrittore','I compensi degli articoli pubblicati aumentano del 30%.',40,2,15,'',NULL),(17,'civile','Campo di specializzazione 1','Il personaggio deve scegliere tra i seguenti campi: cronaca nera, cronaca rosa, sport, economica, politica, giornalismo spazzatura.<br>Scrivendo nel campo selezionato può mandare un articolo aggiuntivo.',40,2,NULL,'',NULL),(18,'civile','Campo di specializzazione 2','Il personaggio deve scegliere tra i seguenti campi: cronaca nera, cronaca rosa, sport, economica, politica, giornalismo spazzatura.<br>Scrivendo nel campo selezionato può mandare un articolo aggiuntivo.',40,2,NULL,'',NULL),(19,'civile','Campo di specializzazione 3','Il personaggio deve scegliere tra i seguenti campi: cronaca nera, cronaca rosa, sport, economica, politica, giornalismo spazzatura.<br>Scrivendo nel campo selezionato può mandare un articolo aggiuntivo.',40,2,NULL,'',NULL),(20,'civile','Campo di specializzazione 4','Il personaggio deve scegliere tra i seguenti campi: cronaca nera, cronaca rosa, sport, economica, politica, giornalismo spazzatura.<br>Scrivendo nel campo selezionato può mandare un articolo aggiuntivo.',40,2,NULL,'',NULL),(21,'civile','Foto scottanti','Il personaggio ha contatti per vendere facilmente e a un buon prezzo foto compromettenti (se le deve comunque procurare in gioco).',30,2,NULL,'',NULL),(22,'civile','Clicca qui','Il personaggio ha un sito dove vende informazioni spazzatura per allocchi, questo gli garantisce il 25% in più del tuo attuale stipendio.',40,2,NULL,'',NULL),(23,'civile','Disinformazione','Il personaggio può far pubblicare informazioni palesemente false anche sui canali di informazione regolari.',30,2,22,'',NULL),(24,'civile','Deviare l\'attenzione','Il personaggio può scrivere un articolo “realistico “che devi l’attenzione da un altro evento che vuole nascondere ( questa abilità blocca un articolo già uscito fino all’evento successivo).',40,2,NULL,'',NULL),(25,'civile','Servo del sistema','Il personaggio guadagna il 75% in più del suo stipendio MA non potrà mai utilizzare le seguenti abilità: DISINFORMAZIONE, DEVIARE L’ATTENZIONE, CLICCA QUI.',140,2,NULL,'',NULL),(26,'civile','Informazioni prelibate','Il personaggio ottiene informazioni commerciali preferenziali sull’apposita sezione del Ravnet.',30,2,NULL,'',NULL),(27,'civile','Bunga bunga','Il personaggio può investire una quantità di Bit a sua discrezione per ottenere informazioni su personaggi di spicco della politica.',30,2,NULL,'',NULL),(28,'civile','Voci di strada ','Il personaggio ottiene informazioni di quello che accade nelle strade in ambiti legati a Guardie di vigilanza o malavita tra un live e l’altro inoltrando allo staff una mail con la domanda.',30,2,NULL,'',NULL),(29,'civile','Programmare','Il personaggio può assemblare stringhe di codice per creare programmi singoli.',20,3,NULL,'',NULL),(30,'civile','Programmazione avanzata','Il personaggio può assemblare due programmi assieme; i bonus dei singoli programmi sono accorpati. I programmi così assemblati non possono più essere separati e verranno consumati contemporaneamente.',40,3,29,'',NULL),(31,'civile','Programmazione totale','Il personaggio può assemblare fino a 4 programmi assieme; i bonus dei singoli programmi sono accorpati. I programmi così assemblati non possono più essere separati e verranno consumati contemporaneamente.',60,3,30,'',NULL),(32,'civile','Riallocazione codice','Nella programmazione il giocatore può modificare di +/- 1 uno dei parametri numerici di un singolo programma prima del Debug finale.',50,3,NULL,'',NULL),(33,'civile','Ctrl-c, Ctrl-v','Il giocatore può richiedere allo staff una copia di un programma in suo possesso una volta per evento.',50,3,NULL,'',NULL),(34,'civile','Tutto da solo','Il giocatore in possesso di una singola stringa di codice può compilare un programma di massimo due righe utilizzando due volte la stessa stringa di codice.',60,3,NULL,'',NULL),(35,'civile','Cancellazione programma','Il personaggio mentre è nella rete può decidere di cancellare un qualsiasi  programma che ha equipaggiato per ottenere uno spazio vuoto.',30,3,NULL,'',NULL),(36,'civile','Bruciare il supporto','Il personaggio può chiedere allo staff un cartellino “CRIPT-LOCK®” . ',50,3,NULL,'',NULL),(37,'civile','Multitasking','Il personaggio può caricare fino ad un numero di programmi pari alla metà delle abilità da netrunner che possiede (arrotondate per difetto, con un minimo di 2) prima di entrare nella rete.',30,3,NULL,'',NULL),(38,'civile','Zerg rush','Il  personaggio può, avvisando un membro staff, prima di entrare nella rete creare un proprio ”clone” ogni 2 cartellini codice che sacrifica (con profilo base e senza programmi) fino a un massimo di 10 cloni. Questi cloni non sono altri che “vite” aggiuntive che il giocatore utilizzerà prima del suo ingresso effettivo nella rete.',50,3,37,'',NULL),(39,'civile','Strada sicura','Il personaggio 1 volta per accesso alla rete può inviare in modo sicuro un pacchetto dati a una sua casella “sicura”. In termini di gioco può prendere un singolo cartellino dati in suo possesso all\'interno della rete e consegnarlo a un membro staff presente e richiederlo alla sua uscita dalla rete. ',60,3,NULL,'',NULL),(40,'civile','Neuro armatura','Il personaggio ha installato un programma di protezione latente, se non equipaggiato con programmi di armatura il suo avatar ha 6 punti ferita. ',30,3,NULL,'',NULL),(41,'civile','Sistema di sicurezza integrato','Il personaggio nella rete virtuale può dichiare DISINTEGRAZIONE! su se stesso anche se non è cosciente.',50,3,38,'',NULL),(42,'civile','Guerriglia informatica','Il personaggio può, quando entra nella rete, dichiarare BONUS! +X DANNI! RAGGIO 5! oppure dichiarare BONUS! +X PUNTI FERITA! RAGGIO 5! (in entrambi i casi X è pari alla metà dei personaggi che sono entrati insieme a lui nella rete virtuale).',40,3,37,'',NULL),(43,'civile','Alter ego','Il personaggio può, se vuole, modificare il proprio costume prima di entrare nella rete. Se la modifica al costume è totale, non è possibile riconoscere il personaggio.',30,3,37,'',NULL),(44,'civile','Riparare','Il personaggio può dichiarare RIPARAZIONE 1 dopo 5 Minuti di lavoro.',30,4,NULL,'',NULL),(45,'civile','Riparazione veloce','Il personaggio riduce il tempo TOTALE di applicazione dell’abilità RIPARARE di 1 minuto (fino ad un minimo di 1 minuto).',40,4,44,'',NULL),(46,'civile','Mago della brugola','Il personaggio aggiunge sempre + 1 al suo valore di RIPARAZIONE! Dato dall’abilità Riparare.',50,4,NULL,'',NULL),(47,'civile','Lavoro di squadra','Il personaggio se lavora con un altro personaggio con questa abilità dimezza i tempi di riparazione (approssimati per eccesso) e aggiunge +1 al valore della chiamata. Questa abilità non può essere usata assieme a RIPARAZIONE VELOCE.',40,4,NULL,'',NULL),(48,'civile','Specializzazione-Armi','Il personaggio può scegliere tra i progetti fattibili qualsiasi tipologia da arma.',40,4,45,'',NULL),(49,'civile','Specializzazione-Protesi','Il personaggio può scegliere tra i progetti fattibili qualsiasi tipologia di protesi.',40,4,45,'',NULL),(50,'civile','Specializzazione-Gadget e Shield','Il personaggio può scegliere tra i progetti fattibili qualsiasi tipologia di gadget e Shield.',40,4,45,'',NULL),(51,'civile','Specializzazione-Esoscheletri e scudi','Il personaggio può scegliere tra i progetti fattibili qualsiasi tipologia di potenziamento per tutte le tipologie di esoscheletro e scudi.',40,4,45,'',NULL),(52,'civile','Specializzazione avanzata-Esoscheletri','Il personaggio può progettare esoscheletri completi.',40,4,51,'',NULL),(53,'civile','Specializzazione avanzata-Gadget','Il personaggio può progettare gadget complessi.',40,4,50,'',NULL),(54,'civile','Scansione schemi','Il personaggio può demolire un oggetto per scoprire il suo esatto schema di realizzazione',80,4,NULL,'',NULL),(55,'civile','Smontaggio veloce','Il personaggio può smontare qualsiasi oggetto dotato di cartellino Azzurro recuperando la componente più facile da ottenere, mimando di smontare l’oggetto per 1 minuti e riconsegnando l’oggetto demolito allo Staff.',70,4,NULL,'',NULL),(56,'civile','Ricerca mirata','Il personaggio può demolire un oggetto Bianco per ottenere un suo componente. Il personaggio deve consegnare l’oggetto allo staff specificando quale parte vuole ottenere tra le seguenti tipologie: struttura, batteria, applicativo.',60,4,55,'',NULL),(57,'civile','Macchinari specialistici','',20,4,NULL,'',NULL),(58,'civile','Squadra di aiutanti','Il personaggio può farsi aiutare da altri personaggi (da uno ad un massimo pari alla metà delle abilità di Tecnico che possiede, arrotondate per difetto) nel compiere le operazioni di riparazione. Se lui, i suoi aiutanti e l’oggetto da riparare sono in un raggio di 5 metri, può utilizzare le abilità di riparazione riducendo di 30 SECONDI i tempi per ogni aiutante, fino ad un minimo di 1 minuto per operazione.',40,4,NULL,'',NULL),(59,'civile','Impiantologia cibernetica','Il personaggio è in grado di montare protesi a un personaggio se opera in un struttura adeguata. L’operazione deve essere mimata per 10 minuti. Al termine dichiara NEUTRALIZZA! MUTILAZIONE!',20,5,NULL,'',NULL),(60,'civile','Impiantologia cibernetica migliorata','Il personaggio è in grado di montare protesi a un personaggio se opera in un struttura adeguata. L’operazione deve essere mimata per 5 minuti.',40,5,59,'',NULL),(61,'civile','Prime cure','Il personaggio può, dopo 10 secondi di lavoro, allungare il tempo di coma del bersaglio di ulteriori 5 minuti. Può essere utilizzata solo una volta sullo stesso bersaglio, anche da diversi Biomedici. Il giocatore dovrà spiegare al bersaglio gli effetti di questa abilità.',20,5,NULL,'',NULL),(62,'civile','Cure intensive','Il personaggio può dichiarare GUARIGIONE! X! (dove X è pari alla metà delle abilità di medicina che possiede) dopo aver mimato la procedura per 5 minuti ad un personaggio che non sia in stato di coma.',30,5,NULL,'',NULL),(63,'civile','Cure avanzatre','Il personaggio può dichiarare GUARIGIONE! X! (dove X è pari alla metà delle abilità di medicina che possiede) su un personaggio in coma dopo aver mimato la procedura per 5 minuti.',40,5,62,'',NULL),(64,'civile','Sintesi e analisi chimica','Il personaggio è in grado di analizzare e produrre sostanze chimiche tramite la specifica sezione del database medico e dello strumento di sintesi preposto.',20,5,NULL,'',NULL),(65,'civile','Produzione migliorata','Durante la sintesi chimica un personaggio ottiene il doppio dei prodotti normalmente ottenibili.',60,5,NULL,'',NULL),(66,'civile','Equipe medica','Il personaggio se lavora con un altro personaggio con questa abilità aggiunge +1 al valore della chiamata per ogni personaggio con cui collabora.',40,5,NULL,'',NULL),(67,'civile','Gestire gli aiutanti','Il personaggio può farsi aiutare da altri personaggi (da uno ad un massimo pari alla metà delle abilità di medicina che possiede, arrotondate per difetto ) nel compiere le operazioni mediche. Se lui, i suoi aiutanti e i pazienti sono in un raggio di 5 metri, può utilizzare le abilità “Prime Cure”, “Cure Intensive” e “Cure Avanzate” su un paziente aggiuntivo per ogni aiutante.<br><br>(N.B. : Si intende “Paziente” il personaggio sottoposto a cure, “Aiutante” la persona, anche non medico, che sta aiutando chi usa l’abilità. L’Aiutante non può in nessun caso essere anche un paziente, e non potrà utilizzare altre abilità mentre aiuta il personaggio. L’uso di questa abilità esclude l’utilizzo dell’abilità “Gestire i Tempi”)',60,5,NULL,'',NULL),(68,'civile','Gestire i tempi','Il personaggio può farsi aiutare da altri personaggi (da uno ad un massimo pari alla metà delle abilità di medicina che possiede, arrotondate per difetto) nel compiere le operazioni mediche. Se lui, i suoi aiutanti e il paziente sono in un raggio di 5 metri, può utilizzare le abilità “Prime Cure”, “Cure Intensive” e “Cure Avanzate” riducendo di 1 minuto i tempi per ogni aiutante, fino a dimezzare le tempistiche.<br><br>(N.B. : Si intende “Paziente” il personaggio sottoposto a cure, “Aiutante” la persona, anche non medico, che sta aiutando chi usa l’abilità. L’Aiutante non può in nessun caso essere anche un paziente, e non potrà utilizzare altre abilità mentre aiuta il personaggio. L’uso di questa abilità esclude l’utilizzo dell’abilità “Gestire gli aiutanti”).<br><br>N.b. Quando il medico sta operando su un altro personaggio, il conteggio di coma del ferito si interrompe.',60,5,NULL,'',NULL),(69,'civile','Non puoi ingrandirla di più?','Il personaggio può ottenere informazioni aggiuntive tramite la Ravnet, su prove che sono già state analizzate.',20,6,NULL,'',NULL),(70,'civile','Grissom è amico mio','Il personaggio ottiene informazioni aggiunte nei cartellini “Interazione”.',20,6,NULL,'',NULL),(71,'civile','Linguaggio del corpo','Il personaggio, dopo aver parlato almeno 5 minuti con una persona può dichiarare SINCERITA’!: MI HAI MENTITO SU QUALCOSA IN QUESTI ULTIMI 5 MINUTI?. Non è possibile interrogare con questa abilità la stessa persona più volte nell’arco di un ora.',40,6,NULL,'',NULL),(72,'civile','Direzione dei colpi','Il personaggio se in presenza di un cadavere può chiedere allo staff la direzione, il numero di colpi e la tipologia dell’arma che ha ucciso la persona.',20,6,NULL,'',NULL),(73,'civile','Interrogatorio','Durante un interrogatorio il personaggio può, dopo aver posto allo stesso un bersaglio 5 domande sullo stesso argomento, dichiarare SINCERITA’! HAI MENTITO IN QUALCUNA DELLE RISPOSTE CHE MI HAI DATO?. Non è possibile interrogare con questa abilità la stessa persona più volte nell’arco di un ora.',60,6,NULL,'',NULL),(74,'civile','Poliziotto buono e Poliziotto cattivo','Se 2 giocatori hanno l’abilità INTERROGATORIO possono interrogare lo stesso soggetto in contemporanea anche sullo stesso argomento. Viene richiesto ai due giocatori di interpretare correttamente la cosa con uno dei due “buono” e l’altro “cattivo”.',60,6,NULL,'',NULL),(75,'civile','Contatti nell\'Ago','Il personaggio ha contatti nell’Ago e ottiene accesso all’apposita sezione nel Ravnet.',40,6,NULL,'',NULL),(76,'civile','Chiuderemo un occhio','La prima volta che il personaggio fa qualche errore grosso e si ritrova il dipartimento disciplinare può dichiarare a un membro staff l’uso di questa abilità e il suo problema verrà ignorato solo per quella volta. Il favore può essere recuperato in gioco.  ',80,6,NULL,'',NULL),(77,'civile','Contatti nella malavita','Il personaggio ha contatti nella malavita e ottiene accesso all’apposita sezione nel Ravnet.',40,6,NULL,'',NULL),(78,'civile','Nemesi','Il personaggio nel suo passato si è creato un nemico giurato con cui si è andato a creare una strana simbiosi, il suo nemico cercherà di ostacolarlo ma non ucciderlo, non lo aiuterà ma potrebbe salvarlo da situazioni estreme solo perché “è una questione personale”.',60,6,NULL,'',NULL),(79,'civile','Torturare','Durante un interrogatorio e dopo aver causato dei danni al bersaglio, il personaggio può, dopo aver posto allo stesso bersaglio 5 domande sullo stesso argomento, dichiarare SINCERITA’! HAI MENTITO IN QUALCUNA DELLE RISPOSTE CHE MI HAI DATO?. Non è possibile interrogare con questa abilità la stessa persona più volte nell’arco di un ora.',50,7,NULL,'',NULL),(80,'civile','Baciamo le mani','Il personaggio ha contatti che gli garantiscono informazioni sui movimenti delle guardie corporative e ottiene accesso all’apposita sezione nel Ravnet.',80,7,NULL,'',NULL),(81,'civile','Contatti tra gli sbirri','Il personaggio ha contatti che gli garantiscono informazioni sui movimenti delle guardie corporative e ottiene accesso all’apposita sezione nel Ravnet.',40,7,NULL,'',NULL),(82,'civile','Contatti nella famiglia','Il personaggio ha contatti nella malavita e ottiene accesso all’apposita sezione nel Ravnet.',40,7,NULL,'',NULL),(83,'civile','Inquinare le prove','Il personaggio può interagire su Cartellini Interazione “Prove” chiedendo allo staff di modificarli permanentemente.',40,7,NULL,'',NULL),(84,'civile','Scassinare','Il personaggio può mimare di scassinare una serratura e aprirla dopo 1 minuto di interazione per ogni livello di difficoltà della serratura.',40,7,NULL,'',NULL),(85,'civile','Ricettare merce','Il personaggio può “vendere” alla segreteria oggetti in suo possesso e ottenerne il 50 % del valore.',40,7,NULL,'',NULL),(86,'civile','Menù del Continental','Il personaggio ottiene prima del live una lista di prodotti ottenibili sul mercato nero ma deve trovare qualcuno che gli venda l’oggetto del suo desiderio.',30,7,NULL,'',NULL),(87,'civile','Consierge del Continental','Il personaggio sapendo cosa vendono al Continental può acquistare prima del live uno o più beni (sempre se possiede i Bit necessari per farlo).',80,7,86,'',NULL),(88,'civile','Allibratore','Se il personaggio perde giocando a delle scommesse ufficiali recupera il 25% del valore perso.',40,7,NULL,'',NULL),(89,'civile','Vita allo sbando','Il personaggio sceglie tra una di queste due opzioni:<br><br>ALCOLISMO: il personaggio ha passato la sua vita a bere, risulta immune agli effetti negativi fisici delle droghe da ingestione.<br>INIEZIONE: il personaggio ha passato la sua vita a bucarsi, risulta immune agli effetti negativi delle droghe da iniezione.<br><br>Tuttavia, se subisce la chiamata SINCERITA’ mentre è sotto l’effetto della tipologia da lui selezionata dovrà rispondere a 3 domande dicendo la verità .',60,7,NULL,'',NULL),(90,'civile','Conversione sicura','Il personaggio può convertire Bit in Platino e viceversa senza problemi andando in sala staff.',70,7,NULL,'',NULL),(91,'civile','Riconoscere droghe e sostanze illegali','Il personaggio è in grado di riconoscere sostanze illegali non identificate se appartengono alla categoria “Droghe”.',20,7,NULL,'',NULL),(92,'militare','Istinto omicida','Se il personaggio è sotto l’effetto di CONFUSIONE! può comunque attaccare colpendo col danno base<br>dell’arma usata ridotto di 1 seguendo la normale catena:<br>COMA! – A ZERO! – CRASH! - QUADRUPLO! - TRIPLO! - DOPPIO! – SINGOLO!.',1,8,NULL,'personale','passiva'),(93,'militare','Istinto di sopravvivenza','Se il personaggio è sotto effetto della chiamata DOLORE! può comunque muoversi arrancando per tutta<br>la durata della chiamata, senza compiere nessun’altra azione.',1,8,NULL,'personale','passiva'),(94,'militare','Scudo umano','Il personaggio può dichiarare NEUTRALIZZA GRANATA! Il personaggio deve mimare di coprire la granata<br>col proprio corpo (NOTA: è sufficiente essere entro un raggio massimo di 1 metro dalla granata)<br>subendo però ARTEFATTO COMA! nel caso in cui la granata causi danno o ARTEFATTO SHOCK! nel caso<br>in cui sia una qualunque chiamata di effetto. Quest’abilità non funziona se non si è coscienti.',1,8,NULL,'personale','passiva'),(95,'militare','Posizione difensiva','Il personaggio può rilocare un danno subito dalla locazione vitale ad un arto o viceversa.<br>ESEMPIO: un colpo alla gamba può essere spostato sul torso ma non sulle braccia; un colpo al torso può<br>essere spostato dove si vuole.',1,8,93,'personale','passiva'),(96,'militare','Difesa mentale 1','Il punteggio di Difesa Mentale del personaggio è aumentato permanentemente di 1.',1,8,NULL,'personale','passiva'),(97,'militare','Addestramento fisico 1','I Punti Ferita del personaggio aumentano permanentemente di 1.',1,8,NULL,'personale','passiva'),(98,'militare','Shield MK2','Se il personaggio ha almeno un Punto Shield base, guadagna +2 punti al suo valore globale.',1,8,NULL,'personale','passiva'),(99,'militare','Resistere alla paura','Il personaggio può dichiarare IMMUNE! Alla chiamata PAURA!.',1,8,95,'personale','attiva'),(100,'militare','Tuta corazzata MK2','Il valore base dei punti Shield garantiti dalle locazioni equipaggiate con una tuta da combattimento<br>corazzata (come indicato a pag. 17) è moltiplicato per 1,5.',1,8,NULL,'personale','passiva'),(101,'militare','Tuta corazzata MK3','Il valore base dei punti Shield garantiti dalle locazioni equipaggiate con una tuta da combattimento<br>corazzata (come indicato a pag. 17) è raddoppiato. Questa abilità sostituisce TUTA CORAZZATA MK2.',1,8,100,'personale','passiva'),(102,'militare','Shield MK3','Se il personaggio ha almeno un Punto Shield base, guadagna +4 punti al suo valore globale. Questa<br>abilità sostituisce SHIELD MK2.',1,8,98,'personale','passiva'),(103,'militare','Braccio di ferro','Il personaggio può dichiarare IMMUNE! alla chiamata DISARMO!.',1,8,NULL,'personale','attiva'),(104,'militare','Fuciliere','Il personaggio può aumentare di 2 i danni causati col Fucile d’Assalto per il prossimo colpo sparato in<br>base alla seguente scala: SINGOLO! – DOPPIO! – TRIPLO! – QUADRUPLO! – CRASH! – A ZERO!.',1,8,105,'personale','attiva'),(105,'militare','Presa ferma','Il personaggio può impugnare armi di categoria Fucile d’Assalto con una sola mano se nell’altra impugna<br>uno Scudo.',1,8,103,'personale','passiva'),(106,'militare','Testa dura','Il personaggio può dichiarare IMMUNE! alla chiamata SHOCK!',1,8,NULL,'personale','attiva'),(107,'militare','Scarica d\'adrenalina','Il personaggio quando entra in stato di COMA può, simulando un “urlo belluino” (o altro effetto<br>scenografico simile ad alto tasso di testosterone), subire BLOCCO! TEMPO 1 ORA! alla batteria e ritorna<br>a pieni punti ferita e punteggio Shield al massimo.',1,8,-1,'personale','attiva'),(108,'militare','Farsi scudo','Se il personaggio impugna un Mitragliatore Pesante può dichiarare IMMUNE! ad un colpo subito ma<br>l’arma subisce l’effetto BLOCCO! Eccezioni sono le chiamate DISINTEGRAZIONE! (applicata comunque al<br>bersaglio) e le chiamate MUTILAZIONE! o CREPA! che infliggono all’arma che la subisce<br>DISINTEGRAZIONE! Invece di BLOCCO!.',1,9,NULL,'personale','passiva'),(109,'militare','Addestramento fisico 2','I Punti ferita del personaggio aumentano permanentemente di 2 (questa abilità sostituisce<br>ADDESTRAMENTO FISICO I).',1,9,97,'personale','passiva'),(110,'militare','Difendere gli altri','Il personaggio può dichiarare IMMUNE! ad una chiamata subita da un bersaglio entro 1 metro da lui,<br>subendo la chiamata al suo posto.',1,9,NULL,'personale','passiva'),(111,'militare','Inarrestabile','Il personaggio può dichiarare IMMUNE! a una qualsiasi delle seguenti chiamate:<br>PARALISI! – CONFUSIONE! – SHOCK! – DISARMO! – SPINTA!.',1,9,112,'personale','attiva'),(112,'militare','E\' solo un graffietto','Il personaggio può dichiarare IMMUNE! alla chiamata DOLORE!',1,9,93,'personale','passiva'),(113,'militare','Bunker semovente','Il personaggio utilizzando un’arma di classe Mitragliatore Pesante può, se appostato dietro un riparo,<br>camminare per un massimo di 10 metri fino a posizionarsi dietro un altro riparo contando come se fosse<br>stazionario e appostato ai fini del prerequisito “Posizionamento” per questa classe d’arma.<br>(N.B. Puoi quindi sparare con un mitragliatore pesante mentre cammini tra un riparo e l’altro.)',1,9,111,'personale','passiva'),(114,'militare','Tempesta di metallo','Il personaggio, se sta già sparando con un’arma di classe Mitragliatore Pesante, può dichiarare la prossima chiamata base dell’arma aggiungendo IN QUEST’AREA!.',1,9,NULL,'Area 10 metri','attiva'),(115,'militare','Fuoco difensivo','Il personaggio se sta usando un’arma di classe Mitragliatore pesante, dopo aver sparato ininterrottamente sullo stesso bersaglio ostile per 10 secondi, subisce BONUS! + 4 PUNTI SHIELD!<br><br>(N.b. Non è possibile cambiare bersaglio, ma è possibile sospendere il conteggio per cambiare caricatore, riprendendo quindi a sparare sullo stesso bersaglio)',1,9,114,'personale','passiva'),(116,'militare','Ricarica scudo d\'emergenza','Quando il personaggio arriva a 0 punti Shield può subire la chiamata BONUS! +8 PUNTI SHIELD.',1,9,102,'personale','attiva'),(117,'militare','Feel no pain','Se il personaggio subisce la chiamata MUTILAZIONE! ad un arto ignora la chiamata ARTEFATTO COMA! associata; l’arto è comunque da sostituire e deve simulare il dolore estremo.',1,9,112,'personale','passiva'),(118,'militare','Barricata','Il personaggio può imbracciare uno scudo di dimensione minima 140x80 e massima 200x100; se il personaggio poggia lo scudo e un ginocchio a terra, questo scudo permette di parare chiamate di danno fino a CRASH! compreso; qualora intercetti chiamate superiori, lo scudo subisce DISINTEGRAZIONE! ma la chiamata non viene comunque subita.<br>Qualora il personaggio non sia posizionato, funziona come un normale scudo. ',1,9,108,'personale','passiva'),(119,'militare','Fortezza della solitudine','Il massimale base del valore di Shield del personaggio non è mai inferiore a 3 punti quando indossa una tuta da combattimento corazzata, neanche a seguito di oggetti equipaggiati.',1,9,NULL,'personale','passiva'),(120,'militare','Interfacce protesiche avanzate','Se il personaggio viene colpito ad una locazione sintetica dalle chiamate COMA! o CREPA! può, subendo BLOCCO! alla batteria ed alla protesi interessata dal colpo, declassare la chiamata COMA! ad ARTEFATTO! A ZERO! oppure può declassare la chiamata CREPA! ad ARTEFATTO! MUTILAZIONE!.<br>Questa abilità non può essere utilizzata con una protesi d’emergenza.<br><br>(NOTA: le chiamate sostitutive si ritengono da applicarsi SEMPRE alla locazione originale dell’impatto, non possono essere deviate o rilocate su un’altra parte del corpo o su un altro bersaglio.)',1,9,117,'personale','passiva'),(121,'militare','Ultima parola','Il personaggio, dopo aver subito la chiamata CREPA! (non è sufficiente entrare in status Morto per conteggio) può rialzarsi con 50 Punti Ferita alocazionali, ma il suo Shield e la sua Batteria subiscono la chiamata BLOCCO! CONTINUO! Questo stato dura 1 minuto, durante i quali subisce tutte le chiamate di danno fino a QUADRUPLO come 1 singolo danno, le altre chiamate come 5 danni eccetto CREPA! e DISINTEGRAZIONE! che subisce normalmente. Passato il minuto o esauriti i Punti Ferita subisce la chiamata ARTEFATTO CREPA! e non può più utilizzare questa abilità.',1,9,NULL,'personale','passiva'),(122,'militare','Yippie kay yay','Il personaggio dopo avere subito per almeno 10 secondi la chiamata DOLORE (senza quindi aver dichiarato IMMUNE o aver subito NEUTRALIZZA) può alzare di due la prossima chiamata di danno secondo la normale scala, fino ad A ZERO!',1,9,NULL,'personale','passiva'),(123,'militare','Last man standing','Il personaggio per 1 minuto può dichiarare IMMUNE! a PARALISI! – PAURA! - CONFUSIONE! – SHOCK! – DISARMO! – DOLORE!, i suoi punti Shield vengono raddoppiati, i suoi Punti Ferita vengono raddoppiati e i suoi talenti attivi non avviano il Cooldown. Passato il minuto il personaggio subisce ARTEFATTO COMA!; una volta curato, subisce tutte le chiamate di status per il doppio del tempo e i suoi punti ferita sono dimezzati (arrotondati per difetto) fino alla fine della giornata di gioco.<br><br>Nota: se un personaggio con questi malus arriva ad avere Punti Ferita pari o inferiori a 0 (calcolo effettuato in base ai punti ferita standard, non quelli temporanei dovuti all’abilità) il personaggio si considera aver avuto un collasso multiorgano e subisce immediatamente la chiamata ARTEFATTO CREPA!',1,9,-1,'personale','attiva'),(124,'militare','Batteria aumentata','Il personaggio può utilizzare un massimo di 2 abilità Attive contemporaneamente invece di 1 sola per ogni attivazione. Così facendo somma i tempi di Cooldown.<br><br>NOTA: si può applicare questa abilità solo ai talenti da Assaltatore (sia Base che Avanzato)',1,10,NULL,'personale','passiva'),(125,'militare','Tuta da combattimento MK2','Il punteggio di Shield totale garantito dalla tuta da combattimento equipaggiata aumenta di 1, se la tuta fornisce al personaggio almeno un punto Shield Base.',1,10,NULL,'personale','passiva'),(126,'militare','Pistolero','Il personaggio se combatte impugnando contemporaneamente due armi di classe Pistola può sostituire il danno base dell’arma con la chiamata SINGOLO! CONFUSIONE! Al prossimo colpo sparato (o solo CONFUSIONE! Nel caso il danno base dell’arma fosse già SINGOLO!).',1,10,NULL,'personale','attiva'),(127,'militare','Hotshot','Il personaggio utilizza la sua batteria per sovraccaricare la pistola sparando un colpo molto più potente.<br>Il personaggio può aumentare di 2 il danno del suo prossimo colpo (fino a COMA! compreso). L’abilità è utilizzabile solo con pistole ad energia. Dopo aver sparato, la Batteria e la pistola subiscono la chiamata BLOCCO! CONTINUO!.',1,10,126,'personale','attiva'),(128,'militare','Ambidestria','Il personaggio può impugnare un’arma a una mano (pistola, arma da mischia corta se può utilizzarla) per mano e combattere utilizzando la mano secondaria.',1,10,NULL,'personale','passiva'),(129,'militare','Addestramento fisico','I Punti Ferita del personaggio aumentano permanentemente di 1.',1,10,NULL,'personale','passiva'),(130,'militare','Tiratore scelto','Il personaggio con le armi di classe Fucile di Precisione può aumentare di 1 il danno del prossimo colpo sparato. L’abilità viene “spesa” anche se il colpo manca il bersaglio.<br><br>(NOTA: i potenziamenti seguono la normale scala di danno:<br>SINGOLO! – DOPPIO! – TRIPLO! – QUADRUPLO! – CRASH! – A ZERO!)',1,10,NULL,'personale','attiva'),(131,'militare','Non a me, a lui!','Il personaggio se subisce PAURA! Può considerare qualunque personaggio cosciente e consenziente come riparo fisso per gli effetti della chiamata.',1,10,NULL,'personale','passiva'),(132,'militare','Colpo perforante','Il personaggio, utilizzando un Fucile di Precisione, deve dichiarare CRASH! con il suo prossimo colpo.',1,10,138,'personale','attiva'),(133,'militare','Braccia robuste','Il Personaggio può sparare con Shotgun e Fucili d’Assalto impugnandoli con una sola mano.',1,10,129,'personale','passiva'),(134,'militare','Proiettili incendiari','Il personaggio se utilizza un Fucile di Precisione può aggiungere la chiamata FUOCO! al prossimo colpo sparato.',1,10,NULL,'personale','attiva'),(135,'militare','Fuoco a terra','Il personaggio, se utilizza un Fucile di Precisione od uno Shotgun, può dichiarare per il prossimo colpo SPINTA X! al posto del danno dell’arma, dove X corrisponde al danno causato (se il danno è superiore a QUADRUPLO! X assume come valore 7).',1,10,NULL,'personale',NULL),(136,'militare','Colpo non letale','Il personaggio può utilizzare la chiamata SHOCK! sparando con uno Shotgun con il prossimo colpo.',1,10,NULL,'personale','attiva'),(137,'militare','Disarmare','Il personaggio può sostituire il danno effettuato con la chiamata DISARMO! con ogni arma da fuoco nella quale è competente. Il DISARMO! Si applica al prossimo colpo sparato.',1,10,NULL,'personale','attiva'),(138,'militare','Mirare','Il personaggio, utilizzando un Fucile di Precisione, può dichiarare il prossimo colpo a dito su un bersaglio entro i 10 metri dopo aver simulato di mirare il suo obiettivo per 10 secondi.',1,10,-2,'10 metri','passiva'),(139,'militare','Colpo sanguinante','Il personaggio può abbinare l’effetto CONTINUO! al prossimo colpo.<br><br>(N.B. il tempo di Cooldown di questa abilità è 60 secondi e NON 30 secondi)',1,10,-1,'personale','attiva'),(140,'militare','Arma selezionata','Il personaggio deve scegliere una tipologia di arma tra quelle in cui è addestrato. <br>Può aumentare di 1 il danno fatto con l’arma prescelta secondo la scala <br>SINGOLO! – DOPPIO! – TRIPLO! – QUADRUPLO! – CRASH! – A ZERO!.<br>NOTA 1: non sono comprese nelle armi selezionabili le Granate.<br>NOTA 2: questo bonus è sommabile a qualunque altro bonus ai danni, eventualmente disponibile per il giocatore con l’arma selezionata.',1,11,-6,'personale','passiva'),(141,'militare','Pistola e coltello','Se il personaggio impugna un’Arma da mischia corta e una Pistola, può dichiarare CONFUSIONE! con l’arma da mischia ed aumentare di 1 le chiamate di danno effettuate con la pistola sul bersaglio confuso.<br><br>(NOTA: i potenziamenti seguono la seguente scala SINGOLO! – DOPPIO! – TRIPLO! – QUADRUPLO! – CRASH! – A ZERO!)',1,11,128,'personale','attiva'),(142,'militare','Scarica accecante','Il personaggio può, utilizzando uno Shotgun, sostituire la sua prossima chiamata di danno con CONFUSIONE! IN QUEST’AREA 3!.<br><br>(NOTA: l’angolo formato dalle braccia per determinare l’area d’effetto DEVE essere 90°.)',1,11,136,'3 metri','attiva'),(143,'militare','Gestione tattica','Quando il personaggio ha lo Shield ridotto a zero aumenta di 1 le chiamate fatte con le Armi da mischia.<br><br>(NOTA: i potenziamenti seguono la seguente scala SINGOLO! – DOPPIO! – TRIPLO! – QUADRUPLO! – CRASH! – A ZERO!)',1,11,NULL,'personale','passiva'),(144,'militare','Resistere alla paura','Il personaggio può dichiarare IMMUNE! Alla chiamata PAURA!.',1,11,148,'personale','attiva'),(145,'militare','Granate modificate','Il personaggio può aggiungere la chiamata CONFUSIONE! alla prossima granata lanciata.',1,11,NULL,'personale','attiva'),(146,'militare','Bombe gemelle','Il personaggio può attaccare il cartellino Granata a una Granata che ne sia già fornita purché i cartellini delle due Granate siano identici, aumentando di 1 il danno base e aggiungendo 2 metri al raggio.',1,11,NULL,'personale','passiva'),(147,'militare','Colpo di striscio','Dopo aver sparato un colpo con il fucile di precisione ad un bersaglio oltre i 10 metri, se il colpo è andato a vuoto, il personaggio potrà dichiarare a dito, su un bersaglio entro 1 metro da dove impatta il colpo, il danno scalato di uno secondo la scala:<br><br>SINGOLO! – DOPPIO! – TRIPLO! – QUADRUPLO! – CRASH! – A ZERO! – COMA!',1,11,138,'personale','attiva'),(148,'militare','I morti non parlano','Se il personaggio ha subito almeno una ferita (Punti Ferita ridotti di almeno 1 punto a causa di danni) alla locazione vitale, può fingersi morto subendo CRASH! e BLOCCO! allo Shield. Se analizzato dichiara il suo status come CREPA!; tuttavia, se subisce una chiamata di danno, deve reagire muovendosi e rivelandosi.<br><br>(Nota Bene: Il Cooldown parte quando il personaggio si alza o compie altre azioni.)',1,11,152,'personale','attiva'),(149,'militare','Colpo di mano','Il personaggio può dichiarare DISARMO! Con un colpo utilizzando un’arma da mischia.',1,11,NULL,'personale','attiva'),(150,'militare','Apriscatola','Il personaggio può aggiungere il descrittore DIRETTO! al prossimo colpo che sferrerà con un’Arma da Mischia.',1,11,153,'personale','attiva'),(151,'militare','Bomba adesiva','Il personaggio colpendo direttamente un Bersaglio con una granata può dichiarare la normale chiamata della granata, escludendo “GRANATA!“ e “RAGGIO X”. Se si manca fisicamente il bersaglio la granata è sprecata.',1,11,NULL,'personale','attiva'),(152,'militare','Movimento occultato','Il personaggio è equipaggiato e addestrato all’utilizzo di rifrattori ottici che gli permettono di restare invisibile per poco tempo. Quando attiva l’abilità il personaggio può dichiarare su se stesso ATTENUAZIONE! Quante volte desidera per i prossimi 10 secondi. ',1,11,143,'personale','attiva'),(153,'militare','Tempesta di lame','Il personaggio è un maestro nell’uso di due lame in combattimento. Può utilizzare con il talento AMBIDESTRIA armi da mischia ad una mano di dimensione massime 130 cm.',1,11,128,'personale','passiva'),(154,'militare','Bomba in buca','Il personaggio ha affinato il suo istinto di sopravvivenza: prima di essere colpito dagli effetti di GRANATA! può dichiarare IMMUNE! mimando di buttarsi a terra o dietro un riparo solido.',1,11,-1,'personale','attiva'),(155,'militare','Gloria o morte','Il personaggio può attivare questa abilità urlando “GLORIA O MORTE!”.<br>Da questo momento si considera avere punti ferita alocazionali pari ai punti ferita attuali della locazione vitale moltiplicati x 10 (fino ad un massimo di 40 punti ferita) e considera tutte le chiamate di danno come ARTEFATTO! TRIPLO! ad eccezione di CREPA! DISINTEGRAZIONE! E MUTILAZIONE! che subisce normalmente.<br>Il suo Shield, se presente, funziona normalmente.<br>Il personaggio deve lanciarsi in combattimento in mischia contro il più vicino bersaglio ostile.<br>Se tutti i bersagli ostili in vista sono morti prima di aver concluso i punti ferita il personaggio sviene e subisce ARTEFATTO COMA!; se viene abbattuto prima di aver terminato i bersagli ostili, o se non termina i bersagli entro 5 minuti, subisce invece ARTEFATTO! CREPA!<br><br><br>Ogni volta che utilizza questa abilità riduce il suo massimale di punti ferita di 1 per tutto l\'evento.',1,11,NULL,'personale','attiva'),(156,'militare','Opportunista','Quando il personaggio dichiara BONUS! su un bersaglio diverso da se stesso, può decidere di subire lo<br>stesso BONUS! a sua volta.',1,12,NULL,'personale','passiva'),(157,'militare','Batteria ausiliare Medipack','Quando il personaggio utilizza un talento del Medipack, se il bersaglio dichiara IMMUNE! non fa partire il<br>Cooldown.',1,12,NULL,'personale','passiva'),(158,'militare','Tuta da combattimento MK2','Il valore base dei punti Shield garantiti dalle locazioni equipaggiate con una tuta da combattimento<br>corazzata (come indicato a pag. 17) è moltiplicato per 1,5.',1,12,NULL,'personale','passiva'),(159,'militare','Shield MK2','Se il personaggio ha almeno un Punto Shield base, guadagna +2 punti al suo valore globale.',1,12,NULL,'personale','passiva'),(160,'militare','Controllo dello stress sul campo','Il personaggio può dichiarare NEUTRALIZZA! DOLORE! o NEUTRALIZZA! CONFUSIONE! su un bersaglio.',1,12,NULL,'10 metri','attiva'),(161,'militare','Intervento d\'emergenza','Il personaggio può dichiarare RIMARGINAZIONE 1! su un bersaglio ferito dopo 30 secondi di interazione.',1,12,NULL,'Tocco','attiva'),(162,'militare','Smuovere','Il personaggio può dichiarare NEUTRALIZZA SHOCK! Oppure NEUTRALIZZA PARALISI! toccando il<br>bersaglio.',1,12,NULL,'Tocco','attiva'),(163,'militare','Medipack-Prime cure','Il personaggio può dichiarare BONUS! +3 PUNTI FERITA! toccando il bersaglio.',1,12,NULL,'Tocco','attiva'),(164,'militare','Medipack-Antidolorifici ad alto spettro','Il valore di BONUS! Conferito con il Medipack è aumentato permanentemente di 1.',1,12,163,'personale','passiva'),(165,'militare','Medipack-Nanochirurghi integrati','Il personaggio può dichiarare NEUTRALIZZA! MUTILAZIONE! Dopo 30 secondi di intervento simulato sul<br>bersaglio toccato.<br>(N.b. La locazione non ricresce miracolosamente: il bersaglio però potrà essere guarito anche se<br>necessita comunque di un innesto se vuole tornare ad usare la locazione colpita da mutilazione)',1,12,163,'Tocco','attiva'),(166,'militare','Soccorritore di linea','Il personaggio, se sta impugnando solo una pistola e niente nell’altra mano, può aumentare di 1 il danno<br>secondo la scala SINGOLO! – DOPPIO! – TRIPLO! – QUADRUPLO! – CRASH! – A ZERO!.<br>(NOTA: il bonus è sommabile a qualunque altro bonus disponibile per il giocatore con le pistole.)',1,12,-3,'personale','passiva'),(167,'militare','Medipack-Resettare','Il personaggio può dichiarare NEUTRALIZZA! BONUS! ad un bersaglio non ostile.<br>Tempo Hacking: 10 secondi.',1,12,NULL,'Tocco','attiva'),(168,'militare','Controller-Reinizializzazione dispositivi elettronici','Il personaggio può dichiarare NEUTRALIZZA! BLOCCO! su un qualunque impianto cibernetico (arto o<br>locazione vitale) che sta toccando.<br>Tempo Hacking: 10 secondi.',1,12,NULL,'Tocco','attiva'),(169,'militare','Controller-Modifica frequenza shield','Il personaggio può dichiarare BONUS! +5 SHIELD! su un bersaglio equipaggiato con una Tuta da<br>Combattimento.<br>Tempo Hacking: 10 secondi.',1,12,NULL,'10 metri','attiva'),(170,'militare','Controller-Miglioramento firmware innesti','Il personaggio può dichiarare BONUS! DIFESA MENTALE +1! Su un bersaglio.<br>Tempo Hacking: 10 secondi.<br>NOTA: se il bersaglio è privo di un qualunque tipo di innesto cerebrale DEVE dichiarare IMMUNE! Al<br>bonus sopra descritto.',1,12,NULL,'10 metri','attiva'),(171,'militare','Controller-Campo difensivo','Il Personaggio può dichiarare BONUS! SHIELD +X! (dove X è il punteggio di Shield del personaggio)<br>RAGGIO 10!.<br>Tempo Hacking: 10 secondi.<br>Al termine, il personaggio subisce BLOCCO! CONTINUO! TEMPO 1 ORA! al proprio Controller.',1,12,-1,'Raggio 10 metri','attiva'),(172,'militare','Protezione firmware avanzata','Il personaggio aumenta permanentemente di 1 il suo punteggio di Difesa Mentale.',1,13,NULL,'personale','passiva'),(173,'militare','Schermatura celebrale','Il personaggio aumenta permanentemente di 2 il suo punteggio di Difesa Mentale (quest’abilità va a<br>sostituire “Protezione Firmware Avanzata”).',1,13,172,'personale','passiva'),(174,'militare','Tuta corazzata \"\"Redentore\"\"','Il personaggio se equipaggiato con una tuta da combattimento corazzata aumenta di 2 il punteggio di<br>Shield ottenuto dalla suddetta tuta.<br>Una volta per giornata di gioco il personaggio, quando entra in status di Coma, può subire GUARIGIONE<br>5! Subendo quindi BLOCCO! CONTINUO! allo Shield.',1,13,NULL,'personale','passiva'),(175,'militare','Angelo custode','Il personaggio, quando equipaggiato con uno Scudo e lo sta imbracciando, può dichiarare IMMUNE! Ad<br>una chiamata di danno su un bersaglio entro 1 metro da lui e subire quella chiamata sul suo Scudo.',1,13,NULL,'1 metro','attiva'),(176,'militare','Non fa male! Non fa male!','Il personaggio quando armato con un Fucile d’assalto può dichiarare DOLORE! in sostituzione al normale<br>danno portato dal colpo successivo.',1,13,NULL,'personale','attiva'),(177,'militare','Controller-Stimolanti da battaglia','Il personaggio può dichiarare BONUS! DANNI +1!<br>Tempo Hacking: 10 secondi.',1,13,NULL,'10 metri','attiva'),(178,'militare','Medico da battaglia','Il personaggio mentre è impegnato a prestare soccorso non può essere distratto da nessuno stimolo<br>inferiore ad una lesione fisica. Mentre sta utilizzando il Medipack per curare un bersaglio può dichiarare<br>IMMUNE! ai seguenti effetti: DOLORE! - PARALISI! – CONFUSIONE! – SHOCK! – DISARMO! – SPINTA!',1,13,179,'personale','passiva'),(179,'militare','Mente razionale','Il personaggio può dichiarare IMMUNE! alla chiamata PAURA! su se stesso o NEUTRALIZZA PAURA!<br>toccando un altro bersaglio.',1,13,NULL,'personale/tocco','attiva'),(180,'militare','Deviare energia','Il personaggio può spendere 6 Punti Shield per terminare un Cooldown attivo.',1,13,174,'personale','passiva'),(181,'militare','Controller-Trasferimento energetico','Il personaggio può dichiarare BONUS! X SHIELD! (dove X sono i suoi punti Shield che vuole trasferire).<br>Tempo Hacking: 10 secondi.<br>NOTA: Il personaggio deve avere almeno 1 punto Shield attivo per poter effettuare il trasferimento.',1,13,NULL,'personale','attiva'),(182,'militare','Controller-Potenziamento nanoriparatori','Il personaggio può dichiarare BONUS! +5 SHIELD! IMMUNE! a CRASH! su un qualunque bersaglio<br>equipaggiato con una tuta da combattimento.<br>Tempo Hacking: 10 secondi.',1,13,NULL,'10 metri','attiva'),(183,'militare','Ultimo riparo','Il personaggio, se impugna uno scudo grande può dichiarare IMMUNE! ad una chiamata ad area o a<br>raggio; lo scudo impugnato subisce DISINTEGRAZIONE!',1,13,175,'personale','passiva'),(184,'militare','Medipack-Vettore curativo aerodisperso','Il personaggio può, dopo 10 secondi di utilizzo del Medipack, dichiarare BONUS! +2 PUNTI FERITA!<br>RAGGIO 10!. Subisce quindi la dichiarazione BLOCCO! CONTINUO! TEMPO 5 MINUTI! al Medipack.',1,13,NULL,'Raggio 10 metri','attiva'),(185,'militare','Medipack-Interfaccia biomeccanica di manutenzione e cura','Il personaggio può dichiarare BONUS! +2 PUNTI FERITA! e RIPARAZIONE 2! ad un bersaglio.<br>Tempo Hacking: 10 secondi.',1,13,NULL,'Tocco','attiva'),(186,'militare','Medipack-Dispositivo di cura automatico d\'emergenza','Il personaggio, se cade in stato di Coma, può prima di cadere dichiarare BONUS! +1 PUNTO FERITA!<br>Raggio 10!. E subire BLOCCO! Al Medipack.',1,13,NULL,'personale','passiva'),(187,'militare','Inganno della nera signora','Il personaggio può sostituire il danno della sua arma con la chiamata GUARIGIONE 2! VELENO! BONUS!<br>+ X PUNTI FERITA! Dove X è il danno che avrebbe causato, con un massimale di 4.<br>(N.B. il tempo di Cooldown di questa abilità è 60 secondi e NON 30 secondi)',1,13,-1,'personale','attiva'),(188,'militare','Batteria schermata','Quando utilizzi un talento collegato al controller, se il bersaglio dichiara IMMUNE! ad ELETTRO!, il<br>Cooldown non viene attivato.',1,14,NULL,'personale','passiva'),(189,'militare','Non a me, a lui!','Quando il personaggio subisce una chiamata di natura ELETTRO! può dichiarare IMMUNE! ma DEVE<br>ripetere la stessa chiamata (priva della natura ELETTRO!) su un bersaglio entro 10 metri a lui NON<br>ostile.',1,14,NULL,'personale','attiva'),(190,'militare','Tuta da combattimento MK2','Il punteggio di Shield garantito da una tuta da combattimento equipaggiata aumenta di 1, se la tuta<br>fornisce al personaggio almeno un punto Shield Base.',1,14,NULL,'personale','passiva'),(191,'militare','Shield MK2','Se il personaggio ha almeno un Punto Shield base, guadagna +2 punti al suo valore globale.',1,14,NULL,'personale','passiva'),(192,'militare','Tempesta di piombo','Il personaggio può aggiungere PAURA! al prossimo colpo sparato con un mitragliatore pesante.',1,14,NULL,'personale','attiva'),(193,'militare','Perfezionamento tattich d\'intrusione','Il personaggio ha + 1 permanente alle sue dichiarazioni di Hacking.',1,14,194,'personale','passiva'),(194,'militare','Brute force','Il personaggio può ripetere il lancio di un programma di Hacking: per ogni lancio così effettuato può<br>aumentare di + 1 il valore di lancio del programma, fino a quando il bersaglio non ha subito la chiamata<br>lanciata o se il personaggio compie altre azioni.<br>Se un bersaglio dichiara immune a ELETTRO! L\'abilità si interrompe immediatamente.<br>(Esempio: Thug Sta lanciando il potere di distrazione su Erebron. Attende 10 secondi e poi dichiara<br>“ELETTRO 1! CONFUSIONE!” ad Erebron, il quale dichiara IMMUNE! e prosegue in quello che sta<br>facendo. Thug continua il conteggio dei 10 secondi successivi, per poi dichiarare “ELETTRO 2!<br>CONFUSIONE!” ad Erebron, il quale risponde ancora IMMUNE! e prosegue nelle sue azioni. Thug<br>continua il conteggio dei 10 secondi successivi, per poi dichiarare “ELETTRO 3! CONFUSIONE!” ad<br>Erebron, il quale questa volta subisce la chiamata. Il Cooldown di Thug inzierà ora, e lui potrà fare<br>nuove azioni.)',1,14,-4,'personale','passiva'),(195,'militare','Farsi scudo','Se il personaggio impugna un Mitragliatore Pesante può dichiarare IMMUNE! ad un colpo subito ma<br>l’arma subisce l’effetto BLOCCO! Eccezioni sono le chiamate DISINTEGRAZIONE! (applicata comunque al<br>bersaglio) e le chiamate MUTILAZIONE! o CREPA! che infliggono all’arma utilizzata la chiamata<br>DISINTEGRAZIONE! invece di BLOCCO!.',1,14,NULL,'personale','passiva'),(196,'militare','Controller-Distrazione','Il personaggio può dichiarare ELETTRO 1! CONFUSIONE!<br>Tempo Hacking: 10 secondi.',1,14,NULL,'10 metri','attiva'),(197,'militare','Controller-Disarmare','Il personaggio può dichiarare ELETTRO 1! DISARMO !<br>Tempo Hacking: 10 secondi.',1,14,NULL,'10 metri','attiva'),(198,'militare','Controller-Dolore','Il personaggio può dichiarare ELETTRO 1! DOLORE!<br>Tempo Hacking: 10 secondi.',1,14,NULL,'10 metri','attiva'),(199,'militare','Controller-Rottura','Il personaggio può dichiarare ELETTRO 1! CRASH! Shield.<br>Tempo Hacking: 10 secondi.<br>(N.b. Questa abilità ha effetto solo sullo Shield)',1,14,NULL,'10 metri','attiva'),(200,'militare','Controller-Erosione','Il personaggio può dichiarare ELETTRO 1! SINGOLO! Su un bersaglio. Dopo averlo effettuato può<br>decidere di rimandare il cool-down standard e, dopo altri 10 secondi, può ripetere la chiamata sullo<br>stesso bersaglio. Può ripetere la stessa dichiarazione, sempre sullo stesso bersaglio e sempre ad<br>intervalli di 10 secondi, un numero di volte illimitato. Quando decide di interrompere la catena parte il<br>cool-down standard dell’abilità. L’abilità si considera interrotta se il personaggio è in status incapacitato.<br>Tempo Hacking: 10 secondi.',1,14,NULL,'10 metri','attiva'),(201,'militare','Controller-Paralisi','Il personaggio può dichiarare ELETTRO 1! PARALISI!<br>Tempo Hacking : 10 secondi.',1,14,NULL,'10 metri','attiva'),(202,'militare','Schermatura celebrale','Il valore di Difesa mentale del personaggio aumenta di 1.',1,14,NULL,'personale','passiva'),(203,'militare','Hacking ad area','Il personaggio può, aumentando di 30 secondi il tempo di Hacking, aggiungere IN QUEST’AREA! al<br>talento di Hacking che sta effettuando, alzando il valore di ELETTRO! a 4.<br>Dopo la dichiarazione subisce CRASH! e BLOCCO! CONTINUO! Alla Batteria.<br>(NOTA: l’angolo formato dalle braccia per determinare l’area d’effetto DEVE essere massimo 90°.)<br>(N.B. Non può mai essere utilizzata con in combinazione con Brute-Force).',1,14,-1,'personale','passiva'),(204,'militare','Parassita elettrico','Il personaggio mentre è in fase di cool-down può, toccando un bersaglio consenziente e non già sotto<br>BLOCCO!, dichiarare BLOCCO! Batteria! TEMPO 1 minuto! E abbreviare il suo cool-down attualmente<br>attivo di 30 secondi fino ad arrivare a minimo 0 secondi.',1,15,NULL,'Contatto','passiva'),(205,'militare','Amplificazione dell\'area','Il personaggio quando usa una granata può aumentare di 2 metri il raggio della granata.',1,15,NULL,'personale','passiva'),(206,'militare','Schermatura celebrale avanzata','Il valore di Difesa del personaggio aumenta di 2. (Sostituisce il bonus dato da Schermatura Cerebrale)',1,15,173,'personale','passiva'),(207,'militare','Controller-Sovraccarico elettromagnetico','Il personaggio può dichiarare ELETTRO 1! TRIPLO! su fino a 3 bersagli differenti.<br>Tempo Hacking : 10 secondi.<br>(N.B. Non può mai essere utilizzata con Hacking ad area)',1,15,NULL,'10 metri','attiva'),(208,'militare','Controller-Smorzamento neurale','Il personaggio può dichiarare ELETTRO 1! BONUS! MENO -1 DANNI!<br>Tempo Hacking : 10 secondi.',1,15,NULL,'10 metri','attiva'),(209,'militare','Granata congelante','Il personaggio può aggiungere la chiamata GELO! Al prossimo colpo con il lanciagranate.',1,15,205,'personale','attiva'),(210,'militare','Fuoco di copertura','Il personaggio può dichiarare PAURA! IN QUEST\'AREA! Se impugna un mitragliatore pesante e sta già<br>sparando nella stessa direzione. Il personaggio dovrà continuare a sparare nella direzione generica in<br>cui ha effettuato la dichiarazione, fermandosi solo quando avrà terminato il caricatore o sarà in qualche<br>modo incapacitato.<br>(NOTA: l’angolo formato dalle braccia per determinare l’area d’effetto DEVE essere massimo 90°.)',1,15,NULL,'personale','attiva'),(211,'militare','Colpo di sponda','Dopo aver sparato un colpo con il lanciagranate, se il colpo manca il bersaglio il personaggio potrà<br>dichiarare a dito, su un bersaglio entro 1 metro da dove impatta il colpo, il danno scalato di uno secondo<br>la scala:<br>SINGOLO! – DOPPIO! – TRIPLO! – QUADRUPLO! – CRASH! – A ZERO! – COMA!',1,15,209,'personale','attiva'),(212,'militare','Confettone','Il personaggio può, strappando il cartellino di una granata da lancio, effettuare la stessa chiamata<br>(senza dichiarare GRANATA! RAGGIO X!) con il prossimo colpo sparato con il lanciagranate.',1,15,209,'personale','attiva'),(213,'militare','Controller-Alterare percezioni','Il personaggio può dichiarare ELETTRO 1! COMANDO! UCCIDILO!<br>Tempo Hacking : 10 secondi.<br>(N.B. Non può essere utilizzata con Hacking ad area)',1,15,NULL,'10 metri','attiva'),(214,'militare','Controller-Svanire dalla mente','Il personaggio può dichiarare ELETTRO 1! COMANDO! IGNORAMI!<br>Tempo Hacking : 10 secondi.',1,15,213,'10 metri','attiva'),(215,'militare','Controller-Fotografia','Il personaggio può dichiarare ELETTRO 1! PARALISI! TEMPO 1 Minuto!<br>Tempo Hacking : 10 secondi.',1,15,214,'10 metri','attiva'),(216,'militare','Controller-Blocco totale','Il personaggio può dichiarare ELETTRO1! CRASH! BLOCCO!<br>Tempo Hacking : 10 secondi.<br>(N.B. Non può mai essere utilizzata con Hacking ad area)<br>(N.B. il tempo di Cooldown di questa abilità è 60 secondi e NON 30 secondi)',1,15,-7,'10 metri','attiva'),(217,'militare','Controller-Cortocircuito','Il personaggio può dichiarare ELETTRO 1! NEUTRALIZZA BONUS!<br>Tempo Hacking : 10 secondi.',1,15,214,'10 metri','attiva'),(218,'militare','Saturare l\'area','Il personaggio può aggiungere la chiamata IN QUEST\'AREA! al danno base della sua arma se impugna un mitragliatore pesante. Fino a quando continua a sparare può ripetere la dichiarazione IN QUEST\'AREA! Una volta ogni cinque secondi finchè non si muove o viene incapacitato.<br><br>(NOTA: l’angolo formato dalle braccia per determinare l’area d’effetto DEVE essere massimo 90°.)',1,15,210,'personale','attiva'),(219,'militare','Front toward enemy','Il personaggio, subendo la chiamata CRASH!, può strappare un cartellino Granata e fare la dichiarazione della granata sostituendo la chiamata GRANATA! RAGGIO X! con la chiamata IN QUEST\'AREA!<br><br>(NOTA: l’angolo formato dalle braccia per determinare l’area d’effetto DEVE obbligatoriamente essere compreso tra 90° e 180°.)',1,15,-1,'personale','attiva');
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grants`
--

LOCK TABLES `grants` WRITE;
/*!40000 ALTER TABLE `grants` DISABLE KEYS */;
INSERT INTO `grants` VALUES (1,'mostraPersonaggi_proprio','L\'utente potrà visualizzare la pagina dei suoi personaggi.'),(2,'visualizza_pagina_componenti','L\'utente potrà visualizzare la pagina con la lista dei componenti.'),(3,'visualizza_pagina_ricette','L\'utente potrà visualizzare la pagina con la lista delle ricette.'),(4,'visualizza_pagina_gestione_eventi','L\'utente potrà visualizzare la pagina di gestione degli eventi.'),(5,'visualizza_pagina_eventi','L\'utente potrà visualizzare la pagina con la lista degli eventi.'),(6,'visualizza_pagina_giocatori','L\'utente potrà visualizzare la pagina con la lista dei giocatori iscritti.'),(7,'mostraPersonaggi_altri','L\'utente potrà visualizzare i personaggi creati dagli altri utenti.'),(8,'creaPG','L\'utente può creare un nuovo personaggio.'),(9,'modificaPG_background_personaggio_altri','L\'utente può modificare il background di un personaggio qualsiasi.'),(10,'cancellaPG_altri','L\'utente può eliminare definitivamente un qualsiasi personaggio dal database.'),(22,'aggiungiClassiAlPG_altri','L\'utente può assegnare nuove classi a personaggi non suoi.'),(23,'aggiungiAbilitaAlPG_altri','L\'utente può assegnare nuove abilità a personaggi non suoi.'),(24,'visualizza_pagina_main','L\'utente può visualizzare la pagina principale del sito.'),(25,'visualizza_pagina_lista_pg','L\'utente può visualizzare la pagina con la lista dei personaggi.'),(26,'visualizza_pagina_crea_pg','L\'utente può visualizzare la pagina per creare un personaggio.'),(27,'visualizza_pagina_scheda_pg','L\'utente può visualizzare la pagina con i dettagli di un personaggio.'),(28,'modificaBackground','L\'utente può modificare il background di un personaggio.'),(29,'visualizza_pagina_negozio_abilita','L\'utente può acquistare abilità'),(30,'modificaPG_background_personaggio_proprio','L\'utente può modificare il background di un proprio personaggio'),(31,'aggiungiClassiAlPG_proprio','L\'utente può assegnare nuove classi a un proprio personaggio.'),(32,'aggiungiAbilitaAlPG_proprio','L\'utente può assegnare nuove abilità a un proprio personaggio.'),(33,'cancellaPG_proprio','L\'utente può eliminare definitivamente un proprio personaggio dal database.'),(34,'rimuoviClassePG_altri','L\'utente può eliminare la classe di un personaggio non suo.'),(35,'rimuoviClassePG_proprio','L\'utente può eliminare la classe di un proprio personaggio.'),(36,'rimuoviAbilitaPG_altri','L\'utente può eliminare una abilità di un personaggio non suo.'),(37,'rimuoviAbilitaPG_proprio','L\'utente può eliminare una abilità di un proprio personaggio.'),(38,'loginPG_proprio','L\'utente può loggarsi con un proprio pg.'),(39,'loginPG_altri','L\'utente può loggarsi con il pg di altri utenti.'),(40,'recuperaStorico_proprio','L\'utente può guardare tutte le azioni compiute sul personaggio selezionato.'),(41,'recuperaStorico_altri','L\'utente può guardare tutte le azioni compiute sui personaggi degli altri.'),(42,'modificaPG_background_personaggio_proprio','L\'utente può modificare il proprio background.'),(43,'visualizza_pagina_gestione_eventi','L\'utente può entrare nella sezione per la gestione degli eventi.'),(44,'visualizza_pagina_gestione_giocatori','L\'utente può entrare nella sezione per la modifica dei dati dei giocatori.'),(45,'modificaPG_note_master_personaggio_altri','L\'utente può inserire delle note master.'),(46,'modificaPG_note_master_personaggio_proprio','L\'utente può inserire delle note master ai propri pg'),(47,'visualizza_pagina_messaggi','L\'utente può accedere alla sezione messaggi'),(48,'recuperaMessaggi_proprio','L\'utente può visualizzare i propri messaggi.'),(49,'recuperaMessaggi_altri','L\'utente può visualizzare i messaggi degli altri giocatori.'),(50,'recuperaMessaggioSingolo_proprio','L\'utente può visualizzare il testo di un proprio messaggio.'),(51,'recuperaMessaggioSingolo_altri','L\'utente può visualizzare il testo di un messaggio di altri.'),(52,'inviaMessaggio','L\'utente può inviare messaggi.'),(53,'recuperaListaGiocatori','L\'utente può visualizzare una lista di tutti i giocatori iscritti.');
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
INSERT INTO `ruoli_has_grants` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,34),(1,35),(1,36),(1,37),(1,38),(1,39),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,52),(1,53),(3,1),(3,2),(3,3),(3,5),(3,8),(3,22),(3,23);
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
	--  -4: servono almeno 3 abilita Guastatore Base
    --  -5: servono almeno 4 abilita da Sportivo
    --  -6: servono almeno 3 talenti da Assaltatore-Base
    --  -7: servono almeno 3 talenti da Guastatore-Avanzato
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

-- Dump completed on 2018-03-08 23:44:13
