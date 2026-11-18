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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkpoints`
--

LOCK TABLES `checkpoints` WRITE;
/*!40000 ALTER TABLE `checkpoints` DISABLE KEYS */;
INSERT INTO `checkpoints` VALUES (2,2,4,'purchase_order','Orden de Compra #OC-2026-109 Confirmada','2026-10-05 09:15:00','Orden aprobada por gerencia comercial BaiFa.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(3,2,5,'in_production','Planta Industrial BaiFa Power Wuxi','2026-10-18 14:30:00','Ensamblaje de motor Cummins y cabina insonorizada completado. Pruebas de carga al 100%.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(4,2,5,'origin_customs','Terminal Aduanera Puerto de Shanghai','2026-11-01 11:00:00','Declaración de exportación y precinto aduanero verificados sin novedades.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(5,2,6,'maritime_transit','Embarque Buque CMA CGM Volga (Ruta Atlántico)','2026-11-12 07:45:00','Zarpe confirmado con destino a Puerto Cabello. B/L #SHAPCAB8841.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(6,3,4,'purchase_order','Orden de Compra #OC-2026-088','2026-09-10 10:00:00','Pedido formalizado para respaldo de centro de datos.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(7,3,5,'in_production','Línea de Ensamblaje BaiFa Wuxi','2026-09-25 16:20:00','Pruebas FAT aprobadas satisfactoriamente.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(8,3,5,'origin_customs','Aduana Portuaria Ningbo','2026-10-05 08:50:00','Despacho de exportación liberado.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(9,3,6,'maritime_transit','Tránsito Marítimo Buque MSC Sofia','2026-10-14 13:10:00','Travesía oceánica completada sin incidencias.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(10,3,6,'destination_customs','SENIAT Aduana Principal Puerto Cabello','2026-11-08 11:30:00','Nacionalización y pago de aranceles finiquitados.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(11,3,5,'baifa_warehouse','Almacén Central BaiFa Valencia - Zona Industrial','2026-11-15 15:40:00','Inspección pre-entrega (PDI), niveles de fluidos y batería verificados.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(12,4,1,'purchase_order','Orden de Compra #OC-2026-054','2026-08-15 09:00:00','Aprobación técnica de generador de 500 kVA.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(13,4,5,'in_production','Fábrica Principal BaiFa Power','2026-09-01 12:00:00','Producción y banco de pruebas finalizados.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(14,4,5,'origin_customs','Aduana de Exportación Shanghai','2026-09-12 15:00:00','Documentación de exportación sellada.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(15,4,6,'maritime_transit','Buque Maersk Salalah','2026-09-20 06:30:00','En navegación hacia costa venezolana.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(16,4,6,'destination_customs','Aduana Marítima Puerto Cabello','2026-10-25 10:15:00','Reconocimiento aduanero aprobado y pase de salida emitido.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(17,4,5,'baifa_warehouse','Almacén Central BaiFa Valencia','2026-11-02 14:00:00','Revisión electromecánica completa antes del despacho final.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(18,4,4,'delivered','Planta Industrial Cliente - Zona Industrial Carabobo','2026-11-10 11:20:00','Descarga con grúa telescópica y entrega formal con acta de recepción #ENT-2026-043.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(19,5,4,'purchase_order','Orden de Compra #OC-2026-112','2026-09-28 11:00:00','Orden registrada para proyecto vial en Mérida.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(20,5,5,'in_production','Planta de Producción BaiFa','2026-10-10 17:00:00','Unidad ensamblada con motor Perkins.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(21,5,5,'origin_customs','Aduana de Origen Shanghai','2026-10-19 09:30:00','Inspección de exportación aprobada.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(22,5,6,'maritime_transit','Tránsito Marítimo Buque Cosco Faith','2026-10-24 08:00:00','Salida de puerto origen.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(23,5,6,'destination_customs','Aduana Principal Puerto Cabello - Patio 4','2026-11-16 10:45:00','Descarga de buque completada, agente aduanal gestionando liquidación.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(24,6,4,'purchase_order','Orden de Compra #OC-2026-130','2026-10-22 10:15:00','Orden confirmada para planta de silos en Portuguesa.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(25,6,5,'in_production','Planta Industrial BaiFa Wuxi','2026-11-05 15:00:00','Fabricación y pintura epóxica anticorrosiva terminadas.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(26,6,5,'origin_customs','Aduana Portuaria Shanghai - Terminal Yangshan','2026-11-17 09:20:00','Ingreso a zona primaria aduanera para despacho marítimo.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(27,7,4,'purchase_order','Orden de Compra #OC-2026-145','2026-11-04 14:10:00','Orden procesada y enviada a fábrica.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(28,7,5,'in_production','Línea 3 de Ensamblaje BaiFa Power','2026-11-16 11:00:00','Montaje de motor y módulo de control digital DSE7320.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(29,8,1,'purchase_order','Orden de Compra #OC-2026-158 Emitida','2026-11-18 08:30:00','Apertura de expediente logístico y confirmación de especificaciones técnicas.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(30,9,4,'purchase_order','Orden de Compra #OC-2026-041','2026-08-02 10:00:00','Solicitud aprobada.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(31,9,5,'in_production','Planta BaiFa Wuxi','2026-08-20 16:00:00','Fabricación completada.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(32,9,5,'origin_customs','Aduana Shanghai','2026-09-02 09:00:00','Exportación autorizada.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(33,9,6,'maritime_transit','Tránsito Marítimo Internacional','2026-09-10 12:00:00','Buque en ruta.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(34,9,6,'destination_customs','Aduana Puerto Cabello','2026-10-18 14:30:00','Nacionalizado.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(35,9,5,'baifa_warehouse','Almacén BaiFa Valencia','2026-10-25 11:00:00','Alistamiento completado.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(36,9,6,'delivered','Sede Cliente Maracay - Zona Industrial San Vicente','2026-11-05 15:15:00','Entrega final completada sin observaciones.','2026-11-18 19:53:29','2026-11-18 19:53:29'),(37,10,1,'in_production','Línea de Ensamblaje BaiFa Wuxi','2026-11-18 19:55:51','Ingreso a línea de producción verificado','2026-11-18 19:55:51','2026-11-18 19:55:51');
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
INSERT INTO `clients` VALUES (1,'Inversiones Energía Total C.A.','Energía Total','J-41234567-8','0212-9514420','Carlos Mendoza','cliente@baifa.com.ve','0414-3218890',1,2,'2026-11-18 00:09:07','2026-11-18 19:53:29',NULL),(2,'Volkswagen de Venezuela S.A.','VW Venezuela','J-30145892-3','0241-8324500','Juan Eliezer Chirinos','juaneliezer13@gmail.com','0412-4559812',1,3,'2026-11-18 18:45:31','2026-11-18 19:53:29',NULL),(3,'Constructora Andina de Infraestructura C.A.','ConstAndina','J-30891234-5','0274-2631180','Roberto Silva','logistica@constandina.com.ve','0414-7412233',1,7,'2026-11-18 19:53:29','2026-11-18 19:53:29',NULL),(4,'Agroindustrial Los Llanos S.A.','AgroLlanos','J-29765432-1','0255-6218840','Elena Betancourt','compras@agrollanos.com.ve','0424-5123344',1,8,'2026-11-18 19:53:29','2026-11-18 19:53:29',NULL),(5,'Frigoríficos Centrales de Carabobo C.A.','FrigoCarabobo','J-40551122-9','0241-8715500','Miguel Ángel Pérez','mperez@frigocarabobo.com.ve','0414-4809911',0,NULL,'2026-11-18 19:53:29','2026-11-18 19:53:29',NULL);
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
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'purchase_order',
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generators`
--

