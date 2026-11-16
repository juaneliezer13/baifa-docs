-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: baifa_api
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkpoints`
--

DROP TABLE IF EXISTS `checkpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkpoints` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `generator_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkpoint_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_date` datetime NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checkpoints_user_id_foreign` (`user_id`),
  KEY `checkpoints_generator_id_event_date_index` (`generator_id`,`event_date`),
  KEY `checkpoints_status_index` (`status`),
  CONSTRAINT `checkpoints_generator_id_foreign` FOREIGN KEY (`generator_id`) REFERENCES `generators` (`id`) ON DELETE CASCADE,
  CONSTRAINT `checkpoints_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkpoints`
--

LOCK TABLES `checkpoints` WRITE;
/*!40000 ALTER TABLE `checkpoints` DISABLE KEYS */;
INSERT INTO `checkpoints` VALUES (1,1,3,'warehouse','Almacén Central Caracas','2026-09-27 08:30:00','Inspección técnica de pre-entrega aprobada. Generador preparado para despacho.','2026-10-02 18:20:59','2026-10-02 18:20:59'),(2,1,4,'in_transit','Distribuidor La Encrucijada','2026-09-29 11:45:00','En ruta hacia Valencia con Transporte Los Andes Placa A12BC3D. Chofer: José Parra.','2026-10-02 18:20:59','2026-10-02 18:20:59'),(3,1,4,'in_transit','Peaje Guacara','2026-10-01 16:20:00','Paso de peaje sin novedades mecánicas. Velocidad crucero 60 km/h.','2026-10-02 18:20:59','2026-10-02 18:20:59'),(4,3,3,'warehouse','Almacén Central Caracas','2026-09-25 09:00:00','Carga y trincaje en plataforma de carga pesada.','2026-10-02 18:20:59','2026-10-02 18:20:59'),(5,3,4,'in_transit','Autopista Regional del Centro Km 84','2026-09-28 14:15:00','Tránsito normal con custodia hacia el occidente del país.','2026-10-02 18:20:59','2026-10-02 18:20:59'),(6,3,4,'checkpoint','Punto de Control Alcabala Guacara','2026-10-01 18:30:00','Detenido en Punto de Control Alcabala Guacara para revisión de guía de transporte e inspección de seriales.','2026-10-02 18:20:59','2026-10-02 18:20:59'),(7,4,3,'warehouse','Almacén Central Caracas','2026-09-22 10:00:00','Equipo verificado en banco de prueba con carga resistiva al 100%.','2026-10-02 18:20:59','2026-10-02 18:20:59'),(8,4,4,'in_transit','Troncal 5 Tramo Barinas','2026-09-27 13:00:00','Transporte avanzando hacia los llanos occidentales.','2026-10-02 18:20:59','2026-10-02 18:20:59'),(9,4,4,'delivered','Hacienda Santa Inés (Locación Final)','2026-09-30 16:45:00','Recibido en finca por el encargado de operaciones. Pendiente arranque y conexionado.','2026-10-02 18:20:59','2026-10-02 18:20:59'),(10,5,3,'warehouse','Warehouse Principal Baifa','2026-09-02 09:15:00','Ingreso a inventario y nacionalización de planta 500 kVA.','2026-10-02 18:20:59','2026-10-02 18:20:59'),(11,5,4,'in_transit','Distribuidor San Blas Valencia','2026-09-12 11:30:00','Traslado especial escoltado hasta zona industrial.','2026-10-02 18:20:59','2026-10-02 18:20:59'),(12,5,4,'delivered','Planta Fabril Valencia','2026-09-16 15:00:00','Descarga sobre losa de concreto antivibratoria.','2026-10-02 18:20:59','2026-10-02 18:20:59'),(13,5,4,'installed','Sede Fabril Valencia (Sala de Máquinas)','2026-09-17 17:30:00','Instalado, cableado y probado con transferencia automática 100% operativa.','2026-10-02 18:20:59','2026-10-02 18:20:59'),(14,2,3,'warehouse','Warehouse Principal Baifa Caracas','2026-09-20 10:00:00','En inventario físico en Warehouse Principal Baifa Caracas.','2026-10-02 18:20:59','2026-10-02 18:20:59'),(15,2,1,'checkpoint','Punto de control barquisimeto','2026-10-08 12:05:00','Alcabala barquisimeto','2026-10-08 16:05:19','2026-10-08 16:05:19');
/*!40000 ALTER TABLE `checkpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company_fiscal_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_short_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rif` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `office_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_rif_unique` (`rif`),
  KEY `clients_user_id_foreign` (`user_id`),
  CONSTRAINT `clients_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Empresa Cliente Real S.A.','Cliente Real','J-11223344-5','0212-999-0000','Cliente Real Demo','cliente.real@empresa.com','0414-999-0001',1,5,'2026-09-27 23:50:42','2026-09-27 23:50:42',NULL),(2,'Industrias Venezolanas Toro S.A.','IndVen Toro','J-12345678-9','0212-555-0100','Carlos Mendoza','cmendoza@indventoro.com.ve','0414-555-0101',1,6,'2026-09-27 23:50:42','2026-09-27 23:50:42',NULL),(3,'Constructora Andina C.A.','ConstAndina','J-98765432-1','0261-444-0200','María González','mgonzalez@constructoraandina.com','0424-555-0201',1,7,'2026-09-27 23:50:43','2026-09-27 23:50:43',NULL),(4,'Agropecuaria Los Llanos S.R.L.','AgroLlanos','J-45678901-2','0243-333-0300','Roberto Díaz','rdiaz@agrollanos.com.ve','0416-555-0301',1,8,'2026-09-27 23:50:43','2026-09-27 23:50:43',NULL),(5,'Distribuidora Nacional de Alimentos C.A.','DiNaCa','J-31416926-7','0212-777-0400','Ana Torres','atorres@dinaca.com.ve','0412-555-0401',0,9,'2026-09-27 23:50:43','2026-09-27 23:50:43',NULL);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`)
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
-- Table structure for table `generators`
--

DROP TABLE IF EXISTS `generators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generators` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity_kva` decimal(8,2) DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'warehouse',
  `estimated_arrival_date` date DEFAULT NULL,
  `photo_path` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `generators_serial_number_unique` (`serial_number`),
  KEY `generators_client_id_foreign` (`client_id`),
  CONSTRAINT `generators_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generators`
--

LOCK TABLES `generators` WRITE;
/*!40000 ALTER TABLE `generators` DISABLE KEYS */;
INSERT INTO `generators` VALUES (1,'GEN-2026-0041',2,'Generador Principal Planta Valencia','Cummins 150 kVA Silent Diésel',150.00,'in_transit','2026-10-05',NULL,'Despachado desde almacén central. Transporte Transporte Los Andes Placa A12BC3D.','2026-09-27 23:50:43','2026-10-02 00:05:15',NULL),(2,'GEN-2026-0038',NULL,'Generador Auxiliar Stock','Perkins 60 kVA Insonorizado',60.00,'checkpoint',NULL,NULL,'Alcabala barquisimeto','2026-09-27 23:50:44','2026-10-08 16:05:19',NULL),(3,'GEN-2026-0029',3,'Generador Obra Maracaibo','Baudouin 250 kVA Diésel Abierto',250.00,'checkpoint','2026-10-03',NULL,'Detenido en Punto de Control Alcabala Guacara para revisión de guía de transporte.','2026-09-27 23:50:44','2026-10-02 00:05:15',NULL),(4,'GEN-2026-0015',4,'Generador Hacienda Santa Inés','Weichai 100 kVA Silent',100.00,'delivered','2026-09-30',NULL,'Recibido en finca por el encargado de operaciones. Pendiente arranque y conexionado.','2026-09-27 23:50:44','2026-10-02 00:05:16',NULL),(5,'GEN-2026-0008',2,'Generador Respaldo Sede Fabril','Cummins 500 kVA Power Heavy',500.00,'installed','2026-09-17',NULL,'Instalado, cableado y probado con transferencia automática 100% operativa.','2026-09-27 23:50:44','2026-10-02 00:05:16',NULL),(6,'GEN-2026-0099',NULL,NULL,'Yanmar 45 kVA Silent Ultra',45.00,'warehouse',NULL,NULL,'Generador ingresado para prueba de integración Etapa 2','2026-09-27 23:54:19','2026-09-27 23:54:25','2026-09-27 23:54:25'),(7,'GEN-234-432',1,NULL,'432423',1200.00,'warehouse','2026-10-02','0','test','2026-10-02 17:39:20','2026-10-02 17:39:20',NULL);
/*!40000 ALTER TABLE `generators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_09_09_141555_create_personal_access_tokens_table',1),(5,'2026_09_09_142410_add_role_to_users_table',1),(6,'2026_09_10_000001_add_is_active_to_users_table',1),(7,'2026_09_10_130000_create_clients_table',1),(8,'2026_09_27_160000_create_generators_table',1),(9,'2026_10_02_140000_create_checkpoints_table',2),(10,'2026_10_07_180000_create_support_tickets_table',3),(11,'2026_10_07_180100_create_ticket_messages_table',3),(12,'2026_10_07_180200_create_ticket_logs_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'auth_token','c082085d1a29fbce9a34b776a1aa58c02b952baa13b5d9174ef5282e900d6ca8','[\"*\"]',NULL,NULL,'2026-09-27 23:51:14','2026-09-27 23:51:14'),(2,'App\\Models\\User',1,'auth_token','e6d29403d6b120920098ca7f2fc1b02b0e72f2132a5b843277c4f2eca76e0a79','[\"*\"]',NULL,NULL,'2026-09-27 23:51:30','2026-09-27 23:51:30'),(3,'App\\Models\\User',1,'auth_token','435d62e82f15afae3329775e1a1fe2e4108845212b99fbe63c883c8873369eff','[\"*\"]','2026-09-27 23:54:25',NULL,'2026-09-27 23:53:55','2026-09-27 23:54:25'),(4,'App\\Models\\User',1,'auth_token','c2d696278c763b299da8a3e474a2739b820c536de90356cb4df4014164de65c7','[\"*\"]',NULL,NULL,'2026-10-02 00:06:03','2026-10-02 00:06:03'),(5,'App\\Models\\User',1,'auth_token','73b5c1e91960c7324d6115fd90fbdd7ff0c63a022758e288ab9a897248ceba55','[\"*\"]',NULL,NULL,'2026-10-02 00:07:23','2026-10-02 00:07:23'),(6,'App\\Models\\User',1,'auth_token','701052d9a3f9b28898f715e3c1c46aaae4c87fbcd64ed032a66e3fa59193c3d7','[\"*\"]','2026-10-02 00:07:36',NULL,'2026-10-02 00:07:32','2026-10-02 00:07:36'),(8,'App\\Models\\User',5,'web','cd6ab5232c8381ee1577dd3503147c155dd2447e115a4e0df54311dc7af02280','[\"*\"]','2026-10-02 17:43:02',NULL,'2026-10-02 17:40:42','2026-10-02 17:43:02'),(9,'App\\Models\\User',1,'web','be492c42cd626eb53a1e90cdce3c46abbf91e6c2b812e954a3356af628f509e0','[\"*\"]','2026-10-02 18:16:01',NULL,'2026-10-02 18:15:58','2026-10-02 18:16:01'),(10,'App\\Models\\User',1,'auth_token','9edf410713c17e8059e742ee321c2f6ad9597e288602eeb5fd66dd9448e52512','[\"*\"]','2026-10-02 18:21:43',NULL,'2026-10-02 18:21:34','2026-10-02 18:21:43'),(16,'App\\Models\\User',1,'web','faa3a826e4c518c1ad48d6e87a6d9fb3f28077fc01f9ba9a790a17c80174437f','[\"*\"]','2026-10-08 00:25:18',NULL,'2026-10-07 23:50:43','2026-10-08 00:25:18'),(18,'App\\Models\\User',1,'web','d19cced083539f06683f86ffa27c7329204c16a0db572ca26733c5954aeeb681','[\"*\"]','2026-10-08 16:00:08',NULL,'2026-10-08 15:59:28','2026-10-08 16:00:08'),(19,'App\\Models\\User',1,'web','5caf0d022af87b94a27b22974cda768f64aa2ecd753c1757fcfb31b94aebd89b','[\"*\"]','2026-10-08 17:54:20',NULL,'2026-10-08 16:04:04','2026-10-08 17:54:20');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
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
-- Table structure for table `support_tickets`
--

DROP TABLE IF EXISTS `support_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `support_tickets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned DEFAULT NULL,
  `assigned_to_user_id` bigint unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'soporte_tecnico',
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `final_comment` text COLLATE utf8mb4_unicode_ci,
  `closed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `support_tickets_code_unique` (`code`),
  KEY `support_tickets_client_id_foreign` (`client_id`),
  KEY `support_tickets_status_category_index` (`status`,`category`),
  KEY `support_tickets_user_id_status_index` (`user_id`,`status`),
  KEY `support_tickets_assigned_to_user_id_status_index` (`assigned_to_user_id`,`status`),
  CONSTRAINT `support_tickets_assigned_to_user_id_foreign` FOREIGN KEY (`assigned_to_user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `support_tickets_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE SET NULL,
  CONSTRAINT `support_tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_tickets`
--

LOCK TABLES `support_tickets` WRITE;
/*!40000 ALTER TABLE `support_tickets` DISABLE KEYS */;
INSERT INTO `support_tickets` VALUES (1,'TKT-2026-0001',5,1,NULL,'falla en arranque de generador','logistica','test','pending',NULL,NULL,'2026-10-07 23:48:06','2026-10-07 23:49:36');
/*!40000 ALTER TABLE `support_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_logs`
--

DROP TABLE IF EXISTS `ticket_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `action` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `previous_status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `metadata` json DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ticket_logs_user_id_foreign` (`user_id`),
  KEY `ticket_logs_ticket_id_created_at_index` (`ticket_id`,`created_at`),
  CONSTRAINT `ticket_logs_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ticket_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_logs`
--

LOCK TABLES `ticket_logs` WRITE;
/*!40000 ALTER TABLE `ticket_logs` DISABLE KEYS */;
INSERT INTO `ticket_logs` VALUES (1,1,5,'ticket_created',NULL,'pending','Ticket de soporte generado por el cliente.',NULL,'2026-10-07 23:48:06');
/*!40000 ALTER TABLE `ticket_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_messages`
--

DROP TABLE IF EXISTS `ticket_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `sender_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'client',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_messages_user_id_foreign` (`user_id`),
  KEY `ticket_messages_ticket_id_created_at_index` (`ticket_id`,`created_at`),
  CONSTRAINT `ticket_messages_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ticket_messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_messages`
--

LOCK TABLES `ticket_messages` WRITE;
/*!40000 ALTER TABLE `ticket_messages` DISABLE KEYS */;
INSERT INTO `ticket_messages` VALUES (1,1,NULL,'system','Ticket #TKT-2026-0001 creado con éxito: \"falla en arranque de generador\". En cola del Helpdesk a la espera de asignación de operador.','2026-10-07 23:48:06','2026-10-07 23:48:06'),(2,1,5,'client','test','2026-10-07 23:48:06','2026-10-07 23:48:06'),(3,1,5,'client','por favor necesito soporte','2026-10-07 23:49:36','2026-10-07 23:49:36');
/*!40000 ALTER TABLE `ticket_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'client',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_index` (`role`),
  KEY `users_is_active_index` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Adriana Morales','admin@baifa.com.ve','admin',1,NULL,'$2y$12$cA73MiyizDLdetNpUIPsw.4wlmHFp8MkufbWQTecFHvWWGvo3l7ta',NULL,'2026-09-27 23:50:40','2026-09-27 23:50:40'),(2,'Admin Baifa','admin@admin','admin',1,NULL,'$2y$12$0i24n/NkaPvgecL3Jkt7Pe5zugsWH.B2NbIk73m0RRIXTMvPRGCQq',NULL,'2026-09-27 23:50:41','2026-09-27 23:50:41'),(3,'Fernando Soto','gerente@baifa.com.ve','manager',1,NULL,'$2y$12$pSFXScUxEC.7Az6GltcFueMKuMmzPH8vFNtJt36G7wMe0yq4G.Dpu',NULL,'2026-09-27 23:50:41','2026-09-27 23:50:41'),(4,'Luis Ramírez','operador@baifa.com.ve','employee',1,NULL,'$2y$12$CQSK7EFHFnBuLiy/5qYzfeKEyc1etreMxXPXsId1bZqs0rSzmKjgG',NULL,'2026-09-27 23:50:41','2026-09-27 23:50:41'),(5,'Cliente Real Demo','cliente.real@empresa.com','client',1,NULL,'$2y$12$wtyXqWqLKQk2TK/BIFV8DOQkW80yH4ion9oTWZJ/ngCkLqu84dViu',NULL,'2026-09-27 23:50:42','2026-09-27 23:50:42'),(6,'Carlos Mendoza','cmendoza@indventoro.com.ve','client',1,NULL,'$2y$12$w0s8kgo05fKqkdMOyhmhrOZx9i1iy.42VrcIA4cLWzzHbbPQPRCTm',NULL,'2026-09-27 23:50:42','2026-09-27 23:50:42'),(7,'María González','mgonzalez@constructoraandina.com','client',1,NULL,'$2y$12$qYcMP5TWTvpyiM1D7TTh3OVg/AzHGqSEpl9AnVwIm255TXp6LgtHm',NULL,'2026-09-27 23:50:43','2026-09-27 23:50:43'),(8,'Roberto Díaz','rdiaz@agrollanos.com.ve','client',1,NULL,'$2y$12$49hf1jKF9FC7rgWZJAXaJOa1avN7vUnu.AH/RplizFmyWSa01qMv6',NULL,'2026-09-27 23:50:43','2026-09-27 23:50:43'),(9,'Ana Torres','atorres@dinaca.com.ve','client',0,NULL,'$2y$12$AQTMkauu5rR9LP3awejc6.zg2AdWlpkvNsCkOBwH/BiQWGoFWqxnG',NULL,'2026-09-27 23:50:43','2026-09-27 23:50:43');
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

-- Dump completed on 2026-11-07 15:21:24
