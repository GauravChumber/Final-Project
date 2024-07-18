CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `customer_table`
--

DROP TABLE IF EXISTS `customer_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_table` (
  `cus_id` int NOT NULL,
  `cus_name` varchar(45) DEFAULT NULL,
  `visit_date` date DEFAULT NULL,
  `ordered_pets` int DEFAULT NULL,
  PRIMARY KEY (`cus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_table`
--

LOCK TABLES `customer_table` WRITE;
/*!40000 ALTER TABLE `customer_table` DISABLE KEYS */;
INSERT INTO `customer_table` VALUES (1,'Bob Brown','2023-01-15',2),(2,'Amy Green','2023-02-20',4),(3,'John Doe','2023-03-25',5),(4,'Jane Smith','2023-04-20',4),(5,'Sarah Jones','2023-05-18',1),(6,'David Lee','2023-07-05',1),(7,'Maria Garcia','2023-07-30',1),(8,'Kim Lee','2023-08-20',3),(9,'Nguyen Tran','2023-09-10',3),(10,'Emily Clark','2023-10-25',1);
/*!40000 ALTER TABLE `customer_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_table_has_pet_table`
--

DROP TABLE IF EXISTS `customer_table_has_pet_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_table_has_pet_table` (
  `customer_table_cus_id` int NOT NULL,
  `pet_table_pet_id` int NOT NULL,
  `pet_table_trainer_table_trainer_id` int NOT NULL,
  `pet_table_pet_breed_info_id` int NOT NULL,
  `pet_table_product_table_product_id` int NOT NULL,
  PRIMARY KEY (`customer_table_cus_id`,`pet_table_pet_id`,`pet_table_trainer_table_trainer_id`,`pet_table_pet_breed_info_id`,`pet_table_product_table_product_id`),
  KEY `fk_customer_table_has_pet_table_pet_table1_idx` (`pet_table_pet_id`,`pet_table_trainer_table_trainer_id`,`pet_table_pet_breed_info_id`,`pet_table_product_table_product_id`),
  KEY `fk_customer_table_has_pet_table_customer_table1_idx` (`customer_table_cus_id`),
  CONSTRAINT `fk_customer_table_has_pet_table_customer_table1` FOREIGN KEY (`customer_table_cus_id`) REFERENCES `customer_table` (`cus_id`),
  CONSTRAINT `fk_customer_table_has_pet_table_pet_table1` FOREIGN KEY (`pet_table_pet_id`, `pet_table_trainer_table_trainer_id`, `pet_table_pet_breed_info_id`, `pet_table_product_table_product_id`) REFERENCES `pet_table` (`pet_id`, `trainer_table_trainer_id`, `pet_breed_info_id`, `product_table_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_table_has_pet_table`
--

LOCK TABLES `customer_table_has_pet_table` WRITE;
/*!40000 ALTER TABLE `customer_table_has_pet_table` DISABLE KEYS */;
INSERT INTO `customer_table_has_pet_table` VALUES (1,1,1,1,1),(2,2,2,2,2),(3,3,3,3,3),(4,4,4,4,4),(5,5,5,5,5),(6,6,6,6,6),(7,7,7,7,7),(8,8,8,8,8),(9,9,9,9,9),(10,10,10,10,10);
/*!40000 ALTER TABLE `customer_table_has_pet_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_table`
--

DROP TABLE IF EXISTS `doctor_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_table` (
  `doctor_id` int NOT NULL,
  `doctor_name` varchar(45) DEFAULT NULL,
  `primary_contact` varchar(20) DEFAULT NULL,
  `secondary_contact` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `pet_table_pet_id` int NOT NULL,
  `pet_table_trainer_table_trainer_id` int NOT NULL,
  `pet_table_pet_breed_info_id` int NOT NULL,
  `health_table_report_id` int NOT NULL,
  PRIMARY KEY (`doctor_id`,`pet_table_pet_id`,`pet_table_trainer_table_trainer_id`,`pet_table_pet_breed_info_id`,`health_table_report_id`),
  KEY `fk_doctor_table_pet_table1_idx` (`pet_table_pet_id`,`pet_table_trainer_table_trainer_id`,`pet_table_pet_breed_info_id`),
  KEY `fk_doctor_table_health_table1_idx` (`health_table_report_id`),
  CONSTRAINT `fk_doctor_table_health_table1` FOREIGN KEY (`health_table_report_id`) REFERENCES `health_table` (`report_id`),
  CONSTRAINT `fk_doctor_table_pet_table1` FOREIGN KEY (`pet_table_pet_id`, `pet_table_trainer_table_trainer_id`, `pet_table_pet_breed_info_id`) REFERENCES `pet_table` (`pet_id`, `trainer_table_trainer_id`, `pet_breed_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_table`
--

LOCK TABLES `doctor_table` WRITE;
/*!40000 ALTER TABLE `doctor_table` DISABLE KEYS */;
INSERT INTO `doctor_table` VALUES (1,'Dr. Smith','123-456-7890','988-634-3210','123 Main St.',1,1,1,1),(2,'Dr. Johnson','987-654-3210',NULL,'456 Elm St.',2,2,2,2),(3,'Dr. Williams','555-123-4567','313-404-5515','789 Oak St.',3,3,3,3),(4,'Dr. Lee','555-987-6543','411-505-6123','321 Pine St.',4,4,4,4),(5,'Dr. Brown','111-222-3333',NULL,'456 Maple St.',5,5,5,5),(6,'Dr. Patel','444-555-6666','766-234-9119','789 Cedar St.',6,6,6,6),(7,'Dr. Garcia','777-888-9999',NULL,'123 Elm St.',7,7,7,7),(8,'Dr. Kim','222-333-4444','422-231-6006','789 Pine St.',8,8,8,8),(9,'Dr. Nguyen','888-999-0000',NULL,'456 Oak St.',9,9,9,9),(10,'Dr. Clark','333-444-5555','122-200-3131','789 Elm St.',10,10,10,10);
/*!40000 ALTER TABLE `doctor_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `health_table`
--

DROP TABLE IF EXISTS `health_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `health_table` (
  `report_id` int NOT NULL,
  `health_report` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_table`
--

LOCK TABLES `health_table` WRITE;
/*!40000 ALTER TABLE `health_table` DISABLE KEYS */;
INSERT INTO `health_table` VALUES (1,'Good'),(2,'Excellent'),(3,'Good'),(4,'Fair'),(5,'Good'),(6,'Excellent'),(7,'Excellent'),(8,'Good'),(9,'Fair'),(10,'Excellent');
/*!40000 ALTER TABLE `health_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_table`
--

DROP TABLE IF EXISTS `location_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_table` (
  `city` varchar(19) NOT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_table`
--

LOCK TABLES `location_table` WRITE;
/*!40000 ALTER TABLE `location_table` DISABLE KEYS */;
INSERT INTO `location_table` VALUES ('brampton','mumbai'),('brantford','ontario'),('halifax','nova scotia'),('inuvik','northwest territories'),('jalandhar','punjab'),('moncton','new brunswick'),('vancouver','british columbia'),('warman','saskatchewan'),('whitehorse','yukon'),('winnipeg','manitoba');
/*!40000 ALTER TABLE `location_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_breed`
--

DROP TABLE IF EXISTS `pet_breed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_breed` (
  `info_id` int NOT NULL,
  `species` varchar(40) DEFAULT NULL,
  `breed` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_breed`
--

LOCK TABLES `pet_breed` WRITE;
/*!40000 ALTER TABLE `pet_breed` DISABLE KEYS */;
INSERT INTO `pet_breed` VALUES (1,'Dog','Labrador'),(2,'Cat','Siamese'),(3,'Dog','Bulldog'),(4,'Bird','Parrot'),(5,'Cat','Persian'),(6,'Dog','Poodle'),(7,'Hamster','Syrian'),(8,'Rabbit','Holland'),(9,'Fish','Goldfish'),(10,'Dog','Beagle');
/*!40000 ALTER TABLE `pet_breed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_table`
--

DROP TABLE IF EXISTS `pet_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pet_table` (
  `pet_id` int NOT NULL,
  `pet_name` varchar(45) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `selling_price` decimal(10,0) DEFAULT NULL,
  `date_of_purchase` date DEFAULT NULL,
  `trainer_table_trainer_id` int NOT NULL,
  `pet_breed_info_id` int NOT NULL,
  `product_table_product_id` int NOT NULL,
  PRIMARY KEY (`pet_id`,`trainer_table_trainer_id`,`pet_breed_info_id`,`product_table_product_id`),
  KEY `fk_pet_table_trainer_table_idx` (`trainer_table_trainer_id`),
  KEY `fk_pet_table_pet_breed1_idx` (`pet_breed_info_id`),
  KEY `fk_pet_table_product_table1_idx` (`product_table_product_id`),
  CONSTRAINT `fk_pet_table_pet_breed1` FOREIGN KEY (`pet_breed_info_id`) REFERENCES `pet_breed` (`info_id`),
  CONSTRAINT `fk_pet_table_product_table1` FOREIGN KEY (`product_table_product_id`) REFERENCES `product_table` (`product_id`),
  CONSTRAINT `fk_pet_table_trainer_table` FOREIGN KEY (`trainer_table_trainer_id`) REFERENCES `trainer_table` (`trainer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_table`
--

LOCK TABLES `pet_table` WRITE;
/*!40000 ALTER TABLE `pet_table` DISABLE KEYS */;
INSERT INTO `pet_table` VALUES (1,'Fluffy',3,5,100,'2023-01-05',1,1,1),(2,'Whiskers',2,3,80,'2023-02-10',2,2,2),(3,'Max',4,7,120,'2023-03-20',3,3,3),(4,'Mittens',1,2,90,'2023-04-15',4,4,4),(5,'Spike',2,4,30,'2023-05-12',5,5,5),(6,'Tweety',1,1,50,'2023-06-30',6,6,6),(7,'Nemo',1,2,15,'2023-07-25',7,7,7),(8,'Snowball',2,3,70,'2023-08-10',8,8,8),(9,'Shadow',3,6,110,'2023-09-05',9,9,9),(10,'Simba',5,1,500,'2023-10-20',10,10,10);
/*!40000 ALTER TABLE `pet_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_table`
--

DROP TABLE IF EXISTS `product_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_table` (
  `product_id` int NOT NULL,
  `product_name` varchar(45) DEFAULT NULL,
  `product_price` decimal(20,0) DEFAULT NULL,
  `product_stock` int DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `manufacture_date` date DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_table`
--

LOCK TABLES `product_table` WRITE;
/*!40000 ALTER TABLE `product_table` DISABLE KEYS */;
INSERT INTO `product_table` VALUES (1,'Dog Food',20,10,'2024-06-01','2023-12-15'),(2,'Cat Food',15,8,'2024-07-01','2023-11-20'),(3,'Dog Treats',10,15,'2024-09-01','2023-12-31'),(4,'Cat Litter',25,5,'2025-01-01','2023-03-10'),(5,'Hamster Food',5,20,'2024-12-01','2023-04-20'),(6,'Bird Seed',8,10,'2024-03-01','2023-06-01'),(7,'Fish Food',3,30,'2024-08-01','2023-07-10'),(8,'Rabbit Food',12,15,'2024-10-01','2023-08-15'),(9,'Dog Shampoo',18,10,'2025-02-01','2023-09-10'),(10,'Lion Toy',50,5,'2024-11-01','2023-10-25');
/*!40000 ALTER TABLE `product_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_table`
--

DROP TABLE IF EXISTS `supplier_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_table` (
  `supplier_id` int NOT NULL,
  `supplier_name` varchar(45) DEFAULT NULL,
  `received_pets` int DEFAULT NULL,
  `reviews` decimal(5,0) DEFAULT NULL,
  `sup_secondary_phone` varchar(30) DEFAULT NULL,
  `sup_primary_phone` varchar(30) DEFAULT NULL,
  `supplier_address` varchar(45) DEFAULT NULL,
  `location_table_city` varchar(19) NOT NULL,
  PRIMARY KEY (`supplier_id`,`location_table_city`),
  KEY `fk_supplier_table_location_table1_idx` (`location_table_city`),
  CONSTRAINT `fk_supplier_table_location_table1` FOREIGN KEY (`location_table_city`) REFERENCES `location_table` (`city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_table`
--

LOCK TABLES `supplier_table` WRITE;
/*!40000 ALTER TABLE `supplier_table` DISABLE KEYS */;
INSERT INTO `supplier_table` VALUES (1,'Pet Foods Co.',7,4,'777-888-9992','111-222-3033','89 Cayuga St.','brantford'),(2,'Healthy Pets',7,5,NULL,'444-555-6166','456 Sas St.','brampton'),(3,'Pet Treats Inc.',12,5,NULL,'777-888-9299','789 Elm St.','halifax'),(4,'Kitty Litter Co.',6,4,NULL,'222-333-4344','321 Cedar St.','vancouver'),(5,'Pet Food Mart',5,4,NULL,'888-999-0400','456 Oak St.','warman'),(6,'Bird Supplies',2,5,NULL,'333-444-1555','789 Pine St.','whitehorse'),(7,'Aquatic Pets',3,5,NULL,'555-666-7677','123 Nelson St.','winnipeg'),(8,'Bunny Treats',6,4,NULL,'666-777-8788','789 Maple St.','inuvik'),(9,'Pet Groomers',9,4,NULL,'999-000-1811','456 Colborne St.','moncton'),(10,'Lion King Inc.',2,5,NULL,'000-111-2922','789 Data St.','jalandhar');
/*!40000 ALTER TABLE `supplier_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_table_has_pet_table`
--

DROP TABLE IF EXISTS `supplier_table_has_pet_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_table_has_pet_table` (
  `supplier_table_supplier_id` int NOT NULL,
  `pet_table_pet_id` int NOT NULL,
  `pet_table_trainer_table_trainer_id` int NOT NULL,
  `pet_table_pet_breed_info_id` int NOT NULL,
  PRIMARY KEY (`supplier_table_supplier_id`,`pet_table_pet_id`,`pet_table_trainer_table_trainer_id`,`pet_table_pet_breed_info_id`),
  KEY `fk_supplier_table_has_pet_table_pet_table1_idx` (`pet_table_pet_id`,`pet_table_trainer_table_trainer_id`,`pet_table_pet_breed_info_id`),
  KEY `fk_supplier_table_has_pet_table_supplier_table1_idx` (`supplier_table_supplier_id`),
  CONSTRAINT `fk_supplier_table_has_pet_table_pet_table1` FOREIGN KEY (`pet_table_pet_id`, `pet_table_trainer_table_trainer_id`, `pet_table_pet_breed_info_id`) REFERENCES `pet_table` (`pet_id`, `trainer_table_trainer_id`, `pet_breed_info_id`),
  CONSTRAINT `fk_supplier_table_has_pet_table_supplier_table1` FOREIGN KEY (`supplier_table_supplier_id`) REFERENCES `supplier_table` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_table_has_pet_table`
--

LOCK TABLES `supplier_table_has_pet_table` WRITE;
/*!40000 ALTER TABLE `supplier_table_has_pet_table` DISABLE KEYS */;
INSERT INTO `supplier_table_has_pet_table` VALUES (1,1,1,1),(2,2,2,2),(3,3,3,3),(4,4,4,4),(5,5,5,5),(6,6,6,6),(7,7,7,7),(8,8,8,8),(9,9,9,9),(10,10,10,10);
/*!40000 ALTER TABLE `supplier_table_has_pet_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer_table`
--

DROP TABLE IF EXISTS `trainer_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer_table` (
  `trainer_id` int NOT NULL,
  `trainer_name` varchar(45) DEFAULT NULL,
  `trainer_age` varchar(45) DEFAULT NULL,
  `trainer_joining_date` date DEFAULT NULL,
  `trainer_fees` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`trainer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer_table`
--

LOCK TABLES `trainer_table` WRITE;
/*!40000 ALTER TABLE `trainer_table` DISABLE KEYS */;
INSERT INTO `trainer_table` VALUES (1,'John','30','2023-01-05','$50/hr'),(2,'Shakila','28','2023-02-10','$60/hr'),(3,'Ashwin','35','2023-03-20','$55/hr'),(4,'Shubham','32','2023-04-25','$45/hr'),(5,'Kamal','27','2023-05-15','$55/hr'),(6,'Dhaliwal','31','2023-06-30','$65/hr'),(7,'Jessica','29','2023-07-25','$50/hr'),(8,'Yagnik','33','2023-08-10','$55/hr'),(9,'Olivia','26','2023-09-05','$60/hr'),(10,'Sophia','30','2023-10-20','$50/hr');
/*!40000 ALTER TABLE `trainer_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-17 17:44:46
