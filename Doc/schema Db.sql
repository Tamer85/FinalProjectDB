-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `album_songs`
--

DROP TABLE IF EXISTS `album_songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album_songs` (
  `albumId` int(11) NOT NULL,
  `songId` int(11) NOT NULL,
  PRIMARY KEY (`albumId`,`songId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_songs`
--

LOCK TABLES `album_songs` WRITE;
/*!40000 ALTER TABLE `album_songs` DISABLE KEYS */;
INSERT INTO `album_songs` VALUES (1,1),(1,2),(1,3),(2,5),(2,7),(5,4),(5,8),(8,1),(8,5),(8,9),(10,3),(10,6);
/*!40000 ALTER TABLE `album_songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `albumId` int(11) NOT NULL AUTO_INCREMENT,
  `albumName` varchar(45) NOT NULL,
  `albumRecordingBegining` datetime NOT NULL,
  `albumRecordingEnd` datetime NOT NULL,
  `albumNumberOfTracks` int(11) DEFAULT NULL,
  UNIQUE KEY `albumId_UNIQUE` (`albumId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,'resistence','2018-12-01 21:50:03','2019-05-01 21:50:03',3),(2,'drones','2018-12-01 21:50:03','2019-04-21 21:50:03',2),(3,'boston','2018-11-01 21:50:03','2019-03-15 21:50:03',1),(4,'stull','2018-10-01 21:50:03','2019-03-15 21:50:03',4),(5,'lust for life','2018-10-01 21:50:03','2019-03-15 21:50:03',2),(6,'goo','2018-10-01 21:50:03','2019-03-15 21:50:03',1),(7,'vital idol','2018-10-01 21:50:03','2019-03-15 21:50:03',2),(8,'word up','2018-10-01 21:50:03','2019-03-15 21:50:03',1),(9,'kiss','2017-09-01 21:50:03','2018-11-08 21:50:03',2),(10,'flay','2017-09-13 21:50:03','2018-04-11 21:50:03',3);
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums_instruments`
--

DROP TABLE IF EXISTS `albums_instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums_instruments` (
  `albumId` int(11) NOT NULL,
  `instrumentId` int(11) NOT NULL,
  PRIMARY KEY (`albumId`,`instrumentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums_instruments`
--

LOCK TABLES `albums_instruments` WRITE;
/*!40000 ALTER TABLE `albums_instruments` DISABLE KEYS */;
INSERT INTO `albums_instruments` VALUES (1,1),(1,2),(1,3),(1,4),(2,2),(3,1),(4,6),(5,4),(5,8),(6,4),(6,7),(6,8),(7,1),(7,3),(8,7),(8,9),(9,1),(10,3);
/*!40000 ALTER TABLE `albums_instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums_musical_number`
--

DROP TABLE IF EXISTS `albums_musical_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums_musical_number` (
  `albumId` int(11) NOT NULL,
  `musicalNumberId` int(11) NOT NULL,
  PRIMARY KEY (`albumId`,`musicalNumberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums_musical_number`
--

LOCK TABLES `albums_musical_number` WRITE;
/*!40000 ALTER TABLE `albums_musical_number` DISABLE KEYS */;
INSERT INTO `albums_musical_number` VALUES (1,1),(1,3),(2,2),(3,3),(3,5),(4,4),(4,7),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `albums_musical_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instruments`
--

DROP TABLE IF EXISTS `instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instruments` (
  `instrumentId` int(11) NOT NULL AUTO_INCREMENT,
  `instrumentName` varchar(45) NOT NULL,
  `instrumentType` varchar(45) NOT NULL,
  `instrumentMaker` varchar(45) NOT NULL,
  UNIQUE KEY `idinstruments_UNIQUE` (`instrumentId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruments`
--

LOCK TABLES `instruments` WRITE;
/*!40000 ALTER TABLE `instruments` DISABLE KEYS */;
INSERT INTO `instruments` VALUES (1,'Kinor','string','dodge'),(2,'guitar','string','charger'),(3,'halil','blow','viper'),(4,'hazozra','metalic','bmw'),(5,'tupim','beat','hp'),(6,'clasic guitar','string','dell'),(7,'bass guitar','string','sony'),(8,'klarinet','blow','psp'),(9,'meshulash','metalic','dell'),(10,'tuba','metalic','intel');
/*!40000 ALTER TABLE `instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musical_numbers`
--

DROP TABLE IF EXISTS `musical_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musical_numbers` (
  `musicalNumberId` int(11) NOT NULL AUTO_INCREMENT,
  `musicalNumberName` varchar(45) NOT NULL,
  `musicalNumberWriter` varchar(45) NOT NULL,
  `musicalNumberComposer` varchar(45) NOT NULL,
  `musicalNumberType` varchar(45) NOT NULL,
  `musicalNumberLength` varchar(45) NOT NULL,
  `musicalNumberGenre` varchar(45) NOT NULL,
  `musicalNumberRecordingDate` datetime NOT NULL,
  `musical_songId` int(11) NOT NULL,
  UNIQUE KEY `musicalNumbersId_UNIQUE` (`musicalNumberId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musical_numbers`
--

LOCK TABLES `musical_numbers` WRITE;
/*!40000 ALTER TABLE `musical_numbers` DISABLE KEYS */;
INSERT INTO `musical_numbers` VALUES (1,'Just dance','soem writer','some idiot','Song','180','Metal','2019-07-23 22:50:03',1),(2,'We are','lame writer','generic composer','Instrumental','186','Clasic','2019-05-01 21:50:03',2),(3,'Not yet','writer0','composer1','Vocal','125','Clasic','2019-02-01 22:50:03',3),(4,'Musical 7','writer4454574','Comp5325765','Vocal','174','Alternative','2019-03-01 08:04:03',1),(5,'name1','writer86756453','comp8954y6765','Blah','56','Comedy','2019-05-01 21:50:03',2),(6,'name2','writer089984545','compuser436436','Generic','123','fluffy','2019-05-01 21:50:03',3),(7,'my name','writer88999','computer','blah','64','pretty','2019-05-01 21:50:03',4),(8,'tv','asd','bvc','ytry','343','joy','2019-05-01 21:50:03',5),(9,'marvel','rtyyu6546546','vcvcxv525','yetti','167','joy','2019-05-01 21:50:03',6),(10,'heyo','retyuio','dfghjkl','zxcvbnm','123','hello','2019-05-01 21:50:03',7);
/*!40000 ALTER TABLE `musical_numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musical_numbers_instruments`
--

DROP TABLE IF EXISTS `musical_numbers_instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musical_numbers_instruments` (
  `musicalNumberId` int(11) NOT NULL,
  `instruemntId` int(11) NOT NULL,
  PRIMARY KEY (`musicalNumberId`,`instruemntId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musical_numbers_instruments`
--

LOCK TABLES `musical_numbers_instruments` WRITE;
/*!40000 ALTER TABLE `musical_numbers_instruments` DISABLE KEYS */;
INSERT INTO `musical_numbers_instruments` VALUES (1,1),(1,2),(1,3),(2,3),(3,5),(4,5),(4,6),(5,3),(5,7),(6,1),(6,9),(7,8),(8,6),(9,1);
/*!40000 ALTER TABLE `musical_numbers_instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musician_albums`
--

DROP TABLE IF EXISTS `musician_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musician_albums` (
  `musicianId` int(11) NOT NULL,
  `albumId` int(11) NOT NULL,
  PRIMARY KEY (`musicianId`,`albumId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musician_albums`
--

LOCK TABLES `musician_albums` WRITE;
/*!40000 ALTER TABLE `musician_albums` DISABLE KEYS */;
INSERT INTO `musician_albums` VALUES (1,1),(2,1),(2,5),(3,2),(3,3),(3,8),(4,2),(6,4);
/*!40000 ALTER TABLE `musician_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musician_instruments`
--

DROP TABLE IF EXISTS `musician_instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musician_instruments` (
  `musicianId` int(11) NOT NULL,
  `instrumentId` int(11) NOT NULL,
  PRIMARY KEY (`musicianId`,`instrumentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musician_instruments`
--

LOCK TABLES `musician_instruments` WRITE;
/*!40000 ALTER TABLE `musician_instruments` DISABLE KEYS */;
INSERT INTO `musician_instruments` VALUES (1,1),(1,2),(2,1),(2,3),(3,5),(4,6),(5,8),(6,2),(7,3),(7,9),(8,4),(9,4),(10,7),(10,9);
/*!40000 ALTER TABLE `musician_instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musician_songs`
--

DROP TABLE IF EXISTS `musician_songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musician_songs` (
  `musicianId` int(11) NOT NULL,
  `songId` int(11) NOT NULL,
  PRIMARY KEY (`musicianId`,`songId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musician_songs`
--

LOCK TABLES `musician_songs` WRITE;
/*!40000 ALTER TABLE `musician_songs` DISABLE KEYS */;
INSERT INTO `musician_songs` VALUES (1,1),(1,2),(1,3),(2,1),(2,2),(3,4),(4,5),(4,6),(5,2),(5,4),(5,7),(6,1),(6,7),(6,8),(7,9),(8,3),(9,2),(9,6),(10,10);
/*!40000 ALTER TABLE `musician_songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musicians`
--

DROP TABLE IF EXISTS `musicians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musicians` (
  `musicianId` int(11) NOT NULL AUTO_INCREMENT,
  `musicianName` varchar(45) NOT NULL,
  `musicianAddress` varchar(45) NOT NULL,
  `musicianPhoneNumber` varchar(45) NOT NULL,
  `musicianSingerPlayerBoth` varchar(45) NOT NULL,
  UNIQUE KEY `musicianId_UNIQUE` (`musicianId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musicians`
--

LOCK TABLES `musicians` WRITE;
/*!40000 ALTER TABLE `musicians` DISABLE KEYS */;
INSERT INTO `musicians` VALUES (1,'Joel','other city 64','053032357','Singer'),(2,'Don','street 454','054354524','Player'),(3,'Blacky','city4364','938756674','Both'),(4,'Shorty','city 8543','036463433','Player'),(5,'Luffy','windmill island','754435467','Singer'),(6,'Zoro','some island','065465443','Player'),(7,'Nami','orange island','043543553','Both'),(8,'Shrek','erez aheret','043556565','Singer'),(9,'Johnny','finland','074234232','Player'),(10,'Sarah','America','024336546','Singer');
/*!40000 ALTER TABLE `musicians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producer_albums`
--

DROP TABLE IF EXISTS `producer_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producer_albums` (
  `producerId` int(11) NOT NULL,
  `albumId` int(11) NOT NULL,
  PRIMARY KEY (`producerId`,`albumId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producer_albums`
--

LOCK TABLES `producer_albums` WRITE;
/*!40000 ALTER TABLE `producer_albums` DISABLE KEYS */;
INSERT INTO `producer_albums` VALUES (1,1),(1,9),(2,1),(2,8),(3,2),(3,7),(4,3),(5,4),(6,4),(7,5),(8,6),(9,6),(9,10),(10,6);
/*!40000 ALTER TABLE `producer_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producers`
--

DROP TABLE IF EXISTS `producers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producers` (
  `producerId` int(11) NOT NULL AUTO_INCREMENT,
  `producerName` varchar(45) NOT NULL,
  `producerAddress` varchar(45) NOT NULL,
  `producerPhoneNumber` varchar(45) NOT NULL,
  UNIQUE KEY `idproducers_UNIQUE` (`producerId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producers`
--

LOCK TABLES `producers` WRITE;
/*!40000 ALTER TABLE `producers` DISABLE KEYS */;
INSERT INTO `producers` VALUES (1,'Ronen','big city1','0456789147'),(2,'Daniel','shum makom4','3456789096'),(3,'Goldshmit','blah1','4567854768'),(4,'Huri','city654','5436578769'),(5,'Gary','final space','9999999999'),(6,'Spongebob','under the sea','8754646324'),(7,'Patrick','near spongebob','3546546456'),(8,'Mr Crab','Crusty Crab','0546458643'),(9,'Igal','Lod','0479812133'),(10,'Ariela','Ahla ir','4567899855');
/*!40000 ALTER TABLE `producers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recorders`
--

DROP TABLE IF EXISTS `recorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recorders` (
  `recorderId` int(11) NOT NULL AUTO_INCREMENT,
  `recorderName` varchar(45) NOT NULL,
  `recorderAddress` varchar(45) NOT NULL,
  `recorderPhoneNumber` varchar(45) NOT NULL,
  UNIQUE KEY `idRecorders_UNIQUE` (`recorderId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recorders`
--

LOCK TABLES `recorders` WRITE;
/*!40000 ALTER TABLE `recorders` DISABLE KEYS */;
INSERT INTO `recorders` VALUES (1,'David','street1','0658753452'),(2,'Or','street2','0348543583'),(3,'Aviv','city1','0123573684'),(4,'Moshe','city2','0124465742'),(5,'Nadav','moshav1','1234567863'),(6,'Jack','moshav2','9435435475'),(7,'Itay','shum makom1','0654785466'),(8,'Nir','5 meter','0345678908'),(9,'Ran','15 meter','4658768690'),(10,'Ofir','day aval day','0775724775'),(11,'May','shum makom2','0467868836'),(12,'Tal','karov meod','0463274325'),(13,'Lior','shtei betim','0454354354'),(14,'Duvsha','shum makom3','0321432497');
/*!40000 ALTER TABLE `recorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs` (
  `songId` int(11) NOT NULL AUTO_INCREMENT,
  `songName` varchar(45) NOT NULL,
  `songGenre` varchar(45) NOT NULL,
  `recorderId` int(11) NOT NULL,
  UNIQUE KEY `songId_UNIQUE` (`songId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (1,'Song2','rock',6),(2,'Run away','pop',7),(3,'Stop','punk',3),(4,'Dont stop','rock',9),(5,'wake up','classic',2),(6,'enjoy','pop',1),(7,'its you','jazz',4),(8,'what I believe','kpop',5),(9,'back in black','classic',10),(10,'try it out','punk',3);
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-28 22:11:20
