-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: shopping
-- ------------------------------------------------------
-- Server version	5.7.9-log

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (4,'Clothes'),(2,'Electronics'),(3,'Jewellery');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_us`
--

DROP TABLE IF EXISTS `contact_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telephone` varchar(11) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_us`
--

LOCK TABLES `contact_us` WRITE;
/*!40000 ALTER TABLE `contact_us` DISABLE KEYS */;
INSERT INTO `contact_us` VALUES (1,'dalia','dalia.maher94@gmail.com','01111267812','Hello msg'),(2,'Rana','rana@gmail.com','0111126781','Hello 2'),(3,'test','mustafa@yahoo.com','a','asd');
/*!40000 ALTER TABLE `contact_us` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit`
--

DROP TABLE IF EXISTS `credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit` (
  `cardID` varchar(14) NOT NULL,
  `cardValue` int(11) NOT NULL,
  `customerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`cardID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit`
--

LOCK TABLES `credit` WRITE;
/*!40000 ALTER TABLE `credit` DISABLE KEYS */;
INSERT INTO `credit` VALUES ('0WUVK7LWXE8DA9',10,NULL),('1QKCRJ45WYAUWW',10,NULL),('4BJ7IBLARDLG2O',10,9),('66KZG62JZYI0AK',10,NULL),('B1U1SLJ82L5NPB',10,NULL),('BET1BB54KFXX5C',10,NULL),('BW2WC60WL44XTH',10,NULL),('GEURYOX4DZ0VW4',10,NULL),('MZUS4HOBB4QNRL',10,NULL),('P0WLEJKNE536G8',10,13),('SHYPTBM53ZK74Q',10,13),('SYVTG1TJ4D9QMR',10,14),('XADAOS8TFDR49E',10,NULL);
/*!40000 ALTER TABLE `credit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `credit` double DEFAULT NULL,
  `addresse` varchar(100) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `BDate` date NOT NULL,
  `job` varchar(80) NOT NULL,
  PRIMARY KEY (`customerID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'dalia_2412@yahoo.com','dalia','12345','Dalia','Maher',230,'ITI',0,'1994-01-24','Student'),(2,'marwa@gmail.com','marwa','1234','Marwa','Mohsen',0,'ITI',0,'1970-01-01','Student'),(3,'tahany@yahoo.com','tahany','123','Tahany','Fawzy',0,'ITI',0,'1994-01-04','Student'),(5,'5','asd','12','asdasd','sdfsdf',0,'ITI',0,'2017-01-05','Student'),(6,'ranya@yahoo.com','ranya','1234','Ranya','Maher',0,'ITI',0,'2016-01-27','Student'),(7,'mostafa@gmail.com','mostafa','1234','Mostafa','Mamdouh',0,'ITI',0,'2017-01-05','Student'),(8,'admin@gmail.com','admin','1234','admin','admin',0,'ITI',1,'2017-01-01','Student'),(9,'dalia@gmail.com','daliaa','1234','Dalia','Maher',10,'ITI',0,'1994-12-30','Student'),(12,'dalia_2412@yahooo.com','daliaaa','1234','Dalia','Maher',0,'ITI',0,'2010-11-30','doctor'),(13,'rana@yahoo.com','rana','1234','Rana','Mohammad',139,'ITI',0,'1994-08-31','Student'),(14,'tahany@yahoo.comm','tahanyy','1234','Tahanyy','Fawzy',10,'ITI',0,'1993-11-27','Student');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interests`
--

DROP TABLE IF EXISTS `interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interests` (
  `customerID` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL,
  PRIMARY KEY (`customerID`,`categoryID`),
  KEY `categoryID` (`categoryID`),
  CONSTRAINT `interests_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`),
  CONSTRAINT `interests_ibfk_2` FOREIGN KEY (`categoryID`) REFERENCES `category` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interests`
--

LOCK TABLES `interests` WRITE;
/*!40000 ALTER TABLE `interests` DISABLE KEYS */;
INSERT INTO `interests` VALUES (7,2),(9,2),(1,3),(7,3),(9,3),(14,3),(13,4);
/*!40000 ALTER TABLE `interests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `productID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `price` double NOT NULL,
  `ordernumber` int(11) NOT NULL,
  PRIMARY KEY (`orderID`),
  KEY `productID` (`productID`),
  KEY `customerID` (`customerID`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`ID`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,2,1,2,'2017-03-10 00:00:00',120,1),(2,4,1,1,'2017-03-10 00:00:00',200,2),(3,2,1,1,'2017-03-10 00:00:00',120,3),(4,4,1,1,'2017-03-10 00:00:00',200,3),(5,3,1,1,'2017-03-10 00:00:00',300,4),(21,1,1,1,'2017-03-11 00:00:00',211,5),(31,1,1,1,'2017-03-11 00:00:00',211,6),(32,2,1,2,'2017-03-11 00:00:00',120,6),(33,2,1,1,'2017-03-11 00:00:00',120,7),(34,2,1,1,'2017-03-12 00:22:55',120,8),(35,1,13,1,'2017-03-15 08:08:50',211,1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryID` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(500) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `images` text,
  `valid` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `categoryID` (`categoryID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `category` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,3,'Necklace','Dazzling crystals cascade down the twists of this necklace to the large Tanzanite coloured showpiece stone at the pendants base, Swarovski crystals throughout and an elegant 16\" diamond cut rolo chain with extender. Glints of colour reflecting off multi-facets create a truly stunning piece. Rhodium finish, a member of the Platinum family, for added luxury. Fabulous to wear, great as a gift.',2,211,'&&1-0&&1-1&&1-2',1),(2,3,'Ring','Leaf Engagement Ring Conflict Free Diamonds.',0,120,'2-5',1),(3,3,'The Suzette Sterling','Dazzling crystals cascade down the twists of this necklace to the large Tanzanite coloured showpiece stone at the pendants base, Swarovski crystals throughout and an elegant 16\" diamond cut rolo chain with extender. Glints of colour reflecting off multi-facets create a truly stunning piece. Rhodium finish, a member of the Platinum family, for added luxury. Fabulous to wear, great as a gift.',3,300,'&&3-2',1),(4,3,'Earring','gold earring',6,200,'4-1',1),(5,4,'1','1',1,1,'',0),(6,4,'2','2',2,2,'',1),(7,4,'3','3',3,3,'&&7-0',1),(8,4,'4','4',4,4,'',1),(9,4,'5','5',5,5,'',1),(10,4,'6','6',6,6,'',1),(11,4,'7','7',7,7,'',1),(12,4,'9','9',9,9,'',1),(13,4,'test','55',13,13,'',1),(14,4,'asdasd','9',9,9,'',1),(15,4,'664','545',4545,5454,'',0),(16,4,'asdad','fgdfg',7,7,'',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart`
--

DROP TABLE IF EXISTS `shoppingcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart` (
  `productID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`productID`,`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart`
--

LOCK TABLES `shoppingcart` WRITE;
/*!40000 ALTER TABLE `shoppingcart` DISABLE KEYS */;
INSERT INTO `shoppingcart` VALUES (2,10,10);
/*!40000 ALTER TABLE `shoppingcart` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-15 11:16:26
