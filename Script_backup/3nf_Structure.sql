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

-- Dump completed on 2024-04-17 17:45:33
