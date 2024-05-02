-- MySQL dump 10.13  Distrib 8.3.0, for Win64 (x86_64)
--
-- Host: localhost    Database: testDB
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `budget`
--

DROP TABLE IF EXISTS `budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budget` (
  `budgetID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `budgetCategory` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`budgetID`),
  KEY `username` (`username`),
  CONSTRAINT `budget_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budget`
--

LOCK TABLES `budget` WRITE;
/*!40000 ALTER TABLE `budget` DISABLE KEYS */;
INSERT INTO `budget` VALUES (1,'user1',1500.00,NULL),(2,'user2',2000.00,NULL),(3,'user3',1800.00,NULL),(4,'user4',2100.00,NULL),(5,'user5',2300.00,NULL),(6,'user6',2400.00,NULL),(7,'user7',2500.00,NULL),(8,'user8',2600.00,NULL),(9,'user9',2700.00,NULL),(10,'user10',2800.00,NULL),(11,'user11',2900.00,'Groceries'),(12,'user12',3000.00,'Groceries'),(13,'user13',3100.00,NULL),(14,'user14',3200.00,NULL),(15,'user15',3300.00,NULL),(16,'user16',3400.00,NULL),(17,'user17',3500.00,NULL),(18,'user18',3600.00,NULL),(19,'user19',3700.00,NULL),(20,'user20',3800.00,NULL);
/*!40000 ALTER TABLE `budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `expenseID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `expenseCategory` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`expenseID`),
  KEY `username` (`username`),
  CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` VALUES (1,'user1','2023-04-01',100.00,NULL),(2,'user2','2023-04-02',150.50,NULL),(3,'user3','2023-04-03',200.75,NULL),(4,'user4','2023-04-04',250.00,NULL),(5,'user5','2023-04-05',300.25,NULL),(6,'user6','2023-04-06',350.50,NULL),(7,'user7','2023-04-07',400.75,NULL),(8,'user8','2023-04-08',450.00,NULL),(9,'user9','2023-04-09',500.25,NULL),(10,'user10','2023-04-10',550.50,NULL),(11,'user11','2023-04-11',600.75,'Groceries'),(12,'user12','2023-04-12',650.00,'Groceries'),(13,'user13','2023-04-13',700.25,'Groceries'),(14,'user14','2023-04-14',750.50,NULL),(15,'user15','2023-04-15',800.75,NULL),(16,'user16','2023-04-16',850.00,NULL),(17,'user17','2023-04-17',900.25,NULL),(18,'user18','2023-04-18',950.50,NULL),(19,'user19','2023-04-19',1000.75,NULL),(20,'user20','2023-04-20',1050.00,NULL);
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income`
--

DROP TABLE IF EXISTS `income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `income` (
  `incomeID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`incomeID`),
  KEY `username` (`username`),
  CONSTRAINT `income_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income`
--

LOCK TABLES `income` WRITE;
/*!40000 ALTER TABLE `income` DISABLE KEYS */;
INSERT INTO `income` VALUES (1,'user1','Salary',3000.00),(2,'user2','Investment',1200.00),(3,'user3','Freelance',800.00),(4,'user4','Salary',3200.00),(5,'user5','Investment',1500.00),(6,'user6','Freelance',950.00),(7,'user7','Salary',2800.00),(8,'user8','Investment',1100.00),(9,'user9','Freelance',700.00),(10,'user10','Salary',3500.00),(11,'user11','Investment',1600.00),(12,'user12','Freelance',1000.00),(13,'user13','Salary',3100.00),(14,'user14','Investment',1300.00),(15,'user15','Freelance',850.00),(16,'user16','Salary',3300.00),(17,'user17','Investment',1400.00),(18,'user18','Freelance',900.00),(19,'user19','Salary',2900.00),(20,'user20','Investment',1700.00);
/*!40000 ALTER TABLE `income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loans` (
  `loanID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `loanType` varchar(255) DEFAULT NULL,
  `loanAmount` decimal(10,2) DEFAULT NULL,
  `interest` decimal(5,2) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `balanceAmount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`loanID`),
  KEY `username` (`username`),
  CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
INSERT INTO `loans` VALUES (1,'user1','Personal',5000.00,5.50,'2023-01-01','2024-01-01',2500.00),(2,'user2','Mortgage',150000.00,3.50,'2023-02-01','2043-02-01',148000.00),(3,'user3','Auto',20000.00,4.00,'2023-03-01','2028-03-01',19000.00),(4,'user4','Personal',10000.00,5.00,'2023-04-01','2025-04-01',7500.00),(5,'user5','Mortgage',200000.00,3.20,'2023-05-01','2043-05-01',198000.00),(6,'user6','Auto',25000.00,4.50,'2023-06-01','2029-06-01',24000.00),(7,'user7','Personal',7000.00,6.00,'2023-07-01','2026-07-01',6500.00),(8,'user8','Mortgage',180000.00,3.80,'2023-08-01','2043-08-01',179000.00),(9,'user9','Auto',15000.00,4.20,'2023-09-01','2027-09-01',14500.00),(10,'user10','Personal',8500.00,5.70,'2023-10-01','2024-10-01',4250.00),(11,'user11','Student!',1.00,4.00,'2023-11-01','2043-11-01',1000.00),(12,'user12','Student',30000.00,4.80,'2023-12-01','2030-12-01',29500.00),(13,'user13','Personal',9500.00,6.50,'2024-01-01','2027-01-01',9000.00),(14,'user14','Mortgage',250000.00,2.90,'2024-02-01','2044-02-01',248500.00),(15,'user15','Auto',10000.00,4.40,'2024-03-01','2028-03-01',9500.00),(16,'user16','Personal',12000.00,5.20,'2024-04-01','2026-04-01',11000.00),(17,'user17','Mortgage',160000.00,3.60,'2024-05-01','2044-05-01',159000.00),(18,'user18','Auto',18000.00,3.90,'2024-06-01','2029-06-01',17500.00),(19,'user19','Personal',11000.00,5.90,'2024-07-01','2025-07-01',5500.00),(20,'user20','Mortgage',140000.00,3.30,'2024-08-01','2044-08-01',139000.00),(21,'user12','Student',12000.00,12.00,NULL,NULL,10000.00),(22,'user12','Student',12000.00,12.00,NULL,NULL,10000.00),(23,'user12','Student',12000.00,12.00,NULL,NULL,10000.00),(24,'user12','Student',12000.00,12.00,NULL,NULL,10000.00),(25,'user12','Student',12000.00,12.00,NULL,NULL,10000.00),(26,'user11','Personal',12000.00,12.00,'2022-12-12','2022-12-12',10000.00),(27,'user12','Student',12000.00,3.10,'2022-12-12','2022-12-12',219000.00);
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transactionID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`transactionID`),
  KEY `username` (`username`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,'user1','2023-04-01',100.00,'Credit Card'),(2,'user2','2023-04-02',150.50,'Debit Card'),(3,'user3','2023-04-03',200.75,'Cash'),(4,'user4','2023-04-04',250.00,'Online Payment'),(5,'user5','2023-04-05',300.25,'Credit Card'),(6,'user6','2023-04-06',350.50,'Debit Card'),(7,'user7','2023-04-07',400.75,'Cash'),(8,'user8','2023-04-08',450.00,'Online Payment'),(9,'user9','2023-04-09',500.25,'Credit Card'),(10,'user10','2023-04-10',550.50,'Debit Card'),(11,'user11','2023-04-11',600.75,'Cash'),(12,'user12','2023-04-12',650.00,'Online Payment'),(13,'user13','2023-04-13',700.25,'Credit Card'),(14,'user14','2023-04-14',750.50,'Debit Card'),(15,'user15','2023-04-15',800.75,'Cash'),(16,'user16','2023-04-16',850.00,'Online Payment'),(17,'user17','2023-04-17',900.25,'Credit Card'),(18,'user18','2023-04-18',950.50,'Debit Card'),(19,'user19','2023-04-19',1000.75,'Cash'),(20,'user20','2023-04-20',1050.00,'Online Payment');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `userType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('user1','password1','iamuser1@vt.edu','admin'),('user10','password10','ilove@vt.edu','admin'),('user11','password11','tihut@vt.edu','user'),('user12','password12','ilove@vt.edu','user'),('user13','password13','user13@example.com','admin'),('user14','password14','user14@example.com','user'),('user15','password15','user15@example.com','user'),('user16','password16','user16@example.com','admin'),('user17','password17','user17@example.com','user'),('user18','password18','user18@example.com','user'),('user19','password19','user19@example.com','admin'),('user2','password2','user2@example.com','user'),('user20','password20','user20@example.com','user'),('user3','password3','user3@example.com','user'),('user4','password4','user4@example.com','admin'),('user5','password5','user5@example.com','user'),('user6','password6','user6@example.com','user'),('user7','password7','user7@example.com','admin'),('user8','password8','user8@example.com','user'),('user9','password9','user9@example.com','user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-30 19:59:57
