-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: bookslib
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authority` varchar(45) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_authorities_users_idx` (`id_user`),
  CONSTRAINT `fk_authorities_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES (1,'ROLE_ADMIN',1),(2,'ROLE_USER',2),(3,'ROLE_USER',3),(4,'ROLE_USER',4),(5,'ROLE_USER',5);
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `text` text NOT NULL,
  `author` varchar(45) NOT NULL,
  `year` varchar(45) NOT NULL,
  `id_category` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_books_category_id` (`id_category`),
  CONSTRAINT `fk_books_category` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'ОС','без описания','без автора','2015',2,'http://www.books4all.ru/cover/614.jpg'),(2,'Основы java программирования','Java полное руководство','Герберт Шилдт','2016',1,'https://ozon-st.cdn.ngenix.net/multimedia/1011607354.jpg'),(3,'Программирование на Java для начинающих','Книга \"Программирование на Java для начинающих\" является исчерпывающим руководством для того, чтобы научиться программировать ','Майк МакГрат','2016',1,'https://ozon-st.cdn.ngenix.net/multimedia/1014559170.jpg'),(6,'Изучаем Java EE 7','Java Enterprise Edition (Java EE) остается одной из ведущих технологий и платформ на основе Java','Энтони Гонсалвес','2016',1,'https://ozon-st.cdn.ngenix.net/multimedia/1010335961.jpg'),(7,'Java 8 для чайников','Java — современный объектно-ориентированный язык программирования','Барри Берд','2015',1,'https://ozon-st.cdn.ngenix.net/multimedia/1011541110.jpg'),(8,'Java 2. Библиотека профессионала. Том 1','Книга ведущих специалистов по программированию на языке Java представляет собой обновленное издание фундаментального труда','Кей С. Хорстманн, Гари Корнелл','2010',1,'https://ozon-st.cdn.ngenix.net/multimedia/1000739159.jpg'),(9,'Компьютерные сети. Принципы, технологии','Пятое издание одного из лучших российских учебников по сетевым технологиям','Виктор Олифер, Наталия Олифер','2016',4,'https://ozon-st.cdn.ngenix.net/multimedia/1013458180.jpg'),(10,'Компьютерные сети','Перед вами - очередное, пятое издание самой авторитетной книги по современным сетевым технологиям','Эндрю Таненбаум, Дэвид Уэзеролл','2016',4,'https://ozon-st.cdn.ngenix.net/multimedia/1014435959.jpg'),(11,'IPv6. Администрирование сетей','На протяжении почти десяти лет IPv6 готовился к выходу \"в самом ближайшем будущем','Найэл Ричард Мэрфи, Дэвид Мэлоун','2007',4,'https://ozon-st.cdn.ngenix.net/multimedia/1000424802.jpg'),(12,'Администрирование VMware vSphere 5','Книга посвящена вопросу работы с семейством продуктов VMware vSphere 5.','Михаил Михеев','2016',4,'https://ozon-st.cdn.ngenix.net/multimedia/1014310796.jpg');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Программирование'),(2,'Операционные системы'),(3,'Веб-дизайн'),(4,'Компьютерные сети');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `patronimyc` varchar(45) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','Zaur','Zaurov','Zaurovich',1),(2,'user','user','Testov','Test','Testovich',1),(3,'zaur','zaur','Эльбукаев','Заур','Хусейнович',1),(4,'login','login,gfdgdf','login,sdfds','login,sdfsdf','login,dfgfd',1),(5,'a','a','a','a','a',1);
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

-- Dump completed on 2017-02-15 10:49:50
