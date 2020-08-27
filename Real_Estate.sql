CREATE DATABASE  IF NOT EXISTS `real_estate_office` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `real_estate_office`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: real_estate_office
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent` (
  `agentid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `contactid` int(11) NOT NULL,
  `locality_pincode` int(11) NOT NULL,
  `pass` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`agentid`),
  KEY `fk_agent_contact1_idx` (`contactid`),
  KEY `fk_agent_locality1_idx` (`locality_pincode`),
  CONSTRAINT `fk_agent_contact1` FOREIGN KEY (`contactid`) REFERENCES `contact` (`contactid`) ON UPDATE CASCADE,
  CONSTRAINT `fk_agent_locality1` FOREIGN KEY (`locality_pincode`) REFERENCES `locality` (`pincode`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` VALUES (1,'Karan Deka',11,781001,'111'),(2,'Ankur Barua',12,781003,'222'),(3,'Naveen Kalita',13,781005,'333'),(4,'Vinay Borah',14,781013,'444'),(5,'Akash Kapil',15,781009,'555'),(6,'Sourav Bhatiya',16,781004,'666'),(7,'real_estate_office Manager',17,781019,'777');
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `clientid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `contactid` int(11) NOT NULL,
  `locality_pincode` int(11) NOT NULL,
  PRIMARY KEY (`clientid`),
  KEY `fk_client_contact1_idx` (`contactid`),
  KEY `fk_client_locality1_idx` (`locality_pincode`),
  CONSTRAINT `fk_client_contact1` FOREIGN KEY (`contactid`) REFERENCES `contact` (`contactid`) ON UPDATE CASCADE,
  CONSTRAINT `fk_client_locality1` FOREIGN KEY (`locality_pincode`) REFERENCES `locality` (`pincode`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Aditi Musunur',1,781007),(2,'Advitiya Sujeet',2,781010),(3,'Alagesan Poduri',3,781001),(4,'Amrish Ilyas',4,781004),(5,'Aprativirya Seshan',5,781001),(6,'Asvathama Ponnada',6,781009),(7,'Avantas Ghosal',7,781003),(8,'Avidosa Vaisakhi',8,781010),(9,'Barsati Sandipa',9,781004),(10,'Debasis Sundhararajan',10,781005),(11,'deepak yadav',21,781036);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `contactid` int(11) NOT NULL AUTO_INCREMENT,
  `contact_no` decimal(10,0) NOT NULL,
  PRIMARY KEY (`contactid`,`contact_no`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,9812471832),(1,9963792805),(2,9076401801),(3,9138825876),(3,9578262508),(4,9346680745),(5,9716562065),(6,9427735010),(6,9625758957),(7,9708846493),(8,9191262795),(9,9576901617),(10,9582500018),(10,9954064468),(11,9328049458),(12,9073158308),(13,9471643919),(13,9635544075),(14,9831467515),(15,9274137036),(16,9831453847),(17,9631467515),(18,9731467553),(19,9431467537),(20,9331467536),(21,9461132817);
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `details`
--

DROP TABLE IF EXISTS `details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `details` (
  `detailsid` int(11) NOT NULL AUTO_INCREMENT,
  `size` varchar(45) DEFAULT NULL,
  `BHK` int(11) DEFAULT NULL,
  `propertyid` int(11) NOT NULL,
  PRIMARY KEY (`detailsid`,`propertyid`),
  KEY `fk_details_property_idx` (`propertyid`),
  CONSTRAINT `fk_details_property` FOREIGN KEY (`propertyid`) REFERENCES `property` (`propertyid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `details`
--

LOCK TABLES `details` WRITE;
/*!40000 ALTER TABLE `details` DISABLE KEYS */;
INSERT INTO `details` VALUES (1,'1100 sqft',3,4),(1,'1100 sqft',3,11),(2,'467 sqft',1,12),(3,'885 sqft',2,13),(4,'900 sqft',2,14),(5,'920 sqft',2,15),(6,'800 sqft',2,16),(6,'800 sqft',2,20),(7,'660 sqft',1,17),(8,'700 sqft',2,7),(8,'700 sqft',2,18),(9,'400 sqft',3,19),(11,'600 sqft',2,1),(12,'960 sqft',3,2),(13,'1200 sqft',4,3),(14,'500 sqft',1,5),(14,'500 sqft',1,9),(15,'850 sqft',2,6),(16,'680 sqft',2,8),(17,'800 sqft',3,10),(18,'200 sqft',1,22),(19,'850 sqft',2,21);
/*!40000 ALTER TABLE `details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locality`
--

DROP TABLE IF EXISTS `locality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locality` (
  `pincode` int(11) NOT NULL,
  `locality_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pincode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locality`
--

LOCK TABLES `locality` WRITE;
/*!40000 ALTER TABLE `locality` DISABLE KEYS */;
INSERT INTO `locality` VALUES (781001,'Fancy Bazar'),(781003,'Silpukhuri'),(781004,'Kharguli'),(781005,'Dispur'),(781006,'Ganeshguri'),(781007,'Ulubari'),(781008,'Rehabari'),(781009,'Bharalumukh'),(781010,'Kamakhya'),(781011,'Maligaon'),(781012,'Pandu'),(781013,'Jhalukbari'),(781014,'Dharapur'),(781015,'Guwahati Airport'),(781016,'Gopinath Nagar'),(781017,'Azara'),(781018,'Binova Nagar'),(781019,'Kahilipara'),(781020,'Noonmati'),(781021,'Bamunimaidan'),(781022,'Khanapara'),(781023,'Amerigog'),(781024,'Zoo Road'),(781028,'Beltola'),(781031,'Amingaon'),(781036,'Hengrabari');
/*!40000 ALTER TABLE `locality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property` (
  `propertyid` int(11) NOT NULL AUTO_INCREMENT,
  `type` char(1) DEFAULT NULL,
  `price` decimal(12,0) DEFAULT NULL,
  `locality_address` varchar(150) DEFAULT NULL,
  `landmark` varchar(50) DEFAULT NULL,
  `on_market_date` date DEFAULT NULL,
  `tag` varchar(15) DEFAULT 'available',
  `locality_pincode` int(11) NOT NULL,
  `agentid` int(11) DEFAULT NULL,
  PRIMARY KEY (`propertyid`),
  KEY `fk_property_locality1_idx` (`locality_pincode`),
  KEY `fk_property_agent1_idx` (`agentid`),
  CONSTRAINT `fk_property_agent1` FOREIGN KEY (`agentid`) REFERENCES `agent` (`agentid`) ON DELETE SET NULL,
  CONSTRAINT `fk_property_locality1` FOREIGN KEY (`locality_pincode`) REFERENCES `locality` (`pincode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES (1,'S',2900000,'Jalukbari near Radison Blue','Lankeswar Market','2016-01-05','available',781013,1),(2,'S',4670000,'Near Radison Blue Hotel','Radison Blue','2016-02-10','sold',781013,1),(3,'S',5620000,'Sarania (Ulubari)','Aruna Memorial Hospital','2016-05-05','available',781007,2),(4,'S',5000000,'Near dispur supar market','International Hospital School Nursing','2016-07-25','available',781005,3),(5,'S',1210000,'Rani gate, Azara','Kidzee Dharapur centre','2017-04-16','available',781017,4),(6,'S',3300000,'Kahilipara, Dakhingaon Road, Mulaghaburo Path, 1st bye lane','SAI R.N.S Academy','2017-11-14','sold',781019,5),(7,'R',8500,'near vishal maga mart.','Exotica Greens Shopping Mall','2016-03-23','sold',781006,1),(8,'R',8000,'Janakpur, Kahilipara Near State Bank','Protech Centre Mall','2016-09-27','available',781019,6),(9,'R',7500,'Dispur low college','International Hospital School Nursing','2017-01-25','available',781005,3),(10,'R',10000,'Near Jyoti chitraban','SAI R.N.S Academy','2016-06-18','available',781019,4),(11,'S',2000000,'Near St. Vivekananda English Academy, Maligaon','St. Vivekananda English Academy','2018-06-25','available',781011,6),(12,'S',2200000,'Prime Millenium Garden, Jalukbari','Satmile Bus Stop','2018-09-17','sold',781013,3),(13,'S',2480000,'new airport gorol road, Dharapur','Garal PHC Hospital','2019-02-22','sold',781014,4),(14,'S',2600000,'Near Aruna Memorial Hospital,Ulubari','Aruna Memorial Hospital','2019-08-29','available',781007,5),(15,'S',2990000,'Nh37., Azara,','Decathlon','2018-11-14','sold',781017,1),(16,'R',12000,'House No. 6, Rodali Path, Panjabari Road','Close to Pabjabari Road','2018-04-16','sold',781022,4),(17,'R',9000,'House no-48, Mother teresa path Opposite Hatigaon Police Station','Hatigaon','2017-08-12','sold',781024,6),(18,'R',12000,'North Guwahati Ghoramara, North Guwahati-30','Near IIT Guwahati','2019-02-04','sold',781031,4),(19,'R',14000,'G 30 phulonibari near heritage public school','Close to Heritage public school','2019-01-17','available',781011,2),(20,'R',9000,'Near Jyoti Chitraban, Kahilipara','Bharat Petroleum,Petrol Pump','2017-08-28','available',781019,5),(21,'S',3300000,'Raj Palace','Dekathlon','2020-05-05','available',781017,1),(22,'R',9000,'RoomNo.-211,Boys Hostel,IIIT Guwahati,Bongora','IT Park','2020-05-01','available',781015,5);
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `propertyid` int(11) NOT NULL,
  `agentid` int(11) NOT NULL,
  `sales_date` date DEFAULT NULL,
  `clientid` int(11) NOT NULL,
  PRIMARY KEY (`propertyid`,`agentid`),
  KEY `fk_property_has_agent_property1_idx` (`propertyid`),
  KEY `fk_property_has_agent_agent1_idx` (`agentid`),
  KEY `fk_sales_client1_idx` (`clientid`),
  CONSTRAINT `fk_property_has_agent_agent1` FOREIGN KEY (`agentid`) REFERENCES `agent` (`agentid`) ON UPDATE CASCADE,
  CONSTRAINT `fk_property_has_agent_property1` FOREIGN KEY (`propertyid`) REFERENCES `property` (`propertyid`) ON UPDATE CASCADE,
  CONSTRAINT `fk_sales_client1` FOREIGN KEY (`clientid`) REFERENCES `client` (`clientid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (2,1,'2018-03-28',3),(6,5,'2018-03-26',7),(7,1,'2018-01-15',2),(12,3,'2020-04-23',11),(13,4,'2019-04-26',6),(15,1,'2019-02-14',1),(16,4,'2019-02-05',5),(17,6,'2019-05-27',8),(18,4,'2019-06-30',4);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `set_tag` AFTER INSERT ON `sales` FOR EACH ROW begin 
update property
set tag='sold'
where property.propertyid = new.propertyid ;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `del_property` AFTER DELETE ON `sales` FOR EACH ROW begin 
delete from property where property.propertyid= old.propertyid; 
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'real_estate_office'
--

--
-- Dumping routines for database 'real_estate_office'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-27 23:00:03
