-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: odev7_abdullahali
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `alim`
--

DROP TABLE IF EXISTS `alim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alim` (
  `mkodu` varchar(5) DEFAULT NULL,
  `firma` int DEFAULT NULL,
  `miktar` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alim`
--

LOCK TABLES `alim` WRITE;
/*!40000 ALTER TABLE `alim` DISABLE KEYS */;
INSERT INTO `alim` VALUES ('SA11',2,15),('KF23',5,25),('KF28',3,30),('A111',5,20),('A118',2,30),('ZX3',2,20),('KF29',1,30);
/*!40000 ALTER TABLE `alim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bolum`
--

DROP TABLE IF EXISTS `bolum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bolum` (
  `bolno` int NOT NULL,
  `badi` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`bolno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bolum`
--

LOCK TABLES `bolum` WRITE;
/*!40000 ALTER TABLE `bolum` DISABLE KEYS */;
INSERT INTO `bolum` VALUES (1,'Elektronik'),(2,'Satınalma'),(3,'Ayniyat'),(4,'Muhasaebe');
/*!40000 ALTER TABLE `bolum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firma`
--

DROP TABLE IF EXISTS `firma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `firma` (
  `firma` int NOT NULL,
  `adi` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`firma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firma`
--

LOCK TABLES `firma` WRITE;
/*!40000 ALTER TABLE `firma` DISABLE KEYS */;
INSERT INTO `firma` VALUES (1,'KRN'),(2,'BATIKAN'),(3,'ARENA'),(4,'HP');
/*!40000 ALTER TABLE `firma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `malzeme`
--

DROP TABLE IF EXISTS `malzeme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `malzeme` (
  `mkodu` varchar(5) NOT NULL,
  `madi` varchar(11) DEFAULT NULL,
  `mevmik` int DEFAULT NULL,
  PRIMARY KEY (`mkodu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `malzeme`
--

LOCK TABLES `malzeme` WRITE;
/*!40000 ALTER TABLE `malzeme` DISABLE KEYS */;
INSERT INTO `malzeme` VALUES ('A111','Monitor',40),('B31','Ram',100),('KF23','Cdrom',50),('SA11','Harddisk',30),('ZX3','Anakart',25);
/*!40000 ALTER TABLE `malzeme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personel`
--

DROP TABLE IF EXISTS `personel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personel` (
  `sno` int NOT NULL,
  `bno` int DEFAULT NULL,
  `ucret` int DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personel`
--

LOCK TABLES `personel` WRITE;
/*!40000 ALTER TABLE `personel` DISABLE KEYS */;
INSERT INTO `personel` VALUES (1,2,50),(2,2,75),(3,3,75),(4,1,25),(5,4,100),(6,4,50),(7,3,75),(8,3,50),(9,1,100),(10,1,50),(11,1,100);
/*!40000 ALTER TABLE `personel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proje`
--

DROP TABLE IF EXISTS `proje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proje` (
  `pno` int NOT NULL,
  `projeadi` varchar(11) DEFAULT NULL,
  `bno` int DEFAULT NULL,
  PRIMARY KEY (`pno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proje`
--

LOCK TABLES `proje` WRITE;
/*!40000 ALTER TABLE `proje` DISABLE KEYS */;
INSERT INTO `proje` VALUES (1,'Elpro',1),(2,'Bilgi',2),(3,'Satbilgi',2),(4,'AyniPro',3),(5,'Muhpro',4);
/*!40000 ALTER TABLE `proje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuketim`
--

DROP TABLE IF EXISTS `tuketim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tuketim` (
  `mkodu` varchar(5) DEFAULT NULL,
  `pno` int DEFAULT NULL,
  `miktar` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuketim`
--

LOCK TABLES `tuketim` WRITE;
/*!40000 ALTER TABLE `tuketim` DISABLE KEYS */;
INSERT INTO `tuketim` VALUES ('SA11',1,5),('SA11',3,10),('SA11',4,15),('KF23',1,10),('A111',2,5),('B31',2,10),('ZX3',5,25),('KF23',3,20);
/*!40000 ALTER TABLE `tuketim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uretim`
--

DROP TABLE IF EXISTS `uretim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uretim` (
  `mkodu` varchar(5) DEFAULT NULL,
  `bno` int DEFAULT NULL,
  `miktar` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uretim`
--

LOCK TABLES `uretim` WRITE;
/*!40000 ALTER TABLE `uretim` DISABLE KEYS */;
INSERT INTO `uretim` VALUES ('SA11',1,10),('SA11',2,20),('SA11',3,15),('KF23',4,5),('A111',2,5),('B31',3,10),('ZX',3,25),('KF23',2,20);
/*!40000 ALTER TABLE `uretim` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-24 15:19:06
