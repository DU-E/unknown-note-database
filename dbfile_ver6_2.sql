CREATE DATABASE  IF NOT EXISTS `diary_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `diary_db`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: diary_db
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
-- Table structure for table `diary`
--

DROP TABLE IF EXISTS `diary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diary` (
  `diary_id` int NOT NULL AUTO_INCREMENT,
  `d_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `d_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `d_tag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'empty',
  `user_id` int NOT NULL,
  `openable` int DEFAULT '1',
  PRIMARY KEY (`diary_id`),
  KEY `fk_d_userid` (`user_id`),
  CONSTRAINT `fk_d_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diary`
--

LOCK TABLES `diary` WRITE;
/*!40000 ALTER TABLE `diary` DISABLE KEYS */;
INSERT INTO `diary` VALUES (1,'test content!','2024-02-04 04:32:07','happy',1,1),(2,'blah balh @@3#','2024-02-04 04:40:46','sad',1,1),(3,'ehoeheoheoho  ef#','2024-02-04 04:42:16','love',2,1),(4,'java fukin good  ef#','2024-02-04 04:43:17','love',3,1),(5,'java fukin 안녕  ef#','2024-02-04 04:54:02','sad',3,0),(6,'하하 ahah !! @@##','2024-02-04 05:35:57','happy',1,1),(7,'일기 내용임. 민재진양입니다 MinJAEGINYANG','2024-02-04 08:06:31','happy',1,1),(8,'일기 내용임. 222','2024-02-05 03:40:50','happy',1,1),(9,'일기 by user 2','2024-02-18 00:49:43','happy',2,1),(10,'일기일기일리기기 일기 by user 2','2024-02-18 01:11:58','happy',2,1),(11,'일기내용일개뇽 일기 by user 2','2024-02-18 02:54:17','happy',2,1),(12,'일기 수정 테스트 1111 by user 111dkdkdkdkdkdk1','2024-02-25 00:48:16','happy',1,1),(13,'일기 수정 테스트 1 by user 1','2024-03-03 05:13:28','happy',1,0),(14,'diary 테스트 after merge 일기 by user 11111','2024-03-13 02:44:48','happy',1,1),(15,'일기 수정 테스트 after 머지 수정수 by user 111dkdkdkdkdkdk1','2024-03-28 14:21:56','happy',1,1),(16,'민형버전 일기수정 by user 1','2024-04-01 06:26:57','happy',1,1);
/*!40000 ALTER TABLE `diary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essay`
--

DROP TABLE IF EXISTS `essay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `essay` (
  `essay_id` int NOT NULL AUTO_INCREMENT,
  `e_title` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'empty',
  `e_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `e_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `e_likes` int DEFAULT '0',
  `e_category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'empty',
  `user_id` int NOT NULL,
  `openable` int DEFAULT '1',
  PRIMARY KEY (`essay_id`),
  KEY `fk_e_userid` (`user_id`),
  CONSTRAINT `fk_e_userid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essay`
--

LOCK TABLES `essay` WRITE;
/*!40000 ALTER TABLE `essay` DISABLE KEYS */;
INSERT INTO `essay` VALUES
(1, 'Spring Framework Introduction', 'This is a sample content for Spring Framework.', '2024-03-14 12:00:00', 1, 'novel', 0,1),
(2, 'AI in Modern World', 'This is a sample content for AI in Modern World.', '2024-03-14 12:10:00', 1, 'whisper', 1, 1),
(3, 'The Beauty of Nature', 'This is a sample content for The Beauty of Nature.', '2024-03-14 12:20:00', 0, 'poem', 2, 1),
(4, 'Technology and Society', 'This is a sample content for Technology and Society.', '2024-03-14 12:30:00', 0, 'novel', 3, 1),
(5, 'Exploring Spring Boot', 'This is a sample content for Exploring Spring Boot.', '2024-03-14 12:40:00', 0, 'whisper', 1, 1),
(6, 'Understanding AI Models', 'This is a sample content for Understanding AI Models.', '2024-03-14 12:50:00', 0, 'poem', 2, 1),
(7, 'Nature Conservation Efforts', 'This is a sample content for Nature Conservation Efforts.', '2024-03-14 13:00:00', 0, 'novel', 3, 1),
(8, 'Societal Impacts of Technology', 'This is a sample content for Societal Impacts of Technology.', '2024-03-14 13:10:00', 0, 'whisper', 0, 1),
(9, 'Advanced Spring Boot Features', 'This is a sample content for Advanced Spring Boot Features.', '2024-03-14 13:20:00', 0, 'poem', 1, 1),
(10, 'AI Ethics and Society', 'This is a sample content for AI Ethics and Society.', '2024-03-14 13:30:00', 0, 'novel', 2, 1);
/*!40000 ALTER TABLE `essay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essay_subscribe`
--

DROP TABLE IF EXISTS `essay_subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `essay_subscribe` (
  `user_id` int NOT NULL,
  `following_essay` int DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `fk_es_followingessay` (`following_essay`),
  CONSTRAINT `essay_subscribe_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_es_followingessay` FOREIGN KEY (`following_essay`) REFERENCES `essay` (`essay_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essay_subscribe`
--

LOCK TABLES `essay_subscribe` WRITE;
/*!40000 ALTER TABLE `essay_subscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `essay_subscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '유저 고유구별자',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'empty' COMMENT '익명',
  `birth` int DEFAULT '0' COMMENT '000423 형태',
  `gender` int DEFAULT '0' COMMENT '남자는 0, 여자는 1',
  `made_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '유저 회원가입 시간',
  `social_id` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'empty',
  `introduction` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'empty',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'empty',
  `profile_img_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'empty',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='가입 유저 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'testnickname',20000423,3,'2024-01-20 03:35:03','tombos9877@gmail.com','intro','google',NULL),(2,'testnickname2',20000501,4,'2024-02-04 04:38:27','sdsds@naver.com','don\'t touch','naver',NULL),(3,'testnickname3',20000501,4,'2024-02-04 04:38:43','sdsds@naver.com','don\'t touch','naver',NULL),(4,'testnickname4',20000501,4,'2024-02-04 04:39:26','sdsds@naver.com','don\'t touch','kakao',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_subscribe`
--

DROP TABLE IF EXISTS `user_subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_subscribe` (
  `user_id` int NOT NULL,
  `following_id` int DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `fk_us_followingid` (`following_id`),
  CONSTRAINT `fk_us_followingid` FOREIGN KEY (`following_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `user_subscribe_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_subscribe`
--

LOCK TABLES `user_subscribe` WRITE;
/*!40000 ALTER TABLE `user_subscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_subscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uservieweddiaries`
--

DROP TABLE IF EXISTS `uservieweddiaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uservieweddiaries` (
  `user_id` int NOT NULL,
  `diary_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`diary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uservieweddiaries`
--

LOCK TABLES `uservieweddiaries` WRITE;
/*!40000 ALTER TABLE `uservieweddiaries` DISABLE KEYS */;
INSERT INTO `uservieweddiaries` VALUES (1,7),(1,8),(1,9),(1,10),(1,14),(1,15),(1,16),(2,10),(2,11),(2,12),(2,13);
/*!40000 ALTER TABLE `uservieweddiaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userviewedessay`
--

DROP TABLE IF EXISTS `userviewedessay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userviewedessay` (
  `user_id` int NOT NULL,
  `essay_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`essay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userviewedessay`
--

LOCK TABLES `userviewedessay` WRITE;
/*!40000 ALTER TABLE `userviewedessay` DISABLE KEYS */;
/*!40000 ALTER TABLE `userviewedessay` ENABLE KEYS */;
UNLOCK TABLES;

CREATE TABLE `user_liked_essays` (
  `user_id` int NOT NULL,
  `essay_id` int NOT NULL,
  PRIMARY KEY (`user_id`, `essay_id`),
  FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  FOREIGN KEY (`essay_id`) REFERENCES `essay` (`essay_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping events for database 'diary_db'
--

--
-- Dumping routines for database 'diary_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-05 15:14:53
