-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: shareit
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `downloadlog`
--

DROP TABLE IF EXISTS `downloadlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `downloadlog` (
  `fname` varchar(100) NOT NULL,
  `ubyid` varchar(10) NOT NULL,
  `userid` varchar(10) NOT NULL,
  `ddate` varchar(10) DEFAULT NULL,
  `dtime` varchar(10) DEFAULT NULL,
  `ftype` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `downloadlog`
--

LOCK TABLES `downloadlog` WRITE;
/*!40000 ALTER TABLE `downloadlog` DISABLE KEYS */;
INSERT INTO `downloadlog` VALUES ('47297.png','1002','1002','26/01/2020','16:12:07','png'),('71840.jpg','1006','1005','26/01/2020','23:28:28','jpg');
/*!40000 ALTER TABLE `downloadlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginlog`
--

DROP TABLE IF EXISTS `loginlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loginlog` (
  `userid` varchar(20) NOT NULL,
  `date` varchar(11) DEFAULT NULL,
  `time` varchar(10) DEFAULT NULL,
  `counter` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginlog`
--

LOCK TABLES `loginlog` WRITE;
/*!40000 ALTER TABLE `loginlog` DISABLE KEYS */;
INSERT INTO `loginlog` VALUES ('1002','26/01/2020','23:27:04',42),('1003','25/01/2020','22:05:18',18),('1004','26/01/2020','23:27:43',12),('1005','26/01/2020','23:28:21',17),('1006','26/01/2020','14:58:14',17),('1007','26/01/2020','13:12:48',16),('1008','25/01/2020','22:22:29',4),('1045','26/01/2020','12:26:29',5);
/*!40000 ALTER TABLE `loginlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `userid` varchar(20) NOT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES ('1002',1),('1003',0),('1004',1),('1005',1),('1006',1),('1007',1),('1008',0),('1045',1);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissionslog`
--

DROP TABLE IF EXISTS `permissionslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissionslog` (
  `srno` int(11) NOT NULL,
  `userid` varchar(10) NOT NULL,
  `givep` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `srno` (`srno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissionslog`
--

LOCK TABLES `permissionslog` WRITE;
/*!40000 ALTER TABLE `permissionslog` DISABLE KEYS */;
INSERT INTO `permissionslog` VALUES (1,'1002','|5|6|8|'),(2,'1003','|1|3|5|4|6|7|'),(3,'1004','|2|5|4|7|'),(4,'1005','|7|'),(6,'1006','|1|4|7|8|'),(5,'1007','|4|'),(7,'1008','|'),(8,'1045','|6|1|');
/*!40000 ALTER TABLE `permissionslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploads`
--

DROP TABLE IF EXISTS `uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uploads` (
  `userid` varchar(10) DEFAULT NULL,
  `fname` varchar(100) NOT NULL,
  `udate` varchar(10) DEFAULT NULL,
  `utime` varchar(10) DEFAULT NULL,
  `ftype` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`fname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploads`
--

LOCK TABLES `uploads` WRITE;
/*!40000 ALTER TABLE `uploads` DISABLE KEYS */;
INSERT INTO `uploads` VALUES ('1002','47297.png','26/01/2020','12:23:55','png'),('1004','47438.png','26/01/2020','12:24:32','png'),('1002','570566.jpg','26/01/2020','16:14:13','jpg'),('1005','57496.png','26/01/2020','12:25:06','png'),('1006','71840.jpg','26/01/2020','12:25:29','jpg'),('1007','72691.png','26/01/2020','12:25:50','png'),('1045','72695.png','26/01/2020','12:26:28','png');
/*!40000 ALTER TABLE `uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userid` varchar(10) NOT NULL,
  `pswd` varchar(30) NOT NULL,
  `usernm` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `mobile` varchar(13) DEFAULT NULL,
  `emailid` varchar(40) DEFAULT NULL,
  `usertype` varchar(10) DEFAULT 'member',
  `secques` varchar(100) DEFAULT NULL,
  `answer` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  CONSTRAINT `users_chk_1` CHECK ((`mobile` >= 10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1001','chirag123','Chirag',19,'male','9348923679','chiragkashikar505@gmail.com','admin',NULL,NULL),('1002','unknown123','Unknown',19,'male','9263576342','unknown123@gmail.com','member','Which is your favorite tourist destination?','Kashmir'),('1003','karan123','Karan',20,'male','8537486432','karan786@gmail.com','member','What is your birth place?','fgjjgkg'),('1004','anmol123','Anmol',20,'male','4754389453','anmol619@gmail.com','member','Who is your favorite filmstar?','lykitgdj'),('1005','shubhashish123','Shubhashish',21,'male','8543684379','shubhashish@gmail.com','member','Which color do you like the most?','otfiysd'),('1006','purva123','Purva',19,'female','9358434689','purva.04@gmail.com','member','What is your birth place?','wtrjsfg'),('1007','aniket123','Aniket',21,'male','7435798732','beingeche@gmail.com','member','Who is your favorite filmstar?','yfkjigdk'),('1008','ashutosh123','Ashutosh',22,'male','5493647982','ashutosh@gmail.com','member','Who is your favorite filmstar?','rtigfuoklhjl'),('1045','rohit123','Rohit Sharma',28,'male','9235653211','rohitsharma45@gmail.com','member','Which is your favorite tourist destination?','eyrurysyd');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'shareit'
--

--
-- Dumping routines for database 'shareit'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-27 22:33:41
