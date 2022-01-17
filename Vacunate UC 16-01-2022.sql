-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: vacunateuc
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Administradores'),(3,'Cargadores'),(2,'Usuarios normales');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(45,1,45),(46,1,46),(47,1,47),(48,1,48),(49,1,49),(50,1,50),(51,1,51),(52,1,52),(53,1,53),(54,1,54),(55,1,55),(56,1,56),(57,1,57),(58,1,58),(59,1,59),(60,1,60),(61,1,61),(62,1,62),(63,1,63),(64,1,64),(65,1,65),(66,1,66),(67,1,67),(68,1,68),(69,1,69),(70,1,70),(71,1,71),(72,1,72),(73,1,73),(74,1,74),(75,1,75),(76,1,76),(85,3,33),(86,3,34),(87,3,35),(88,3,36),(89,3,37),(90,3,38),(91,3,39),(92,3,40),(93,3,41),(94,3,42),(95,3,43),(96,3,44),(77,3,45),(82,3,46),(83,3,47),(84,3,48),(97,3,49),(98,3,50),(99,3,51),(100,3,52),(101,3,53),(102,3,54),(103,3,55),(104,3,56),(105,3,57),(106,3,58),(107,3,59),(108,3,60),(109,3,65),(110,3,66),(111,3,67),(112,3,68),(78,3,77),(79,3,78),(81,3,79),(80,3,80);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add question',1,'add_question'),(2,'Can change question',1,'change_question'),(3,'Can delete question',1,'delete_question'),(4,'Can view question',1,'view_question'),(5,'Can add choice',2,'add_choice'),(6,'Can change choice',2,'change_choice'),(7,'Can delete choice',2,'delete_choice'),(8,'Can view choice',2,'view_choice'),(9,'Can add log entry',3,'add_logentry'),(10,'Can change log entry',3,'change_logentry'),(11,'Can delete log entry',3,'delete_logentry'),(12,'Can view log entry',3,'view_logentry'),(13,'Can add permission',4,'add_permission'),(14,'Can change permission',4,'change_permission'),(15,'Can delete permission',4,'delete_permission'),(16,'Can view permission',4,'view_permission'),(17,'Can add group',5,'add_group'),(18,'Can change group',5,'change_group'),(19,'Can delete group',5,'delete_group'),(20,'Can view group',5,'view_group'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add content type',7,'add_contenttype'),(26,'Can change content type',7,'change_contenttype'),(27,'Can delete content type',7,'delete_contenttype'),(28,'Can view content type',7,'view_contenttype'),(29,'Can add session',8,'add_session'),(30,'Can change session',8,'change_session'),(31,'Can delete session',8,'delete_session'),(32,'Can view session',8,'view_session'),(33,'Can add sede',9,'add_sede'),(34,'Can change sede',9,'change_sede'),(35,'Can delete sede',9,'delete_sede'),(36,'Can view sede',9,'view_sede'),(37,'Can add puesto',10,'add_puesto'),(38,'Can change puesto',10,'change_puesto'),(39,'Can delete puesto',10,'delete_puesto'),(40,'Can view puesto',10,'view_puesto'),(41,'Can add puesto_ tipo_ vacunatorio',11,'add_puesto_tipo_vacunatorio'),(42,'Can change puesto_ tipo_ vacunatorio',11,'change_puesto_tipo_vacunatorio'),(43,'Can delete puesto_ tipo_ vacunatorio',11,'delete_puesto_tipo_vacunatorio'),(44,'Can view puesto_ tipo_ vacunatorio',11,'view_puesto_tipo_vacunatorio'),(45,'Can add modalidad_ vacunatorio',12,'add_modalidad_vacunatorio'),(46,'Can change modalidad_ vacunatorio',12,'change_modalidad_vacunatorio'),(47,'Can delete modalidad_ vacunatorio',12,'delete_modalidad_vacunatorio'),(48,'Can view modalidad_ vacunatorio',12,'view_modalidad_vacunatorio'),(49,'Can add vacuna_ puesto',13,'add_vacuna_puesto'),(50,'Can change vacuna_ puesto',13,'change_vacuna_puesto'),(51,'Can delete vacuna_ puesto',13,'delete_vacuna_puesto'),(52,'Can view vacuna_ puesto',13,'view_vacuna_puesto'),(53,'Can add vacuna',14,'add_vacuna'),(54,'Can change vacuna',14,'change_vacuna'),(55,'Can delete vacuna',14,'delete_vacuna'),(56,'Can view vacuna',14,'view_vacuna'),(57,'Can add tipo_de_ enfermedad',15,'add_tipo_de_enfermedad'),(58,'Can change tipo_de_ enfermedad',15,'change_tipo_de_enfermedad'),(59,'Can delete tipo_de_ enfermedad',15,'delete_tipo_de_enfermedad'),(60,'Can view tipo_de_ enfermedad',15,'view_tipo_de_enfermedad'),(61,'Can add usuario',16,'add_usuario'),(62,'Can change usuario',16,'change_usuario'),(63,'Can delete usuario',16,'delete_usuario'),(64,'Can view usuario',16,'view_usuario'),(65,'Can add usuario vacuna',17,'add_usuariovacuna'),(66,'Can change usuario vacuna',17,'change_usuariovacuna'),(67,'Can delete usuario vacuna',17,'delete_usuariovacuna'),(68,'Can view usuario vacuna',17,'view_usuariovacuna'),(69,'Can add personal blanco',18,'add_personalblanco'),(70,'Can change personal blanco',18,'change_personalblanco'),(71,'Can delete personal blanco',18,'delete_personalblanco'),(72,'Can view personal blanco',18,'view_personalblanco'),(73,'Can add profesiones',19,'add_profesiones'),(74,'Can change profesiones',19,'change_profesiones'),(75,'Can delete profesiones',19,'delete_profesiones'),(76,'Can view profesiones',19,'view_profesiones'),(77,'Can add ciudades',20,'add_ciudades'),(78,'Can change ciudades',20,'change_ciudades'),(79,'Can delete ciudades',20,'delete_ciudades'),(80,'Can view ciudades',20,'view_ciudades');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$vlUjbxgByGzo0GIrcC1DDz$rZ15EYevKtPmNFg+exU+4+y4eLG2atYv1TShutNVoWs=','2021-10-05 00:47:10.423548',1,'melgarejod','Oscar','Melgarejo','oscar95d.melgarejo@gmail.com',1,1,'2021-10-01 00:24:03.000000'),(3,'pbkdf2_sha256$260000$f0ny6xKVeGRZb0OTsrxVek$aaSMh12r/BOeGUNIuR4XTe6qdVxpkBrnUC20t/KvnO8=','2022-01-16 15:31:08.594801',1,'4455321','Gerardo','Espinola','',1,1,'2021-10-06 17:41:28.000000'),(4,'pbkdf2_sha256$260000$BlrrWpCmkSlDKTG2ddBzB6$flNDZGvnYXRLdyHDZZzTjO7aWZ7Bpn4ww1TM3qTp7QY=','2021-12-28 05:15:48.000000',0,'carlos','','','',0,1,'2021-10-12 17:40:16.000000'),(20,'pbkdf2_sha256$260000$xehN2erPWdUId66oc4ZlSn$i0HbZhmf2KdjSsIKS3W573FNYDtU5Ykcuu7dNndDDEo=','2021-12-28 23:52:16.540359',0,'3456789','Francisco','Quiñonez','',1,1,'2021-12-15 04:11:29.000000'),(29,'pbkdf2_sha256$260000$NkcFFERpUcBZJ2JW9YSeYK$SQAppQYV19XDdwknod4pXcESD6LR2N8en83eb7JHpGc=','2022-01-15 22:10:03.062379',0,'123456','Jose Luis Félix','Chillavert González','',0,1,'2021-12-15 21:38:59.984529'),(31,'pbkdf2_sha256$260000$IU7GRnP2GONWNyy0HXjhrY$QOaIymFEq1Jw0kynOkUnYYIYfkti4dMeCupOvNv4Cz0=','2021-12-29 00:11:37.588289',0,'772546','Carlos','Martinez','',1,1,'2021-12-28 03:59:57.000000'),(32,'pbkdf2_sha256$260000$ewqI4qtCrnWopnBPybBq5q$rcZ7FGrQvj6mv5hiOqBMX9z63bkc1iy3RSJ5YYZe7Ac=','2021-12-28 15:43:26.537881',0,'546546','Gustavo','Morel','',0,1,'2021-12-28 15:43:26.208906');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (2,3,1),(1,4,2),(3,20,3);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-10-01 00:31:37.295166','1','melgarejod',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',6,1),(2,'2021-10-01 00:32:49.480904','2','Gerardo',1,'[{\"added\": {}}]',6,1),(3,'2021-10-01 00:59:35.819636','1','Sede object (1)',1,'[{\"added\": {}}]',9,1),(4,'2021-10-01 01:03:21.556056','1','Villarrica',2,'[]',9,1),(5,'2021-10-01 01:06:05.550907','2','Asuncion',1,'[{\"added\": {}}]',9,1),(6,'2021-10-01 01:22:49.556683','1','Ykua pyta',1,'[{\"added\": {}}]',10,1),(7,'2021-10-01 01:23:01.001671','1','Ykua pyta',3,'',10,1),(8,'2021-10-11 18:12:10.969021','3','gerar',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',6,3),(9,'2021-10-12 17:40:17.120182','4','carlos',1,'[{\"added\": {}}]',6,3),(10,'2021-10-12 17:40:30.637931','4','carlos',2,'[]',6,3),(11,'2021-11-04 18:00:07.830103','1','PersonalBlanco object (1)',1,'[{\"added\": {}}]',18,3),(12,'2021-11-04 18:13:59.393221','1','Enfermero',1,'[{\"added\": {}}]',19,3),(13,'2021-11-04 18:14:06.749540','2','Medico',1,'[{\"added\": {}}]',19,3),(14,'2021-11-04 18:14:35.335448','1','Jose',1,'[{\"added\": {}}]',18,3),(15,'2021-11-04 18:16:04.174263','2','Andrea',1,'[{\"added\": {}}]',18,3),(16,'2021-11-04 18:17:00.212730','3','Clara',1,'[{\"added\": {}}]',18,3),(17,'2021-11-04 18:17:40.398883','4','Maria',1,'[{\"added\": {}}]',18,3),(18,'2021-11-10 17:00:17.911352','2','Hospital Regional',1,'[{\"added\": {}}]',10,3),(19,'2021-11-10 17:02:00.718279','3','Concepción',1,'[{\"added\": {}}]',9,3),(20,'2021-11-10 17:09:01.042255','1','Administradores',1,'[{\"added\": {}}]',5,3),(21,'2021-11-10 17:09:28.070557','2','Usuarios normales',1,'[{\"added\": {}}]',5,3),(22,'2021-11-10 17:10:10.246103','4','carlos',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',6,3),(23,'2021-12-14 22:03:59.345831','7','Lorenzo',1,'[{\"added\": {}}]',6,3),(24,'2021-12-14 22:04:36.948964','1','Lorenzo',1,'[{\"added\": {}}]',16,3),(25,'2021-12-15 04:08:55.112853','4','54679',3,'',16,3),(26,'2021-12-15 04:09:03.606189','5','45678',3,'',16,3),(27,'2021-12-15 04:09:03.800290','3','4455321',3,'',16,3),(28,'2021-12-15 04:09:39.491985','11','4455321',3,'',6,3),(29,'2021-12-15 04:09:39.567742','19','45678',3,'',6,3),(30,'2021-12-15 04:09:39.669481','18','54679',3,'',6,3),(31,'2021-12-15 04:09:39.772141','2','Gerardo',3,'',6,3),(32,'2021-12-15 04:09:39.873317','7','Lorenzo',3,'',6,3),(33,'2021-12-20 15:10:00.113454','3','Estadio Ykua Pytã',1,'[{\"added\": {}}]',10,3),(34,'2021-12-20 15:11:26.865620','4','Ex Estación del Ferrocaril',1,'[{\"added\": {}}]',10,3),(35,'2021-12-21 00:35:22.649585','1','Autovac',1,'[{\"added\": {}}]',12,3),(36,'2021-12-21 00:36:08.885924','2','Peatonal',1,'[{\"added\": {}}]',12,3),(37,'2021-12-21 00:36:33.989914','1','Puesto_Tipo_Vacunatorio object (1)',1,'[{\"added\": {}}]',11,3),(38,'2021-12-21 00:51:33.692997','1','Vacuna_Puesto object (1)',1,'[{\"added\": {}}]',13,3),(39,'2021-12-21 01:06:55.641824','1','Puesto_Tipo_Vacunatorio object (1)',3,'',11,3),(40,'2021-12-21 01:09:40.493129','7','123456',2,'[{\"changed\": {\"fields\": [\"Fecha de nacimiento\"]}}]',16,3),(41,'2021-12-24 01:57:23.659065','1','COVID-19',1,'[{\"added\": {}}]',15,3),(42,'2021-12-24 02:29:54.843594','1','Pfizer',1,'[{\"added\": {}}]',14,3),(43,'2021-12-24 02:36:03.973077','1','Pfizer',2,'[]',14,3),(44,'2021-12-24 02:38:03.509957','2','Moderna',1,'[{\"added\": {}}]',14,3),(45,'2021-12-24 02:38:07.988547','2','Moderna',2,'[]',14,3),(46,'2021-12-24 02:38:25.487153','1','Pfizer',2,'[{\"changed\": {\"fields\": [\"Fin de rango etario\"]}}]',14,3),(47,'2021-12-24 02:40:32.399533','3','AstraZeneca',1,'[{\"added\": {}}]',14,3),(48,'2021-12-25 22:49:08.927969','1','UsuarioVacuna object (1)',1,'[{\"added\": {}}]',17,3),(49,'2021-12-25 22:50:23.384644','1','UsuarioVacuna object (1)',3,'',17,3),(50,'2021-12-25 22:56:54.942286','2','UsuarioVacuna object (2)',1,'[{\"added\": {}}]',17,3),(51,'2021-12-25 23:31:19.798606','2','123456',2,'[{\"changed\": {\"fields\": [\"Cantidad de dosis\"]}}]',17,3),(52,'2021-12-26 01:09:10.386914','2','123456',2,'[{\"changed\": {\"fields\": [\"Cantidad de dosis\"]}}]',17,3),(53,'2021-12-26 01:09:25.691128','2','123456',2,'[{\"changed\": {\"fields\": [\"Cantidad de dosis\"]}}]',17,3),(54,'2021-12-26 01:14:36.862056','2','123456',2,'[{\"changed\": {\"fields\": [\"Cantidad de dosis\"]}}]',17,3),(55,'2021-12-26 01:30:49.634067','2','123456',3,'',17,3),(56,'2021-12-27 23:17:43.227035','3','123456',1,'[{\"added\": {}}]',17,3),(57,'2021-12-27 23:19:43.904401','3','123456',3,'',17,3),(58,'2021-12-27 23:29:16.714994','9','gerar',1,'[{\"added\": {}}]',16,3),(59,'2021-12-27 23:32:08.002160','3','4455321',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',6,3),(60,'2021-12-27 23:36:28.511931','3','4455321',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',6,3),(61,'2021-12-28 03:00:45.841951','4','4455321',1,'[{\"added\": {}}]',17,3),(62,'2021-12-28 03:24:45.784607','4','4455321',2,'[{\"changed\": {\"fields\": [\"Cantidad de dosis\"]}}]',17,3),(63,'2021-12-28 04:00:40.954551','31','772546',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"User permissions\"]}}]',6,3),(64,'2021-12-28 04:01:05.426709','31','772546',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',6,3),(65,'2021-12-28 04:11:39.263627','5','772546',1,'[{\"added\": {}}]',17,3),(66,'2021-12-28 04:17:22.766251','5','772546',2,'[{\"changed\": {\"fields\": [\"Cantidad de dosis\"]}}]',17,3),(67,'2021-12-28 04:17:40.357111','5','772546',2,'[{\"changed\": {\"fields\": [\"Cantidad de dosis\"]}}]',17,3),(68,'2021-12-28 04:19:11.686397','5','772546',2,'[{\"changed\": {\"fields\": [\"Cantidad de dosis\"]}}]',17,3),(69,'2021-12-28 05:07:28.496272','4','4455321',2,'[{\"changed\": {\"fields\": [\"Cantidad de dosis\"]}}]',17,3),(70,'2021-12-28 05:07:39.846923','4','4455321',2,'[{\"changed\": {\"fields\": [\"Cantidad de dosis\"]}}]',17,3),(71,'2021-12-28 05:07:50.826867','4','4455321',3,'',17,3),(72,'2021-12-28 05:17:45.231983','4','carlos',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',6,3),(73,'2021-12-28 05:19:59.936897','4','carlos',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',6,3),(74,'2021-12-28 20:28:10.516377','2','Fiebre amarilla',1,'[{\"added\": {}}]',15,3),(75,'2021-12-28 23:41:35.559590','5','772546',2,'[{\"changed\": {\"fields\": [\"Cantidad de dosis\"]}}]',17,3),(76,'2021-12-28 23:49:28.639066','3','Cargadores',1,'[{\"added\": {}}]',5,3),(77,'2021-12-28 23:49:58.569931','20','3456789',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',6,3),(78,'2021-12-28 23:51:57.587721','20','3456789',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',6,3),(79,'2021-12-28 23:54:39.492512','3','Cargadores',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',5,3),(80,'2021-12-28 23:57:24.482398','6','3456789',1,'[{\"added\": {}}]',17,20),(81,'2021-12-29 00:11:51.387886','5','772546',2,'[{\"changed\": {\"fields\": [\"Cantidad de dosis\"]}}]',17,3),(82,'2022-01-14 21:50:41.159128','9','4455321',2,'[{\"changed\": {\"fields\": [\"Ciudad\"]}}]',16,3),(83,'2022-01-14 21:50:50.597841','6','3456789',2,'[{\"changed\": {\"fields\": [\"Ciudad\"]}}]',16,3),(84,'2022-01-14 21:56:13.390733','4','Ex Estación del Ferrocaril',2,'[{\"changed\": {\"fields\": [\"Horario de inicio de atenci\\u00f3n\", \"Horario de finalizaci\\u00f3n de atenci\\u00f3n\"]}}]',10,3),(85,'2022-01-14 21:56:30.459052','3','Estadio Ykua Pytã',2,'[{\"changed\": {\"fields\": [\"Horario de inicio de atenci\\u00f3n\", \"Horario de finalizaci\\u00f3n de atenci\\u00f3n\"]}}]',10,3),(86,'2022-01-14 21:56:43.085564','2','Hospital Regional',2,'[{\"changed\": {\"fields\": [\"Horario de inicio de atenci\\u00f3n\", \"Horario de finalizaci\\u00f3n de atenci\\u00f3n\"]}}]',10,3),(87,'2022-01-15 00:26:10.072562','7','123456',2,'[{\"changed\": {\"fields\": [\"Cantidad de dosis aplicada\", \"Fecha de aplicaci\\u00f3n de dosis\"]}}]',17,3),(88,'2022-01-15 00:26:33.948036','7','123456',2,'[{\"changed\": {\"fields\": [\"Fecha de aplicaci\\u00f3n de dosis\"]}}]',17,3),(89,'2022-01-15 00:27:00.969133','7','123456',2,'[{\"changed\": {\"fields\": [\"Cantidad de dosis aplicada\"]}}]',17,3);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (3,'admin','logentry'),(5,'auth','group'),(4,'auth','permission'),(6,'auth','user'),(7,'contenttypes','contenttype'),(2,'polls','choice'),(1,'polls','question'),(8,'sessions','session'),(20,'vacuna','ciudades'),(12,'vacuna','modalidad_vacunatorio'),(18,'vacuna','personalblanco'),(19,'vacuna','profesiones'),(10,'vacuna','puesto'),(11,'vacuna','puesto_tipo_vacunatorio'),(9,'vacuna','sede'),(15,'vacuna','tipo_de_enfermedad'),(16,'vacuna','usuario'),(17,'vacuna','usuariovacuna'),(14,'vacuna','vacuna'),(13,'vacuna','vacuna_puesto');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-10-01 00:18:02.016247'),(2,'auth','0001_initial','2021-10-01 00:18:05.679913'),(3,'admin','0001_initial','2021-10-01 00:18:06.111462'),(4,'admin','0002_logentry_remove_auto_add','2021-10-01 00:18:06.153861'),(5,'admin','0003_logentry_add_action_flag_choices','2021-10-01 00:18:06.186772'),(6,'contenttypes','0002_remove_content_type_name','2021-10-01 00:18:06.484016'),(7,'auth','0002_alter_permission_name_max_length','2021-10-01 00:18:06.749037'),(8,'auth','0003_alter_user_email_max_length','2021-10-01 00:18:06.993073'),(9,'auth','0004_alter_user_username_opts','2021-10-01 00:18:07.022893'),(10,'auth','0005_alter_user_last_login_null','2021-10-01 00:18:07.232896'),(11,'auth','0006_require_contenttypes_0002','2021-10-01 00:18:07.265396'),(12,'auth','0007_alter_validators_add_error_messages','2021-10-01 00:18:07.346786'),(13,'auth','0008_alter_user_username_max_length','2021-10-01 00:18:07.554322'),(14,'auth','0009_alter_user_last_name_max_length','2021-10-01 00:18:07.842516'),(15,'auth','0010_alter_group_name_max_length','2021-10-01 00:18:07.922213'),(16,'auth','0011_update_proxy_permissions','2021-10-01 00:18:07.957284'),(17,'auth','0012_alter_user_first_name_max_length','2021-10-01 00:18:08.149506'),(18,'polls','0001_initial','2021-10-01 00:18:08.502841'),(19,'sessions','0001_initial','2021-10-01 00:18:08.642628'),(20,'vacuna','0001_initial','2021-10-01 00:55:51.544783'),(21,'vacuna','0002_alter_sede_habilitado','2021-10-01 01:05:44.650772'),(23,'vacuna','0003_puesto','2021-10-01 01:21:35.088512'),(24,'vacuna','0004_puesto_tipo_vacunatorio','2021-10-03 16:09:08.509584'),(25,'vacuna','0004_modalidad_vacunatorio','2021-10-03 18:01:55.047362'),(26,'vacuna','0005_puesto_tipo_vacunatorio','2021-10-03 18:04:05.417787'),(27,'vacuna','0006_vacuna_puesto','2021-10-03 18:17:48.592475'),(28,'vacuna','0007_vacuna','2021-10-03 23:59:25.836717'),(29,'vacuna','0007_tipo_de_enfermedad_vacuna','2021-10-05 00:31:02.554411'),(40,'vacuna','0008_auto_20211214_1816','2021-12-14 18:16:53.789435'),(41,'vacuna','0009_rename_usuario_usuario_user','2021-12-14 20:04:02.043048'),(42,'vacuna','0010_alter_usuario_user','2021-12-14 20:41:31.906101'),(43,'vacuna','0011_ciudades','2021-12-15 20:18:27.008430'),(44,'vacuna','0012_auto_20220111_2204','2022-01-14 21:49:29.150023'),(45,'vacuna','0013_auto_20220112_2051','2022-01-14 21:49:31.391705'),(46,'vacuna','0014_auto_20220112_2214','2022-01-14 21:49:31.838029'),(47,'vacuna','0015_alter_usuariovacuna_estado','2022-01-14 21:49:32.449076'),(48,'vacuna','0016_alter_usuariovacuna_periodoentredosisdias','2022-01-14 21:49:32.606300'),(49,'vacuna','0017_alter_usuariovacuna_periodoentredosisdias','2022-01-14 21:49:32.766412'),(50,'vacuna','0018_auto_20220114_0421','2022-01-14 21:49:34.395132'),(51,'vacuna','0019_alter_usuariovacuna_vacuna','2022-01-16 15:27:48.255053'),(52,'vacuna','0020_alter_usuariovacuna_vacuna','2022-01-16 15:32:40.839553');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('5s4t3zsaejcpa81q4oic51brhxbjcbd0','.eJxVjMEOwiAQRP-FsyGUAgWP3vsNZJddpGpoUtqT8d9tkx70Npn3Zt4iwraWuDVe4kTiKnpx-e0Q0pPrAegB9T7LNNd1mVAeijxpk-NM_Lqd7t9BgVb2tfc5sE4Mnj1qr3JHOWUEC33aw2AMOPIhIFsipdEECNaRRdsNGp0Sny8ivjkH:1mctE3:P9lMMbLelTAyh0VpkhOM3RYd0j5vkPmmoIYEZijTwog','2021-11-02 17:48:35.109090'),('8eh7x2f2nb6irzkwoeeew0a4gyormq7g','.eJxVjMEOwiAQRP-FsyGUAgWP3vsNZJddpGpoUtqT8d9tkx70Npn3Zt4iwraWuDVe4kTiKnpx-e0Q0pPrAegB9T7LNNd1mVAeijxpk-NM_Lqd7t9BgVb2tfc5sE4Mnj1qr3JHOWUEC33aw2AMOPIhIFsipdEECNaRRdsNGp0Sny8ivjkH:1n97Uq:KNKBjQ0WBDZJzrRNcORRTx_6z9TIvf5QA8vEosyM8U8','2022-01-30 15:31:08.663686'),('da0b0yhxjpyr7eosqid6zkwr0miwtu0m','.eJxVjEEOwiAQRe_C2hBgoB1cuvcMZGBAqoYmpV0Z765NutDtf-_9lwi0rTVsPS9hYnEWWpx-t0jpkdsO-E7tNss0t3WZotwVedAurzPn5-Vw_w4q9fqt0Wqr2LFFO2TjAEqJJnpMPAJpD9oXLuzJGAbwqUSrYGAVFY4eAZ14fwDR-jdS:1mXYbu:WWMLvMiqNhh4lTen1sxiL1_nJksh1nzasqkCKlBPIrw','2021-10-19 00:47:10.433521'),('l3j1ej4z9n59mj6b3bnegf4067i9tafy','.eJxVjMEOwiAQRP-FsyGUAgWP3vsNZJddpGpoUtqT8d9tkx70Npn3Zt4iwraWuDVe4kTiKnpx-e0Q0pPrAegB9T7LNNd1mVAeijxpk-NM_Lqd7t9BgVb2tfc5sE4Mnj1qr3JHOWUEC33aw2AMOPIhIFsipdEECNaRRdsNGp0Sny8ivjkH:1n1GDa:12AMtckHk3oCqUxm_GMR0ydDz_Cuzq1StDugRFC4-kw','2022-01-08 23:12:50.174220'),('lp1o4gyihv5yh5v8zbn9d9myhrmoeimt','.eJxVjMEOwiAQRP-FsyGUAgWP3vsNZJddpGpoUtqT8d9tkx70Npn3Zt4iwraWuDVe4kTiKnpx-e0Q0pPrAegB9T7LNNd1mVAeijxpk-NM_Lqd7t9BgVb2tfc5sE4Mnj1qr3JHOWUEC33aw2AMOPIhIFsipdEECNaRRdsNGp0Sny8ivjkH:1md3dA:9t_hNrAa3zHTuDAhK5nnh_WbagRnJL4rgzvERfI7YM0','2021-11-03 04:55:12.983190'),('lrexhjd98uqjaxwmifsux1z8dw58fz81','.eJxVjMEOwiAQRP-FsyGUAgWP3vsNZJddpGpoUtqT8d9tkx70Npn3Zt4iwraWuDVe4kTiKnpx-e0Q0pPrAegB9T7LNNd1mVAeijxpk-NM_Lqd7t9BgVb2tfc5sE4Mnj1qr3JHOWUEC33aw2AMOPIhIFsipdEECNaRRdsNGp0Sny8ivjkH:1md0Xs:NE3fXr5xvwtenmjJ3WPxvO0FEAwzIuM3hEuugteCuiU','2021-11-03 01:37:32.807196'),('mh3get36bm1pmou3qg3jwow7n6eszbrv','.eJxVjMEOwiAQRP-FsyGUAgWP3vsNZJddpGpoUtqT8d9tkx70Npn3Zt4iwraWuDVe4kTiKnpx-e0Q0pPrAegB9T7LNNd1mVAeijxpk-NM_Lqd7t9BgVb2tfc5sE4Mnj1qr3JHOWUEC33aw2AMOPIhIFsipdEECNaRRdsNGp0Sny8ivjkH:1mcwTe:3w8jUPzF62ttSIQkaIBz3db5u2Zc98Ka7k51n632KXs','2021-11-02 21:16:54.186569'),('of7o4b5wkjawtjk9ugvnr2qzqjfgk322','e30:1mx9KD:z4D3BpwXhKIg0-Ls5NxOHrCDrsDA1mBwNWdCjjHcEMg','2021-12-28 15:02:41.624961'),('p4bs6ld6p5jynx2vi8q9iw7rl90qoemq','.eJxVjMEOwiAQRP-FsyGUAgWP3vsNZJddpGpoUtqT8d9tkx70Npn3Zt4iwraWuDVe4kTiKnpx-e0Q0pPrAegB9T7LNNd1mVAeijxpk-NM_Lqd7t9BgVb2tfc5sE4Mnj1qr3JHOWUEC33aw2AMOPIhIFsipdEECNaRRdsNGp0Sny8ivjkH:1mjYYp:7r-pNOccEtGeY54hiv3jOQFzp5aaFSRL-i3n3erbOyg','2021-11-21 03:09:35.201513'),('ryl2wh8jwj59kacsqe98kwm2s4nsgtry','e30:1mx8u4:V8GiJoajXxCmdnEIWPoXh2rGBYO2ojMF8BWJWlvHglA','2021-12-28 14:35:40.490396'),('sftt5y343eq0shyvh279dvzked88kxvw','.eJxVjMEOwiAQRP-FsyGUAgWP3vsNZJddpGpoUtqT8d9tkx70Npn3Zt4iwraWuDVe4kTiKnpx-e0Q0pPrAegB9T7LNNd1mVAeijxpk-NM_Lqd7t9BgVb2tfc5sE4Mnj1qr3JHOWUEC33aw2AMOPIhIFsipdEECNaRRdsNGp0Sny8ivjkH:1mcvZh:yxSUNLKGpjHVqYTa-KnZDZT32rHpK4tMAYk2atPG3OY','2021-11-02 20:19:05.963699'),('tvhkcurzhnhoytmoln90c4d6fvi6msxx','e30:1mcZ0T:g8X2edSYydMfGXLwrE1FoVMVJItMNue4FOtVloVJxAc','2021-11-01 20:13:13.372665'),('w57me4dy7f6bk2zxdyxg6u9kjjjdqfc0','.eJxVjMEOwiAQRP-FsyGUAgWP3vsNZJddpGpoUtqT8d9tkx70Npn3Zt4iwraWuDVe4kTiKnpx-e0Q0pPrAegB9T7LNNd1mVAeijxpk-NM_Lqd7t9BgVb2tfc5sE4Mnj1qr3JHOWUEC33aw2AMOPIhIFsipdEECNaRRdsNGp0Sny8ivjkH:1mcwDe:L_XwQqFln6wK1H63WSsb1OqVRaLOV_PLkUyEgvjyWk4','2021-11-02 21:00:22.431516'),('wupbf3uaeka18tv4yizbrkvzcje0nxbw','.eJxVjMEOwiAQRP-FsyGUAgWP3vsNZJddpGpoUtqT8d9tkx70Npn3Zt4iwraWuDVe4kTiKnpx-e0Q0pPrAegB9T7LNNd1mVAeijxpk-NM_Lqd7t9BgVb2tfc5sE4Mnj1qr3JHOWUEC33aw2AMOPIhIFsipdEECNaRRdsNGp0Sny8ivjkH:1n2GgT:p8Qe0pQZrYWWE1EzO7cXgoEM2TqrWkmdHDNz8BJtoVg','2022-01-11 17:54:49.611291'),('zux7j0e6vxcq0pzpylluhvfkvuk5lnzb','.eJxVjMEOwiAQRP-FsyGUAgWP3vsNZJddpGpoUtqT8d9tkx70Npn3Zt4iwraWuDVe4kTiKnpx-e0Q0pPrAegB9T7LNNd1mVAeijxpk-NM_Lqd7t9BgVb2tfc5sE4Mnj1qr3JHOWUEC33aw2AMOPIhIFsipdEECNaRRdsNGp0Sny8ivjkH:1mkrda:1rawpsYbsSfU_oZ1RkLW88LHr_3R0W7odxwON-dd9AE','2021-11-24 17:43:54.382259');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_choice`
--

DROP TABLE IF EXISTS `polls_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polls_choice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(200) NOT NULL,
  `votes` int NOT NULL,
  `question_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `polls_choice_question_id_c5b4b260_fk_polls_question_id` (`question_id`),
  CONSTRAINT `polls_choice_question_id_c5b4b260_fk_polls_question_id` FOREIGN KEY (`question_id`) REFERENCES `polls_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_choice`
--

LOCK TABLES `polls_choice` WRITE;
/*!40000 ALTER TABLE `polls_choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `polls_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_question`
--

DROP TABLE IF EXISTS `polls_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polls_question` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_question`
--

LOCK TABLES `polls_question` WRITE;
/*!40000 ALTER TABLE `polls_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `polls_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacuna_ciudades`
--

DROP TABLE IF EXISTS `vacuna_ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacuna_ciudades` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_ciudad` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacuna_ciudades`
--

LOCK TABLES `vacuna_ciudades` WRITE;
/*!40000 ALTER TABLE `vacuna_ciudades` DISABLE KEYS */;
INSERT INTO `vacuna_ciudades` VALUES (1,'BORJA'),(2,'CAPITAN MAURICIO JOSE TROCHE'),(3,'CORONEL MARTINEZ'),(4,'DOCTOR BOTTRELL'),(5,'FELIX PEREZ CARDOZO'),(6,'GRAL. EUGENIO A. GARAY'),(7,'INDEPENDENCIA'),(8,'ITAPE'),(9,'ITURBE'),(10,'JOSE FASSARDI'),(11,'MBOCAYATY'),(12,'NATALICIO TALAVERA'),(13,'ÑUMI'),(14,'PASO YOBAI'),(15,'SAN SALVADOR'),(16,'TEBICUARY'),(17,'VILLARRICA'),(18,'YATAITY');
/*!40000 ALTER TABLE `vacuna_ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacuna_modalidad_vacunatorio`
--

DROP TABLE IF EXISTS `vacuna_modalidad_vacunatorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacuna_modalidad_vacunatorio` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacuna_modalidad_vacunatorio`
--

LOCK TABLES `vacuna_modalidad_vacunatorio` WRITE;
/*!40000 ALTER TABLE `vacuna_modalidad_vacunatorio` DISABLE KEYS */;
INSERT INTO `vacuna_modalidad_vacunatorio` VALUES (1,'Autovac','Para vacunación en vehículos'),(2,'Peatonal','Para vacunación peatonal');
/*!40000 ALTER TABLE `vacuna_modalidad_vacunatorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacuna_puesto`
--

DROP TABLE IF EXISTS `vacuna_puesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacuna_puesto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `habilitado` tinyint(1) NOT NULL,
  `sede_id` bigint NOT NULL,
  `horario_fin` time(6) DEFAULT NULL,
  `horario_inicio` time(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vacuna_puesto_sede_id_fbdc7d1d_fk_vacuna_sede_id` (`sede_id`),
  CONSTRAINT `vacuna_puesto_sede_id_fbdc7d1d_fk_vacuna_sede_id` FOREIGN KEY (`sede_id`) REFERENCES `vacuna_sede` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacuna_puesto`
--

LOCK TABLES `vacuna_puesto` WRITE;
/*!40000 ALTER TABLE `vacuna_puesto` DISABLE KEYS */;
INSERT INTO `vacuna_puesto` VALUES (2,'Hospital Regional',1,1,'15:00:00.000000','07:00:00.000000'),(3,'Estadio Ykua Pytã',1,1,'15:00:00.000000','07:00:00.000000'),(4,'Ex Estación del Ferrocaril',1,1,'15:00:00.000000','07:00:00.000000');
/*!40000 ALTER TABLE `vacuna_puesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacuna_puesto_tipo_vacunatorio`
--

DROP TABLE IF EXISTS `vacuna_puesto_tipo_vacunatorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacuna_puesto_tipo_vacunatorio` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `habilitado` tinyint(1) NOT NULL,
  `modalidadvacunatorio_id` bigint NOT NULL,
  `puesto_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vacuna_puesto_tipo_v_modalidadvacunatorio_d430ea47_fk_vacuna_mo` (`modalidadvacunatorio_id`),
  KEY `vacuna_puesto_tipo_v_puesto_id_c1bf9c8f_fk_vacuna_pu` (`puesto_id`),
  CONSTRAINT `vacuna_puesto_tipo_v_modalidadvacunatorio_d430ea47_fk_vacuna_mo` FOREIGN KEY (`modalidadvacunatorio_id`) REFERENCES `vacuna_modalidad_vacunatorio` (`id`),
  CONSTRAINT `vacuna_puesto_tipo_v_puesto_id_c1bf9c8f_fk_vacuna_pu` FOREIGN KEY (`puesto_id`) REFERENCES `vacuna_puesto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacuna_puesto_tipo_vacunatorio`
--

LOCK TABLES `vacuna_puesto_tipo_vacunatorio` WRITE;
/*!40000 ALTER TABLE `vacuna_puesto_tipo_vacunatorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacuna_puesto_tipo_vacunatorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacuna_sede`
--

DROP TABLE IF EXISTS `vacuna_sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacuna_sede` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `habilitado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacuna_sede`
--

LOCK TABLES `vacuna_sede` WRITE;
/*!40000 ALTER TABLE `vacuna_sede` DISABLE KEYS */;
INSERT INTO `vacuna_sede` VALUES (1,'Villarrica',1),(2,'Asuncion',1),(3,'Concepción',1);
/*!40000 ALTER TABLE `vacuna_sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacuna_tipo_de_enfermedad`
--

DROP TABLE IF EXISTS `vacuna_tipo_de_enfermedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacuna_tipo_de_enfermedad` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacuna_tipo_de_enfermedad`
--

LOCK TABLES `vacuna_tipo_de_enfermedad` WRITE;
/*!40000 ALTER TABLE `vacuna_tipo_de_enfermedad` DISABLE KEYS */;
INSERT INTO `vacuna_tipo_de_enfermedad` VALUES (1,'COVID-19'),(2,'Fiebre amarilla');
/*!40000 ALTER TABLE `vacuna_tipo_de_enfermedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacuna_usuario`
--

DROP TABLE IF EXISTS `vacuna_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacuna_usuario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_nac` date NOT NULL,
  `departamento` varchar(150) NOT NULL,
  `ciudad` varchar(150) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_id` (`user_id`),
  CONSTRAINT `vacuna_usuario_user_id_5961cbd7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacuna_usuario`
--

LOCK TABLES `vacuna_usuario` WRITE;
/*!40000 ALTER TABLE `vacuna_usuario` DISABLE KEYS */;
INSERT INTO `vacuna_usuario` VALUES (6,'1989-11-17','Guaira','VILLARRICA',20),(7,'1965-07-27','Guaira','GRAL. EUGENIO A. GARAY',29),(9,'1997-12-05','Guaira','VILLARRICA',3),(10,'1956-10-31','Guaira','VILLARRICA',31),(11,'1997-04-15','Guaira','BORJA',32);
/*!40000 ALTER TABLE `vacuna_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacuna_usuariovacuna`
--

DROP TABLE IF EXISTS `vacuna_usuariovacuna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacuna_usuariovacuna` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidaddedosis` int NOT NULL,
  `periodoentredosisdias` int NOT NULL,
  `puesto_id` bigint NOT NULL,
  `usuario_id` bigint NOT NULL,
  `vacuna_id` bigint NOT NULL,
  `fecha_aplicacion` date DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vacuna_usuariovacuna_puesto_id_ded3dc56_fk_vacuna_puesto_id` (`puesto_id`),
  KEY `vacuna_usuariovacuna_usuario_id_5a6a91bb_fk_vacuna_usuario_id` (`usuario_id`),
  KEY `vacuna_usuariovacuna_vacuna_id_cbaa7033` (`vacuna_id`),
  CONSTRAINT `vacuna_usuariovacuna_puesto_id_ded3dc56_fk_vacuna_puesto_id` FOREIGN KEY (`puesto_id`) REFERENCES `vacuna_puesto` (`id`),
  CONSTRAINT `vacuna_usuariovacuna_usuario_id_5a6a91bb_fk_vacuna_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `vacuna_usuario` (`id`),
  CONSTRAINT `vacuna_usuariovacuna_vacuna_id_cbaa7033_fk_vacuna_vacuna_id` FOREIGN KEY (`vacuna_id`) REFERENCES `vacuna_vacuna` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacuna_usuariovacuna`
--

LOCK TABLES `vacuna_usuariovacuna` WRITE;
/*!40000 ALTER TABLE `vacuna_usuariovacuna` DISABLE KEYS */;
INSERT INTO `vacuna_usuariovacuna` VALUES (5,0,21,2,10,1,NULL,0),(6,1,28,2,6,2,NULL,0),(7,2,28,4,7,3,'2022-01-13',1);
/*!40000 ALTER TABLE `vacuna_usuariovacuna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacuna_vacuna`
--

DROP TABLE IF EXISTS `vacuna_vacuna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacuna_vacuna` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `cantidaddosis` int NOT NULL,
  `rangoetarioinicio` int NOT NULL,
  `rangoetariofin` int NOT NULL,
  `periodoentredosis` int NOT NULL,
  `tipoenfermedad_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vacuna_vacuna_tipoenfermedad_id_caf54dc2_fk_vacuna_ti` (`tipoenfermedad_id`),
  CONSTRAINT `vacuna_vacuna_tipoenfermedad_id_caf54dc2_fk_vacuna_ti` FOREIGN KEY (`tipoenfermedad_id`) REFERENCES `vacuna_tipo_de_enfermedad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacuna_vacuna`
--

LOCK TABLES `vacuna_vacuna` WRITE;
/*!40000 ALTER TABLE `vacuna_vacuna` DISABLE KEYS */;
INSERT INTO `vacuna_vacuna` VALUES (1,'Pfizer',50,18,100,21,1),(2,'Moderna',50,18,100,28,1),(3,'AstraZeneca',50,18,100,28,1);
/*!40000 ALTER TABLE `vacuna_vacuna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacuna_vacuna_puesto`
--

DROP TABLE IF EXISTS `vacuna_vacuna_puesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacuna_vacuna_puesto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `puesto_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vacuna_vacuna_puesto_puesto_id_16e99ef3_fk_vacuna_puesto_id` (`puesto_id`),
  CONSTRAINT `vacuna_vacuna_puesto_puesto_id_16e99ef3_fk_vacuna_puesto_id` FOREIGN KEY (`puesto_id`) REFERENCES `vacuna_puesto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacuna_vacuna_puesto`
--

LOCK TABLES `vacuna_vacuna_puesto` WRITE;
/*!40000 ALTER TABLE `vacuna_vacuna_puesto` DISABLE KEYS */;
INSERT INTO `vacuna_vacuna_puesto` VALUES (1,3);
/*!40000 ALTER TABLE `vacuna_vacuna_puesto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-16 22:44:35
