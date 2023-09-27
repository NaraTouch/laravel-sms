-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: laravel-sms
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Dumping data for table `account_employee_salaries`
--

LOCK TABLES `account_employee_salaries` WRITE;
/*!40000 ALTER TABLE `account_employee_salaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_employee_salaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `account_other_costs`
--

LOCK TABLES `account_other_costs` WRITE;
/*!40000 ALTER TABLE `account_other_costs` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_other_costs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `account_student_fees`
--

LOCK TABLES `account_student_fees` WRITE;
/*!40000 ALTER TABLE `account_student_fees` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_student_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'nara','admin@gmail.com','2023-09-25 01:50:26','$2y$10$mQyxk3stmZOVFt.QafOzROd3PNpzooYIco6geIlIw.URPGdK1x2v2','Test','012345687','phnom penh','Male','202309261933OIP.jpg',NULL,NULL,'Hindu',NULL,'2023-09-26',NULL,NULL,NULL,1,NULL,NULL,NULL,'2023-09-25 01:50:26','2023-09-26 12:33:54',1);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `assign_students`
--

LOCK TABLES `assign_students` WRITE;
/*!40000 ALTER TABLE `assign_students` DISABLE KEYS */;
/*!40000 ALTER TABLE `assign_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `assign_subjects`
--

LOCK TABLES `assign_subjects` WRITE;
/*!40000 ALTER TABLE `assign_subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `assign_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `designations`
--

LOCK TABLES `designations` WRITE;
/*!40000 ALTER TABLE `designations` DISABLE KEYS */;
/*!40000 ALTER TABLE `designations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `discount_students`
--

LOCK TABLES `discount_students` WRITE;
/*!40000 ALTER TABLE `discount_students` DISABLE KEYS */;
/*!40000 ALTER TABLE `discount_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `employee_attendances`
--

LOCK TABLES `employee_attendances` WRITE;
/*!40000 ALTER TABLE `employee_attendances` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `employee_leaves`
--

LOCK TABLES `employee_leaves` WRITE;
/*!40000 ALTER TABLE `employee_leaves` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_leaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `employee_salary_logs`
--

LOCK TABLES `employee_salary_logs` WRITE;
/*!40000 ALTER TABLE `employee_salary_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_salary_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `exam_types`
--

LOCK TABLES `exam_types` WRITE;
/*!40000 ALTER TABLE `exam_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fee_categories`
--

LOCK TABLES `fee_categories` WRITE;
/*!40000 ALTER TABLE `fee_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `fee_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fee_category_amounts`
--

LOCK TABLES `fee_category_amounts` WRITE;
/*!40000 ALTER TABLE `fee_category_amounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `fee_category_amounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `leave_purposes`
--

LOCK TABLES `leave_purposes` WRITE;
/*!40000 ALTER TABLE `leave_purposes` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave_purposes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `marks_grades`
--

LOCK TABLES `marks_grades` WRITE;
/*!40000 ALTER TABLE `marks_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `marks_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1),(6,'2020_11_23_192918_create_sessions_table',1),(7,'2020_11_27_191622_create_student_classes_table',1),(8,'2020_11_27_201955_create_student_years_table',1),(9,'2020_11_27_205317_create_student_groups_table',1),(10,'2020_11_27_212648_create_student_shifts_table',1),(11,'2020_11_28_184513_create_fee_categories_table',1),(12,'2020_11_28_193421_create_fee_category_amounts_table',1),(13,'2020_11_29_190907_create_exam_types_table',1),(14,'2020_11_29_193820_create_school_subjects_table',1),(15,'2020_11_30_192807_create_assign_subjects_table',1),(16,'2020_11_30_211919_create_designations_table',1),(17,'2020_12_02_191137_create_assign_students_table',1),(18,'2020_12_02_191735_create_discount_students_table',1),(19,'2020_12_09_192120_create_employee_salary_logs_table',1),(20,'2020_12_11_205416_create_leave_purposes_table',1),(21,'2020_12_11_210033_create_employee_leaves_table',1),(22,'2020_12_13_192045_create_employee_attendances_table',1),(23,'2020_12_15_214223_create_student_marks_table',1),(24,'2020_12_16_202402_create_marks_grades_table',1),(25,'2020_12_18_191232_create_account_student_fees_table',1),(26,'2020_12_18_212912_create_account_employee_salaries_table',1),(27,'2020_12_20_192742_create_account_other_costs_table',1),(28,'2022_12_14_102818_create_admins_table',1),(29,'2022_12_14_131042_create_moderators_table',1),(30,'2023_09_25_083254_create_sys_roles_table',1),(31,'2023_09_25_083800_create_sys_role_method_table',1),(32,'2023_09_25_083845_create_sys_role_module_table',1),(33,'2023_09_25_083920_create_sys_permissions_table',1),(34,'2023_09_25_083946_create_sys_methods_table',1),(35,'2023_09_25_084011_create_sys_modules_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `moderators`
--

LOCK TABLES `moderators` WRITE;
/*!40000 ALTER TABLE `moderators` DISABLE KEYS */;
INSERT INTO `moderators` VALUES (1,'Moderator','Moderator@gmail.com','2023-09-25 01:50:26','$2y$10$3wbf.phM87gCZPhJzwliRu.VhIoUuyKJ1F1icMURMZa/9JowTiat.','Test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2023-09-25 01:50:26','2023-09-25 01:50:26');
/*!40000 ALTER TABLE `moderators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `school_subjects`
--

LOCK TABLES `school_subjects` WRITE;
/*!40000 ALTER TABLE `school_subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `school_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `student_classes`
--

LOCK TABLES `student_classes` WRITE;
/*!40000 ALTER TABLE `student_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `student_groups`
--

LOCK TABLES `student_groups` WRITE;
/*!40000 ALTER TABLE `student_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `student_marks`
--

LOCK TABLES `student_marks` WRITE;
/*!40000 ALTER TABLE `student_marks` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `student_shifts`
--

LOCK TABLES `student_shifts` WRITE;
/*!40000 ALTER TABLE `student_shifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `student_years`
--

LOCK TABLES `student_years` WRITE;
/*!40000 ALTER TABLE `student_years` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_years` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_methods`
--

LOCK TABLES `sys_methods` WRITE;
/*!40000 ALTER TABLE `sys_methods` DISABLE KEYS */;
INSERT INTO `sys_methods` VALUES (1,'View Method',1,NULL,'2023-09-25 07:51:09','2023-09-27 11:51:21','method.view',0,1),(2,'Add Method',1,NULL,'2023-09-25 07:55:03','2023-09-26 15:45:35','method.add',0,NULL),(3,'Edit Method',1,NULL,NULL,'2023-09-26 15:45:41','method.edit',0,NULL),(4,'View Admin',2,NULL,'2023-09-25 13:29:18','2023-09-26 15:43:06','admin.member.view',1,NULL),(5,'Add Admin',2,NULL,'2023-09-25 13:34:53','2023-09-26 15:43:12','admin.member.add',0,NULL),(6,'Edit Admin',2,NULL,'2023-09-25 13:35:33','2023-09-26 15:44:03','update.admin.member',0,NULL),(7,'Delete Admin',2,NULL,'2023-09-25 13:35:46','2023-09-26 15:43:42','admin.member.delete',0,NULL),(8,'View Module',1,NULL,'2023-09-25 13:37:18','2023-09-26 15:45:47','module.view',1,NULL),(9,'Add Module',1,NULL,'2023-09-25 13:39:04','2023-09-26 15:45:53','module.add',0,NULL),(10,'Edit Module',1,NULL,'2023-09-25 13:39:16','2023-09-26 15:46:00','module.edit',0,NULL),(11,'View Role',3,NULL,'2023-09-25 13:40:02','2023-09-26 15:46:26','role.view',1,NULL),(12,'Add Role',3,NULL,'2023-09-25 13:40:12','2023-09-26 15:46:31','role.add',0,NULL),(13,'Edit Role',3,NULL,'2023-09-25 13:40:28','2023-09-26 16:19:30','role.edit',0,NULL),(14,'Disabled Role',3,NULL,'2023-09-25 13:40:44','2023-09-26 15:47:00','role.delete',0,NULL),(15,'View User',4,NULL,'2023-09-25 13:42:36','2023-09-26 15:47:20','user.view',1,NULL),(16,'Add User',4,NULL,'2023-09-25 13:42:47','2023-09-26 15:47:25','user.add',0,NULL),(17,'Edit User',4,NULL,'2023-09-25 13:42:59','2023-09-26 15:47:34','user.edit',0,NULL),(18,'Delete User',4,NULL,'2023-09-25 13:43:20','2023-09-26 15:47:54','delete.user',0,NULL),(19,'Profile View',5,NULL,'2023-09-25 13:45:21','2023-09-27 11:54:53','profile.view',1,1),(20,'Edit Profile',5,NULL,'2023-09-25 13:51:09','2023-09-27 11:54:48','profile.user.add',1,2),(21,'Change-Password',5,NULL,'2023-09-25 13:52:30','2023-09-27 11:54:58','password.view',1,3),(23,'Studen Class',6,NULL,'2023-09-25 13:54:54','2023-09-27 11:57:11','student.class.view',1,1),(24,'Add Class',6,NULL,'2023-09-25 13:55:22','2023-09-25 13:55:22','student.class.add',0,NULL),(25,'Edit Class',6,NULL,'2023-09-25 13:56:10','2023-09-25 13:56:10','student.class.edit',0,NULL),(26,'Delete Student',6,NULL,'2023-09-26 00:11:58','2023-09-26 00:11:58','student.class.delete',0,NULL),(27,'Student Year',6,NULL,'2023-09-26 00:12:30','2023-09-27 11:57:48','student.year.view',1,2),(28,'student.year.add',6,NULL,'2023-09-26 00:13:21','2023-09-26 00:13:21','Add Year',0,NULL),(29,'Edit Year',6,NULL,'2023-09-26 00:13:41','2023-09-26 00:13:41','student.year.edit',0,NULL),(30,'Delete Year',6,NULL,'2023-09-26 00:14:07','2023-09-26 00:14:07','student.year.delete',0,NULL),(31,'Student Group',6,NULL,'2023-09-26 00:14:31','2023-09-27 11:58:05','student.group.view',1,3),(32,'Add Group',6,NULL,'2023-09-26 00:14:50','2023-09-26 00:14:50','student.group.add',0,NULL),(33,'Edit Group',6,NULL,'2023-09-26 00:15:10','2023-09-26 00:15:10','student.group.edit',0,NULL),(34,'Delete Group',6,NULL,'2023-09-26 00:15:35','2023-09-26 00:15:35','student.group.delete',0,NULL),(35,'Student Shift',6,NULL,'2023-09-26 00:15:56','2023-09-27 11:58:21','student.shift.view',1,4),(36,'Add Shift',6,NULL,'2023-09-26 00:16:15','2023-09-26 00:16:15','student.shift.add',0,NULL),(37,'Edit Shift',6,NULL,'2023-09-26 00:16:42','2023-09-26 00:16:42','student.shift.edit',0,NULL),(38,'Delete Shift',6,NULL,'2023-09-26 00:16:58','2023-09-26 00:16:58','student.shift.delete',0,NULL),(39,'Fee Category',6,NULL,'2023-09-26 00:17:20','2023-09-27 11:58:37','fee.category.view',1,5),(40,'Add Fee',6,NULL,'2023-09-26 00:17:36','2023-09-26 00:17:36','fee.category.add',0,NULL),(41,'Edit Fee',6,NULL,'2023-09-26 00:17:57','2023-09-26 00:17:57','fee.category.edit',0,NULL),(42,'Delete Fee',6,NULL,'2023-09-26 00:18:12','2023-09-26 00:18:12','fee.category.delete',0,NULL),(43,'Fee Category Amount',6,NULL,'2023-09-26 00:22:32','2023-09-27 11:58:46','fee.amount.view',1,6),(44,'Add Fee Category',6,NULL,'2023-09-26 00:23:17','2023-09-26 00:23:17','fee.amount.add',0,NULL),(45,'Edit Fee Category',6,NULL,'2023-09-26 00:23:45','2023-09-26 00:23:45','fee.amount.edit',0,NULL),(46,'Detail Fee Category',6,NULL,'2023-09-26 00:24:08','2023-09-26 00:24:08','fee.amount.details',0,NULL),(47,'Exam Type',6,NULL,'2023-09-26 00:24:30','2023-09-27 11:59:08','exam.type.view',1,7),(48,'Add Exam Type',6,NULL,'2023-09-26 00:24:48','2023-09-26 00:24:48','exam.type.add',0,NULL),(49,'Edit Exam Type',6,NULL,'2023-09-26 00:25:17','2023-09-26 00:25:17','exam.type.edit',0,NULL),(50,'Delete Exam Type',6,NULL,'2023-09-26 00:26:07','2023-09-26 00:26:07','exam.type.delete',0,NULL),(51,'School Subject',6,NULL,'2023-09-26 00:27:05','2023-09-27 11:59:22','school.subject.view',1,8),(52,'Add School Subject',6,NULL,'2023-09-26 00:27:38','2023-09-26 00:27:38','school.subject.add',0,NULL),(53,'Edit School Subject',6,NULL,'2023-09-26 00:28:00','2023-09-26 00:28:00','school.subject.edit',0,NULL),(54,'Delete School Subject',6,NULL,'2023-09-26 00:28:21','2023-09-26 00:28:21','school.subject.delete',0,NULL),(55,'Assign Subject',6,NULL,'2023-09-26 00:28:44','2023-09-27 11:59:38','assign.subject.view',1,9),(56,'Add Assign Subject',6,NULL,'2023-09-26 00:29:04','2023-09-26 00:29:04','assign.subject.add',0,NULL),(57,'Edit Assign Subject',6,NULL,'2023-09-26 00:29:30','2023-09-26 00:29:30','assign.subject.edit',0,NULL),(58,'Detail Assign Subject',6,NULL,'2023-09-26 00:30:31','2023-09-26 00:30:31','assign.subject.details',0,NULL),(59,'Designation',6,NULL,'2023-09-26 00:30:49','2023-09-27 12:00:04','designation.view',1,10),(60,'Add Designation',6,NULL,'2023-09-26 00:31:02','2023-09-26 00:31:02','designation.add',0,NULL),(61,'Edit Designation',6,NULL,'2023-09-26 00:31:24','2023-09-26 00:31:24','designation.edit',0,NULL),(62,'Delete Designation.',6,NULL,'2023-09-26 00:32:07','2023-09-26 00:32:07','designation.delete',0,NULL),(63,'Student Registration',7,NULL,'2023-09-26 00:33:26','2023-09-26 00:33:26','student.registration.view',1,NULL),(64,'Add Student Registration',7,NULL,'2023-09-26 00:33:53','2023-09-26 00:33:53','student.registration.add',0,NULL),(65,'Student Search',7,NULL,'2023-09-26 00:35:49','2023-09-26 00:35:49','student.year.class.wise',0,NULL),(66,'Edit Student Registeration',7,NULL,'2023-09-26 00:36:12','2023-09-26 00:36:12','student.registration.edit',0,NULL),(67,'Student Register Promotion',7,NULL,'2023-09-26 00:37:56','2023-09-26 00:37:56','student.registration.promotion',0,NULL),(68,'Detail Student Registration',7,NULL,'2023-09-26 00:38:47','2023-09-26 00:38:47','student.registration.details',0,NULL),(78,'Employee Registration',11,NULL,'2023-09-26 00:46:31','2023-09-26 00:46:31','employee.registration.view',1,NULL),(79,'Add Employee',11,NULL,'2023-09-26 00:47:26','2023-09-26 00:47:26','employee.registration.add',0,NULL),(81,'Registration Fee',7,NULL,'2023-09-26 00:50:01','2023-09-26 00:50:01','registration.fee.view',1,NULL),(82,'Search Student Registration Fee',7,NULL,'2023-09-26 00:50:17','2023-09-26 00:50:17','student.registration.fee.classwise.get',0,NULL),(83,'Student Registration Fee PaySlip',7,NULL,'2023-09-26 00:50:39','2023-09-26 00:50:39','student.registration.fee.payslip',0,NULL),(84,'Monthly Fee',7,NULL,'2023-09-26 00:51:06','2023-09-26 00:51:06','monthly.fee.view',1,NULL),(85,'Search Student Monthly Fee',7,NULL,'2023-09-26 00:51:32','2023-09-26 00:51:32','student.monthly.fee.classwise.get',0,NULL),(86,'Monthly Fee Payslip',7,NULL,'2023-09-26 00:51:44','2023-09-26 00:51:44','student.monthly.fee.payslip',0,NULL),(87,'Exam Fee',7,NULL,'2023-09-26 00:52:07','2023-09-26 00:52:07','exam.fee.view',1,NULL),(88,'Search Student Exam Fee',7,NULL,'2023-09-26 00:52:24','2023-09-26 00:52:24','student.exam.fee.classwise.get',0,NULL),(89,'Exam Fee Payslip',7,NULL,'2023-09-26 00:52:53','2023-09-26 00:52:53','student.exam.fee.payslip',0,NULL),(91,'Edit Employee',11,NULL,'2023-09-26 00:54:36','2023-09-26 00:54:36','employee.registration.edit',0,NULL),(92,'Detail Employee',11,NULL,'2023-09-26 00:54:58','2023-09-26 00:54:58','employee.registration.details',0,NULL),(93,'Employee Salary',11,NULL,'2023-09-26 00:56:38','2023-09-26 00:56:38','employee.salary.view',1,NULL),(94,'Employee Salary Increment',11,NULL,'2023-09-26 00:57:05','2023-09-26 00:57:05','employee.salary.increment',0,NULL),(95,'Employee Salary Details',11,NULL,'2023-09-26 00:57:29','2023-09-26 00:57:29','employee.salary.details',0,NULL),(96,'Employee Leave',11,NULL,'2023-09-26 00:58:36','2023-09-26 00:58:36','employee.leave.view',1,NULL),(98,'Add Employee Leave',11,NULL,'2023-09-26 01:02:19','2023-09-26 01:02:19','employee.leave.add',0,NULL),(100,'Edit Employee Leave',11,NULL,'2023-09-26 01:03:19','2023-09-26 01:03:19','employee.leave.edit',0,NULL),(101,'Delete Employee Leave',11,NULL,'2023-09-26 01:03:32','2023-09-26 01:03:32','employee.leave.delete',0,NULL),(102,'Employee Attendance',11,NULL,'2023-09-26 01:05:26','2023-09-26 01:05:26','employee.attendance.view',1,NULL),(103,'Add Employe Attendance',11,NULL,'2023-09-26 01:05:53','2023-09-26 01:05:53','employee.attendance.add',0,NULL),(104,'Edit Employee Attendance',11,NULL,'2023-09-26 01:06:29','2023-09-26 01:06:29','employee.attendance.edit',0,NULL),(105,'Detail Employee Attendance',11,NULL,'2023-09-26 01:06:51','2023-09-26 01:06:51','employee.attendance.details',0,NULL),(106,'Employee Monthly Salary',11,NULL,'2023-09-26 01:07:29','2023-09-26 01:07:29','employee.monthly.salary',1,NULL),(107,'Search Employee Monthly Salary',11,NULL,'2023-09-26 01:08:22','2023-09-26 01:08:22','employee.monthly.salary.get',0,NULL),(108,'Employee Monthly Salary Payslip',11,NULL,'2023-09-26 01:08:40','2023-09-26 01:08:40','employee.monthly.salary.payslip',0,NULL),(109,'Marks Entry',12,NULL,'2023-09-26 01:10:25','2023-09-26 01:10:25','marks.entry.add',1,NULL),(110,'Edit Marks Entry',12,NULL,'2023-09-26 01:10:47','2023-09-26 01:12:30','marks.entry.edit',1,NULL),(111,'Search Marks Entry',12,NULL,'2023-09-26 01:11:40','2023-09-26 01:11:40','student.edit.getstudents',0,NULL),(112,'Marks Grade',12,NULL,'2023-09-26 01:13:18','2023-09-26 01:13:18','marks.entry.grade',1,NULL),(113,'Add MarksGrade',12,NULL,'2023-09-26 01:13:35','2023-09-26 01:13:35','marks.grade.add',0,NULL),(114,'Edit Marks Grade',12,NULL,'2023-09-26 01:13:54','2023-09-26 01:13:54','marks.grade.edit',0,NULL),(115,'Ajax Student Marks Getsubject',6,NULL,'2023-09-26 01:17:35','2023-09-26 01:18:38','student.marks.getstudents',0,NULL),(116,'Ajax Marks Getsubject',12,NULL,'2023-09-26 01:19:02','2023-09-26 01:19:02','marks.getsubject',0,NULL),(117,'Student Fee',13,NULL,'2023-09-26 01:21:16','2023-09-26 01:21:16','student.fee.view',1,NULL),(118,'Add Student Fee',13,NULL,'2023-09-26 01:21:36','2023-09-26 01:21:36','student.fee.add',0,NULL),(119,'Search Student Fee List',13,NULL,'2023-09-26 01:22:13','2023-09-26 01:22:13','account.fee.getstudent',0,NULL),(120,'Employee Salary',13,NULL,'2023-09-26 01:22:42','2023-09-26 01:22:42','account.salary.view',1,NULL),(121,'Add Account Salary',13,NULL,'2023-09-26 01:23:01','2023-09-26 01:23:01','account.salary.add',0,NULL),(122,'Search Employee Salary List',13,NULL,'2023-09-26 01:23:20','2023-09-26 01:23:20','account.salary.getemployee',0,NULL),(123,'Other Cost',13,NULL,'2023-09-26 01:23:49','2023-09-26 01:23:49','other.cost.view',1,NULL),(124,'Add Other Cost',13,NULL,'2023-09-26 01:24:02','2023-09-26 01:24:02','other.cost.add',0,NULL),(125,'Edit Other Cost',13,NULL,'2023-09-26 01:25:13','2023-09-26 01:25:13','edit.other.cost',0,NULL),(126,'Monthly-Yearly-Profit',14,NULL,'2023-09-26 01:26:37','2023-09-26 01:26:37','monthly.profit.view',1,NULL),(127,'Search Manage Monthly/Yearly Profit',14,NULL,'2023-09-26 01:27:11','2023-09-26 01:27:11','report.profit.datewais.get',0,NULL),(128,'Monthly Profit Pdf',14,NULL,'2023-09-26 01:27:30','2023-09-26 01:27:30','report.profit.pdf',0,NULL),(129,'MarkSheet Generate',14,NULL,'2023-09-26 01:28:35','2023-09-26 01:28:35','marksheet.generate.view',1,NULL),(130,'Search Manage MarkSheet Generate',14,NULL,'2023-09-26 01:28:58','2023-09-26 01:28:58','report.marksheet.get',0,NULL),(131,'Attendance Report',14,NULL,'2023-09-26 01:29:32','2023-09-26 01:29:32','attendance.report.view',1,NULL),(132,'Search Manage Employee Attendance Report',14,NULL,'2023-09-26 01:29:54','2023-09-26 01:29:54','report.attendance.get',0,NULL),(133,'Student Result',14,NULL,'2023-09-26 01:30:48','2023-09-26 01:30:48','student.result.view',1,NULL),(134,'Search Manage Student Result Report',14,NULL,'2023-09-26 01:31:28','2023-09-26 01:31:28','report.student.result.get',0,NULL),(135,'Student Id Card',14,NULL,'2023-09-26 01:31:58','2023-09-26 01:31:58','student.idcard.view',1,NULL),(136,'Search Manage Student ID Card',14,NULL,'2023-09-26 01:32:18','2023-09-26 01:32:18','report.student.idcard.get',0,NULL),(137,'Dashboard',15,NULL,'2023-09-26 01:33:56','2023-09-27 10:58:45','admin.dashboard',0,1),(138,'Log Out',16,NULL,'2023-09-27 01:02:11','2023-09-27 10:58:59','admin.logout',0,1);
/*!40000 ALTER TABLE `sys_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_modules`
--

LOCK TABLES `sys_modules` WRITE;
/*!40000 ALTER TABLE `sys_modules` DISABLE KEYS */;
INSERT INTO `sys_modules` VALUES (1,'Manage Module',NULL,'2023-09-25 06:39:00','2023-09-27 01:38:01','sys',10,'codesandbox',NULL),(2,'Manage Admin',NULL,'2023-09-25 13:08:05','2023-09-27 11:33:41','sys',9,'toggle-left','admin.members'),(3,'Role',NULL,'2023-09-25 13:39:53','2023-09-27 01:38:56','sys',11,'airplay',NULL),(4,'Manage User',NULL,'2023-09-25 13:42:21','2023-09-27 11:29:36','app',2,'users','admin.users'),(5,'Profile',NULL,'2023-09-25 13:44:52','2023-09-27 11:30:00','app',9,'user','admin.profile'),(6,'Setup Management',NULL,'2023-09-25 13:54:12','2023-09-27 11:30:16','app',3,'credit-card','admin.setups'),(7,'Student Mangement',NULL,'2023-09-26 00:32:53','2023-09-27 11:30:45','app',4,'hard-drive','admin.students'),(11,'Employee Management',NULL,'2023-09-26 00:45:23','2023-09-27 11:30:59','app',4,'package','admin.employees'),(12,'Marks Management',NULL,'2023-09-26 01:09:05','2023-09-27 11:32:50','app',6,'edit-2','admin.marks'),(13,'Account Management',NULL,'2023-09-26 01:20:16','2023-09-27 11:33:09','app',7,'inbox','admin.accounts'),(14,'Report Management',NULL,'2023-09-26 01:25:49','2023-09-27 11:33:23','repo',8,'server','admin.reports'),(15,'Dashboard',NULL,'2023-09-26 01:33:35','2023-09-27 11:29:19','app',1,'pie-chart','admin.dashboard'),(16,'Log Out',NULL,'2023-09-27 01:01:34','2023-09-27 11:34:28','sys',12,'lock','admin.logout');
/*!40000 ALTER TABLE `sys_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_permissions`
--

LOCK TABLES `sys_permissions` WRITE;
/*!40000 ALTER TABLE `sys_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_role_method`
--

LOCK TABLES `sys_role_method` WRITE;
/*!40000 ALTER TABLE `sys_role_method` DISABLE KEYS */;
INSERT INTO `sys_role_method` VALUES (161,4,18,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(162,4,17,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(163,4,16,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(164,4,15,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(165,4,22,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(166,4,21,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(167,4,20,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(168,4,19,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(169,4,115,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(170,4,62,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(171,4,61,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(172,4,60,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(173,4,59,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(174,4,58,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(175,4,57,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(176,4,56,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(177,4,55,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(178,4,54,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(179,4,53,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(180,4,52,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(181,4,51,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(182,4,50,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(183,4,49,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(184,4,48,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(185,4,47,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(186,4,46,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(187,4,45,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(188,4,44,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(189,4,43,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(190,4,42,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(191,4,41,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(192,4,40,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(193,4,39,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(194,4,38,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(195,4,37,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(196,4,36,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(197,4,35,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(198,4,34,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(199,4,33,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(200,4,32,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(201,4,31,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(202,4,30,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(203,4,29,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(204,4,28,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(205,4,27,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(206,4,26,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(207,4,25,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(208,4,24,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(209,4,23,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(210,1,10,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(211,1,9,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(212,1,8,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(213,1,3,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(214,1,2,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(215,1,1,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(216,1,7,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(217,1,6,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(218,1,5,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(219,1,4,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(220,1,14,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(221,1,13,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(222,1,12,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(223,1,11,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(224,1,18,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(225,1,17,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(226,1,16,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(227,1,15,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(228,1,21,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(229,1,20,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(230,1,19,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(231,1,115,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(232,1,62,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(233,1,61,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(234,1,60,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(235,1,59,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(236,1,58,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(237,1,57,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(238,1,56,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(239,1,55,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(240,1,54,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(241,1,53,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(242,1,52,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(243,1,51,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(244,1,50,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(245,1,49,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(246,1,48,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(247,1,47,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(248,1,46,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(249,1,45,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(250,1,44,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(251,1,43,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(252,1,42,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(253,1,41,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(254,1,40,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(255,1,39,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(256,1,38,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(257,1,37,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(258,1,36,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(259,1,35,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(260,1,34,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(261,1,33,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(262,1,32,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(263,1,31,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(264,1,30,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(265,1,29,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(266,1,28,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(267,1,27,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(268,1,26,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(269,1,25,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(270,1,24,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(271,1,23,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(272,1,89,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(273,1,88,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(274,1,87,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(275,1,86,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(276,1,85,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(277,1,84,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(278,1,83,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(279,1,82,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(280,1,81,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(281,1,68,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(282,1,67,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(283,1,66,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(284,1,65,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(285,1,64,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(286,1,63,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(287,1,108,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(288,1,107,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(289,1,106,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(290,1,105,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(291,1,104,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(292,1,103,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(293,1,102,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(294,1,101,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(295,1,100,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(296,1,98,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(297,1,96,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(298,1,95,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(299,1,94,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(300,1,93,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(301,1,92,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(302,1,91,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(303,1,79,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(304,1,78,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(305,1,116,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(306,1,114,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(307,1,113,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(308,1,112,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(309,1,111,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(310,1,110,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(311,1,109,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(312,1,125,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(313,1,124,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(314,1,123,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(315,1,122,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(316,1,121,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(317,1,120,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(318,1,119,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(319,1,118,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(320,1,117,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(321,1,136,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(322,1,135,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(323,1,134,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(324,1,133,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(325,1,132,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(326,1,131,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(327,1,130,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(328,1,129,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(329,1,128,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(330,1,127,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(331,1,126,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(332,1,137,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(333,1,138,'2023-09-27 01:07:24','2023-09-27 01:07:24');
/*!40000 ALTER TABLE `sys_role_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_role_module`
--

LOCK TABLES `sys_role_module` WRITE;
/*!40000 ALTER TABLE `sys_role_module` DISABLE KEYS */;
INSERT INTO `sys_role_module` VALUES (23,4,4,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(24,4,5,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(25,4,6,'2023-09-26 11:55:12','2023-09-26 11:55:12'),(26,1,1,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(27,1,2,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(28,1,3,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(29,1,4,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(30,1,5,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(31,1,6,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(32,1,7,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(33,1,11,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(34,1,12,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(35,1,13,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(36,1,14,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(37,1,15,'2023-09-27 01:07:24','2023-09-27 01:07:24'),(38,1,16,'2023-09-27 01:07:24','2023-09-27 01:07:24');
/*!40000 ALTER TABLE `sys_role_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sys_roles`
--

LOCK TABLES `sys_roles` WRITE;
/*!40000 ALTER TABLE `sys_roles` DISABLE KEYS */;
INSERT INTO `sys_roles` VALUES (1,'admin',NULL,'2023-09-25 12:29:59','2023-09-27 01:07:23',1),(4,'Director',NULL,'2023-09-26 11:55:12','2023-09-26 15:39:41',1);
/*!40000 ALTER TABLE `sys_roles` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2023-09-28  2:18:43
