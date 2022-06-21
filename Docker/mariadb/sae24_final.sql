-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: sae24
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

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
-- Table structure for table `amplitude`
--

DROP TABLE IF EXISTS `amplitude`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amplitude` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `distance` float(3,2) NOT NULL,
  `intensite` float(6,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amplitude`
--

LOCK TABLES `amplitude` WRITE;
/*!40000 ALTER TABLE `amplitude` DISABLE KEYS */;
INSERT INTO `amplitude` VALUES (1,0.00,401.00),(2,0.50,400.24),(3,1.00,100.06),(4,1.50,44.47),(5,2.00,25.02),(6,2.50,16.01),(7,3.00,11.12),(8,3.50,8.17),(9,4.00,6.25),(10,4.50,4.94),(11,5.00,4.00),(12,5.50,3.31),(13,6.00,2.78),(14,6.50,2.37),(15,7.00,2.04),(16,7.50,1.78),(18,0.71,198.49),(19,1.12,79.77),(20,1.58,40.08),(21,2.06,23.58),(22,2.55,15.39),(23,3.04,10.83),(24,3.54,7.98),(25,4.03,6.16),(26,4.53,4.88),(27,5.02,3.97),(28,5.52,3.28),(29,6.02,2.76),(30,6.52,2.35),(31,7.02,2.03),(32,7.52,1.77),(35,1.41,50.33),(36,1.80,30.88),(37,2.24,19.94),(38,2.69,13.83),(39,3.16,10.02),(40,3.64,7.55),(41,4.12,5.89),(42,4.61,4.71),(43,5.10,3.85),(44,5.59,3.20),(45,6.08,2.71),(46,6.58,2.31),(47,7.07,2.00),(48,7.57,1.75),(52,2.12,22.26),(54,2.92,11.74),(55,3.35,8.92),(56,3.81,6.89),(57,4.27,5.49),(58,4.74,4.45),(59,5.22,3.67),(60,5.70,3.08),(61,6.18,2.62),(62,6.67,2.25),(63,7.16,1.95),(64,7.65,1.71),(69,2.83,12.49),(70,3.20,9.77),(71,3.61,7.68),(73,4.47,5.01),(74,4.92,4.13),(75,5.39,3.44),(76,5.85,2.92),(77,6.32,2.51),(78,6.80,2.16),(79,7.28,1.89),(80,7.76,1.66),(87,3.91,6.54),(88,4.30,5.41),(89,4.72,4.49),(90,5.15,3.77),(92,6.04,2.74),(94,6.96,2.08),(95,7.43,1.81),(96,7.91,1.60),(103,4.24,5.57),(106,5.41,3.42),(107,5.83,2.94),(108,6.26,2.55),(109,6.71,2.22),(111,7.62,1.72),(112,8.08,1.53),(120,4.95,4.08),(121,5.32,3.54),(123,6.10,2.69),(125,6.95,2.07),(126,7.38,1.84),(127,7.83,1.63),(128,8.28,1.46),(137,5.66,3.12),(139,6.40,2.44),(141,7.21,1.92),(142,7.63,1.73),(143,8.06,1.54),(144,8.50,1.38),(154,6.36,2.47),(155,6.73,2.21),(156,7.11,1.98),(159,8.32,1.45),(160,8.75,1.31),(173,7.81,1.64),(174,8.20,1.49),(175,8.60,1.35),(176,9.01,1.23),(188,7.78,1.65),(189,8.14,1.51),(190,8.51,1.39),(191,8.90,1.26),(192,9.30,1.16),(205,8.49,1.40),(206,8.85,1.28),(207,9.22,1.19),(208,9.60,1.09),(222,9.19,1.18),(223,9.55,1.10),(224,9.92,1.05),(239,9.90,1.02),(256,9.99,0.89);
/*!40000 ALTER TABLE `amplitude` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distance`
--

DROP TABLE IF EXISTS `distance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `C1` float(3,2) NOT NULL,
  `C2` float(3,2) NOT NULL,
  `C3` float(3,2) NOT NULL,
  `id_position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_position` (`id_position`),
  CONSTRAINT `id_position` FOREIGN KEY (`id_position`) REFERENCES `position` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distance`
--

LOCK TABLES `distance` WRITE;
/*!40000 ALTER TABLE `distance` DISABLE KEYS */;
INSERT INTO `distance` VALUES (1,0.00,7.50,9.99,1),(2,0.50,7.00,9.99,2),(3,1.00,6.50,9.92,3),(4,1.50,6.00,9.60,4),(5,2.00,5.50,9.30,5),(6,2.50,5.00,9.01,6),(7,3.00,4.50,8.75,7),(8,3.50,4.00,8.50,8),(9,4.00,3.50,8.28,9),(10,4.50,3.00,8.08,10),(11,5.00,2.50,7.91,11),(12,5.50,2.00,7.76,12),(13,6.00,1.50,7.65,13),(14,6.50,1.00,7.57,14),(15,7.00,0.50,7.52,15),(16,7.50,0.00,7.50,16),(17,0.50,7.52,9.99,17),(18,0.71,7.02,9.90,18),(19,1.12,6.52,9.55,19),(20,1.58,6.02,9.22,20),(21,2.06,5.52,8.90,21),(22,2.55,5.02,8.60,22),(23,3.04,4.53,8.32,23),(24,3.54,4.03,8.06,24),(25,4.03,3.54,7.83,25),(26,4.53,3.04,7.62,26),(27,5.02,2.55,7.43,27),(28,5.52,2.06,7.28,28),(29,6.02,1.58,7.16,29),(30,6.52,1.12,7.07,30),(31,7.02,0.71,7.02,31),(32,7.52,0.50,7.00,32),(33,1.00,7.57,9.92,33),(34,1.12,7.07,9.55,34),(35,1.41,6.58,9.19,35),(36,1.80,6.08,8.85,36),(37,2.24,5.59,8.51,37),(38,2.69,5.10,8.20,38),(39,3.16,4.61,7.91,39),(40,3.64,4.12,7.63,40),(41,4.12,3.64,7.38,41),(42,4.61,3.16,7.16,42),(43,5.10,2.69,6.96,43),(44,5.59,2.24,6.80,44),(45,6.08,1.80,6.67,45),(46,6.58,1.41,6.58,46),(47,7.07,1.12,6.52,47),(48,7.57,1.00,6.50,48),(49,1.50,7.65,9.60,49),(50,1.58,7.16,9.22,50),(51,1.80,6.67,8.85,51),(52,2.12,6.18,8.49,52),(53,2.50,5.70,8.14,53),(54,2.92,5.22,7.81,54),(55,3.35,4.74,7.50,55),(56,3.81,4.27,7.21,56),(57,4.27,3.81,6.95,57),(58,4.74,3.35,6.71,58),(59,5.22,2.92,6.50,59),(60,5.70,2.50,6.32,60),(61,6.18,2.12,6.18,61),(62,6.67,1.80,6.08,62),(63,7.16,1.58,6.02,63),(64,7.65,1.50,6.00,64),(65,2.00,7.76,9.30,65),(66,2.06,7.28,8.90,66),(67,2.24,6.80,8.51,67),(68,2.50,6.32,8.14,68),(69,2.83,5.85,7.78,69),(70,3.20,5.39,7.43,70),(71,3.61,4.92,7.11,71),(72,4.03,4.47,6.80,72),(73,4.47,4.03,6.52,73),(74,4.92,3.61,6.26,74),(75,5.39,3.20,6.04,75),(76,5.85,2.83,5.85,76),(77,6.32,2.50,5.70,77),(78,6.80,2.24,5.59,78),(79,7.28,2.06,5.52,79),(80,7.76,2.00,5.50,80),(81,2.50,7.91,9.01,81),(82,2.55,7.43,8.60,82),(83,2.69,6.96,8.20,83),(84,2.92,6.50,7.81,84),(85,3.20,6.04,7.43,85),(86,3.54,5.59,7.07,86),(87,3.91,5.15,6.73,87),(88,4.30,4.72,6.40,88),(89,4.72,4.30,6.10,89),(90,5.15,3.91,5.83,90),(91,5.59,3.54,5.59,91),(92,6.04,3.20,5.39,92),(93,6.50,2.92,5.22,93),(94,6.96,2.69,5.10,94),(95,7.43,2.55,5.02,95),(96,7.91,2.50,5.00,96),(97,3.00,8.08,8.75,97),(98,3.04,7.62,8.32,98),(99,3.16,7.16,7.91,99),(100,3.35,6.71,7.50,100),(101,3.61,6.26,7.11,101),(102,3.91,5.83,6.73,102),(103,4.24,5.41,6.36,103),(104,4.61,5.00,6.02,104),(105,5.00,4.61,5.70,105),(106,5.41,4.24,5.41,106),(107,5.83,3.91,5.15,107),(108,6.26,3.61,4.92,108),(109,6.71,3.35,4.74,109),(110,7.16,3.16,4.61,110),(111,7.62,3.04,4.53,111),(112,8.08,3.00,4.50,112),(113,3.50,8.28,8.50,113),(114,3.54,7.83,8.06,114),(115,3.64,7.38,7.63,115),(116,3.81,6.95,7.21,116),(117,4.03,6.52,6.80,117),(118,4.30,6.10,6.40,118),(119,4.61,5.70,6.02,119),(120,4.95,5.32,5.66,120),(121,5.32,4.95,5.32,121),(122,5.70,4.61,5.00,122),(123,6.10,4.30,4.72,123),(124,6.52,4.03,4.47,124),(125,6.95,3.81,4.27,125),(126,7.38,3.64,4.12,126),(127,7.83,3.54,4.03,127),(128,8.28,3.50,4.00,128),(129,4.00,8.50,8.28,129),(130,4.03,8.06,7.83,130),(131,4.12,7.63,7.38,131),(132,4.27,7.21,6.95,132),(133,4.47,6.80,6.52,133),(134,4.72,6.40,6.10,134),(135,5.00,6.02,5.70,135),(136,5.32,5.66,5.32,136),(137,5.66,5.32,4.95,137),(138,6.02,5.00,4.61,138),(139,6.40,4.72,4.30,139),(140,6.80,4.47,4.03,140),(141,7.21,4.27,3.81,141),(142,7.63,4.12,3.64,142),(143,8.06,4.03,3.54,143),(144,8.50,4.00,3.50,144),(145,4.50,8.75,8.08,145),(146,4.53,8.32,7.62,146),(147,4.61,7.91,7.16,147),(148,4.74,7.50,6.71,148),(149,4.92,7.11,6.26,149),(150,5.15,6.73,5.83,150),(151,5.41,6.36,5.41,151),(152,5.70,6.02,5.00,152),(153,6.02,5.70,4.61,153),(154,6.36,5.41,4.24,154),(155,6.73,5.15,3.91,155),(156,7.11,4.92,3.61,156),(157,7.50,4.74,3.35,157),(158,7.91,4.61,3.16,158),(159,8.32,4.53,3.04,159),(160,8.75,4.50,3.00,160),(161,5.00,9.01,7.91,161),(162,5.02,8.60,7.43,162),(163,5.10,8.20,6.96,163),(164,5.22,7.81,6.50,164),(165,5.39,7.43,6.04,165),(166,5.59,7.07,5.59,166),(167,5.83,6.73,5.15,167),(168,6.10,6.40,4.72,168),(169,6.40,6.10,4.30,169),(170,6.73,5.83,3.91,170),(171,7.07,5.59,3.54,171),(172,7.43,5.39,3.20,172),(173,7.81,5.22,2.92,173),(174,8.20,5.10,2.69,174),(175,8.60,5.02,2.55,175),(176,9.01,5.00,2.50,176),(177,5.50,9.30,7.76,177),(178,5.52,8.90,7.28,178),(179,5.59,8.51,6.80,179),(180,5.70,8.14,6.32,180),(181,5.85,7.78,5.85,181),(182,6.04,7.43,5.39,182),(183,6.26,7.11,4.92,183),(184,6.52,6.80,4.47,184),(185,6.80,6.52,4.03,185),(186,7.11,6.26,3.61,186),(187,7.43,6.04,3.20,187),(188,7.78,5.85,2.83,188),(189,8.14,5.70,2.50,189),(190,8.51,5.59,2.24,190),(191,8.90,5.52,2.06,191),(192,9.30,5.50,2.00,192),(193,6.00,9.60,7.65,193),(194,6.02,9.22,7.16,194),(195,6.08,8.85,6.67,195),(196,6.18,8.49,6.18,196),(197,6.32,8.14,5.70,197),(198,6.50,7.81,5.22,198),(199,6.71,7.50,4.74,199),(200,6.95,7.21,4.27,200),(201,7.21,6.95,3.81,201),(202,7.50,6.71,3.35,202),(203,7.81,6.50,2.92,203),(204,8.14,6.32,2.50,204),(205,8.49,6.18,2.12,205),(206,8.85,6.08,1.80,206),(207,9.22,6.02,1.58,207),(208,9.60,6.00,1.50,208),(209,6.50,9.92,7.57,209),(210,6.52,9.55,7.07,210),(211,6.58,9.19,6.58,211),(212,6.67,8.85,6.08,212),(213,6.80,8.51,5.59,213),(214,6.96,8.20,5.10,214),(215,7.16,7.91,4.61,215),(216,7.38,7.63,4.12,216),(217,7.63,7.38,3.64,217),(218,7.91,7.16,3.16,218),(219,8.20,6.96,2.69,219),(220,8.51,6.80,2.24,220),(221,8.85,6.67,1.80,221),(222,9.19,6.58,1.41,222),(223,9.55,6.52,1.12,223),(224,9.92,6.50,1.00,224),(225,7.00,9.99,7.52,225),(226,7.02,9.90,7.02,226),(227,7.07,9.55,6.52,227),(228,7.16,9.22,6.02,228),(229,7.28,8.90,5.52,229),(230,7.43,8.60,5.02,230),(231,7.62,8.32,4.53,231),(232,7.83,8.06,4.03,232),(233,8.06,7.83,3.54,233),(234,8.32,7.62,3.04,234),(235,8.60,7.43,2.55,235),(236,8.90,7.28,2.06,236),(237,9.22,7.16,1.58,237),(238,9.55,7.07,1.12,238),(239,9.90,7.02,0.71,239),(240,9.99,7.00,0.50,240),(241,7.50,9.99,7.50,241),(242,7.52,9.99,7.00,242),(243,7.57,9.92,6.50,243),(244,7.65,9.60,6.00,244),(245,7.76,9.30,5.50,245),(246,7.91,9.01,5.00,246),(247,8.08,8.75,4.50,247),(248,8.28,8.50,4.00,248),(249,8.50,8.28,3.50,249),(250,8.75,8.08,3.00,250),(251,9.01,7.91,2.50,251),(252,9.30,7.76,2.00,252),(253,9.60,7.65,1.50,253),(254,9.92,7.57,1.00,254),(255,9.99,7.52,0.50,255),(256,9.99,7.50,0.00,256);
/*!40000 ALTER TABLE `distance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journaux`
--

DROP TABLE IF EXISTS `journaux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journaux` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `heure` time NOT NULL,
  `message` text NOT NULL,
  `position` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journaux`
--

LOCK TABLES `journaux` WRITE;
/*!40000 ALTER TABLE `journaux` DISABLE KEYS */;
/*!40000 ALTER TABLE `journaux` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesure`
--

DROP TABLE IF EXISTS `mesure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `heure` time NOT NULL,
  `id_emplacement` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_emplacement` (`id_emplacement`),
  CONSTRAINT `id_emplacement` FOREIGN KEY (`id_emplacement`) REFERENCES `position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesure`
--

LOCK TABLES `mesure` WRITE;
/*!40000 ALTER TABLE `mesure` DISABLE KEYS */;
/*!40000 ALTER TABLE `mesure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mode`
--

DROP TABLE IF EXISTS `mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mode` (
  `nbr_capteur` int(11) NOT NULL,
  PRIMARY KEY (`nbr_capteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mode`
--

LOCK TABLES `mode` WRITE;
/*!40000 ALTER TABLE `mode` DISABLE KEYS */;
INSERT INTO `mode` VALUES (3);
/*!40000 ALTER TABLE `mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` float(3,2) NOT NULL,
  `y` float(3,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,0.25,0.25),(2,0.25,0.75),(3,0.25,1.25),(4,0.25,1.75),(5,0.25,2.25),(6,0.25,2.75),(7,0.25,3.25),(8,0.25,3.75),(9,0.25,4.25),(10,0.25,4.75),(11,0.25,5.25),(12,0.25,5.75),(13,0.25,6.25),(14,0.25,6.75),(15,0.25,7.25),(16,0.25,7.75),(17,0.75,0.25),(18,0.75,0.75),(19,0.75,1.25),(20,0.75,1.75),(21,0.75,2.25),(22,0.75,2.75),(23,0.75,3.25),(24,0.75,3.75),(25,0.75,4.25),(26,0.75,4.75),(27,0.75,5.25),(28,0.75,5.75),(29,0.75,6.25),(30,0.75,6.75),(31,0.75,7.25),(32,0.75,7.75),(33,1.25,0.25),(34,1.25,0.75),(35,1.25,1.25),(36,1.25,1.75),(37,1.25,2.25),(38,1.25,2.75),(39,1.25,3.25),(40,1.25,3.75),(41,1.25,4.25),(42,1.25,4.75),(43,1.25,5.25),(44,1.25,5.75),(45,1.25,6.25),(46,1.25,6.75),(47,1.25,7.25),(48,1.25,7.75),(49,1.75,0.25),(50,1.75,0.75),(51,1.75,1.25),(52,1.75,1.75),(53,1.75,2.25),(54,1.75,2.75),(55,1.75,3.25),(56,1.75,3.75),(57,1.75,4.25),(58,1.75,4.75),(59,1.75,5.25),(60,1.75,5.75),(61,1.75,6.25),(62,1.75,6.75),(63,1.75,7.25),(64,1.75,7.75),(65,2.25,0.25),(66,2.25,0.75),(67,2.25,1.25),(68,2.25,1.75),(69,2.25,2.25),(70,2.25,2.75),(71,2.25,3.25),(72,2.25,3.75),(73,2.25,4.25),(74,2.25,4.75),(75,2.25,5.25),(76,2.25,5.75),(77,2.25,6.25),(78,2.25,6.75),(79,2.25,7.25),(80,2.25,7.75),(81,2.75,0.25),(82,2.75,0.75),(83,2.75,1.25),(84,2.75,1.75),(85,2.75,2.25),(86,2.75,2.75),(87,2.75,3.25),(88,2.75,3.75),(89,2.75,4.25),(90,2.75,4.75),(91,2.75,5.25),(92,2.75,5.75),(93,2.75,6.25),(94,2.75,6.75),(95,2.75,7.25),(96,2.75,7.75),(97,3.25,0.25),(98,3.25,0.75),(99,3.25,1.25),(100,3.25,1.75),(101,3.25,2.25),(102,3.25,2.75),(103,3.25,3.25),(104,3.25,3.75),(105,3.25,4.25),(106,3.25,4.75),(107,3.25,5.25),(108,3.25,5.75),(109,3.25,6.25),(110,3.25,6.75),(111,3.25,7.25),(112,3.25,7.75),(113,3.75,0.25),(114,3.75,0.75),(115,3.75,1.25),(116,3.75,1.75),(117,3.75,2.25),(118,3.75,2.75),(119,3.75,3.25),(120,3.75,3.75),(121,3.75,4.25),(122,3.75,4.75),(123,3.75,5.25),(124,3.75,5.75),(125,3.75,6.25),(126,3.75,6.75),(127,3.75,7.25),(128,3.75,7.75),(129,4.25,0.25),(130,4.25,0.75),(131,4.25,1.25),(132,4.25,1.75),(133,4.25,2.25),(134,4.25,2.75),(135,4.25,3.25),(136,4.25,3.75),(137,4.25,4.25),(138,4.25,4.75),(139,4.25,5.25),(140,4.25,5.75),(141,4.25,6.25),(142,4.25,6.75),(143,4.25,7.25),(144,4.25,7.75),(145,4.75,0.25),(146,4.75,0.75),(147,4.75,1.25),(148,4.75,1.75),(149,4.75,2.25),(150,4.75,2.75),(151,4.75,3.25),(152,4.75,3.75),(153,4.75,4.25),(154,4.75,4.75),(155,4.75,5.25),(156,4.75,5.75),(157,4.75,6.25),(158,4.75,6.75),(159,4.75,7.25),(160,4.75,7.75),(161,5.25,0.25),(162,5.25,0.75),(163,5.25,1.25),(164,5.25,1.75),(165,5.25,2.25),(166,5.25,2.75),(167,5.25,3.25),(168,5.25,3.75),(169,5.25,4.25),(170,5.25,4.75),(171,5.25,5.25),(172,5.25,5.75),(173,5.25,6.25),(174,5.25,6.75),(175,5.25,7.25),(176,5.25,7.75),(177,5.75,0.25),(178,5.75,0.75),(179,5.75,1.25),(180,5.75,1.75),(181,5.75,2.25),(182,5.75,2.75),(183,5.75,3.25),(184,5.75,3.75),(185,5.75,4.25),(186,5.75,4.75),(187,5.75,5.25),(188,5.75,5.75),(189,5.75,6.25),(190,5.75,6.75),(191,5.75,7.25),(192,5.75,7.75),(193,6.25,0.25),(194,6.25,0.75),(195,6.25,1.25),(196,6.25,1.75),(197,6.25,2.25),(198,6.25,2.75),(199,6.25,3.25),(200,6.25,3.75),(201,6.25,4.25),(202,6.25,4.75),(203,6.25,5.25),(204,6.25,5.75),(205,6.25,6.25),(206,6.25,6.75),(207,6.25,7.25),(208,6.25,7.75),(209,6.75,0.25),(210,6.75,0.75),(211,6.75,1.25),(212,6.75,1.75),(213,6.75,2.25),(214,6.75,2.75),(215,6.75,3.25),(216,6.75,3.75),(217,6.75,4.25),(218,6.75,4.75),(219,6.75,5.25),(220,6.75,5.75),(221,6.75,6.25),(222,6.75,6.75),(223,6.75,7.25),(224,6.75,7.75),(225,7.25,0.25),(226,7.25,0.75),(227,7.25,1.25),(228,7.25,1.75),(229,7.25,2.25),(230,7.25,2.75),(231,7.25,3.25),(232,7.25,3.75),(233,7.25,4.25),(234,7.25,4.75),(235,7.25,5.25),(236,7.25,5.75),(237,7.25,6.25),(238,7.25,6.75),(239,7.25,7.25),(240,7.25,7.75),(241,7.75,0.25),(242,7.75,0.75),(243,7.75,1.25),(244,7.75,1.75),(245,7.75,2.25),(246,7.75,2.75),(247,7.75,3.25),(248,7.75,3.75),(249,7.75,4.25),(250,7.75,4.75),(251,7.75,5.25),(252,7.75,5.75),(253,7.75,6.25),(254,7.75,6.75),(255,7.75,7.25),(256,7.75,7.75);
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-21 15:02:56
