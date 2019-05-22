-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: test_web_development
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

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
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2019-03-14 00:21:20','2019-03-14 00:21:20');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `supercategory_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_categories_on_supercategory_id` (`supercategory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'1',NULL,'2019-05-14 13:33:00','2019-05-14 13:33:00'),(2,'1.1',1,'2019-05-14 13:33:52','2019-05-14 13:33:52'),(3,'1.1.1',2,'2019-05-15 13:18:43','2019-05-15 13:18:43'),(4,'1.2',1,'2019-05-16 07:40:32','2019-05-16 07:40:32');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_entries_on_product_id` (`product_id`),
  KEY `index_entries_on_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (10,9,6,'2019-05-19 11:04:45','2019-05-19 11:04:52',4,2220),(11,1,7,'2019-05-19 11:27:14','2019-05-19 11:32:04',3,333),(14,9,8,'2019-05-19 20:57:02','2019-05-19 20:57:25',7,3885),(15,8,8,'2019-05-19 20:58:41','2019-05-19 20:58:41',1,NULL),(18,1,6,'2019-05-22 11:38:24','2019-05-22 11:38:35',5,555),(19,8,6,'2019-05-22 11:38:50','2019-05-22 11:38:56',1,145),(20,8,11,'2019-05-22 11:39:57','2019-05-22 11:40:08',6,870);
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `completed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_orders_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,13,NULL,'2019-05-19 09:49:28','2019-05-19 09:49:28',NULL),(2,13,NULL,'2019-05-19 09:50:03','2019-05-19 09:50:03',NULL),(3,13,NULL,'2019-05-19 09:51:26','2019-05-19 09:51:26',NULL),(4,13,NULL,'2019-05-19 09:51:51','2019-05-19 09:51:51',NULL),(6,13,NULL,'2019-05-19 11:04:45','2019-05-19 11:04:52',1),(7,14,NULL,'2019-05-19 11:27:14','2019-05-19 11:32:04',1),(8,NULL,NULL,'2019-05-19 11:41:09','2019-05-19 20:57:25',1),(11,13,NULL,'2019-05-22 11:39:57','2019-05-22 11:40:08',1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pers`
--

DROP TABLE IF EXISTS `pers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pers`
--

LOCK TABLES `pers` WRITE;
/*!40000 ALTER TABLE `pers` DISABLE KEYS */;
INSERT INTO `pers` VALUES (1,'2019-03-14 00:47:06','2019-03-14 00:47:06','ass');
/*!40000 ALTER TABLE `pers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_products_on_category_id` (`category_id`),
  CONSTRAINT `fk_rails_fb915499a4` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'2019-05-14 13:40:29','2019-05-16 10:15:18',3,'Test1',111),(6,'2019-05-16 12:02:32','2019-05-16 12:03:02',3,'jopa',123),(7,'2019-05-16 12:03:26','2019-05-16 12:03:35',3,'555',125),(8,'2019-05-18 12:14:24','2019-05-18 12:14:42',4,'Test1',145),(9,'2019-05-18 12:15:46','2019-05-18 12:17:25',3,'1547',555),(10,'2019-05-18 12:17:48','2019-05-18 12:18:01',3,'765',123),(11,'2019-05-18 12:19:30','2019-05-18 12:19:54',3,'Test123',444),(14,'2019-05-20 10:33:19','2019-05-20 10:33:19',1,NULL,NULL),(15,'2019-05-20 10:33:27','2019-05-20 10:33:27',1,NULL,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `properties` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_properties_on_category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (1,3,'2019-05-14 13:42:18','2019-05-16 08:22:11','testP','StringProperty'),(2,4,'2019-05-16 07:40:49','2019-05-16 08:57:01',NULL,'StringProperty'),(3,3,'2019-05-15 16:02:22','2019-05-16 08:22:11','h','IntegerProperty'),(4,3,'2019-05-14 14:12:17','2019-05-16 08:22:11','prop2','StringProperty');
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_values`
--

DROP TABLE IF EXISTS `property_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property_values` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `property_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_property_values_on_property_id` (`property_id`),
  KEY `index_property_values_on_product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_values`
--

LOCK TABLES `property_values` WRITE;
/*!40000 ALTER TABLE `property_values` DISABLE KEYS */;
INSERT INTO `property_values` VALUES (13,1,NULL,'2019-05-16 07:50:31','2019-05-16 07:50:31','StringValue','123'),(14,3,NULL,'2019-05-16 07:50:31','2019-05-16 07:50:31','IntegerValue','231'),(15,4,NULL,'2019-05-16 07:50:31','2019-05-16 07:50:31','StringValue','5'),(16,1,NULL,'2019-05-16 08:50:22','2019-05-16 08:50:22','StringValue',''),(17,3,NULL,'2019-05-16 08:50:22','2019-05-16 08:50:22','IntegerValue',''),(18,4,NULL,'2019-05-16 08:50:22','2019-05-16 08:50:22','StringValue',''),(19,2,NULL,'2019-05-16 08:57:50','2019-05-16 08:57:50','StringValue',''),(21,1,NULL,'2019-05-16 08:59:30','2019-05-16 08:59:30','StringValue','1'),(22,3,NULL,'2019-05-16 08:59:30','2019-05-16 08:59:30','IntegerValue','2'),(23,4,NULL,'2019-05-16 08:59:30','2019-05-16 08:59:30','StringValue','3'),(24,2,NULL,'2019-05-16 08:59:36','2019-05-16 08:59:36','StringValue',''),(25,2,NULL,'2019-05-16 09:00:24','2019-05-16 09:00:24','StringValue',''),(26,2,NULL,'2019-05-16 09:00:25','2019-05-16 09:00:25','StringValue',''),(27,2,NULL,'2019-05-16 09:00:33','2019-05-16 09:00:33','StringValue',''),(29,1,NULL,'2019-05-16 09:10:20','2019-05-16 09:10:20','StringValue',''),(30,3,NULL,'2019-05-16 09:10:20','2019-05-16 09:10:20','IntegerValue',''),(31,4,NULL,'2019-05-16 09:10:20','2019-05-16 09:10:20','StringValue',''),(32,2,NULL,'2019-05-16 09:10:47','2019-05-16 09:10:47','StringValue',''),(34,1,NULL,'2019-05-16 09:15:03','2019-05-16 09:15:03','StringValue',''),(35,3,NULL,'2019-05-16 09:15:03','2019-05-16 09:15:03','IntegerValue',''),(36,4,NULL,'2019-05-16 09:15:03','2019-05-16 09:15:03','StringValue',''),(60,1,1,'2019-05-16 10:03:49','2019-05-16 10:03:55','StringValue','5'),(61,3,1,'2019-05-16 10:03:49','2019-05-16 10:03:55','IntegerValue','6'),(62,4,1,'2019-05-16 10:03:49','2019-05-16 14:51:35','StringValue','7'),(66,1,6,'2019-05-16 12:02:34','2019-05-16 12:03:02','StringValue','ssd'),(67,3,6,'2019-05-16 12:02:34','2019-05-16 12:03:02','IntegerValue','123'),(68,4,6,'2019-05-16 12:02:34','2019-05-16 12:03:02','StringValue','sha'),(69,1,7,'2019-05-16 12:03:27','2019-05-16 12:03:35','StringValue','555'),(70,3,7,'2019-05-16 12:03:27','2019-05-16 12:03:35','IntegerValue','555'),(71,4,7,'2019-05-16 12:03:27','2019-05-16 12:03:35','StringValue','555'),(72,2,6,'2019-05-16 12:18:27','2019-05-16 12:18:27','StringValue',''),(73,2,7,'2019-05-16 12:18:32','2019-05-16 12:18:32','StringValue',''),(74,2,8,'2019-05-18 12:14:27','2019-05-18 12:14:42','StringValue','8'),(76,1,9,'2019-05-18 12:17:07','2019-05-18 12:17:25','StringValue','66'),(77,3,9,'2019-05-18 12:17:07','2019-05-18 12:17:25','IntegerValue','88'),(78,4,9,'2019-05-18 12:17:07','2019-05-18 12:17:25','StringValue','99'),(79,1,10,'2019-05-18 12:17:50','2019-05-18 12:18:01','StringValue','432'),(80,3,10,'2019-05-18 12:17:50','2019-05-18 12:18:01','IntegerValue','245'),(81,4,10,'2019-05-18 12:17:50','2019-05-18 12:18:01','StringValue','654'),(82,1,11,'2019-05-18 12:19:38','2019-05-18 12:19:54','StringValue','222'),(83,3,11,'2019-05-18 12:19:38','2019-05-18 12:19:54','IntegerValue','111'),(84,4,11,'2019-05-18 12:19:38','2019-05-18 12:19:54','StringValue','333'),(85,1,12,'2019-05-20 10:32:52','2019-05-20 10:32:52','StringValue',''),(86,3,12,'2019-05-20 10:32:52','2019-05-20 10:32:52','IntegerValue',''),(87,4,12,'2019-05-20 10:32:53','2019-05-20 10:32:53','StringValue',''),(88,1,13,'2019-05-20 10:33:53','2019-05-20 10:33:53','StringValue',''),(89,3,13,'2019-05-20 10:33:53','2019-05-20 10:33:53','IntegerValue',''),(90,4,13,'2019-05-20 10:33:53','2019-05-20 10:33:53','StringValue',''),(91,2,13,'2019-05-20 10:33:56','2019-05-20 10:33:56','StringValue','');
/*!40000 ALTER TABLE `property_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20190313235341'),('20190314003738'),('20190314004458'),('20190314010158'),('20190314223603'),('20190514112408'),('20190514120002'),('20190514120220'),('20190514133830'),('20190514134116'),('20190514134439'),('20190515081005'),('20190515081642'),('20190515091553'),('20190515110219'),('20190516100611'),('20190516100625'),('20190519095104'),('20190519103704'),('20190519105459');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tests` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (1,'1','2019-03-14 00:28:00','2019-03-14 00:28:00'),(2,'1','2019-03-14 00:35:15','2019-03-14 00:35:15');
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'suck@fuck.cock','123456','2019-03-14 22:42:40','2019-03-14 22:42:40','test',NULL),(2,NULL,'suck@fuck.cock','123456','2019-03-14 22:42:42','2019-03-14 22:42:42','test',NULL),(3,NULL,'suck@fuck.cock','123456','2019-03-14 22:42:59','2019-03-14 22:42:59','test',NULL),(4,NULL,'suck@fuck.cock','123456','2019-03-14 22:42:59','2019-03-14 22:42:59','test',NULL),(5,NULL,'suck@fuck.cock','123456','2019-03-14 22:43:07','2019-03-14 22:43:07','test',NULL),(6,NULL,'suck@fuck.cock','123456','2019-03-14 22:43:07','2019-03-14 22:43:07','test',NULL),(7,NULL,'suck@fuck.cock','123456','2019-03-14 22:43:34','2019-03-14 22:43:34','test',NULL),(8,NULL,'suck@fuck.cock','123456','2019-03-14 22:43:34','2019-03-14 22:43:34','test',NULL),(9,NULL,'1@1.cock','123','2019-03-14 22:46:25','2019-03-14 22:46:25','123',NULL),(10,'1','1','1','2019-03-14 22:47:56','2019-03-14 22:47:56',NULL,NULL),(11,NULL,'1@2','2','2019-03-14 22:50:01','2019-03-14 22:50:01','1',NULL),(12,NULL,'2@2','$2a$10$6JaBR0S9nJlYMdtKwzKAeO2FktpMxc9/FECVsdMunoKIB8tPNX8Hq','2019-03-14 22:56:50','2019-03-14 22:56:50','2',NULL),(13,NULL,'omg4itepok@gmail.com','$2a$10$rYiPWAtWz4CiEruNDYYkRuaKhTPnhbsfWuhrprk1vBTp1scKVDn0S','2019-05-14 10:50:39','2019-05-15 09:16:32','1',1),(14,NULL,'admin','$2a$10$/xxwb14voaSHcuAZcJEqj.sIQ3xS/.ftLH0ZWJljWABKqYQ8HiZMG','2019-05-19 11:10:54','2019-05-19 11:32:56','admin_lalka',1),(15,NULL,'abc','$2a$10$MVFTEt56nOlwXOeG80VTfuzMtQqnRwnEAe/3Ly84w2RiqE47zDNUa','2019-05-19 20:58:00','2019-05-19 20:58:00','abc',NULL);
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

-- Dump completed on 2019-05-22 15:25:48
