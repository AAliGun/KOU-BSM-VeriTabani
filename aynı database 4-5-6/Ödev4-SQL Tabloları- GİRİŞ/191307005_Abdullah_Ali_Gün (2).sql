-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: odev4_abdullahali
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
-- Table structure for table `dersler`
--

DROP TABLE IF EXISTS `dersler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dersler` (
  `ders_kodu` varchar(3) NOT NULL,
  `ders_adi` varchar(22) NOT NULL,
  PRIMARY KEY (`ders_kodu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dersler`
--

LOCK TABLES `dersler` WRITE;
/*!40000 ALTER TABLE `dersler` DISABLE KEYS */;
INSERT INTO `dersler` VALUES ('geo','Geometri'),('mat','Matematik'),('ted','Türk Dili ve Edebiyatı');
/*!40000 ALTER TABLE `dersler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notlar`
--

DROP TABLE IF EXISTS `notlar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notlar` (
  `ogrenci_no` varchar(2) NOT NULL,
  `ders_kodu` varchar(3) NOT NULL,
  `notu` varchar(3) NOT NULL,
  KEY `ogrenci_no` (`ogrenci_no`),
  KEY `ders_kodu` (`ders_kodu`),
  CONSTRAINT `notlar_ibfk_1` FOREIGN KEY (`ogrenci_no`) REFERENCES `ogrenciler` (`ogrenci_no`),
  CONSTRAINT `notlar_ibfk_2` FOREIGN KEY (`ders_kodu`) REFERENCES `dersler` (`ders_kodu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notlar`
--

LOCK TABLES `notlar` WRITE;
/*!40000 ALTER TABLE `notlar` DISABLE KEYS */;
INSERT INTO `notlar` VALUES ('54','mat','40'),('67','ted','70'),('54','ted','40'),('18','geo','60');
/*!40000 ALTER TABLE `notlar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogrenciler`
--

DROP TABLE IF EXISTS `ogrenciler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ogrenciler` (
  `ogrenci_no` varchar(2) NOT NULL,
  `adi` varchar(20) NOT NULL,
  `soyadi` varchar(15) NOT NULL,
  `cinsiyet` varchar(1) NOT NULL,
  `sinif_kodu` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`ogrenci_no`),
  KEY `sinif_kodu` (`sinif_kodu`),
  CONSTRAINT `ogrenciler_ibfk_1` FOREIGN KEY (`sinif_kodu`) REFERENCES `siniflar` (`sinif_kodu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogrenciler`
--

LOCK TABLES `ogrenciler` WRITE;
/*!40000 ALTER TABLE `ogrenciler` DISABLE KEYS */;
INSERT INTO `ogrenciler` VALUES ('18','Mahir','Seren','e','12blsb'),('54','Ahmet','Özdemir','e','12blsa'),('67','Hatice','Eren','e','12blsa');
/*!40000 ALTER TABLE `ogrenciler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siniflar`
--

DROP TABLE IF EXISTS `siniflar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `siniflar` (
  `sinif_kodu` varchar(9) NOT NULL,
  `sinif_adi` varchar(25) NOT NULL,
  PRIMARY KEY (`sinif_kodu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siniflar`
--

LOCK TABLES `siniflar` WRITE;
/*!40000 ALTER TABLE `siniflar` DISABLE KEYS */;
INSERT INTO `siniflar` VALUES ('12andbls','12 Anadolu Bilişim'),('12blsa','12 Bilişim A'),('12blsb','12 Bilişim B');
/*!40000 ALTER TABLE `siniflar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-30 19:57:11
