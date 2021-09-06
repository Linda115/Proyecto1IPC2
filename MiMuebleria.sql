-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: mymuebleria
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `NIT` bigint NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Departamento` varchar(20) DEFAULT NULL,
  `Municipio` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`NIT`),
  UNIQUE KEY `NIT_UNIQUE` (`NIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallesfactura`
--

DROP TABLE IF EXISTS `detallesfactura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallesfactura` (
  `idDetallesFactura` int NOT NULL AUTO_INCREMENT,
  `Factura_idFactura` int NOT NULL,
  `MuebleVenta_MuebleEnsamblado_idMuebleEnsamblado` int NOT NULL,
  PRIMARY KEY (`idDetallesFactura`),
  UNIQUE KEY `idDetallesFactura_UNIQUE` (`idDetallesFactura`),
  KEY `fk_DetallesFactura_Factura1_idx` (`Factura_idFactura`),
  KEY `fk_DetallesFactura_MuebleVenta1_idx` (`MuebleVenta_MuebleEnsamblado_idMuebleEnsamblado`),
  CONSTRAINT `fk_DetallesFactura_Factura1` FOREIGN KEY (`Factura_idFactura`) REFERENCES `factura` (`idFactura`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_DetallesFactura_MuebleVenta1` FOREIGN KEY (`MuebleVenta_MuebleEnsamblado_idMuebleEnsamblado`) REFERENCES `muebleventa` (`MuebleEnsamblado_idMuebleEnsamblado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallesfactura`
--

LOCK TABLES `detallesfactura` WRITE;
/*!40000 ALTER TABLE `detallesfactura` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallesfactura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ensamblepiezas`
--

DROP TABLE IF EXISTS `ensamblepiezas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ensamblepiezas` (
  `Mueble_Nombre` varchar(30) NOT NULL,
  `MateriaPrima_Tipo` varchar(30) NOT NULL,
  KEY `fk_EnsamblePiezas_Mueble1_idx` (`Mueble_Nombre`),
  KEY `fk_EnsamblePiezas_MateriaPrima1_idx` (`MateriaPrima_Tipo`),
  CONSTRAINT `fk_EnsamblePiezas_MateriaPrima1` FOREIGN KEY (`MateriaPrima_Tipo`) REFERENCES `materiaprima` (`Tipo`),
  CONSTRAINT `fk_EnsamblePiezas_Mueble1` FOREIGN KEY (`Mueble_Nombre`) REFERENCES `mueble` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ensamblepiezas`
--

LOCK TABLES `ensamblepiezas` WRITE;
/*!40000 ALTER TABLE `ensamblepiezas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ensamblepiezas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `idFactura` int NOT NULL AUTO_INCREMENT,
  `Clientes_NIT` bigint NOT NULL,
  `Fecha` date NOT NULL,
  `Usuario_Nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`idFactura`),
  UNIQUE KEY `idFactura_UNIQUE` (`idFactura`),
  KEY `fk_Factura_Clientes_idx` (`Clientes_NIT`),
  KEY `fk_Factura_Usuario1_idx` (`Usuario_Nombre`),
  CONSTRAINT `fk_Factura_Clientes` FOREIGN KEY (`Clientes_NIT`) REFERENCES `clientes` (`NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Factura_Usuario1` FOREIGN KEY (`Usuario_Nombre`) REFERENCES `usuario` (`Nombre`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materiaprima`
--

DROP TABLE IF EXISTS `materiaprima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materiaprima` (
  `Tipo` varchar(30) NOT NULL,
  `Precio` decimal(7,2) NOT NULL,
  PRIMARY KEY (`Tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materiaprima`
--

LOCK TABLES `materiaprima` WRITE;
/*!40000 ALTER TABLE `materiaprima` DISABLE KEYS */;
/*!40000 ALTER TABLE `materiaprima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mueble`
--

DROP TABLE IF EXISTS `mueble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mueble` (
  `Nombre` varchar(30) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Nombre`),
  UNIQUE KEY `Nombre_UNIQUE` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mueble`
--

LOCK TABLES `mueble` WRITE;
/*!40000 ALTER TABLE `mueble` DISABLE KEYS */;
/*!40000 ALTER TABLE `mueble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muebleensamblado`
--

DROP TABLE IF EXISTS `muebleensamblado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `muebleensamblado` (
  `idMuebleEnsamblado` int NOT NULL AUTO_INCREMENT,
  `Costo` decimal(10,2) NOT NULL,
  `Usuario_Nombre` varchar(30) NOT NULL,
  `Mueble_Nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`idMuebleEnsamblado`),
  UNIQUE KEY `idMuebleEnsamblado_UNIQUE` (`idMuebleEnsamblado`),
  KEY `fk_MuebleEnsamblado_Usuario1_idx` (`Usuario_Nombre`),
  KEY `fk_MuebleEnsamblado_Mueble1_idx` (`Mueble_Nombre`),
  CONSTRAINT `fk_MuebleEnsamblado_Mueble1` FOREIGN KEY (`Mueble_Nombre`) REFERENCES `mueble` (`Nombre`),
  CONSTRAINT `fk_MuebleEnsamblado_Usuario1` FOREIGN KEY (`Usuario_Nombre`) REFERENCES `usuario` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muebleensamblado`
--

LOCK TABLES `muebleensamblado` WRITE;
/*!40000 ALTER TABLE `muebleensamblado` DISABLE KEYS */;
/*!40000 ALTER TABLE `muebleensamblado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muebleventa`
--

DROP TABLE IF EXISTS `muebleventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `muebleventa` (
  `Tipo` varchar(45) NOT NULL,
  `MuebleEnsamblado_idMuebleEnsamblado` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`MuebleEnsamblado_idMuebleEnsamblado`),
  UNIQUE KEY `MuebleEnsamblado_idMuebleEnsamblado_UNIQUE` (`MuebleEnsamblado_idMuebleEnsamblado`),
  KEY `fk_MuebleVenta_MuebleEnsamblado1_idx` (`MuebleEnsamblado_idMuebleEnsamblado`),
  CONSTRAINT `fk_MuebleVenta_MuebleEnsamblado1` FOREIGN KEY (`MuebleEnsamblado_idMuebleEnsamblado`) REFERENCES `muebleensamblado` (`idMuebleEnsamblado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muebleventa`
--

LOCK TABLES `muebleventa` WRITE;
/*!40000 ALTER TABLE `muebleventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `muebleventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `Nombre` varchar(30) NOT NULL,
  `Contraseña` varchar(15) NOT NULL,
  `Tipo` int NOT NULL,
  PRIMARY KEY (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-06 12:02:09
