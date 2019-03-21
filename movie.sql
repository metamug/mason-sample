-- MySQL dump 10.16  Distrib 10.1.19-MariaDB, for Win32 (AMD64)
--
-- Host: api.metamug.com    Database: api.metamug.com
-- ------------------------------------------------------
-- Server version	5.6.33-0ubuntu0.14.04.1-log
--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(700) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` decimal(2,1) NOT NULL,
  `releaseDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'Reader',3.1,'2017-01-27 15:34:22'),(2,'The Dark Knight',5.0,'2017-01-27 15:34:22'),(3,'The Happening',4.0,'2017-01-27 15:34:22'),(4,'hi there;',5.5,'2016-01-05 00:00:00');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;


-- Dump completed on 2017-02-03  3:26:46
