-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: smms
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `roll_number` int NOT NULL,
  `full_name` varchar(69) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`roll_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (101,'Ganesh','Male','2004-12-09','6303834776','Ganesh62@gmail.com','venky40'),(102,'chetan','Male','2004-08-24','7687656542','chetan@075gmail.com','chetan20'),(103,'preetham','Male','2003-12-15','9886578946','preetham086@gmail.com','preetham30'),(104,'parasara','Male','2005-10-10','6890576357','parasara17@gmail.com','parasara40'),(65896,'chaiyh','male','2025-12-09','9886449','Ganesh62@gmail.com','587353'),(475869,'syed yash','Male','2020-07-09','49969916497','yash12@gmail.com','5');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_marks`
--

DROP TABLE IF EXISTS `student_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_marks` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `exam_type` varchar(34) DEFAULT NULL,
  `exam_year` int DEFAULT NULL,
  `sub1` int DEFAULT NULL,
  `sub2` int DEFAULT NULL,
  `sub3` int DEFAULT NULL,
  `sub4` int DEFAULT NULL,
  `sub5` int DEFAULT NULL,
  `sub6` int DEFAULT NULL,
  `total_marks` int DEFAULT NULL,
  `percentage` decimal(5,0) DEFAULT NULL,
  `grade` varchar(20) DEFAULT NULL,
  `result` varchar(10) DEFAULT NULL,
  `roll_number` int DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `roll_number_idx` (`roll_number`),
  CONSTRAINT `roll_number` FOREIGN KEY (`roll_number`) REFERENCES `student` (`roll_number`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_marks`
--

LOCK TABLES `student_marks` WRITE;
/*!40000 ALTER TABLE `student_marks` DISABLE KEYS */;
INSERT INTO `student_marks` VALUES (37,'sem1',2024,94,54,76,58,86,89,457,76,'A-Grade','Pass',101),(38,'sem1',2022,98,80,57,89,69,80,473,79,'A-Grade','Pass',102),(39,'sem2',2022,98,56,49,70,59,72,404,67,'B-Grade','Pass',103),(40,'sem 2',2021,100,56,78,98,89,86,507,85,'A-Grade','Pass',104),(58,'sem1',2024,65,64,59,78,85,89,440,73,'B-Grade','Pass',101),(59,'sem2',2025,53,36,98,54,74,56,371,62,'C-Grade','Pass',475869),(60,'sem3',204,56,69,36,89,45,49,344,57,'C-Grade','Pass',65896),(63,'sem1',2014,54,65,89,89,87,56,440,73,'B-Grade','Pass',101);
/*!40000 ALTER TABLE `student_marks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-26 17:28:07
