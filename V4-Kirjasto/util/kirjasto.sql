/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.19-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: kirjasto
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
-- Table structure for table `asiakas`
--

DROP TABLE IF EXISTS `asiakas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `asiakas` (
  `id_asiakas` int(11) NOT NULL AUTO_INCREMENT,
  `etunimi` varchar(255) NOT NULL,
  `sukunimi` varchar(255) NOT NULL,
  `lahiosoite` varchar(255) NOT NULL,
  `sahkoposti` varchar(255) NOT NULL,
  `puhelinnumero` varchar(255) NOT NULL,
  `velka` decimal(6,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id_asiakas`),
  UNIQUE KEY `sahkoposti` (`sahkoposti`),
  UNIQUE KEY `puhelinnumero` (`puhelinnumero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asiakas`
--

LOCK TABLES `asiakas` WRITE;
/*!40000 ALTER TABLE `asiakas` DISABLE KEYS */;
/*!40000 ALTER TABLE `asiakas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kirja`
--

DROP TABLE IF EXISTS `kirja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `kirja` (
  `id_kirja` int(11) NOT NULL AUTO_INCREMENT,
  `id_teos` int(11) NOT NULL,
  `hylly_sijainti` varchar(255) NOT NULL,
  `tila` varchar(255) NOT NULL DEFAULT 'hyllyssä',
  PRIMARY KEY (`id_kirja`),
  KEY `id_teos` (`id_teos`),
  CONSTRAINT `kirja_ibfk_1` FOREIGN KEY (`id_teos`) REFERENCES `teos` (`id_teos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kirja`
--

LOCK TABLES `kirja` WRITE;
/*!40000 ALTER TABLE `kirja` DISABLE KEYS */;
/*!40000 ALTER TABLE `kirja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lainaus`
--

DROP TABLE IF EXISTS `lainaus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lainaus` (
  `id_lainaus` int(11) NOT NULL AUTO_INCREMENT,
  `id_kirja` int(11) NOT NULL,
  `id_asiakas` int(11) NOT NULL,
  `lainauspaivamaara` date NOT NULL,
  `palautuspaivamaara` date NOT NULL,
  `todellinen_palautuspvm` date DEFAULT NULL,
  `myohastymismaksu` decimal(6,2) NOT NULL DEFAULT 0.00,
  `maksettu` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_lainaus`),
  KEY `id_kirja` (`id_kirja`),
  KEY `id_asiakas` (`id_asiakas`),
  CONSTRAINT `lainaus_ibfk_1` FOREIGN KEY (`id_kirja`) REFERENCES `kirja` (`id_kirja`),
  CONSTRAINT `lainaus_ibfk_2` FOREIGN KEY (`id_asiakas`) REFERENCES `asiakas` (`id_asiakas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lainaus`
--

LOCK TABLES `lainaus` WRITE;
/*!40000 ALTER TABLE `lainaus` DISABLE KEYS */;
/*!40000 ALTER TABLE `lainaus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tekija`
--

DROP TABLE IF EXISTS `tekija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tekija` (
  `id_tekija` int(11) NOT NULL AUTO_INCREMENT,
  `etunimi` varchar(255) NOT NULL,
  `sukunimi` varchar(255) NOT NULL,
  `syntymavuosi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_tekija`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tekija`
--

LOCK TABLES `tekija` WRITE;
/*!40000 ALTER TABLE `tekija` DISABLE KEYS */;
/*!40000 ALTER TABLE `tekija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teos`
--

DROP TABLE IF EXISTS `teos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `teos` (
  `id_teos` int(11) NOT NULL AUTO_INCREMENT,
  `nimi` varchar(255) NOT NULL,
  `isbn` varchar(255) DEFAULT NULL UNIQUE,
  `julkaisuvuosi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_teos`),
  UNIQUE KEY `isbn` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teos`
--

LOCK TABLES `teos` WRITE;
/*!40000 ALTER TABLE `teos` DISABLE KEYS */;
/*!40000 ALTER TABLE `teos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teos_tekija`
--

DROP TABLE IF EXISTS `teos_tekija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `teos_tekija` (
  `id_teos` int(11) NOT NULL,
  `id_tekija` int(11) NOT NULL,
  PRIMARY KEY (`id_teos`,`id_tekija`),
  KEY `id_tekija` (`id_tekija`),
  CONSTRAINT `teos_tekija_ibfk_1` FOREIGN KEY (`id_teos`) REFERENCES `teos` (`id_teos`) ON DELETE CASCADE,
  CONSTRAINT `teos_tekija_ibfk_2` FOREIGN KEY (`id_tekija`) REFERENCES `tekija` (`id_tekija`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teos_tekija`
--

LOCK TABLES `teos_tekija` WRITE;
/*!40000 ALTER TABLE `teos_tekija` DISABLE KEYS */;
/*!40000 ALTER TABLE `teos_tekija` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-13 11:35:44
