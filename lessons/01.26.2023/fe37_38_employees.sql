-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: fe37_38
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int DEFAULT NULL,
  `first_name` text,
  `last_name` text,
  `email` text,
  `salary` int DEFAULT NULL,
  `department` text,
  `new_salary` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Steven','King','SKING',24000,'Sales',28800.00),(2,'Neena','Kochhar','NKOCHHAR',17000,'Sales',20400.00),(3,'Lex','De Haan','LDEHAAN',17000,'Sales',20400.00),(4,'Alexander','Hunold','AHUNOLD',9000,'Finance',10350.00),(5,'Bruce','Ernst','BERNST',6000,'Finance',6900.00),(6,'Valli','Pataballa','VPATABAL',4800,'Finance',5520.00),(7,'Diana','Lorentz','DIANALO',8800,'Finance',10120.00),(8,'Nancy','Greenberg','NGREENBE',12008,'Shipping',13208.80),(9,'Daniel','Faviet','DFAVIET',9000,'Shipping',9900.00),(10,'Jose Manuel','Urman','JMURMAN',7800,'Shipping',8580.00),(11,'Luis','Popp','LPOPP',6900,'Shipping',7590.00),(12,'Den','Raphaely','DRAPHEAL',11000,'Marketing',13750.00),(13,'Alexander','Khoo','AKHOO',3100,'Marketing',3875.00),(14,'Shelli','Baida','SBAIDA',2900,'Marketing',3625.00),(15,'Sigal','Tobias','STOBIAS',2800,'Marketing',3500.00),(16,'Matthew','Weiss','MWEISS',8000,'Human Resources',9600.00),(17,'Adam','Fripp','AFRIPP',8200,'Human Resources',9840.00),(18,'Payam','Kaufling','PKAUFLIN',7900,'Human Resources',9480.00),(19,'Shanta','Vollman','SVOLLMAN',6500,'Human Resources',7800.00),(20,'Kevin','Mourgos','KMOURGOS',5800,'Human Resources',6960.00),(21,'Julia','Nayer','JNAYER',3200,'Human Resources',3840.00),(22,'Adam','Markle','SMARKLE',2200,'Human Resources',2640.00),(23,'Laura','Bissot','LBISSOT',3300,'Human Resources',3960.00),(24,'Mozhe','Atkinson','MATKINSO',2800,'Human Resources',3360.00),(25,'Joshua','Patel','JPATEL',2500,'Human Resources',3000.00),(26,'Trenna','Rajs','TRAJS',3500,'Human Resources',4200.00),(27,'John','Russell','JRUSSEL',14000,'IT',18900.00),(28,'Karen','Partners','KPARTNER',13500,'IT',18225.00),(29,'Alberto','Errazuriz','AERRAZUR',12000,'IT',16200.00),(30,'Gerald','Cambrault','GCAMBRAU',11000,'IT',14850.00),(31,'Eleni','Zlotkey','EZLOTKEY',10500,'IT',14175.00),(32,'Adam','Vargas','PVARGAS',2500,'Human Resources',3000.00),(33,'Laura','Errazuriz','AERRAZUR',12000,'IT',16200.00),(1,'Steven','King','SKING',24000,'Sales',28800.00),(2,'Neena','Kochhar','NKOCHHAR',17000,'Sales',20400.00),(3,'Lex','De Haan','LDEHAAN',17000,'Sales',20400.00),(4,'Alexander','Hunold','AHUNOLD',9000,'Finance',10350.00),(5,'Bruce','Ernst','BERNST',6000,'Finance',6900.00),(6,'Valli','Pataballa','VPATABAL',4800,'Finance',5520.00),(7,'Diana','Lorentz','DIANALO',8800,'Finance',10120.00),(8,'Nancy','Greenberg','NGREENBE',12008,'Shipping',13208.80),(9,'Daniel','Faviet','DFAVIET',9000,'Shipping',9900.00),(10,'Jose Manuel','Urman','JMURMAN',7800,'Shipping',8580.00),(11,'Luis','Popp','LPOPP',6900,'Shipping',7590.00),(12,'Den','Raphaely','DRAPHEAL',11000,'Marketing',13750.00),(13,'Alexander','Khoo','AKHOO',3100,'Marketing',3875.00),(14,'Shelli','Baida','SBAIDA',2900,'Marketing',3625.00),(15,'Sigal','Tobias','STOBIAS',2800,'Marketing',3500.00),(16,'Matthew','Weiss','MWEISS',8000,'Human Resources',9600.00),(17,'Adam','Fripp','AFRIPP',8200,'Human Resources',9840.00),(18,'Payam','Kaufling','PKAUFLIN',7900,'Human Resources',9480.00),(19,'Shanta','Vollman','SVOLLMAN',6500,'Human Resources',7800.00),(20,'Kevin','Mourgos','KMOURGOS',5800,'Human Resources',6960.00),(21,'Julia','Nayer','JNAYER',3200,'Human Resources',3840.00),(22,'Adam','Markle','SMARKLE',2200,'Human Resources',2640.00),(23,'Laura','Bissot','LBISSOT',3300,'Human Resources',3960.00),(24,'Mozhe','Atkinson','MATKINSO',2800,'Human Resources',3360.00),(25,'Joshua','Patel','JPATEL',2500,'Human Resources',3000.00),(26,'Trenna','Rajs','TRAJS',3500,'Human Resources',4200.00),(27,'John','Russell','JRUSSEL',14000,'IT',18900.00),(28,'Karen','Partners','KPARTNER',13500,'IT',18225.00),(29,'Alberto','Errazuriz','AERRAZUR',12000,'IT',16200.00),(30,'Gerald','Cambrault','GCAMBRAU',11000,'IT',14850.00),(31,'Eleni','Zlotkey','EZLOTKEY',10500,'IT',14175.00),(32,'Adam','Vargas','PVARGAS',2500,'Human Resources',3000.00),(33,'Laura','Errazuriz','AERRAZUR',12000,'IT',16200.00);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-26 10:20:18