LOCK TABLES `generators` WRITE;
/*!40000 ALTER TABLE `generators` DISABLE KEYS */;
INSERT INTO `generators` VALUES (2,'GEN-2026-0041',1,'Planta Principal Sede Caracas','BaiFa BF-C170S Cummins Silent',170.00,'maritime_transit','2026-12-10',NULL,'Buque CMA CGM Volga - Contenedor #CMAU449201. En ruta hacia Puerto Cabello.','2026-11-18 19:53:29','2026-11-18 19:53:29',NULL),(3,'GEN-2026-0042',1,'Respaldo Centro de Datos','BaiFa BF-C275S Cummins Industrial',275.00,'baifa_warehouse','2026-11-22',NULL,'Equipo verificado en Almacén Central BaiFa Valencia, listo para programación de entrega.','2026-11-18 19:53:29','2026-11-18 19:53:29',NULL),(4,'GEN-2026-0043',2,'Planta Ensambladora Valencia','BaiFa BF-C500S Cummins Heavy Duty',500.00,'delivered','2026-11-10',NULL,'Entregado con acta de conformidad firmada en planta del cliente.','2026-11-18 19:53:29','2026-11-18 19:53:29',NULL),(5,'GEN-2026-0044',3,'Generador Campamento Vial Mérida','BaiFa BF-P110 Perkins Soundproof',110.00,'destination_customs','2026-11-28',NULL,'En proceso de desaduanamiento en Bolipuertos Puerto Cabello.','2026-11-18 19:53:29','2026-11-18 19:53:29',NULL),(6,'GEN-2026-0045',4,'Planta Silos Acarigua','BaiFa BF-C330S Cummins Agro',330.00,'origin_customs','2026-12-22',NULL,'En patio aduanero de origen esperando asignación de buque.','2026-11-18 19:53:29','2026-11-18 19:53:29',NULL),(7,'GEN-2026-0046',3,'Unidad Auxiliar Obra Táchira','BaiFa BF-C80S Cummins Compact',80.00,'in_production','2027-01-12',NULL,'En ensamblaje de alternador Stamford y tablero DeepSea.','2026-11-18 19:53:29','2026-11-18 19:53:29',NULL),(8,'GEN-2026-0047',4,'Respaldo Frigorífico Barinas','BaiFa BF-V400 Volvo Penta',400.00,'purchase_order','2027-01-25',NULL,'Orden de compra recién emitida y asignada a lote de producción diciembre.','2026-11-18 19:53:29','2026-11-18 19:53:29',NULL),(9,'GEN-2026-0048',1,'Planta Sucursal Maracay','BaiFa BF-C200S Cummins Silent',200.00,'delivered','2026-11-05',NULL,'Entregado y recibido conforme en sucursal Maracay.','2026-11-18 19:53:29','2026-11-18 19:53:29',NULL),(10,'GEN-2026-0049',NULL,NULL,'BaiFa BF-C150S Cummins Silent',150.00,'in_production',NULL,NULL,'Ingreso a línea de producción verificado','2026-11-18 19:55:32','2026-11-18 19:55:51',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_09_09_141555_create_personal_access_tokens_table',1),(5,'2026_09_09_142410_add_role_to_users_table',1),(6,'2026_09_10_000001_add_is_active_to_users_table',1),(7,'2026_09_10_130000_create_clients_table',1),(8,'2026_09_27_160000_create_generators_table',1),(9,'2026_10_02_140000_create_checkpoints_table',1),(10,'2026_11_18_150000_update_generator_statuses_to_seven_stages',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (3,'App\\Models\\User',1,'web','33359011837b1d4703a8c76e5850f8569c3284a271200ddf74c230308356552a','[\"*\"]','2026-11-18 18:47:33',NULL,'2026-11-18 18:33:44','2026-11-18 18:47:33'),(5,'App\\Models\\User',2,'web','809b9282d64a06ddedba462c71df4ce17a322e7cee3ec81f2e5edc6e6057c74c','[\"*\"]','2026-11-18 19:56:57',NULL,'2026-11-18 19:56:57','2026-11-18 19:56:57'),(8,'App\\Models\\User',1,'web','2fa73e6472f3625cc6ffb62b8038eb8bc7c5ad2bd288aabf423d4b5440b34127','[\"*\"]','2026-11-18 20:24:17',NULL,'2026-11-18 20:20:23','2026-11-18 20:24:17');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Administrador General BaiFa','admin@baifa.com.ve','admin',1,NULL,'$2y$12$kRWVbJPb9wcWS5/MAq6HL.rwRdqqlTuxc/xx4ReofDTg4Bmd009qS',NULL,'2026-11-16 19:48:37','2026-11-18 19:53:27'),(2,'Carlos Mendoza','cliente@baifa.com.ve','client',1,NULL,'$2y$12$DGzX/ngMLIonZ2AIiFGFVuG9XgT.vFipf4OHysZuNWKeThY9MhehG',NULL,'2026-11-18 00:09:07','2026-11-18 19:53:28'),(3,'juanperez','juaneliezer13@gmail.com','client',1,NULL,'$2y$12$QBlvEg/Bw6yl2zKMLP.wKuB6rtlYt3edizKKaT4LQPNIGNx9856Jm',NULL,'2026-11-18 18:45:31','2026-11-18 18:45:31'),(4,'Adriana Morales','gerencia@baifa.com.ve','manager',1,NULL,'$2y$12$nZgLJPHd8Ep6rqHwhdmeh.eN72pVK3/JDwhYNlPirKxbcxQ29675i',NULL,'2026-11-18 19:53:27','2026-11-18 19:53:27'),(5,'Luis Alberto Herrera','operaciones@baifa.com.ve','employee',1,NULL,'$2y$12$8ndKoTdBfyn9IMimnQSjC.AA2CGmJsBrYhRqISlbrxWkQ.1PjaGYm',NULL,'2026-11-18 19:53:28','2026-11-18 20:20:06'),(6,'Patricia Rojas','despacho@baifa.com.ve','employee',1,NULL,'$2y$12$zJ0cVM6EuW3epr.kOx3Xs.Ddqi22KCziulSXk2N9SYByTEUOc2fGW',NULL,'2026-11-18 19:53:28','2026-11-18 19:53:28'),(7,'Roberto Silva','logistica@constandina.com.ve','client',1,NULL,'$2y$12$YgkJcoNVL0ivnDNmC0qrE.TIyejWxWIl9k9ZBen9Mmp.xoEpd9LU.',NULL,'2026-11-18 19:53:28','2026-11-18 19:53:28'),(8,'Elena Betancourt','compras@agrollanos.com.ve','client',1,NULL,'$2y$12$M.woBd1iLiGp7UaFyBW5WuRNXlYVW6iywkhB5Z.hZXt2s2F9DKgxm',NULL,'2026-11-18 19:53:29','2026-11-18 19:53:29');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'baifa_api'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-18 20:29:27
