CREATE DATABASE  IF NOT EXISTS `restaurant` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `restaurant`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: restaurant
-- ------------------------------------------------------
-- Server version	5.5.25

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL AUTO_INCREMENT,
  `headCount` int(11) NOT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,10),(3,6),(4,2),(5,2),(18,6);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger customer_headCount_insert
before insert on customer
for each row
begin
	if(new.headCount <= 0)  then
	signal sqlstate '45000'
	set message_text = 'Head Count must be positive';
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger customer_headCount_update
before update on customer
for each row
begin
	if(new.headCount <= 0)  then
	signal sqlstate '45000'
	set message_text = 'Head Count must be positive';
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `billarchive`
--

DROP TABLE IF EXISTS `billarchive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billarchive` (
  `billNo` int(11) NOT NULL,
  `timeStamp` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `tax` decimal(10,2) NOT NULL,
  `grandTotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`billNo`),
  KEY `billArchiveToCustomer` (`billNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billarchive`
--

LOCK TABLES `billarchive` WRITE;
/*!40000 ALTER TABLE `billarchive` DISABLE KEYS */;
INSERT INTO `billarchive` VALUES (2,1509571474,5470.00,984.60,6454.60),(15,1509571967,710.00,127.80,837.80),(16,1509604084,3340.00,601.20,3941.20),(17,1509608243,2810.00,505.80,3315.80),(19,1509637462,3895.00,701.10,4596.10);
/*!40000 ALTER TABLE `billarchive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `itemID` varchar(20) NOT NULL,
  `itemName` varchar(100) NOT NULL,
  `category` varchar(30) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES ('Beverage1','Soft Drinks','Beverage','Any soft drink of choosing',95),('Beverage2','Iced Tea','Beverage',NULL,125),('Beverage3','Fresh Lime Soda','Beverage',NULL,125),('Beverage4','Cold Coffee','Beverage',NULL,175),('Beverage5','Hot coffee','Beverage',NULL,95),('Beverage6','Oreo Shake','Beverage',NULL,175),('Bread1','Tandoori Roti','Bread',NULL,55),('Bread2','Naan','Bread','Butter/Garlic',65),('Bread3','Stuffed Parantha','Bread','Paneer/Aloo/Mixed',95),('Bread4','Stuffed Kulcha','Bread',NULL,95),('Dessert1','Gulaab Jamun','Dessert',NULL,135),('Dessert2','Ice cream','Dessert','Chocolate/strawberry/vanilla',125),('Dessert3','Chocolate Mousse','Dessert',NULL,145),('Main1','Paneer Makhani','Main Course',NULL,345),('Main2','Paneer Tikka Masala','Main Course',NULL,365),('Main3','Dal Makhani','Main Course',NULL,365),('Main4','Murg Tikka Masala','Main Course',NULL,395),('Main5','Rara Gosht','Main Course',NULL,425),('Main6','Roasted Leg of Chicken','Main Course',NULL,395),('Main7','Peri Peri Chicken','Main Course',NULL,395),('Pizza1','Classic Margherita Pizza','Pizza',NULL,325),('Pizza2','Peri Peri chichenPizza','Pizza',NULL,395),('Salad1','Caesar Salad','Salad',NULL,225),('Salad2','Crispy Chicken Salad ','Salad',NULL,195),('Soup1','Tomato Basil Soup','soup',NULL,125),('Soup2','Cream of Mushroom Soup','Soup',NULL,150),('Soup3','Hot and Sour','Soup',NULL,175),('Starters1','Honey Chilli potato','Starters',NULL,265),('Starters2','French Fries','Starters',NULL,125),('Starters3','Tandoori Chicken','Starters',NULL,325);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger menu_price_insert
before insert on menu
for each row
begin
	if(new.price <= 0)  then
	signal sqlstate '45000'
	set message_text = 'Price must be positive.';
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger menu_price_update
before update on menu
for each row
begin
	if(new.price <= 0)  then
	signal sqlstate '45000'
	set message_text = 'Price must be positive.';
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `serves`
--

DROP TABLE IF EXISTS `serves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serves` (
  `empID` varchar(20) NOT NULL,
  `tableID` int(11) NOT NULL,
  PRIMARY KEY (`empID`,`tableID`),
  KEY `servesToEmployee` (`empID`),
  KEY `servesToTable` (`tableID`),
  CONSTRAINT `servesToEmployee` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `servesToTable` FOREIGN KEY (`tableID`) REFERENCES `table` (`tableID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serves`
--

LOCK TABLES `serves` WRITE;
/*!40000 ALTER TABLE `serves` DISABLE KEYS */;
INSERT INTO `serves` VALUES ('W1',1),('W2',2),('W3',3),('W4',4),('W1',5),('W2',6),('W3',7),('W4',8),('W1',9),('W2',9);
/*!40000 ALTER TABLE `serves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chef`
--

DROP TABLE IF EXISTS `chef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chef` (
  `empID` varchar(20) NOT NULL,
  `specialization` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`empID`),
  KEY `empID` (`empID`),
  CONSTRAINT `chefFK` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chef`
--

LOCK TABLES `chef` WRITE;
/*!40000 ALTER TABLE `chef` DISABLE KEYS */;
INSERT INTO `chef` VALUES ('C1','Desserts'),('C2','Continental');
/*!40000 ALTER TABLE `chef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `empID` varchar(20) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`empID`),
  KEY `empIDManager` (`empID`),
  CONSTRAINT `managerFK` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES ('M1','password'),('M2','password');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemsinorder`
--

DROP TABLE IF EXISTS `itemsinorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemsinorder` (
  `orderID` int(11) NOT NULL,
  `itemID` varchar(20) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`orderID`,`itemID`),
  KEY `IIOToOrder` (`orderID`),
  KEY `IIOToItem` (`itemID`),
  CONSTRAINT `IIOToItem` FOREIGN KEY (`itemID`) REFERENCES `menu` (`itemID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `IIOToOrder` FOREIGN KEY (`orderID`) REFERENCES `order` (`orderID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemsinorder`
--

LOCK TABLES `itemsinorder` WRITE;
/*!40000 ALTER TABLE `itemsinorder` DISABLE KEYS */;
INSERT INTO `itemsinorder` VALUES (1,'Beverage1',2),(1,'Salad2',1),(1,'Starters1',1),(2,'Main3',1),(2,'Main5',1),(3,'Dessert1',2),(9,'Beverage2',5),(9,'Pizza2',3),(9,'Starters1',5);
/*!40000 ALTER TABLE `itemsinorder` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger item_quantity_insert
before insert on itemsinorder
for each row
begin
	if(new.qty <= 0)  then
	signal sqlstate '45000'
	set message_text = 'Quantity must be positive.';
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger item_quantity_update
before update on itemsinorder
for each row
begin
	if(new.qty <= 0)  then
	signal sqlstate '45000'
	set message_text = 'Quantity must be positive.';
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `itemsinbill`
--

DROP TABLE IF EXISTS `itemsinbill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemsinbill` (
  `billNo` int(11) NOT NULL,
  `itemID` varchar(20) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`billNo`,`itemID`),
  KEY `IIBToBill` (`billNo`),
  KEY `IIBToItem` (`itemID`),
  CONSTRAINT `IIBToBill` FOREIGN KEY (`billNo`) REFERENCES `billarchive` (`billNo`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `IIBToItem` FOREIGN KEY (`itemID`) REFERENCES `menu` (`itemID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemsinbill`
--

LOCK TABLES `itemsinbill` WRITE;
/*!40000 ALTER TABLE `itemsinbill` DISABLE KEYS */;
INSERT INTO `itemsinbill` VALUES (2,'Beverage1',4),(2,'Beverage3',4),(2,'Dessert1',4),(2,'Dessert2',2),(2,'Dessert3',2),(2,'Main2',3),(2,'Main5',2),(2,'Pizza1',1),(2,'Salad2',2),(2,'Soup3',2),(2,'Starters2',4),(15,'Beverage1',2),(15,'Dessert1',2),(15,'Starters2',2),(16,'Beverage1',4),(16,'Beverage2',6),(16,'Main2',4),(16,'Soup1',2),(16,'Starters2',4),(17,'Beverage2',6),(17,'Main3',4),(17,'Soup2',4),(19,'Beverage1',6),(19,'Main3',5),(19,'Pizza1',2),(19,'Soup2',4),(19,'Starters2',2);
/*!40000 ALTER TABLE `itemsinbill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `empID` varchar(20) NOT NULL,
  `empName` varchar(45) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `contactNo` varchar(20) NOT NULL,
  `DOB` date DEFAULT NULL,
  `DOJ` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `salary` int(11) NOT NULL,
  `qualification` varchar(45) DEFAULT NULL,
  `experience` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`empID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('C1','Niketan Nath',NULL,'8447356519','1987-11-12','2016-06-01','Male',800000,'10th','2 yrs'),('C2','Shivam Gupta',NULL,'8800977044','1992-05-02','2016-01-01','Male',700000,'12th','10 yrs'),('M1','Aayush Mahajan',NULL,'9999569291','1988-08-24','2016-01-01','Male',800000,'Graduate','3 yrs'),('M2','Vrishank Gupta',NULL,'9136666425','1988-04-24','2016-04-01','Male',800000,'PostGrad','None'),('W1','Geetanshu Gupta',NULL,'9717902587','1988-02-25','2016-01-01','Male',500000,'10th','6 yrs'),('W2','Abhishek Dudeja',NULL,'9810593724','1988-09-04','2017-04-01','Male',500000,'Grauate','1 yrs'),('W3','Yash Bansal',NULL,'8800990131','1987-10-07','2017-04-01','Male',600000,'12th','5 yrs'),('W4','Tanvi Singh',NULL,'9968622334','1994-01-01','2017-04-01','Female',500000,'12th','None');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger employee_insert
before insert on employee
for each row
begin
	if(year(now()) - year(new.DOB) < 18
		OR new.DOJ<new.DOB 
		OR new.gender NOT IN ('male','female','other')) then
	signal sqlstate '45000'
	set message_text = 'Error with value entered.';
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger employee_update
before update on employee
for each row
begin
	if(year(now()) - year(new.DOB) < 18
		OR new.DOJ<new.DOB 
		OR new.gender NOT IN ('male','female','other')) then
	signal sqlstate '45000'
	set message_text = 'Error with value entered.';
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `table`
--

DROP TABLE IF EXISTS `table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table` (
  `tableID` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `customerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`tableID`),
  KEY `tableToCustomer` (`customerID`),
  CONSTRAINT `tableToCustomer` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table`
--

LOCK TABLES `table` WRITE;
/*!40000 ALTER TABLE `table` DISABLE KEYS */;
INSERT INTO `table` VALUES (1,2,3),(2,2,4),(3,2,5),(4,2,NULL),(5,4,18),(6,4,NULL),(7,4,3),(8,4,NULL),(9,10,1),(10,10,NULL);
/*!40000 ALTER TABLE `table` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger table_capacity_insert
before insert on `table`
for each row
begin
	if(new.capacity <= 0)  then
	signal sqlstate '45000'
	set message_text = 'Capacity of a table cannot be non positive.';
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger table_capacity_update
before update on `table`
for each row
begin
	if(new.capacity <= 0)  then
	signal sqlstate '45000'
	set message_text = 'Capacity of a table cannot be non positive.';
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `tableID` int(11) NOT NULL,
  `placedTime` int(11) NOT NULL,
  `deliveredTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `orderToTable` (`tableID`),
  CONSTRAINT `orderToSits` FOREIGN KEY (`tableID`) REFERENCES `table` (`tableID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,3,1509430298,1509430826),(2,3,1509431110,1509431956),(3,3,1509432001,NULL),(9,9,1509561945,NULL);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-05 23:45:53
