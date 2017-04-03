CREATE DATABASE  IF NOT EXISTS `etude_sql` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `etude_sql`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: etude_sql
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `employes`
--

DROP TABLE IF EXISTS `employes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employes` (
  `idEmploye` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(20) NOT NULL,
  `Prenom` varchar(20) DEFAULT NULL,
  `idPays` int(11) DEFAULT NULL,
  `idSociete` varchar(10) DEFAULT NULL,
  `idResponsable` int(11) DEFAULT NULL,
  `SalaireMensuel` float(7,2) DEFAULT '0.00',
  `DateNaissance` date DEFAULT NULL,
  PRIMARY KEY (`idEmploye`),
  UNIQUE KEY `CoupleNomPrenomUnique` (`Nom`,`Prenom`),
  KEY `idPays` (`idPays`),
  KEY `idSociete` (`idSociete`),
  KEY `idResponsable` (`idResponsable`),
  CONSTRAINT `employes_ibfk_1` FOREIGN KEY (`idPays`) REFERENCES `pays` (`idPays`),
  CONSTRAINT `employes_ibfk_2` FOREIGN KEY (`idSociete`) REFERENCES `societes` (`idSociete`) ON DELETE CASCADE,
  CONSTRAINT `employes_ibfk_3` FOREIGN KEY (`idResponsable`) REFERENCES `employes` (`idEmploye`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employes`
--

LOCK TABLES `employes` WRITE;
/*!40000 ALTER TABLE `employes` DISABLE KEYS */;
INSERT INTO `employes` VALUES (1,'Nom1','Prénom1',3,'soc1',2,1000.00,'1995-11-20'),(2,'Nom2','Prénom2',NULL,'soc2',3,0.00,'1980-05-25'),(3,'Nom3','Prénom3',1,'soc1',NULL,1900.00,'1980-04-03'),(4,'Nom4','Prénom4',1,'soc4',2,800.00,NULL),(5,'Nom5','Prénom5',1,'soc5',2,1300.00,NULL),(6,'Nom6','Prénom6',9,'soc6',2,1700.00,NULL),(7,'Nom7','Prénom7',NULL,NULL,NULL,0.00,NULL),(8,'Nom8','Prénom8',8,NULL,NULL,1500.00,NULL),(9,'Nom9','Prénom9',9,NULL,NULL,3000.00,NULL),(10,'Nom10','Prénom10',8,'soc4',NULL,2100.00,NULL),(19,'LeNom17972','LePrenom17972',1,'soc3',3,1200.00,'1993-10-09'),(20,'LeNom27972','LePrenom27972',3,'soc2',2,1800.00,'1993-07-14');
/*!40000 ALTER TABLE `employes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pays`
--

DROP TABLE IF EXISTS `pays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pays` (
  `idPays` int(11) NOT NULL AUTO_INCREMENT,
  `pays` varchar(20) NOT NULL,
  PRIMARY KEY (`idPays`),
  UNIQUE KEY `pays` (`pays`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pays`
--

LOCK TABLES `pays` WRITE;
/*!40000 ALTER TABLE `pays` DISABLE KEYS */;
INSERT INTO `pays` VALUES (1,'Pays 1'),(2,'Pays 2'),(3,'Pays 3'),(4,'Pays 4'),(8,'Pays 8'),(9,'Pays 9');
/*!40000 ALTER TABLE `pays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `societes`
--

DROP TABLE IF EXISTS `societes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `societes` (
  `idSociete` varchar(10) NOT NULL,
  `societe` varchar(20) NOT NULL,
  `idPays` int(11) DEFAULT NULL,
  PRIMARY KEY (`idSociete`),
  UNIQUE KEY `societe` (`societe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `societes`
--

LOCK TABLES `societes` WRITE;
/*!40000 ALTER TABLE `societes` DISABLE KEYS */;
INSERT INTO `societes` VALUES ('soc1','societe 1',1),('soc2','societe 2',2),('soc3','societe 3',2),('soc4','societe 4',4),('soc5','societe 5',NULL),('soc6','societe 6',NULL),('soc7','societe 7',10),('soc8','societe 8',12);
/*!40000 ALTER TABLE `societes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-03 14:38:45
