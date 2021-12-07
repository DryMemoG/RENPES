-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: renpes
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `tbl_alumno`
--

DROP TABLE IF EXISTS `tbl_alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_alumno` (
  `id_alumno` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  `codigo` varchar(25) COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  `carnet` varchar(20) COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  `fecha_nac` datetime NOT NULL,
  `id_encargado` int NOT NULL,
  PRIMARY KEY (`id_alumno`),
  KEY `id_encargado` (`id_encargado`),
  CONSTRAINT `tbl_alumno_ibfk_1` FOREIGN KEY (`id_encargado`) REFERENCES `tbl_encargado` (`id_encargado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_es_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_alumno`
--

LOCK TABLES `tbl_alumno` WRITE;
/*!40000 ALTER TABLE `tbl_alumno` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_asignacion`
--

DROP TABLE IF EXISTS `tbl_asignacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_asignacion` (
  `id_asignacion` int NOT NULL AUTO_INCREMENT,
  `id_curso` int NOT NULL,
  `id_alumno` int NOT NULL,
  `id_unidad` int NOT NULL,
  `nota` int NOT NULL,
  `anotaciones` text COLLATE utf8mb4_es_0900_ai_ci,
  PRIMARY KEY (`id_asignacion`),
  KEY `id_curso` (`id_curso`),
  KEY `id_alumno` (`id_alumno`),
  KEY `id_unidad` (`id_unidad`),
  CONSTRAINT `tbl_asignacion_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `tbl_curso` (`id_curso`),
  CONSTRAINT `tbl_asignacion_ibfk_2` FOREIGN KEY (`id_alumno`) REFERENCES `tbl_alumno` (`id_alumno`),
  CONSTRAINT `tbl_asignacion_ibfk_3` FOREIGN KEY (`id_unidad`) REFERENCES `tbl_unidad` (`id_unidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_es_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_asignacion`
--

LOCK TABLES `tbl_asignacion` WRITE;
/*!40000 ALTER TABLE `tbl_asignacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_asignacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_carrera`
--

DROP TABLE IF EXISTS `tbl_carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_carrera` (
  `id_carrera` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_es_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_carrera`
--

LOCK TABLES `tbl_carrera` WRITE;
/*!40000 ALTER TABLE `tbl_carrera` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_curso`
--

DROP TABLE IF EXISTS `tbl_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_curso` (
  `id_curso` int NOT NULL AUTO_INCREMENT,
  `nombre_curso` varchar(50) COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_es_0900_ai_ci DEFAULT NULL,
  `id_grado` int NOT NULL,
  `id_maestro` int NOT NULL,
  `is_XC` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_curso`),
  KEY `id_grado` (`id_grado`),
  KEY `id_maestro` (`id_maestro`),
  CONSTRAINT `tbl_curso_ibfk_1` FOREIGN KEY (`id_grado`) REFERENCES `tbl_grado` (`id_grado`),
  CONSTRAINT `tbl_curso_ibfk_2` FOREIGN KEY (`id_maestro`) REFERENCES `tbl_maestro` (`id_maestro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_es_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_curso`
--

LOCK TABLES `tbl_curso` WRITE;
/*!40000 ALTER TABLE `tbl_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_encargado`
--

DROP TABLE IF EXISTS `tbl_encargado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_encargado` (
  `id_encargado` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  `cui` varchar(13) COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  `direccion` varchar(100) COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  `telefono` varchar(10) COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_encargado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_es_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_encargado`
--

LOCK TABLES `tbl_encargado` WRITE;
/*!40000 ALTER TABLE `tbl_encargado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_encargado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_grado`
--

DROP TABLE IF EXISTS `tbl_grado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_grado` (
  `id_grado` int NOT NULL AUTO_INCREMENT,
  `grado` varchar(25) COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  `id_seccion` int NOT NULL,
  `id_carrera` int NOT NULL,
  `id_nivel` int NOT NULL,
  PRIMARY KEY (`id_grado`),
  KEY `id_seccion` (`id_seccion`),
  KEY `id_carrera` (`id_carrera`),
  KEY `id_nivel` (`id_nivel`),
  CONSTRAINT `tbl_grado_ibfk_1` FOREIGN KEY (`id_seccion`) REFERENCES `tbl_seccion` (`id_seccion`),
  CONSTRAINT `tbl_grado_ibfk_2` FOREIGN KEY (`id_carrera`) REFERENCES `tbl_carrera` (`id_carrera`),
  CONSTRAINT `tbl_grado_ibfk_3` FOREIGN KEY (`id_nivel`) REFERENCES `tbl_nivel` (`id_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_es_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_grado`
--

LOCK TABLES `tbl_grado` WRITE;
/*!40000 ALTER TABLE `tbl_grado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_grado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_maestro`
--

DROP TABLE IF EXISTS `tbl_maestro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_maestro` (
  `id_maestro` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  `apellidos` varchar(75) COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_maestro`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `tbl_maestro_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_es_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_maestro`
--

LOCK TABLES `tbl_maestro` WRITE;
/*!40000 ALTER TABLE `tbl_maestro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_maestro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_nivel`
--

DROP TABLE IF EXISTS `tbl_nivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_nivel` (
  `id_nivel` int NOT NULL AUTO_INCREMENT,
  `nivel` varchar(25) COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_es_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_nivel`
--

LOCK TABLES `tbl_nivel` WRITE;
/*!40000 ALTER TABLE `tbl_nivel` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_nivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pagomaestro`
--

DROP TABLE IF EXISTS `tbl_pagomaestro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pagomaestro` (
  `id_pagomaestro` int NOT NULL AUTO_INCREMENT,
  `correlativo` varchar(25) COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  `id_maestro` int NOT NULL,
  `fecha` datetime NOT NULL,
  `monto` float NOT NULL,
  `descripcion` text COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_pagomaestro`),
  KEY `id_maestro` (`id_maestro`),
  CONSTRAINT `tbl_pagomaestro_ibfk_1` FOREIGN KEY (`id_maestro`) REFERENCES `tbl_maestro` (`id_maestro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_es_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pagomaestro`
--

LOCK TABLES `tbl_pagomaestro` WRITE;
/*!40000 ALTER TABLE `tbl_pagomaestro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pagomaestro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pagos`
--

DROP TABLE IF EXISTS `tbl_pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pagos` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `correlativo` varchar(25) COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  `monto` float NOT NULL,
  `fecha` datetime NOT NULL,
  `id_alumno` int NOT NULL,
  `descripcion` text COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_pago`),
  UNIQUE KEY `correlativo` (`correlativo`),
  KEY `id_alumno` (`id_alumno`),
  CONSTRAINT `tbl_pagos_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `tbl_alumno` (`id_alumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_es_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pagos`
--

LOCK TABLES `tbl_pagos` WRITE;
/*!40000 ALTER TABLE `tbl_pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seccion`
--

DROP TABLE IF EXISTS `tbl_seccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_seccion` (
  `id_seccion` int NOT NULL AUTO_INCREMENT,
  `seccion` varchar(2) COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_seccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_es_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seccion`
--

LOCK TABLES `tbl_seccion` WRITE;
/*!40000 ALTER TABLE `tbl_seccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_seccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_unidad`
--

DROP TABLE IF EXISTS `tbl_unidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_unidad` (
  `id_unidad` int NOT NULL AUTO_INCREMENT,
  `unidad` int NOT NULL,
  `descripcion` varchar(25) COLLATE utf8mb4_es_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_unidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_es_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_unidad`
--

LOCK TABLES `tbl_unidad` WRITE;
/*!40000 ALTER TABLE `tbl_unidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_unidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario`
--

DROP TABLE IF EXISTS `tbl_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(25) COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  `email` varchar(256) COLLATE utf8mb4_es_0900_ai_ci DEFAULT NULL,
  `passwd` varchar(128) COLLATE utf8mb4_es_0900_ai_ci NOT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usuario` (`usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_es_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario`
--

LOCK TABLES `tbl_usuario` WRITE;
/*!40000 ALTER TABLE `tbl_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-07  0:08:18
