/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.19-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: arviointi
-- ------------------------------------------------------
-- Server version	10.11.19-MariaDB-0+deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `arviointi`
--

DROP TABLE IF EXISTS `arviointi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `arviointi` (
  `idArviointi` int(11) NOT NULL AUTO_INCREMENT,
  `paivamaara` date DEFAULT NULL,
  `arvosana` tinyint(4) DEFAULT NULL,
  `idOpiskelija` int(11) NOT NULL,
  `idOpintojakso` int(11) NOT NULL,
  PRIMARY KEY (`idArviointi`),
  KEY `fk_arviointi_opiskelija` (`idOpiskelija`),
  KEY `fk_arviointi_opintojakso` (`idOpintojakso`),
  CONSTRAINT `fk_arviointi_opintojakso` FOREIGN KEY (`idOpintojakso`) REFERENCES `opintojakso` (`idOpintojakso`),
  CONSTRAINT `fk_arviointi_opiskelija` FOREIGN KEY (`idOpiskelija`) REFERENCES `opiskelija` (`idOpiskelija`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arviointi`
--

LOCK TABLES `arviointi` WRITE;
/*!40000 ALTER TABLE `arviointi` DISABLE KEYS */;
INSERT INTO `arviointi` VALUES
(1,'2014-09-05',3,1,1),
(2,'2014-09-05',3,1,3),
(3,'2014-09-05',0,1,7),
(4,'2014-09-05',4,2,1),
(5,'2014-09-05',2,2,3),
(6,'2014-09-05',4,3,1),
(7,'2014-09-05',3,3,3),
(8,'2014-09-05',5,4,1),
(9,'2014-09-05',4,4,3),
(10,'2014-09-05',5,5,3),
(11,'2014-09-05',1,5,1),
(12,'2014-09-05',0,6,3),
(13,'2014-09-05',0,6,2),
(14,'2014-09-05',0,6,1);
/*!40000 ALTER TABLE `arviointi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opintojakso`
--

DROP TABLE IF EXISTS `opintojakso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `opintojakso` (
  `idOpintojakso` int(11) NOT NULL AUTO_INCREMENT,
  `koodi` varchar(45) DEFAULT NULL,
  `laajuus` tinyint(4) DEFAULT NULL,
  `nimi` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idOpintojakso`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opintojakso`
--

LOCK TABLES `opintojakso` WRITE;
/*!40000 ALTER TABLE `opintojakso` DISABLE KEYS */;
INSERT INTO `opintojakso` VALUES
(1,'T20041',3,'Tieto kannattaa'),
(2,'T20042',3,'Liike-elaman tarpeeton tietous'),
(3,'T20043',3,'Fysiikka 0'),
(4,'T20044',6,'Elektroniikan perusteettomat'),
(5,'T20045',5,'Kellarihumppa'),
(6,'T20046',3,'Matematiikka 64'),
(7,'T20047',3,'Ruotsiton Ruotsi'),
(8,'T20048',3,'Viinin salat');
/*!40000 ALTER TABLE `opintojakso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opiskelija`
--

DROP TABLE IF EXISTS `opiskelija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `opiskelija` (
  `idOpiskelija` int(11) NOT NULL AUTO_INCREMENT,
  `etunimi` varchar(45) DEFAULT NULL,
  `sukunimi` varchar(45) DEFAULT NULL,
  `osoite` varchar(45) DEFAULT NULL,
  `luokkatunnus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idOpiskelija`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opiskelija`
--

LOCK TABLES `opiskelija` WRITE;
/*!40000 ALTER TABLE `opiskelija` DISABLE KEYS */;
INSERT INTO `opiskelija` VALUES
(1,'Aku','Ankka','Ankkalinna 313','TTE3SNH'),
(2,'Roope','Ankka','Ankkalinna 314','TTE3SNH'),
(3,'Iines','Ankka','Ankkalinna 315','TTE4SNL'),
(4,'Mikki','Hiiri','Ankkalinna 316','TTE2SNO'),
(5,'Hessu','Hopo','Ankkalinna 317','TTE2SNO'),
(6,'Kroisos','Pennanen','Ankkalinna 666','LL666HE');
/*!40000 ALTER TABLE `opiskelija` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-13  9:51:34
