-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: guarderia
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `cuota_mensual`
--

DROP TABLE IF EXISTS `cuota_mensual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuota_mensual` (
  `id_mensualidad` varchar(10) NOT NULL,
  `valor_mensualidad` float NOT NULL,
  `costo_comida` float DEFAULT NULL,
  `pagador_id` varchar(11) NOT NULL,
  `niño_id` int NOT NULL,
  PRIMARY KEY (`id_mensualidad`),
  KEY `idx_cuota_pagador` (`pagador_id`),
  KEY `idx_cuota_niño` (`niño_id`),
  CONSTRAINT `fk_cuota_niño` FOREIGN KEY (`niño_id`) REFERENCES `niño` (`id_matricula`),
  CONSTRAINT `fk_cuota_pagador` FOREIGN KEY (`pagador_id`) REFERENCES `pagador` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuota_mensual`
--

LOCK TABLES `cuota_mensual` WRITE;
/*!40000 ALTER TABLE `cuota_mensual` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuota_mensual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientes`
--

DROP TABLE IF EXISTS `ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredientes` (
  `nombre` varchar(50) NOT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `niño_id` int NOT NULL,
  `plato_id` varchar(50) NOT NULL,
  PRIMARY KEY (`nombre`),
  KEY `idx_ingrediente_niño` (`niño_id`),
  KEY `idx_ingredientes_plato` (`plato_id`),
  CONSTRAINT `fk_ingredientes_niño` FOREIGN KEY (`niño_id`) REFERENCES `niño` (`id_matricula`),
  CONSTRAINT `fk_ingredientes_plato` FOREIGN KEY (`plato_id`) REFERENCES `plato` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientes`
--

LOCK TABLES `ingredientes` WRITE;
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id_menu` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niño`
--

DROP TABLE IF EXISTS `niño`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `niño` (
  `id_matricula` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `comidas_realizadas` int DEFAULT NULL,
  `fecha_baja` date DEFAULT NULL,
  `persona_id` varchar(11) NOT NULL,
  `menu_id` int NOT NULL,
  PRIMARY KEY (`id_matricula`),
  KEY `idx_niño_persona` (`persona_id`),
  KEY `idx_niño_menu` (`menu_id`),
  CONSTRAINT `fk_niño_menu` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id_menu`),
  CONSTRAINT `fk_niño_persona` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niño`
--

LOCK TABLES `niño` WRITE;
/*!40000 ALTER TABLE `niño` DISABLE KEYS */;
/*!40000 ALTER TABLE `niño` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagador`
--

DROP TABLE IF EXISTS `pagador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagador` (
  `dni` varchar(11) NOT NULL,
  `numero_cuenta` varchar(20) NOT NULL,
  PRIMARY KEY (`dni`),
  KEY `idx_persona_pagador` (`dni`),
  CONSTRAINT `fk_persona_pagador` FOREIGN KEY (`dni`) REFERENCES `personas` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagador`
--

LOCK TABLES `pagador` WRITE;
/*!40000 ALTER TABLE `pagador` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `dni` varchar(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` text,
  `telefono` varchar(15) NOT NULL,
  `parentezco` varchar(20) NOT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plato`
--

DROP TABLE IF EXISTS `plato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plato` (
  `nombre` varchar(50) NOT NULL,
  `cantidad` float NOT NULL,
  `descripcion` text,
  `menu_id` int NOT NULL,
  PRIMARY KEY (`nombre`),
  KEY `idx_plato_menu` (`menu_id`),
  CONSTRAINT `fk_plato_menu` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plato`
--

LOCK TABLES `plato` WRITE;
/*!40000 ALTER TABLE `plato` DISABLE KEYS */;
/*!40000 ALTER TABLE `plato` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-04 11:30:33
