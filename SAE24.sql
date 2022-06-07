-- MariaDB dump 10.19  Distrib 10.4.21-MariaDB, for osx10.10 (x86_64)
--
-- Host: localhost    Database: SAE24
-- ------------------------------------------------------
-- Server version	10.4.21-MariaDB

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
-- Current Database: `SAE24`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `SAE24` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `SAE24`;

--
-- Table structure for table `Amplitude`
--

DROP TABLE IF EXISTS `Amplitude`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Amplitude` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `distance` float(3,2) NOT NULL,
  `intensite` float(6,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Amplitude`
--

LOCK TABLES `Amplitude` WRITE;
/*!40000 ALTER TABLE `Amplitude` DISABLE KEYS */;
/*!40000 ALTER TABLE `Amplitude` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Distance`
--

DROP TABLE IF EXISTS `Distance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Distance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `C1` float(3,2) NOT NULL,
  `C2` float(3,2) NOT NULL,
  `C3` float(3,2) NOT NULL,
  `id_position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_position` (`id_position`),
  CONSTRAINT `id_position` FOREIGN KEY (`id_position`) REFERENCES `Position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Distance`
--

LOCK TABLES `Distance` WRITE;
/*!40000 ALTER TABLE `Distance` DISABLE KEYS */;
/*!40000 ALTER TABLE `Distance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mesure`
--

DROP TABLE IF EXISTS `Mesure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mesure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `heure` time NOT NULL,
  `id_emplacement` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_emplacement` (`id_emplacement`),
  CONSTRAINT `id_emplacement` FOREIGN KEY (`id_emplacement`) REFERENCES `Position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mesure`
--

LOCK TABLES `Mesure` WRITE;
/*!40000 ALTER TABLE `Mesure` DISABLE KEYS */;
/*!40000 ALTER TABLE `Mesure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Position`
--

DROP TABLE IF EXISTS `Position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` float(3,2) NOT NULL,
  `y` float(3,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Position`
--

LOCK TABLES `Position` WRITE;
/*!40000 ALTER TABLE `Position` DISABLE KEYS */;
/*!40000 ALTER TABLE `Position` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-07 15:26:20
