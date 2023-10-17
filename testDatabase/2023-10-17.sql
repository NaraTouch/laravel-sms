-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: laravel-sms
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `account_employee_salaries`
--

DROP TABLE IF EXISTS `account_employee_salaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_employee_salaries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL COMMENT 'employee_id=user_id',
  `date` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_employee_salaries`
--

LOCK TABLES `account_employee_salaries` WRITE;
/*!40000 ALTER TABLE `account_employee_salaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_employee_salaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_other_costs`
--

DROP TABLE IF EXISTS `account_other_costs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_other_costs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_other_costs`
--

LOCK TABLES `account_other_costs` WRITE;
/*!40000 ALTER TABLE `account_other_costs` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_other_costs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_student_fees`
--

DROP TABLE IF EXISTS `account_student_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_student_fees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `year_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `fee_category_id` int(11) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_student_fees`
--

LOCK TABLES `account_student_fees` WRITE;
/*!40000 ALTER TABLE `account_student_fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_student_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `secret_code` varchar(255) NOT NULL DEFAULT 'Test',
  `mobile` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `mname` varchar(255) DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `id_no` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=inactive,1=active',
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'nara','admin@gmail.com','2023-09-25 01:50:26','$2y$10$mQyxk3stmZOVFt.QafOzROd3PNpzooYIco6geIlIw.URPGdK1x2v2','Test','012345687','phnom penh','Male','202309261933OIP.jpg',NULL,NULL,'Hindu',NULL,'2023-09-26',NULL,NULL,NULL,1,NULL,NULL,NULL,'2023-09-25 01:50:26','2023-09-26 12:33:54',1,NULL),(2,'nara custom','nara.custom@gmail.com',NULL,'$2y$10$U4jNrKammSImrHsEAESHT.VhjAe4sbvNu8w/qFrlMFNedqqzP08Ae','Test','3434355','phnom penh','Male',NULL,NULL,NULL,'Islam',NULL,'2023-10-04',NULL,NULL,NULL,1,NULL,NULL,NULL,'2023-10-04 10:06:56','2023-10-09 10:37:10',6,1),(4,'custom 1','custom@gmail.com',NULL,'$2y$10$ofI9JFJ6nL7A0RE8M16EheAGmo8wkkrDiitlxRQkUCDWGl6WVoHuS','Test','012345687','phnom penh','Male',NULL,NULL,NULL,'Hindu',NULL,'2023-10-11',NULL,NULL,NULL,1,NULL,NULL,NULL,'2023-10-09 11:17:51',NULL,7,2);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assign_students`
--

DROP TABLE IF EXISTS `assign_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assign_students` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT 'user_id=student_id',
  `roll` int(11) DEFAULT NULL,
  `class_id` int(11) NOT NULL,
  `year_id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `shift_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assign_students`
--

LOCK TABLES `assign_students` WRITE;
/*!40000 ALTER TABLE `assign_students` DISABLE KEYS */;
/*!40000 ALTER TABLE `assign_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assign_subjects`
--

DROP TABLE IF EXISTS `assign_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assign_subjects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `full_mark` double NOT NULL,
  `pass_mark` double NOT NULL,
  `subjective_mark` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assign_subjects`
--

LOCK TABLES `assign_subjects` WRITE;
/*!40000 ALTER TABLE `assign_subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `assign_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designations`
--

DROP TABLE IF EXISTS `designations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `designations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `designations_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designations`
--

LOCK TABLES `designations` WRITE;
/*!40000 ALTER TABLE `designations` DISABLE KEYS */;
/*!40000 ALTER TABLE `designations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_students`
--

DROP TABLE IF EXISTS `discount_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_students` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `assign_student_id` int(11) NOT NULL,
  `fee_category_id` int(11) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_students`
--

LOCK TABLES `discount_students` WRITE;
/*!40000 ALTER TABLE `discount_students` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_attendances`
--

DROP TABLE IF EXISTS `employee_attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_attendances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL COMMENT 'employee_id=user_id',
  `date` date NOT NULL,
  `attend_status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_attendances`
--

LOCK TABLES `employee_attendances` WRITE;
/*!40000 ALTER TABLE `employee_attendances` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_leaves`
--

DROP TABLE IF EXISTS `employee_leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_leaves` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL COMMENT 'employee_id=user_id',
  `leave_purpose_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_leaves`
--

LOCK TABLES `employee_leaves` WRITE;
/*!40000 ALTER TABLE `employee_leaves` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_leaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_salary_logs`
--

DROP TABLE IF EXISTS `employee_salary_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_salary_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL COMMENT 'employee_id=User_id',
  `previous_salary` int(11) DEFAULT NULL,
  `present_salary` int(11) DEFAULT NULL,
  `increment_salary` int(11) DEFAULT NULL,
  `effected_salary` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_salary_logs`
--

LOCK TABLES `employee_salary_logs` WRITE;
/*!40000 ALTER TABLE `employee_salary_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_salary_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_types`
--

DROP TABLE IF EXISTS `exam_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exam_types_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_types`
--

LOCK TABLES `exam_types` WRITE;
/*!40000 ALTER TABLE `exam_types` DISABLE KEYS */;
INSERT INTO `exam_types` VALUES (1,'IELS','2023-10-17 00:15:59','2023-10-17 00:15:59');
/*!40000 ALTER TABLE `exam_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee_categories`
--

DROP TABLE IF EXISTS `fee_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fee_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fee_categories_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee_categories`
--

LOCK TABLES `fee_categories` WRITE;
/*!40000 ALTER TABLE `fee_categories` DISABLE KEYS */;
INSERT INTO `fee_categories` VALUES (1,'Year','2023-10-17 00:14:33','2023-10-17 00:14:33'),(2,'Month','2023-10-17 00:14:41','2023-10-17 00:14:41'),(3,'course','2023-10-17 00:14:49','2023-10-17 00:14:49');
/*!40000 ALTER TABLE `fee_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee_category_amounts`
--

DROP TABLE IF EXISTS `fee_category_amounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fee_category_amounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fee_category_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee_category_amounts`
--

LOCK TABLES `fee_category_amounts` WRITE;
/*!40000 ALTER TABLE `fee_category_amounts` DISABLE KEYS */;
INSERT INTO `fee_category_amounts` VALUES (1,1,1,1000,'2023-10-17 00:15:09','2023-10-17 00:15:09'),(2,2,1,300,'2023-10-17 00:15:29','2023-10-17 00:15:29'),(3,3,1,100,'2023-10-17 00:15:39','2023-10-17 00:15:39');
/*!40000 ALTER TABLE `fee_category_amounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_purposes`
--

DROP TABLE IF EXISTS `leave_purposes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_purposes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `leave_purposes_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_purposes`
--

LOCK TABLES `leave_purposes` WRITE;
/*!40000 ALTER TABLE `leave_purposes` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave_purposes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marks_grades`
--

DROP TABLE IF EXISTS `marks_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marks_grades` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `grade_name` varchar(255) NOT NULL,
  `grade_point` varchar(255) NOT NULL,
  `start_marks` varchar(255) NOT NULL,
  `end_marks` varchar(255) NOT NULL,
  `start_point` varchar(255) NOT NULL,
  `end_point` varchar(255) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks_grades`
--

LOCK TABLES `marks_grades` WRITE;
/*!40000 ALTER TABLE `marks_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `marks_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1),(6,'2020_11_23_192918_create_sessions_table',1),(7,'2020_11_27_191622_create_student_classes_table',1),(8,'2020_11_27_201955_create_student_years_table',1),(9,'2020_11_27_205317_create_student_groups_table',1),(10,'2020_11_27_212648_create_student_shifts_table',1),(11,'2020_11_28_184513_create_fee_categories_table',1),(12,'2020_11_28_193421_create_fee_category_amounts_table',1),(13,'2020_11_29_190907_create_exam_types_table',1),(14,'2020_11_29_193820_create_school_subjects_table',1),(15,'2020_11_30_192807_create_assign_subjects_table',1),(16,'2020_11_30_211919_create_designations_table',1),(17,'2020_12_02_191137_create_assign_students_table',1),(18,'2020_12_02_191735_create_discount_students_table',1),(19,'2020_12_09_192120_create_employee_salary_logs_table',1),(20,'2020_12_11_205416_create_leave_purposes_table',1),(21,'2020_12_11_210033_create_employee_leaves_table',1),(22,'2020_12_13_192045_create_employee_attendances_table',1),(23,'2020_12_15_214223_create_student_marks_table',1),(24,'2020_12_16_202402_create_marks_grades_table',1),(25,'2020_12_18_191232_create_account_student_fees_table',1),(26,'2020_12_18_212912_create_account_employee_salaries_table',1),(27,'2020_12_20_192742_create_account_other_costs_table',1),(28,'2022_12_14_102818_create_admins_table',1),(29,'2022_12_14_131042_create_moderators_table',1),(30,'2023_09_25_083254_create_sys_roles_table',1),(31,'2023_09_25_083800_create_sys_role_method_table',1),(32,'2023_09_25_083845_create_sys_role_module_table',1),(33,'2023_09_25_083920_create_sys_permissions_table',1),(34,'2023_09_25_083946_create_sys_methods_table',1),(35,'2023_09_25_084011_create_sys_modules_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moderators`
--

DROP TABLE IF EXISTS `moderators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moderators` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `secret_code` varchar(255) NOT NULL DEFAULT 'Test',
  `mobile` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `mname` varchar(255) DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `id_no` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=inactive,1=active',
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `moderators_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moderators`
--

LOCK TABLES `moderators` WRITE;
/*!40000 ALTER TABLE `moderators` DISABLE KEYS */;
INSERT INTO `moderators` VALUES (1,'Moderator','Moderator@gmail.com','2023-09-25 01:50:26','$2y$10$3wbf.phM87gCZPhJzwliRu.VhIoUuyKJ1F1icMURMZa/9JowTiat.','Test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2023-09-25 01:50:26','2023-09-25 01:50:26');
/*!40000 ALTER TABLE `moderators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_subjects`
--

DROP TABLE IF EXISTS `school_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_subjects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `school_subjects_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_subjects`
--

LOCK TABLES `school_subjects` WRITE;
/*!40000 ALTER TABLE `school_subjects` DISABLE KEYS */;
INSERT INTO `school_subjects` VALUES (1,'Math','2023-10-17 00:16:07','2023-10-17 00:16:07');
/*!40000 ALTER TABLE `school_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_classes`
--

DROP TABLE IF EXISTS `student_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_classes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_classes_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_classes`
--

LOCK TABLES `student_classes` WRITE;
/*!40000 ALTER TABLE `student_classes` DISABLE KEYS */;
INSERT INTO `student_classes` VALUES (1,'elementary','2023-10-17 00:13:34','2023-10-17 00:13:34');
/*!40000 ALTER TABLE `student_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_groups`
--

DROP TABLE IF EXISTS `student_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_groups_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_groups`
--

LOCK TABLES `student_groups` WRITE;
/*!40000 ALTER TABLE `student_groups` DISABLE KEYS */;
INSERT INTO `student_groups` VALUES (1,'Full Time','2023-10-17 00:13:43','2023-10-17 00:13:43');
/*!40000 ALTER TABLE `student_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_marks`
--

DROP TABLE IF EXISTS `student_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_marks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT 'student_id=user_id',
  `id_no` varchar(255) DEFAULT NULL,
  `year_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `assign_subject_id` int(11) DEFAULT NULL,
  `exam_type_id` int(11) DEFAULT NULL,
  `marks` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_marks`
--

LOCK TABLES `student_marks` WRITE;
/*!40000 ALTER TABLE `student_marks` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_shifts`
--

DROP TABLE IF EXISTS `student_shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_shifts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_shifts_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_shifts`
--

LOCK TABLES `student_shifts` WRITE;
/*!40000 ALTER TABLE `student_shifts` DISABLE KEYS */;
INSERT INTO `student_shifts` VALUES (1,'Morning','2023-10-17 00:14:14','2023-10-17 00:14:14');
/*!40000 ALTER TABLE `student_shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_years`
--

DROP TABLE IF EXISTS `student_years`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_years` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_years_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_years`
--

LOCK TABLES `student_years` WRITE;
/*!40000 ALTER TABLE `student_years` DISABLE KEYS */;
INSERT INTO `student_years` VALUES (1,'2022','2023-10-17 00:13:19','2023-10-17 00:13:19');
/*!40000 ALTER TABLE `student_years` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_methods`
--

DROP TABLE IF EXISTS `sys_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_methods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sys_module_id` bigint(20) unsigned NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sys_name` varchar(255) NOT NULL,
  `is_menu` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=hidden,1=show',
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_name` (`sys_name`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_methods`
--

LOCK TABLES `sys_methods` WRITE;
/*!40000 ALTER TABLE `sys_methods` DISABLE KEYS */;
INSERT INTO `sys_methods` VALUES (1,'View Method',1,NULL,'2023-09-25 07:51:09','2023-09-27 11:51:21','method.view',0,1),(2,'Add Method',1,NULL,'2023-09-25 07:55:03','2023-09-26 15:45:35','method.add',0,NULL),(3,'Edit Method',1,NULL,NULL,'2023-09-26 15:45:41','method.edit',0,NULL),(4,'View Admin',2,NULL,'2023-09-25 13:29:18','2023-09-26 15:43:06','admin.member.view',1,NULL),(5,'Add Admin',2,NULL,'2023-09-25 13:34:53','2023-09-26 15:43:12','admin.member.add',0,NULL),(6,'Edit Admin',2,NULL,'2023-09-25 13:35:33','2023-09-26 15:44:03','admin.member.edit',0,NULL),(7,'Delete Admin',2,NULL,'2023-09-25 13:35:46','2023-09-26 15:43:42','admin.member.delete',0,NULL),(8,'View Module',1,NULL,'2023-09-25 13:37:18','2023-09-26 15:45:47','module.view',1,NULL),(9,'Add Module',1,NULL,'2023-09-25 13:39:04','2023-09-26 15:45:53','module.add',0,NULL),(10,'Edit Module',1,NULL,'2023-09-25 13:39:16','2023-09-26 15:46:00','module.edit',0,NULL),(11,'View Role',3,NULL,'2023-09-25 13:40:02','2023-09-26 15:46:26','role.view',1,NULL),(12,'Add Role',3,NULL,'2023-09-25 13:40:12','2023-09-26 15:46:31','role.add',0,NULL),(13,'Edit Role',3,NULL,'2023-09-25 13:40:28','2023-09-26 16:19:30','role.edit',0,NULL),(14,'Disabled Role',3,NULL,'2023-09-25 13:40:44','2023-09-26 15:47:00','role.delete',0,NULL),(15,'View User',4,NULL,'2023-09-25 13:42:36','2023-09-26 15:47:20','user.view',1,NULL),(16,'Add User',4,NULL,'2023-09-25 13:42:47','2023-09-26 15:47:25','user.add',0,NULL),(17,'Edit User',4,NULL,'2023-09-25 13:42:59','2023-09-26 15:47:34','user.edit',0,NULL),(18,'Delete User',4,NULL,'2023-09-25 13:43:20','2023-09-26 15:47:54','delete.user',0,NULL),(19,'Profile View',5,NULL,'2023-09-25 13:45:21','2023-09-27 11:54:53','profile.view',1,1),(20,'Edit Profile',5,NULL,'2023-09-25 13:51:09','2023-09-27 11:54:48','profile.user.add',1,2),(21,'Change-Password',5,NULL,'2023-09-25 13:52:30','2023-09-27 11:54:58','password.view',1,3),(23,'Studen Class',6,NULL,'2023-09-25 13:54:54','2023-09-27 11:57:11','student.class.view',1,1),(24,'Add Class',6,NULL,'2023-09-25 13:55:22','2023-09-25 13:55:22','student.class.add',0,NULL),(25,'Edit Class',6,NULL,'2023-09-25 13:56:10','2023-09-25 13:56:10','student.class.edit',0,NULL),(26,'Delete Student',6,NULL,'2023-09-26 00:11:58','2023-09-26 00:11:58','student.class.delete',0,NULL),(27,'Student Year',6,NULL,'2023-09-26 00:12:30','2023-09-27 11:57:48','student.year.view',1,2),(28,'Add Year',6,NULL,'2023-09-26 00:13:21','2023-10-17 00:01:34','student.year.add',0,1),(29,'Edit Year',6,NULL,'2023-09-26 00:13:41','2023-09-26 00:13:41','student.year.edit',0,NULL),(30,'Delete Year',6,NULL,'2023-09-26 00:14:07','2023-09-26 00:14:07','student.year.delete',0,NULL),(31,'Student Group',6,NULL,'2023-09-26 00:14:31','2023-09-27 11:58:05','student.group.view',1,3),(32,'Add Group',6,NULL,'2023-09-26 00:14:50','2023-09-26 00:14:50','student.group.add',0,NULL),(33,'Edit Group',6,NULL,'2023-09-26 00:15:10','2023-09-26 00:15:10','student.group.edit',0,NULL),(34,'Delete Group',6,NULL,'2023-09-26 00:15:35','2023-09-26 00:15:35','student.group.delete',0,NULL),(35,'Student Shift',6,NULL,'2023-09-26 00:15:56','2023-09-27 11:58:21','student.shift.view',1,4),(36,'Add Shift',6,NULL,'2023-09-26 00:16:15','2023-09-26 00:16:15','student.shift.add',0,NULL),(37,'Edit Shift',6,NULL,'2023-09-26 00:16:42','2023-09-26 00:16:42','student.shift.edit',0,NULL),(38,'Delete Shift',6,NULL,'2023-09-26 00:16:58','2023-09-26 00:16:58','student.shift.delete',0,NULL),(39,'Fee Category',6,NULL,'2023-09-26 00:17:20','2023-09-27 11:58:37','fee.category.view',1,5),(40,'Add Fee',6,NULL,'2023-09-26 00:17:36','2023-09-26 00:17:36','fee.category.add',0,NULL),(41,'Edit Fee',6,NULL,'2023-09-26 00:17:57','2023-09-26 00:17:57','fee.category.edit',0,NULL),(42,'Delete Fee',6,NULL,'2023-09-26 00:18:12','2023-09-26 00:18:12','fee.category.delete',0,NULL),(43,'Fee Category Amount',6,NULL,'2023-09-26 00:22:32','2023-09-27 11:58:46','fee.amount.view',1,6),(44,'Add Fee Category',6,NULL,'2023-09-26 00:23:17','2023-09-26 00:23:17','fee.amount.add',0,NULL),(45,'Edit Fee Category',6,NULL,'2023-09-26 00:23:45','2023-09-26 00:23:45','fee.amount.edit',0,NULL),(46,'Detail Fee Category',6,NULL,'2023-09-26 00:24:08','2023-09-26 00:24:08','fee.amount.details',0,NULL),(47,'Exam Type',6,NULL,'2023-09-26 00:24:30','2023-09-27 11:59:08','exam.type.view',1,7),(48,'Add Exam Type',6,NULL,'2023-09-26 00:24:48','2023-09-26 00:24:48','exam.type.add',0,NULL),(49,'Edit Exam Type',6,NULL,'2023-09-26 00:25:17','2023-09-26 00:25:17','exam.type.edit',0,NULL),(50,'Delete Exam Type',6,NULL,'2023-09-26 00:26:07','2023-09-26 00:26:07','exam.type.delete',0,NULL),(51,'School Subject',6,NULL,'2023-09-26 00:27:05','2023-09-27 11:59:22','school.subject.view',1,8),(52,'Add School Subject',6,NULL,'2023-09-26 00:27:38','2023-09-26 00:27:38','school.subject.add',0,NULL),(53,'Edit School Subject',6,NULL,'2023-09-26 00:28:00','2023-09-26 00:28:00','school.subject.edit',0,NULL),(54,'Delete School Subject',6,NULL,'2023-09-26 00:28:21','2023-09-26 00:28:21','school.subject.delete',0,NULL),(55,'Assign Subject',6,NULL,'2023-09-26 00:28:44','2023-09-27 11:59:38','assign.subject.view',1,9),(56,'Add Assign Subject',6,NULL,'2023-09-26 00:29:04','2023-09-26 00:29:04','assign.subject.add',0,NULL),(57,'Edit Assign Subject',6,NULL,'2023-09-26 00:29:30','2023-09-26 00:29:30','assign.subject.edit',0,NULL),(58,'Detail Assign Subject',6,NULL,'2023-09-26 00:30:31','2023-09-26 00:30:31','assign.subject.details',0,NULL),(59,'Designation',6,NULL,'2023-09-26 00:30:49','2023-09-27 12:00:04','designation.view',1,10),(60,'Add Designation',6,NULL,'2023-09-26 00:31:02','2023-09-26 00:31:02','designation.add',0,NULL),(61,'Edit Designation',6,NULL,'2023-09-26 00:31:24','2023-09-26 00:31:24','designation.edit',0,NULL),(62,'Delete Designation.',6,NULL,'2023-09-26 00:32:07','2023-09-26 00:32:07','designation.delete',0,NULL),(63,'Student Registration',7,NULL,'2023-09-26 00:33:26','2023-09-26 00:33:26','student.registration.view',1,NULL),(64,'Add Student Registration',7,NULL,'2023-09-26 00:33:53','2023-09-26 00:33:53','student.registration.add',0,NULL),(65,'Student Search',7,NULL,'2023-09-26 00:35:49','2023-09-26 00:35:49','student.year.class.wise',0,NULL),(66,'Edit Student Registeration',7,NULL,'2023-09-26 00:36:12','2023-09-26 00:36:12','student.registration.edit',0,NULL),(67,'Student Register Promotion',7,NULL,'2023-09-26 00:37:56','2023-09-26 00:37:56','student.registration.promotion',0,NULL),(68,'Detail Student Registration',7,NULL,'2023-09-26 00:38:47','2023-09-26 00:38:47','student.registration.details',0,NULL),(78,'Employee Registration',11,NULL,'2023-09-26 00:46:31','2023-09-26 00:46:31','employee.registration.view',1,NULL),(79,'Add Employee',11,NULL,'2023-09-26 00:47:26','2023-09-26 00:47:26','employee.registration.add',0,NULL),(81,'Registration Fee',7,NULL,'2023-09-26 00:50:01','2023-09-26 00:50:01','registration.fee.view',1,NULL),(82,'Search Student Registration Fee',7,NULL,'2023-09-26 00:50:17','2023-09-26 00:50:17','student.registration.fee.classwise.get',0,NULL),(83,'Student Registration Fee PaySlip',7,NULL,'2023-09-26 00:50:39','2023-09-26 00:50:39','student.registration.fee.payslip',0,NULL),(84,'Monthly Fee',7,NULL,'2023-09-26 00:51:06','2023-09-26 00:51:06','monthly.fee.view',1,NULL),(85,'Search Student Monthly Fee',7,NULL,'2023-09-26 00:51:32','2023-09-26 00:51:32','student.monthly.fee.classwise.get',0,NULL),(86,'Monthly Fee Payslip',7,NULL,'2023-09-26 00:51:44','2023-09-26 00:51:44','student.monthly.fee.payslip',0,NULL),(87,'Exam Fee',7,NULL,'2023-09-26 00:52:07','2023-09-26 00:52:07','exam.fee.view',1,NULL),(88,'Search Student Exam Fee',7,NULL,'2023-09-26 00:52:24','2023-09-26 00:52:24','student.exam.fee.classwise.get',0,NULL),(89,'Exam Fee Payslip',7,NULL,'2023-09-26 00:52:53','2023-09-26 00:52:53','student.exam.fee.payslip',0,NULL),(91,'Edit Employee',11,NULL,'2023-09-26 00:54:36','2023-09-26 00:54:36','employee.registration.edit',0,NULL),(92,'Detail Employee',11,NULL,'2023-09-26 00:54:58','2023-09-26 00:54:58','employee.registration.details',0,NULL),(93,'Employee Salary',11,NULL,'2023-09-26 00:56:38','2023-09-26 00:56:38','employee.salary.view',1,NULL),(94,'Employee Salary Increment',11,NULL,'2023-09-26 00:57:05','2023-09-26 00:57:05','employee.salary.increment',0,NULL),(95,'Employee Salary Details',11,NULL,'2023-09-26 00:57:29','2023-09-26 00:57:29','employee.salary.details',0,NULL),(96,'Employee Leave',11,NULL,'2023-09-26 00:58:36','2023-09-26 00:58:36','employee.leave.view',1,NULL),(98,'Add Employee Leave',11,NULL,'2023-09-26 01:02:19','2023-09-26 01:02:19','employee.leave.add',0,NULL),(100,'Edit Employee Leave',11,NULL,'2023-09-26 01:03:19','2023-09-26 01:03:19','employee.leave.edit',0,NULL),(101,'Delete Employee Leave',11,NULL,'2023-09-26 01:03:32','2023-09-26 01:03:32','employee.leave.delete',0,NULL),(102,'Employee Attendance',11,NULL,'2023-09-26 01:05:26','2023-09-26 01:05:26','employee.attendance.view',1,NULL),(103,'Add Employe Attendance',11,NULL,'2023-09-26 01:05:53','2023-09-26 01:05:53','employee.attendance.add',0,NULL),(104,'Edit Employee Attendance',11,NULL,'2023-09-26 01:06:29','2023-09-26 01:06:29','employee.attendance.edit',0,NULL),(105,'Detail Employee Attendance',11,NULL,'2023-09-26 01:06:51','2023-09-26 01:06:51','employee.attendance.details',0,NULL),(106,'Employee Monthly Salary',11,NULL,'2023-09-26 01:07:29','2023-09-26 01:07:29','employee.monthly.salary',1,NULL),(107,'Search Employee Monthly Salary',11,NULL,'2023-09-26 01:08:22','2023-09-26 01:08:22','employee.monthly.salary.get',0,NULL),(108,'Employee Monthly Salary Payslip',11,NULL,'2023-09-26 01:08:40','2023-09-26 01:08:40','employee.monthly.salary.payslip',0,NULL),(109,'Marks Entry',12,NULL,'2023-09-26 01:10:25','2023-09-26 01:10:25','marks.entry.add',1,NULL),(110,'Edit Marks Entry',12,NULL,'2023-09-26 01:10:47','2023-09-26 01:12:30','marks.entry.edit',1,NULL),(111,'Search Marks Entry',12,NULL,'2023-09-26 01:11:40','2023-09-26 01:11:40','student.edit.getstudents',0,NULL),(112,'Marks Grade',12,NULL,'2023-09-26 01:13:18','2023-09-26 01:13:18','marks.entry.grade',1,NULL),(113,'Add MarksGrade',12,NULL,'2023-09-26 01:13:35','2023-09-26 01:13:35','marks.grade.add',0,NULL),(114,'Edit Marks Grade',12,NULL,'2023-09-26 01:13:54','2023-09-26 01:13:54','marks.grade.edit',0,NULL),(115,'Ajax Student Marks Getsubject',6,NULL,'2023-09-26 01:17:35','2023-09-26 01:18:38','student.marks.getstudents',0,NULL),(116,'Ajax Marks Getsubject',12,NULL,'2023-09-26 01:19:02','2023-09-26 01:19:02','marks.getsubject',0,NULL),(117,'Student Fee',13,NULL,'2023-09-26 01:21:16','2023-09-26 01:21:16','student.fee.view',1,NULL),(118,'Add Student Fee',13,NULL,'2023-09-26 01:21:36','2023-09-26 01:21:36','student.fee.add',0,NULL),(119,'Search Student Fee List',13,NULL,'2023-09-26 01:22:13','2023-09-26 01:22:13','account.fee.getstudent',0,NULL),(120,'Employee Salary',13,NULL,'2023-09-26 01:22:42','2023-09-26 01:22:42','account.salary.view',1,NULL),(121,'Add Account Salary',13,NULL,'2023-09-26 01:23:01','2023-09-26 01:23:01','account.salary.add',0,NULL),(122,'Search Employee Salary List',13,NULL,'2023-09-26 01:23:20','2023-09-26 01:23:20','account.salary.getemployee',0,NULL),(123,'Other Cost',13,NULL,'2023-09-26 01:23:49','2023-09-26 01:23:49','other.cost.view',1,NULL),(124,'Add Other Cost',13,NULL,'2023-09-26 01:24:02','2023-09-26 01:24:02','other.cost.add',0,NULL),(125,'Edit Other Cost',13,NULL,'2023-09-26 01:25:13','2023-09-26 01:25:13','edit.other.cost',0,NULL),(126,'Monthly-Yearly-Profit',14,NULL,'2023-09-26 01:26:37','2023-09-26 01:26:37','monthly.profit.view',1,NULL),(127,'Search Manage Monthly/Yearly Profit',14,NULL,'2023-09-26 01:27:11','2023-09-26 01:27:11','report.profit.datewais.get',0,NULL),(128,'Monthly Profit Pdf',14,NULL,'2023-09-26 01:27:30','2023-09-26 01:27:30','report.profit.pdf',0,NULL),(129,'MarkSheet Generate',14,NULL,'2023-09-26 01:28:35','2023-09-26 01:28:35','marksheet.generate.view',1,NULL),(130,'Search Manage MarkSheet Generate',14,NULL,'2023-09-26 01:28:58','2023-09-26 01:28:58','report.marksheet.get',0,NULL),(131,'Attendance Report',14,NULL,'2023-09-26 01:29:32','2023-09-26 01:29:32','attendance.report.view',1,NULL),(132,'Search Manage Employee Attendance Report',14,NULL,'2023-09-26 01:29:54','2023-09-26 01:29:54','report.attendance.get',0,NULL),(133,'Student Result',14,NULL,'2023-09-26 01:30:48','2023-09-26 01:30:48','student.result.view',1,NULL),(134,'Search Manage Student Result Report',14,NULL,'2023-09-26 01:31:28','2023-09-26 01:31:28','report.student.result.get',0,NULL),(135,'Student Id Card',14,NULL,'2023-09-26 01:31:58','2023-09-26 01:31:58','student.idcard.view',1,NULL),(136,'Search Manage Student ID Card',14,NULL,'2023-09-26 01:32:18','2023-09-26 01:32:18','report.student.idcard.get',0,NULL),(137,'Dashboard',15,NULL,'2023-09-26 01:33:56','2023-09-27 10:58:45','admin.dashboard',0,1),(138,'Log Out',16,NULL,'2023-09-27 01:02:11','2023-09-27 10:58:59','admin.logout',0,1);
/*!40000 ALTER TABLE `sys_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_modules`
--

DROP TABLE IF EXISTS `sys_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_modules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group` varchar(10) NOT NULL DEFAULT 'app' COMMENT 'app=(none group), sys=(system setting group), repo=(report group)',
  `position` int(11) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_modules`
--

LOCK TABLES `sys_modules` WRITE;
/*!40000 ALTER TABLE `sys_modules` DISABLE KEYS */;
INSERT INTO `sys_modules` VALUES (1,'Manage Module',NULL,'2023-09-25 06:39:00','2023-09-27 01:38:01','sys',10,'codesandbox',NULL),(2,'Manage Admin',NULL,'2023-09-25 13:08:05','2023-09-27 11:33:41','sys',9,'toggle-left','admin.members'),(3,'Role',NULL,'2023-09-25 13:39:53','2023-09-27 01:38:56','sys',11,'airplay',NULL),(4,'Manage User',NULL,'2023-09-25 13:42:21','2023-09-27 11:29:36','app',2,'users','admin.users'),(5,'Profile',NULL,'2023-09-25 13:44:52','2023-09-27 11:30:00','app',9,'user','admin.profile'),(6,'Setup Management',NULL,'2023-09-25 13:54:12','2023-09-27 11:30:16','app',3,'credit-card','admin.setups'),(7,'Student Mangement',NULL,'2023-09-26 00:32:53','2023-09-27 11:30:45','app',4,'hard-drive','admin.students'),(11,'Employee Management',NULL,'2023-09-26 00:45:23','2023-09-27 11:30:59','app',4,'package','admin.employees'),(12,'Marks Management',NULL,'2023-09-26 01:09:05','2023-09-27 11:32:50','app',6,'edit-2','admin.marks'),(13,'Account Management',NULL,'2023-09-26 01:20:16','2023-09-27 11:33:09','app',7,'inbox','admin.accounts'),(14,'Report Management',NULL,'2023-09-26 01:25:49','2023-09-27 11:33:23','repo',8,'server','admin.reports'),(15,'Dashboard',NULL,'2023-09-26 01:33:35','2023-09-27 11:29:19','app',1,'pie-chart','admin.dashboard'),(16,'Log Out',NULL,'2023-09-27 01:01:34','2023-09-27 11:34:28','sys',12,'lock','admin.logout');
/*!40000 ALTER TABLE `sys_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_roles`
--

DROP TABLE IF EXISTS `sys_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=hidden,1=show',
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `permission_type` varchar(50) DEFAULT NULL,
  `creator` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_roles`
--

LOCK TABLES `sys_roles` WRITE;
/*!40000 ALTER TABLE `sys_roles` DISABLE KEYS */;
INSERT INTO `sys_roles` VALUES (1,'admin',NULL,'2023-09-25 12:29:59','2023-10-08 08:21:21',1,'[{\"id\": 15, \"icon\": \"pie-chart\", \"name\": \"Dashboard\", \"group\": \"app\", \"prefix\": \"admin.dashboard\", \"methods\": [{\"id\": 137, \"name\": \"Dashboard\", \"is_menu\": 0, \"position\": 1, \"sys_name\": \"admin.dashboard\", \"sys_module_id\": 15}], \"position\": 1}, {\"id\": 4, \"icon\": \"users\", \"name\": \"Manage User\", \"group\": \"app\", \"prefix\": \"admin.users\", \"methods\": [{\"id\": 15, \"name\": \"View User\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"user.view\", \"sys_module_id\": 4}, {\"id\": 16, \"name\": \"Add User\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"user.add\", \"sys_module_id\": 4}, {\"id\": 17, \"name\": \"Edit User\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"user.edit\", \"sys_module_id\": 4}, {\"id\": 18, \"name\": \"Delete User\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"delete.user\", \"sys_module_id\": 4}], \"position\": 2}, {\"id\": 6, \"icon\": \"credit-card\", \"name\": \"Setup Management\", \"group\": \"app\", \"prefix\": \"admin.setups\", \"methods\": [{\"id\": 24, \"name\": \"Add Class\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.class.add\", \"sys_module_id\": 6}, {\"id\": 25, \"name\": \"Edit Class\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.class.edit\", \"sys_module_id\": 6}, {\"id\": 26, \"name\": \"Delete Student\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.class.delete\", \"sys_module_id\": 6}, {\"id\": 28, \"name\": \"student.year.add\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"Add Year\", \"sys_module_id\": 6}, {\"id\": 29, \"name\": \"Edit Year\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.year.edit\", \"sys_module_id\": 6}, {\"id\": 30, \"name\": \"Delete Year\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.year.delete\", \"sys_module_id\": 6}, {\"id\": 32, \"name\": \"Add Group\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.group.add\", \"sys_module_id\": 6}, {\"id\": 33, \"name\": \"Edit Group\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.group.edit\", \"sys_module_id\": 6}, {\"id\": 34, \"name\": \"Delete Group\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.group.delete\", \"sys_module_id\": 6}, {\"id\": 36, \"name\": \"Add Shift\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.shift.add\", \"sys_module_id\": 6}, {\"id\": 37, \"name\": \"Edit Shift\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.shift.edit\", \"sys_module_id\": 6}, {\"id\": 38, \"name\": \"Delete Shift\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.shift.delete\", \"sys_module_id\": 6}, {\"id\": 40, \"name\": \"Add Fee\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"fee.category.add\", \"sys_module_id\": 6}, {\"id\": 41, \"name\": \"Edit Fee\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"fee.category.edit\", \"sys_module_id\": 6}, {\"id\": 42, \"name\": \"Delete Fee\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"fee.category.delete\", \"sys_module_id\": 6}, {\"id\": 44, \"name\": \"Add Fee Category\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"fee.amount.add\", \"sys_module_id\": 6}, {\"id\": 45, \"name\": \"Edit Fee Category\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"fee.amount.edit\", \"sys_module_id\": 6}, {\"id\": 46, \"name\": \"Detail Fee Category\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"fee.amount.details\", \"sys_module_id\": 6}, {\"id\": 48, \"name\": \"Add Exam Type\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"exam.type.add\", \"sys_module_id\": 6}, {\"id\": 49, \"name\": \"Edit Exam Type\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"exam.type.edit\", \"sys_module_id\": 6}, {\"id\": 50, \"name\": \"Delete Exam Type\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"exam.type.delete\", \"sys_module_id\": 6}, {\"id\": 52, \"name\": \"Add School Subject\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"school.subject.add\", \"sys_module_id\": 6}, {\"id\": 53, \"name\": \"Edit School Subject\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"school.subject.edit\", \"sys_module_id\": 6}, {\"id\": 54, \"name\": \"Delete School Subject\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"school.subject.delete\", \"sys_module_id\": 6}, {\"id\": 56, \"name\": \"Add Assign Subject\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"assign.subject.add\", \"sys_module_id\": 6}, {\"id\": 57, \"name\": \"Edit Assign Subject\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"assign.subject.edit\", \"sys_module_id\": 6}, {\"id\": 58, \"name\": \"Detail Assign Subject\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"assign.subject.details\", \"sys_module_id\": 6}, {\"id\": 60, \"name\": \"Add Designation\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"designation.add\", \"sys_module_id\": 6}, {\"id\": 61, \"name\": \"Edit Designation\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"designation.edit\", \"sys_module_id\": 6}, {\"id\": 62, \"name\": \"Delete Designation.\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"designation.delete\", \"sys_module_id\": 6}, {\"id\": 115, \"name\": \"Ajax Student Marks Getsubject\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.marks.getstudents\", \"sys_module_id\": 6}, {\"id\": 23, \"name\": \"Studen Class\", \"is_menu\": 1, \"position\": 1, \"sys_name\": \"student.class.view\", \"sys_module_id\": 6}, {\"id\": 27, \"name\": \"Student Year\", \"is_menu\": 1, \"position\": 2, \"sys_name\": \"student.year.view\", \"sys_module_id\": 6}, {\"id\": 31, \"name\": \"Student Group\", \"is_menu\": 1, \"position\": 3, \"sys_name\": \"student.group.view\", \"sys_module_id\": 6}, {\"id\": 35, \"name\": \"Student Shift\", \"is_menu\": 1, \"position\": 4, \"sys_name\": \"student.shift.view\", \"sys_module_id\": 6}, {\"id\": 39, \"name\": \"Fee Category\", \"is_menu\": 1, \"position\": 5, \"sys_name\": \"fee.category.view\", \"sys_module_id\": 6}, {\"id\": 43, \"name\": \"Fee Category Amount\", \"is_menu\": 1, \"position\": 6, \"sys_name\": \"fee.amount.view\", \"sys_module_id\": 6}, {\"id\": 47, \"name\": \"Exam Type\", \"is_menu\": 1, \"position\": 7, \"sys_name\": \"exam.type.view\", \"sys_module_id\": 6}, {\"id\": 51, \"name\": \"School Subject\", \"is_menu\": 1, \"position\": 8, \"sys_name\": \"school.subject.view\", \"sys_module_id\": 6}, {\"id\": 55, \"name\": \"Assign Subject\", \"is_menu\": 1, \"position\": 9, \"sys_name\": \"assign.subject.view\", \"sys_module_id\": 6}, {\"id\": 59, \"name\": \"Designation\", \"is_menu\": 1, \"position\": 10, \"sys_name\": \"designation.view\", \"sys_module_id\": 6}], \"position\": 3}, {\"id\": 7, \"icon\": \"hard-drive\", \"name\": \"Student Mangement\", \"group\": \"app\", \"prefix\": \"admin.students\", \"methods\": [{\"id\": 63, \"name\": \"Student Registration\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"student.registration.view\", \"sys_module_id\": 7}, {\"id\": 64, \"name\": \"Add Student Registration\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.registration.add\", \"sys_module_id\": 7}, {\"id\": 65, \"name\": \"Student Search\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.year.class.wise\", \"sys_module_id\": 7}, {\"id\": 66, \"name\": \"Edit Student Registeration\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.registration.edit\", \"sys_module_id\": 7}, {\"id\": 67, \"name\": \"Student Register Promotion\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.registration.promotion\", \"sys_module_id\": 7}, {\"id\": 68, \"name\": \"Detail Student Registration\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.registration.details\", \"sys_module_id\": 7}, {\"id\": 81, \"name\": \"Registration Fee\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"registration.fee.view\", \"sys_module_id\": 7}, {\"id\": 82, \"name\": \"Search Student Registration Fee\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.registration.fee.classwise.get\", \"sys_module_id\": 7}, {\"id\": 83, \"name\": \"Student Registration Fee PaySlip\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.registration.fee.payslip\", \"sys_module_id\": 7}, {\"id\": 84, \"name\": \"Monthly Fee\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"monthly.fee.view\", \"sys_module_id\": 7}, {\"id\": 85, \"name\": \"Search Student Monthly Fee\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.monthly.fee.classwise.get\", \"sys_module_id\": 7}, {\"id\": 86, \"name\": \"Monthly Fee Payslip\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.monthly.fee.payslip\", \"sys_module_id\": 7}, {\"id\": 87, \"name\": \"Exam Fee\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"exam.fee.view\", \"sys_module_id\": 7}, {\"id\": 88, \"name\": \"Search Student Exam Fee\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.exam.fee.classwise.get\", \"sys_module_id\": 7}, {\"id\": 89, \"name\": \"Exam Fee Payslip\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.exam.fee.payslip\", \"sys_module_id\": 7}], \"position\": 4}, {\"id\": 11, \"icon\": \"package\", \"name\": \"Employee Management\", \"group\": \"app\", \"prefix\": \"admin.employees\", \"methods\": [{\"id\": 78, \"name\": \"Employee Registration\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"employee.registration.view\", \"sys_module_id\": 11}, {\"id\": 79, \"name\": \"Add Employee\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"employee.registration.add\", \"sys_module_id\": 11}, {\"id\": 91, \"name\": \"Edit Employee\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"employee.registration.edit\", \"sys_module_id\": 11}, {\"id\": 92, \"name\": \"Detail Employee\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"employee.registration.details\", \"sys_module_id\": 11}, {\"id\": 93, \"name\": \"Employee Salary\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"employee.salary.view\", \"sys_module_id\": 11}, {\"id\": 94, \"name\": \"Employee Salary Increment\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"employee.salary.increment\", \"sys_module_id\": 11}, {\"id\": 95, \"name\": \"Employee Salary Details\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"employee.salary.details\", \"sys_module_id\": 11}, {\"id\": 96, \"name\": \"Employee Leave\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"employee.leave.view\", \"sys_module_id\": 11}, {\"id\": 98, \"name\": \"Add Employee Leave\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"employee.leave.add\", \"sys_module_id\": 11}, {\"id\": 100, \"name\": \"Edit Employee Leave\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"employee.leave.edit\", \"sys_module_id\": 11}, {\"id\": 101, \"name\": \"Delete Employee Leave\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"employee.leave.delete\", \"sys_module_id\": 11}, {\"id\": 102, \"name\": \"Employee Attendance\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"employee.attendance.view\", \"sys_module_id\": 11}, {\"id\": 103, \"name\": \"Add Employe Attendance\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"employee.attendance.add\", \"sys_module_id\": 11}, {\"id\": 104, \"name\": \"Edit Employee Attendance\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"employee.attendance.edit\", \"sys_module_id\": 11}, {\"id\": 105, \"name\": \"Detail Employee Attendance\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"employee.attendance.details\", \"sys_module_id\": 11}, {\"id\": 106, \"name\": \"Employee Monthly Salary\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"employee.monthly.salary\", \"sys_module_id\": 11}, {\"id\": 107, \"name\": \"Search Employee Monthly Salary\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"employee.monthly.salary.get\", \"sys_module_id\": 11}, {\"id\": 108, \"name\": \"Employee Monthly Salary Payslip\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"employee.monthly.salary.payslip\", \"sys_module_id\": 11}], \"position\": 4}, {\"id\": 12, \"icon\": \"edit-2\", \"name\": \"Marks Management\", \"group\": \"app\", \"prefix\": \"admin.marks\", \"methods\": [{\"id\": 109, \"name\": \"Marks Entry\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"marks.entry.add\", \"sys_module_id\": 12}, {\"id\": 110, \"name\": \"Edit Marks Entry\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"marks.entry.edit\", \"sys_module_id\": 12}, {\"id\": 111, \"name\": \"Search Marks Entry\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.edit.getstudents\", \"sys_module_id\": 12}, {\"id\": 112, \"name\": \"Marks Grade\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"marks.entry.grade\", \"sys_module_id\": 12}, {\"id\": 113, \"name\": \"Add MarksGrade\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"marks.grade.add\", \"sys_module_id\": 12}, {\"id\": 114, \"name\": \"Edit Marks Grade\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"marks.grade.edit\", \"sys_module_id\": 12}, {\"id\": 116, \"name\": \"Ajax Marks Getsubject\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"marks.getsubject\", \"sys_module_id\": 12}], \"position\": 6}, {\"id\": 13, \"icon\": \"inbox\", \"name\": \"Account Management\", \"group\": \"app\", \"prefix\": \"admin.accounts\", \"methods\": [{\"id\": 117, \"name\": \"Student Fee\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"student.fee.view\", \"sys_module_id\": 13}, {\"id\": 118, \"name\": \"Add Student Fee\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.fee.add\", \"sys_module_id\": 13}, {\"id\": 119, \"name\": \"Search Student Fee List\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"account.fee.getstudent\", \"sys_module_id\": 13}, {\"id\": 120, \"name\": \"Employee Salary\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"account.salary.view\", \"sys_module_id\": 13}, {\"id\": 121, \"name\": \"Add Account Salary\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"account.salary.add\", \"sys_module_id\": 13}, {\"id\": 122, \"name\": \"Search Employee Salary List\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"account.salary.getemployee\", \"sys_module_id\": 13}, {\"id\": 123, \"name\": \"Other Cost\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"other.cost.view\", \"sys_module_id\": 13}, {\"id\": 124, \"name\": \"Add Other Cost\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"other.cost.add\", \"sys_module_id\": 13}, {\"id\": 125, \"name\": \"Edit Other Cost\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"edit.other.cost\", \"sys_module_id\": 13}], \"position\": 7}, {\"id\": 14, \"icon\": \"server\", \"name\": \"Report Management\", \"group\": \"repo\", \"prefix\": \"admin.reports\", \"methods\": [{\"id\": 126, \"name\": \"Monthly-Yearly-Profit\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"monthly.profit.view\", \"sys_module_id\": 14}, {\"id\": 127, \"name\": \"Search Manage Monthly/Yearly Profit\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"report.profit.datewais.get\", \"sys_module_id\": 14}, {\"id\": 128, \"name\": \"Monthly Profit Pdf\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"report.profit.pdf\", \"sys_module_id\": 14}, {\"id\": 129, \"name\": \"MarkSheet Generate\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"marksheet.generate.view\", \"sys_module_id\": 14}, {\"id\": 130, \"name\": \"Search Manage MarkSheet Generate\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"report.marksheet.get\", \"sys_module_id\": 14}, {\"id\": 131, \"name\": \"Attendance Report\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"attendance.report.view\", \"sys_module_id\": 14}, {\"id\": 132, \"name\": \"Search Manage Employee Attendance Report\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"report.attendance.get\", \"sys_module_id\": 14}, {\"id\": 133, \"name\": \"Student Result\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"student.result.view\", \"sys_module_id\": 14}, {\"id\": 134, \"name\": \"Search Manage Student Result Report\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"report.student.result.get\", \"sys_module_id\": 14}, {\"id\": 135, \"name\": \"Student Id Card\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"student.idcard.view\", \"sys_module_id\": 14}, {\"id\": 136, \"name\": \"Search Manage Student ID Card\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"report.student.idcard.get\", \"sys_module_id\": 14}], \"position\": 8}, {\"id\": 2, \"icon\": \"toggle-left\", \"name\": \"Manage Admin\", \"group\": \"sys\", \"prefix\": \"admin.members\", \"methods\": [{\"id\": 4, \"name\": \"View Admin\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"admin.member.view\", \"sys_module_id\": 2}, {\"id\": 5, \"name\": \"Add Admin\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"admin.member.add\", \"sys_module_id\": 2}, {\"id\": 6, \"name\": \"Edit Admin\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"admin.member.edit\", \"sys_module_id\": 2}, {\"id\": 7, \"name\": \"Delete Admin\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"admin.member.delete\", \"sys_module_id\": 2}], \"position\": 9}, {\"id\": 5, \"icon\": \"user\", \"name\": \"Profile\", \"group\": \"app\", \"prefix\": \"admin.profile\", \"methods\": [{\"id\": 19, \"name\": \"Profile View\", \"is_menu\": 1, \"position\": 1, \"sys_name\": \"profile.view\", \"sys_module_id\": 5}, {\"id\": 20, \"name\": \"Edit Profile\", \"is_menu\": 1, \"position\": 2, \"sys_name\": \"profile.user.add\", \"sys_module_id\": 5}, {\"id\": 21, \"name\": \"Change-Password\", \"is_menu\": 1, \"position\": 3, \"sys_name\": \"password.view\", \"sys_module_id\": 5}], \"position\": 9}, {\"id\": 1, \"icon\": \"codesandbox\", \"name\": \"Manage Module\", \"group\": \"sys\", \"prefix\": null, \"methods\": [{\"id\": 2, \"name\": \"Add Method\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"method.add\", \"sys_module_id\": 1}, {\"id\": 3, \"name\": \"Edit Method\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"method.edit\", \"sys_module_id\": 1}, {\"id\": 8, \"name\": \"View Module\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"module.view\", \"sys_module_id\": 1}, {\"id\": 9, \"name\": \"Add Module\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"module.add\", \"sys_module_id\": 1}, {\"id\": 10, \"name\": \"Edit Module\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"module.edit\", \"sys_module_id\": 1}, {\"id\": 1, \"name\": \"View Method\", \"is_menu\": 0, \"position\": 1, \"sys_name\": \"method.view\", \"sys_module_id\": 1}], \"position\": 10}, {\"id\": 3, \"icon\": \"airplay\", \"name\": \"Role\", \"group\": \"sys\", \"prefix\": null, \"methods\": [{\"id\": 11, \"name\": \"View Role\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"role.view\", \"sys_module_id\": 3}, {\"id\": 12, \"name\": \"Add Role\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"role.add\", \"sys_module_id\": 3}, {\"id\": 13, \"name\": \"Edit Role\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"role.edit\", \"sys_module_id\": 3}, {\"id\": 14, \"name\": \"Disabled Role\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"role.delete\", \"sys_module_id\": 3}], \"position\": 11}, {\"id\": 16, \"icon\": \"lock\", \"name\": \"Log Out\", \"group\": \"sys\", \"prefix\": \"admin.logout\", \"methods\": [{\"id\": 138, \"name\": \"Log Out\", \"is_menu\": 0, \"position\": 1, \"sys_name\": \"admin.logout\", \"sys_module_id\": 16}], \"position\": 12}]','all',1),(4,'Director',NULL,'2023-09-26 11:55:12','2023-10-08 08:19:38',1,'[{\"id\": 15, \"icon\": \"pie-chart\", \"name\": \"Dashboard\", \"group\": \"app\", \"prefix\": \"admin.dashboard\", \"methods\": [{\"id\": 137, \"name\": \"Dashboard\", \"is_menu\": 0, \"position\": 1, \"sys_name\": \"admin.dashboard\", \"sys_module_id\": 15}], \"position\": 1}, {\"id\": 4, \"icon\": \"users\", \"name\": \"Manage User\", \"group\": \"app\", \"prefix\": \"admin.users\", \"methods\": {\"1\": {\"id\": 16, \"name\": \"Add User\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"user.add\", \"sys_module_id\": 4}, \"2\": {\"id\": 17, \"name\": \"Edit User\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"user.edit\", \"sys_module_id\": 4}}, \"position\": 2}]','custom',1),(5,'admin2',NULL,'2023-10-04 10:54:34','2023-10-08 07:22:02',1,'[{\"id\": 15, \"icon\": \"pie-chart\", \"name\": \"Dashboard\", \"group\": \"app\", \"prefix\": \"admin.dashboard\", \"methods\": [{\"id\": 137, \"name\": \"Dashboard\", \"is_menu\": 0, \"position\": 1, \"sys_name\": \"admin.dashboard\", \"sys_module_id\": 15}], \"position\": 1}, {\"id\": 4, \"icon\": \"users\", \"name\": \"Manage User\", \"group\": \"app\", \"prefix\": \"admin.users\", \"methods\": [{\"id\": 15, \"name\": \"View User\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"user.view\", \"sys_module_id\": 4}, {\"id\": 16, \"name\": \"Add User\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"user.add\", \"sys_module_id\": 4}, {\"id\": 17, \"name\": \"Edit User\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"user.edit\", \"sys_module_id\": 4}, {\"id\": 18, \"name\": \"Delete User\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"delete.user\", \"sys_module_id\": 4}], \"position\": 2}, {\"id\": 6, \"icon\": \"credit-card\", \"name\": \"Setup Management\", \"group\": \"app\", \"prefix\": \"admin.setups\", \"methods\": [{\"id\": 24, \"name\": \"Add Class\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.class.add\", \"sys_module_id\": 6}, {\"id\": 25, \"name\": \"Edit Class\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.class.edit\", \"sys_module_id\": 6}, {\"id\": 26, \"name\": \"Delete Student\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.class.delete\", \"sys_module_id\": 6}, {\"id\": 28, \"name\": \"student.year.add\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"Add Year\", \"sys_module_id\": 6}, {\"id\": 29, \"name\": \"Edit Year\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.year.edit\", \"sys_module_id\": 6}, {\"id\": 30, \"name\": \"Delete Year\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.year.delete\", \"sys_module_id\": 6}, {\"id\": 32, \"name\": \"Add Group\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.group.add\", \"sys_module_id\": 6}, {\"id\": 33, \"name\": \"Edit Group\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.group.edit\", \"sys_module_id\": 6}, {\"id\": 34, \"name\": \"Delete Group\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.group.delete\", \"sys_module_id\": 6}, {\"id\": 36, \"name\": \"Add Shift\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.shift.add\", \"sys_module_id\": 6}, {\"id\": 37, \"name\": \"Edit Shift\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.shift.edit\", \"sys_module_id\": 6}, {\"id\": 38, \"name\": \"Delete Shift\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.shift.delete\", \"sys_module_id\": 6}, {\"id\": 40, \"name\": \"Add Fee\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"fee.category.add\", \"sys_module_id\": 6}, {\"id\": 41, \"name\": \"Edit Fee\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"fee.category.edit\", \"sys_module_id\": 6}, {\"id\": 42, \"name\": \"Delete Fee\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"fee.category.delete\", \"sys_module_id\": 6}, {\"id\": 44, \"name\": \"Add Fee Category\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"fee.amount.add\", \"sys_module_id\": 6}, {\"id\": 45, \"name\": \"Edit Fee Category\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"fee.amount.edit\", \"sys_module_id\": 6}, {\"id\": 46, \"name\": \"Detail Fee Category\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"fee.amount.details\", \"sys_module_id\": 6}, {\"id\": 48, \"name\": \"Add Exam Type\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"exam.type.add\", \"sys_module_id\": 6}, {\"id\": 49, \"name\": \"Edit Exam Type\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"exam.type.edit\", \"sys_module_id\": 6}, {\"id\": 50, \"name\": \"Delete Exam Type\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"exam.type.delete\", \"sys_module_id\": 6}, {\"id\": 52, \"name\": \"Add School Subject\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"school.subject.add\", \"sys_module_id\": 6}, {\"id\": 53, \"name\": \"Edit School Subject\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"school.subject.edit\", \"sys_module_id\": 6}, {\"id\": 54, \"name\": \"Delete School Subject\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"school.subject.delete\", \"sys_module_id\": 6}, {\"id\": 56, \"name\": \"Add Assign Subject\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"assign.subject.add\", \"sys_module_id\": 6}, {\"id\": 57, \"name\": \"Edit Assign Subject\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"assign.subject.edit\", \"sys_module_id\": 6}, {\"id\": 58, \"name\": \"Detail Assign Subject\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"assign.subject.details\", \"sys_module_id\": 6}, {\"id\": 60, \"name\": \"Add Designation\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"designation.add\", \"sys_module_id\": 6}, {\"id\": 61, \"name\": \"Edit Designation\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"designation.edit\", \"sys_module_id\": 6}, {\"id\": 62, \"name\": \"Delete Designation.\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"designation.delete\", \"sys_module_id\": 6}, {\"id\": 115, \"name\": \"Ajax Student Marks Getsubject\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.marks.getstudents\", \"sys_module_id\": 6}, {\"id\": 23, \"name\": \"Studen Class\", \"is_menu\": 1, \"position\": 1, \"sys_name\": \"student.class.view\", \"sys_module_id\": 6}, {\"id\": 27, \"name\": \"Student Year\", \"is_menu\": 1, \"position\": 2, \"sys_name\": \"student.year.view\", \"sys_module_id\": 6}, {\"id\": 31, \"name\": \"Student Group\", \"is_menu\": 1, \"position\": 3, \"sys_name\": \"student.group.view\", \"sys_module_id\": 6}, {\"id\": 35, \"name\": \"Student Shift\", \"is_menu\": 1, \"position\": 4, \"sys_name\": \"student.shift.view\", \"sys_module_id\": 6}, {\"id\": 39, \"name\": \"Fee Category\", \"is_menu\": 1, \"position\": 5, \"sys_name\": \"fee.category.view\", \"sys_module_id\": 6}, {\"id\": 43, \"name\": \"Fee Category Amount\", \"is_menu\": 1, \"position\": 6, \"sys_name\": \"fee.amount.view\", \"sys_module_id\": 6}, {\"id\": 47, \"name\": \"Exam Type\", \"is_menu\": 1, \"position\": 7, \"sys_name\": \"exam.type.view\", \"sys_module_id\": 6}, {\"id\": 51, \"name\": \"School Subject\", \"is_menu\": 1, \"position\": 8, \"sys_name\": \"school.subject.view\", \"sys_module_id\": 6}, {\"id\": 55, \"name\": \"Assign Subject\", \"is_menu\": 1, \"position\": 9, \"sys_name\": \"assign.subject.view\", \"sys_module_id\": 6}, {\"id\": 59, \"name\": \"Designation\", \"is_menu\": 1, \"position\": 10, \"sys_name\": \"designation.view\", \"sys_module_id\": 6}], \"position\": 3}, {\"id\": 7, \"icon\": \"hard-drive\", \"name\": \"Student Mangement\", \"group\": \"app\", \"prefix\": \"admin.students\", \"methods\": [{\"id\": 63, \"name\": \"Student Registration\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"student.registration.view\", \"sys_module_id\": 7}, {\"id\": 64, \"name\": \"Add Student Registration\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.registration.add\", \"sys_module_id\": 7}, {\"id\": 65, \"name\": \"Student Search\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.year.class.wise\", \"sys_module_id\": 7}, {\"id\": 66, \"name\": \"Edit Student Registeration\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.registration.edit\", \"sys_module_id\": 7}, {\"id\": 67, \"name\": \"Student Register Promotion\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.registration.promotion\", \"sys_module_id\": 7}, {\"id\": 68, \"name\": \"Detail Student Registration\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.registration.details\", \"sys_module_id\": 7}, {\"id\": 81, \"name\": \"Registration Fee\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"registration.fee.view\", \"sys_module_id\": 7}, {\"id\": 82, \"name\": \"Search Student Registration Fee\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.registration.fee.classwise.get\", \"sys_module_id\": 7}, {\"id\": 83, \"name\": \"Student Registration Fee PaySlip\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.registration.fee.payslip\", \"sys_module_id\": 7}, {\"id\": 84, \"name\": \"Monthly Fee\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"monthly.fee.view\", \"sys_module_id\": 7}, {\"id\": 85, \"name\": \"Search Student Monthly Fee\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.monthly.fee.classwise.get\", \"sys_module_id\": 7}, {\"id\": 86, \"name\": \"Monthly Fee Payslip\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.monthly.fee.payslip\", \"sys_module_id\": 7}, {\"id\": 87, \"name\": \"Exam Fee\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"exam.fee.view\", \"sys_module_id\": 7}, {\"id\": 88, \"name\": \"Search Student Exam Fee\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.exam.fee.classwise.get\", \"sys_module_id\": 7}, {\"id\": 89, \"name\": \"Exam Fee Payslip\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.exam.fee.payslip\", \"sys_module_id\": 7}], \"position\": 4}, {\"id\": 11, \"icon\": \"package\", \"name\": \"Employee Management\", \"group\": \"app\", \"prefix\": \"admin.employees\", \"methods\": [{\"id\": 78, \"name\": \"Employee Registration\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"employee.registration.view\", \"sys_module_id\": 11}, {\"id\": 79, \"name\": \"Add Employee\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"employee.registration.add\", \"sys_module_id\": 11}, {\"id\": 91, \"name\": \"Edit Employee\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"employee.registration.edit\", \"sys_module_id\": 11}, {\"id\": 92, \"name\": \"Detail Employee\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"employee.registration.details\", \"sys_module_id\": 11}, {\"id\": 93, \"name\": \"Employee Salary\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"employee.salary.view\", \"sys_module_id\": 11}, {\"id\": 94, \"name\": \"Employee Salary Increment\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"employee.salary.increment\", \"sys_module_id\": 11}, {\"id\": 95, \"name\": \"Employee Salary Details\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"employee.salary.details\", \"sys_module_id\": 11}, {\"id\": 96, \"name\": \"Employee Leave\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"employee.leave.view\", \"sys_module_id\": 11}, {\"id\": 98, \"name\": \"Add Employee Leave\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"employee.leave.add\", \"sys_module_id\": 11}, {\"id\": 100, \"name\": \"Edit Employee Leave\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"employee.leave.edit\", \"sys_module_id\": 11}, {\"id\": 101, \"name\": \"Delete Employee Leave\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"employee.leave.delete\", \"sys_module_id\": 11}, {\"id\": 102, \"name\": \"Employee Attendance\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"employee.attendance.view\", \"sys_module_id\": 11}, {\"id\": 103, \"name\": \"Add Employe Attendance\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"employee.attendance.add\", \"sys_module_id\": 11}, {\"id\": 104, \"name\": \"Edit Employee Attendance\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"employee.attendance.edit\", \"sys_module_id\": 11}, {\"id\": 105, \"name\": \"Detail Employee Attendance\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"employee.attendance.details\", \"sys_module_id\": 11}, {\"id\": 106, \"name\": \"Employee Monthly Salary\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"employee.monthly.salary\", \"sys_module_id\": 11}, {\"id\": 107, \"name\": \"Search Employee Monthly Salary\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"employee.monthly.salary.get\", \"sys_module_id\": 11}, {\"id\": 108, \"name\": \"Employee Monthly Salary Payslip\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"employee.monthly.salary.payslip\", \"sys_module_id\": 11}], \"position\": 4}, {\"id\": 12, \"icon\": \"edit-2\", \"name\": \"Marks Management\", \"group\": \"app\", \"prefix\": \"admin.marks\", \"methods\": [{\"id\": 109, \"name\": \"Marks Entry\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"marks.entry.add\", \"sys_module_id\": 12}, {\"id\": 110, \"name\": \"Edit Marks Entry\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"marks.entry.edit\", \"sys_module_id\": 12}, {\"id\": 111, \"name\": \"Search Marks Entry\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.edit.getstudents\", \"sys_module_id\": 12}, {\"id\": 112, \"name\": \"Marks Grade\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"marks.entry.grade\", \"sys_module_id\": 12}, {\"id\": 113, \"name\": \"Add MarksGrade\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"marks.grade.add\", \"sys_module_id\": 12}, {\"id\": 114, \"name\": \"Edit Marks Grade\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"marks.grade.edit\", \"sys_module_id\": 12}, {\"id\": 116, \"name\": \"Ajax Marks Getsubject\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"marks.getsubject\", \"sys_module_id\": 12}], \"position\": 6}, {\"id\": 13, \"icon\": \"inbox\", \"name\": \"Account Management\", \"group\": \"app\", \"prefix\": \"admin.accounts\", \"methods\": [{\"id\": 117, \"name\": \"Student Fee\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"student.fee.view\", \"sys_module_id\": 13}, {\"id\": 118, \"name\": \"Add Student Fee\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"student.fee.add\", \"sys_module_id\": 13}, {\"id\": 119, \"name\": \"Search Student Fee List\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"account.fee.getstudent\", \"sys_module_id\": 13}, {\"id\": 120, \"name\": \"Employee Salary\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"account.salary.view\", \"sys_module_id\": 13}, {\"id\": 121, \"name\": \"Add Account Salary\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"account.salary.add\", \"sys_module_id\": 13}, {\"id\": 122, \"name\": \"Search Employee Salary List\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"account.salary.getemployee\", \"sys_module_id\": 13}, {\"id\": 123, \"name\": \"Other Cost\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"other.cost.view\", \"sys_module_id\": 13}, {\"id\": 124, \"name\": \"Add Other Cost\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"other.cost.add\", \"sys_module_id\": 13}, {\"id\": 125, \"name\": \"Edit Other Cost\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"edit.other.cost\", \"sys_module_id\": 13}], \"position\": 7}, {\"id\": 14, \"icon\": \"server\", \"name\": \"Report Management\", \"group\": \"repo\", \"prefix\": \"admin.reports\", \"methods\": [{\"id\": 126, \"name\": \"Monthly-Yearly-Profit\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"monthly.profit.view\", \"sys_module_id\": 14}, {\"id\": 127, \"name\": \"Search Manage Monthly/Yearly Profit\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"report.profit.datewais.get\", \"sys_module_id\": 14}, {\"id\": 128, \"name\": \"Monthly Profit Pdf\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"report.profit.pdf\", \"sys_module_id\": 14}, {\"id\": 129, \"name\": \"MarkSheet Generate\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"marksheet.generate.view\", \"sys_module_id\": 14}, {\"id\": 130, \"name\": \"Search Manage MarkSheet Generate\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"report.marksheet.get\", \"sys_module_id\": 14}, {\"id\": 131, \"name\": \"Attendance Report\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"attendance.report.view\", \"sys_module_id\": 14}, {\"id\": 132, \"name\": \"Search Manage Employee Attendance Report\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"report.attendance.get\", \"sys_module_id\": 14}, {\"id\": 133, \"name\": \"Student Result\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"student.result.view\", \"sys_module_id\": 14}, {\"id\": 134, \"name\": \"Search Manage Student Result Report\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"report.student.result.get\", \"sys_module_id\": 14}, {\"id\": 135, \"name\": \"Student Id Card\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"student.idcard.view\", \"sys_module_id\": 14}, {\"id\": 136, \"name\": \"Search Manage Student ID Card\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"report.student.idcard.get\", \"sys_module_id\": 14}], \"position\": 8}, {\"id\": 2, \"icon\": \"toggle-left\", \"name\": \"Manage Admin\", \"group\": \"sys\", \"prefix\": \"admin.members\", \"methods\": [{\"id\": 4, \"name\": \"View Admin\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"admin.member.view\", \"sys_module_id\": 2}, {\"id\": 5, \"name\": \"Add Admin\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"admin.member.add\", \"sys_module_id\": 2}, {\"id\": 6, \"name\": \"Edit Admin\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"admin.member.edit\", \"sys_module_id\": 2}, {\"id\": 7, \"name\": \"Delete Admin\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"admin.member.delete\", \"sys_module_id\": 2}], \"position\": 9}, {\"id\": 5, \"icon\": \"user\", \"name\": \"Profile\", \"group\": \"app\", \"prefix\": \"admin.profile\", \"methods\": [{\"id\": 19, \"name\": \"Profile View\", \"is_menu\": 1, \"position\": 1, \"sys_name\": \"profile.view\", \"sys_module_id\": 5}, {\"id\": 20, \"name\": \"Edit Profile\", \"is_menu\": 1, \"position\": 2, \"sys_name\": \"profile.user.add\", \"sys_module_id\": 5}, {\"id\": 21, \"name\": \"Change-Password\", \"is_menu\": 1, \"position\": 3, \"sys_name\": \"password.view\", \"sys_module_id\": 5}], \"position\": 9}, {\"id\": 1, \"icon\": \"codesandbox\", \"name\": \"Manage Module\", \"group\": \"sys\", \"prefix\": null, \"methods\": [{\"id\": 2, \"name\": \"Add Method\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"method.add\", \"sys_module_id\": 1}, {\"id\": 3, \"name\": \"Edit Method\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"method.edit\", \"sys_module_id\": 1}, {\"id\": 8, \"name\": \"View Module\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"module.view\", \"sys_module_id\": 1}, {\"id\": 9, \"name\": \"Add Module\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"module.add\", \"sys_module_id\": 1}, {\"id\": 10, \"name\": \"Edit Module\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"module.edit\", \"sys_module_id\": 1}, {\"id\": 1, \"name\": \"View Method\", \"is_menu\": 0, \"position\": 1, \"sys_name\": \"method.view\", \"sys_module_id\": 1}], \"position\": 10}, {\"id\": 3, \"icon\": \"airplay\", \"name\": \"Role\", \"group\": \"sys\", \"prefix\": null, \"methods\": [{\"id\": 11, \"name\": \"View Role\", \"is_menu\": 1, \"position\": null, \"sys_name\": \"role.view\", \"sys_module_id\": 3}, {\"id\": 12, \"name\": \"Add Role\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"role.add\", \"sys_module_id\": 3}, {\"id\": 13, \"name\": \"Edit Role\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"role.edit\", \"sys_module_id\": 3}, {\"id\": 14, \"name\": \"Disabled Role\", \"is_menu\": 0, \"position\": null, \"sys_name\": \"role.delete\", \"sys_module_id\": 3}], \"position\": 11}, {\"id\": 16, \"icon\": \"lock\", \"name\": \"Log Out\", \"group\": \"sys\", \"prefix\": \"admin.logout\", \"methods\": [{\"id\": 138, \"name\": \"Log Out\", \"is_menu\": 0, \"position\": 1, \"sys_name\": \"admin.logout\", \"sys_module_id\": 16}], \"position\": 12}]','custom',1),(6,'secretary',NULL,'2023-10-08 08:22:02','2023-10-16 23:31:59',1,'{\"0\":{\"id\":15,\"name\":\"Dashboard\",\"group\":\"app\",\"icon\":\"pie-chart\",\"prefix\":\"admin.dashboard\",\"position\":1,\"methods\":[{\"id\":137,\"sys_module_id\":15,\"name\":\"Dashboard\",\"sys_name\":\"admin.dashboard\",\"is_menu\":0,\"position\":1}]},\"1\":{\"id\":4,\"name\":\"Manage User\",\"group\":\"app\",\"icon\":\"users\",\"prefix\":\"admin.users\",\"position\":2,\"methods\":[{\"id\":15,\"sys_module_id\":4,\"name\":\"View User\",\"sys_name\":\"user.view\",\"is_menu\":1,\"position\":null},{\"id\":16,\"sys_module_id\":4,\"name\":\"Add User\",\"sys_name\":\"user.add\",\"is_menu\":0,\"position\":null},{\"id\":17,\"sys_module_id\":4,\"name\":\"Edit User\",\"sys_name\":\"user.edit\",\"is_menu\":0,\"position\":null},{\"id\":18,\"sys_module_id\":4,\"name\":\"Delete User\",\"sys_name\":\"delete.user\",\"is_menu\":0,\"position\":null}]},\"2\":{\"id\":6,\"name\":\"Setup Management\",\"group\":\"app\",\"icon\":\"credit-card\",\"prefix\":\"admin.setups\",\"position\":3,\"methods\":{\"0\":{\"id\":24,\"sys_module_id\":6,\"name\":\"Add Class\",\"sys_name\":\"student.class.add\",\"is_menu\":0,\"position\":null},\"1\":{\"id\":25,\"sys_module_id\":6,\"name\":\"Edit Class\",\"sys_name\":\"student.class.edit\",\"is_menu\":0,\"position\":null},\"2\":{\"id\":26,\"sys_module_id\":6,\"name\":\"Delete Student\",\"sys_name\":\"student.class.delete\",\"is_menu\":0,\"position\":null},\"3\":{\"id\":28,\"sys_module_id\":6,\"name\":\"student.year.add\",\"sys_name\":\"Add Year\",\"is_menu\":0,\"position\":null},\"31\":{\"id\":23,\"sys_module_id\":6,\"name\":\"Studen Class\",\"sys_name\":\"student.class.view\",\"is_menu\":1,\"position\":1},\"32\":{\"id\":27,\"sys_module_id\":6,\"name\":\"Student Year\",\"sys_name\":\"student.year.view\",\"is_menu\":1,\"position\":2},\"33\":{\"id\":31,\"sys_module_id\":6,\"name\":\"Student Group\",\"sys_name\":\"student.group.view\",\"is_menu\":1,\"position\":3}}},\"8\":{\"id\":2,\"name\":\"Manage Admin\",\"group\":\"sys\",\"icon\":\"toggle-left\",\"prefix\":\"admin.members\",\"position\":9,\"methods\":[{\"id\":4,\"sys_module_id\":2,\"name\":\"View Admin\",\"sys_name\":\"admin.member.view\",\"is_menu\":1,\"position\":null},{\"id\":5,\"sys_module_id\":2,\"name\":\"Add Admin\",\"sys_name\":\"admin.member.add\",\"is_menu\":0,\"position\":null},{\"id\":6,\"sys_module_id\":2,\"name\":\"Edit Admin\",\"sys_name\":\"admin.member.edit\",\"is_menu\":0,\"position\":null},{\"id\":7,\"sys_module_id\":2,\"name\":\"Delete Admin\",\"sys_name\":\"admin.member.delete\",\"is_menu\":0,\"position\":null}]},\"9\":{\"id\":5,\"name\":\"Profile\",\"group\":\"app\",\"icon\":\"user\",\"prefix\":\"admin.profile\",\"position\":9,\"methods\":[{\"id\":19,\"sys_module_id\":5,\"name\":\"Profile View\",\"sys_name\":\"profile.view\",\"is_menu\":1,\"position\":1}]},\"11\":{\"id\":3,\"name\":\"Role\",\"group\":\"sys\",\"icon\":\"airplay\",\"prefix\":null,\"position\":11,\"methods\":[{\"id\":11,\"sys_module_id\":3,\"name\":\"View Role\",\"sys_name\":\"role.view\",\"is_menu\":1,\"position\":null},{\"id\":12,\"sys_module_id\":3,\"name\":\"Add Role\",\"sys_name\":\"role.add\",\"is_menu\":0,\"position\":null},{\"id\":13,\"sys_module_id\":3,\"name\":\"Edit Role\",\"sys_name\":\"role.edit\",\"is_menu\":0,\"position\":null},{\"id\":14,\"sys_module_id\":3,\"name\":\"Disabled Role\",\"sys_name\":\"role.delete\",\"is_menu\":0,\"position\":null}]},\"12\":{\"id\":16,\"name\":\"Log Out\",\"group\":\"sys\",\"icon\":\"lock\",\"prefix\":\"admin.logout\",\"position\":12,\"methods\":[{\"id\":138,\"sys_module_id\":16,\"name\":\"Log Out\",\"sys_name\":\"admin.logout\",\"is_menu\":0,\"position\":1}]}}','custom',1),(7,'custom role',NULL,'2023-10-09 11:15:31','2023-10-16 23:30:25',1,'{\"0\":{\"id\":15,\"name\":\"Dashboard\",\"group\":\"app\",\"icon\":\"pie-chart\",\"prefix\":\"admin.dashboard\",\"position\":1,\"methods\":[{\"id\":137,\"sys_module_id\":15,\"name\":\"Dashboard\",\"sys_name\":\"admin.dashboard\",\"is_menu\":0,\"position\":1}]},\"1\":{\"id\":4,\"name\":\"Manage User\",\"group\":\"app\",\"icon\":\"users\",\"prefix\":\"admin.users\",\"position\":2,\"methods\":[{\"id\":15,\"sys_module_id\":4,\"name\":\"View User\",\"sys_name\":\"user.view\",\"is_menu\":1,\"position\":null},{\"id\":16,\"sys_module_id\":4,\"name\":\"Add User\",\"sys_name\":\"user.add\",\"is_menu\":0,\"position\":null},{\"id\":17,\"sys_module_id\":4,\"name\":\"Edit User\",\"sys_name\":\"user.edit\",\"is_menu\":0,\"position\":null},{\"id\":18,\"sys_module_id\":4,\"name\":\"Delete User\",\"sys_name\":\"delete.user\",\"is_menu\":0,\"position\":null}]},\"2\":{\"id\":6,\"name\":\"Setup Management\",\"group\":\"app\",\"icon\":\"credit-card\",\"prefix\":\"admin.setups\",\"position\":3,\"methods\":[{\"id\":24,\"sys_module_id\":6,\"name\":\"Add Class\",\"sys_name\":\"student.class.add\",\"is_menu\":0,\"position\":null},{\"id\":25,\"sys_module_id\":6,\"name\":\"Edit Class\",\"sys_name\":\"student.class.edit\",\"is_menu\":0,\"position\":null},{\"id\":26,\"sys_module_id\":6,\"name\":\"Delete Student\",\"sys_name\":\"student.class.delete\",\"is_menu\":0,\"position\":null},{\"id\":28,\"sys_module_id\":6,\"name\":\"student.year.add\",\"sys_name\":\"Add Year\",\"is_menu\":0,\"position\":null}]},\"9\":{\"id\":5,\"name\":\"Profile\",\"group\":\"app\",\"icon\":\"user\",\"prefix\":\"admin.profile\",\"position\":9,\"methods\":[{\"id\":19,\"sys_module_id\":5,\"name\":\"Profile View\",\"sys_name\":\"profile.view\",\"is_menu\":1,\"position\":1}]},\"12\":{\"id\":16,\"name\":\"Log Out\",\"group\":\"sys\",\"icon\":\"lock\",\"prefix\":\"admin.logout\",\"position\":12,\"methods\":[{\"id\":138,\"sys_module_id\":16,\"name\":\"Log Out\",\"sys_name\":\"admin.logout\",\"is_menu\":0,\"position\":1}]}}','custom',2);
/*!40000 ALTER TABLE `sys_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `mname` varchar(255) DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `id_no` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL COMMENT 'admin=head of sotware,operator=computer operator,user=employee',
  `join_date` date DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=inactive,1=active',
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Sarah Bayer','yhauck@example.com','2023-09-25 01:50:26','$2y$10$hRIjpPHaVFhtFXUtD0yLyeYUp02MKH15aaMhrnsHu.Yk6jnYqMxmy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'JcTUqIdnKU',NULL,NULL,'2023-09-25 01:50:26','2023-09-25 01:50:26'),(2,'Mac West','una74@example.com','2023-09-25 01:50:26','$2y$10$X1sV.j3NfIm3e2X3ya7zPu6.ys/ubXEKcYZSAhGb64kP4Gm9fqW22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'i9xNpCf1YS',NULL,NULL,'2023-09-25 01:50:26','2023-09-25 01:50:26'),(3,'Mr. Maximo Block IV','jjohnson@example.net','2023-09-25 01:50:26','$2y$10$HVjJMLGhh2RsUx3Rtzog6eF66IFEeUQ77XVZcTvTPFjRlujgEBE.e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'aVNxnrp2Ac',NULL,NULL,'2023-09-25 01:50:26','2023-09-25 01:50:26'),(4,'Larue VonRueden','mayert.vada@example.org','2023-09-25 01:50:26','$2y$10$1VdBAQfBs3szPK/Rln0bLOeONMAgFJycnPzK0wL5EOu8r55li9xh.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'QytWcrQE8d',NULL,NULL,'2023-09-25 01:50:26','2023-09-25 01:50:26'),(5,'Prof. Dashawn Jacobs I','kuphal.levi@example.net','2023-09-25 01:50:26','$2y$10$aNVdP9kPPCOQZXh/V1tKau28uvvw7NQQiicjdtx94Csr6GFEnf0Y2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'l3fNcgIJRB',NULL,NULL,'2023-09-25 01:50:26','2023-09-25 01:50:26'),(6,'Isabell Hayes','kristina96@example.org','2023-09-25 01:50:26','$2y$10$hI3AzZk67g017hJME3KHAuISrUt9j7PFk05Xqu.V.lGxvnccBC53q',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'r0ET2TVKCm',NULL,NULL,'2023-09-25 01:50:26','2023-09-25 01:50:26'),(7,'Michael Walsh III','buddy97@example.net','2023-09-25 01:50:26','$2y$10$NubdmepdmjXR6FBIxAPFdOgIeCxr9aoyo6xxLotO/TCV4t0cF5zFy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'xGFxtwKPa3',NULL,NULL,'2023-09-25 01:50:26','2023-09-25 01:50:26'),(8,'Alene Price PhD','usteuber@example.net','2023-09-25 01:50:26','$2y$10$a3.qb9eWLLmY5yPwseWyvePC34jNmNqtpgG6GiUDCieZkFjXXb/MW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'CrpJkFQvmR',NULL,NULL,'2023-09-25 01:50:26','2023-09-25 01:50:26'),(9,'Jaime Becker','kim.kuphal@example.net','2023-09-25 01:50:26','$2y$10$he09Rzv/SMc0G5Zb./xjguRUu4iqTk4jQ.QETbHn9lCmEdqxxDadW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'XGuc8T5Pfa',NULL,NULL,'2023-09-25 01:50:26','2023-09-25 01:50:26'),(10,'Veronica Stiedemann','nhuel@example.org','2023-09-25 01:50:26','$2y$10$orZdcu.koKQqE3.Qg/BhL.HulQiCVMQPK5LH8CRjeTFdhubpMOe/6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'AduxiSizZU',NULL,NULL,'2023-09-25 01:50:26','2023-09-25 01:50:26'),(11,'Mr. Nara','admin@nomail.com','2023-09-25 01:50:26','$2y$10$kNDsNsTUSHv/MFqeZB8k0umYBhO43YRAahvuzqs9Im7MNw/9YyOru',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'yaSNUfl02Y',NULL,NULL,'2023-09-25 01:50:26','2023-09-25 01:50:26');
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

-- Dump completed on 2023-10-17 15:48:51
