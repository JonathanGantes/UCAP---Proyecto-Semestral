-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: ucap.cfqaouqaacej.us-east-1.rds.amazonaws.com    Database: UCAP-Main
-- ------------------------------------------------------
-- Server version	8.0.20

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `Administrativos`
--

DROP TABLE IF EXISTS `Administrativos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Administrativos` (
  `ID_Administrativo` int NOT NULL AUTO_INCREMENT,
  `ID_Empleado` int DEFAULT NULL,
  `Cargo` int DEFAULT NULL,
  `Password` varchar(200) NOT NULL,
  PRIMARY KEY (`ID_Administrativo`),
  UNIQUE KEY `ID_Administrativo_UNIQUE` (`ID_Administrativo`),
  KEY `ID_Emp_idx` (`ID_Empleado`),
  KEY `ID_Cargo_idx` (`Cargo`),
  CONSTRAINT `ID_Cargo` FOREIGN KEY (`Cargo`) REFERENCES `Administrativos_Cargos` (`ID_Cargo`),
  CONSTRAINT `ID_Empl` FOREIGN KEY (`ID_Empleado`) REFERENCES `Empleado` (`ID_Empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administrativos`
--

LOCK TABLES `Administrativos` WRITE;
/*!40000 ALTER TABLE `Administrativos` DISABLE KEYS */;
INSERT INTO `Administrativos` VALUES (1,1,1,'Proyecto');
/*!40000 ALTER TABLE `Administrativos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Administrativos_Cargos`
--

DROP TABLE IF EXISTS `Administrativos_Cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Administrativos_Cargos` (
  `ID_Cargo` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Salario` float DEFAULT NULL,
  PRIMARY KEY (`ID_Cargo`),
  UNIQUE KEY `ID_Cargo_UNIQUE` (`ID_Cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administrativos_Cargos`
--

LOCK TABLES `Administrativos_Cargos` WRITE;
/*!40000 ALTER TABLE `Administrativos_Cargos` DISABLE KEYS */;
INSERT INTO `Administrativos_Cargos` VALUES (1,'ADMIN',9999),(2,'Rector',8000),(3,'Decano',4000),(4,'Director de Escuela',2000),(5,'Administrador',1000),(6,'Secretaria',600);
/*!40000 ALTER TABLE `Administrativos_Cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Alumno`
--

DROP TABLE IF EXISTS `Alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Alumno` (
  `ID_Alumno` int NOT NULL AUTO_INCREMENT,
  `Indice_A` float DEFAULT NULL,
  `ID_Persona` int NOT NULL,
  `Facultad` int NOT NULL,
  `Escuela` int NOT NULL,
  `Carrera` int NOT NULL,
  PRIMARY KEY (`ID_Alumno`),
  UNIQUE KEY `ID_Alumno_UNIQUE` (`ID_Alumno`),
  KEY `ID_Persona_Al_idx` (`ID_Persona`),
  KEY `ID_Carrera_idx` (`Carrera`),
  KEY `ID_Facultad_idx` (`Facultad`),
  KEY `id_Escuela_idx` (`Escuela`),
  CONSTRAINT `ID_Carrera` FOREIGN KEY (`Carrera`) REFERENCES `Carrera` (`ID_Carrera`),
  CONSTRAINT `id_Escuela` FOREIGN KEY (`Escuela`) REFERENCES `Escuela` (`ID_Esceula`),
  CONSTRAINT `ID_Facultad` FOREIGN KEY (`Facultad`) REFERENCES `Facultad` (`ID_Facultad`),
  CONSTRAINT `ID_Persona_Al` FOREIGN KEY (`ID_Persona`) REFERENCES `Persona` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla de Almunos de la Universidad';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alumno`
--

LOCK TABLES `Alumno` WRITE;
/*!40000 ALTER TABLE `Alumno` DISABLE KEYS */;
/*!40000 ALTER TABLE `Alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Calificaciones`
--

DROP TABLE IF EXISTS `Calificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Calificaciones` (
  `ID_Calif` int NOT NULL,
  `Materia` int NOT NULL,
  `Docente` int NOT NULL,
  `Alumno` int NOT NULL,
  `Calif` varchar(2) NOT NULL,
  `Pts` int NOT NULL,
  `Fecha_Exp` datetime NOT NULL,
  PRIMARY KEY (`ID_Calif`),
  KEY `ID_Mat_idx` (`Materia`),
  KEY `ID_Doc_idx` (`Docente`),
  KEY `ID_Alum_idx` (`Alumno`),
  CONSTRAINT `ID_Alu` FOREIGN KEY (`Alumno`) REFERENCES `Alumno` (`ID_Alumno`),
  CONSTRAINT `ID_Do` FOREIGN KEY (`Docente`) REFERENCES `Docente` (`ID_Docente`),
  CONSTRAINT `ID_Ma` FOREIGN KEY (`Materia`) REFERENCES `Materia` (`ID_Materia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Calificaciones`
--

LOCK TABLES `Calificaciones` WRITE;
/*!40000 ALTER TABLE `Calificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `Calificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Carrera`
--

DROP TABLE IF EXISTS `Carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Carrera` (
  `ID_Carrera` int NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Plan_E` int DEFAULT NULL,
  `Fecha_C` date DEFAULT NULL,
  PRIMARY KEY (`ID_Carrera`),
  UNIQUE KEY `ID_Carrera_UNIQUE` (`ID_Carrera`),
  KEY `ID_Plan_idx` (`Plan_E`),
  CONSTRAINT `ID_Plan` FOREIGN KEY (`Plan_E`) REFERENCES `Plan_Estudios` (`ID_Plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Listado de Carreras de la Universidad';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carrera`
--

LOCK TABLES `Carrera` WRITE;
/*!40000 ALTER TABLE `Carrera` DISABLE KEYS */;
/*!40000 ALTER TABLE `Carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clases`
--

DROP TABLE IF EXISTS `Clases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clases` (
  `ID_Clase` int NOT NULL,
  `Materia` int NOT NULL,
  `Docente` int NOT NULL,
  PRIMARY KEY (`ID_Clase`),
  KEY `ID_Mater_idx` (`Materia`),
  KEY `ID_Doce_idx` (`Docente`),
  CONSTRAINT `ID_Doce` FOREIGN KEY (`Docente`) REFERENCES `Docente` (`ID_Docente`),
  CONSTRAINT `ID_Mater` FOREIGN KEY (`Materia`) REFERENCES `Materia` (`ID_Materia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clases`
--

LOCK TABLES `Clases` WRITE;
/*!40000 ALTER TABLE `Clases` DISABLE KEYS */;
/*!40000 ALTER TABLE `Clases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Docente`
--

DROP TABLE IF EXISTS `Docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Docente` (
  `ID_Docente` int NOT NULL AUTO_INCREMENT,
  `T_Trabajo` int NOT NULL,
  `ID_Emp` int NOT NULL,
  `Materia` int NOT NULL,
  `Nivel` int NOT NULL,
  `Saladrio` float DEFAULT NULL,
  PRIMARY KEY (`ID_Docente`),
  UNIQUE KEY `ID_Docente_UNIQUE` (`ID_Docente`),
  KEY `ID_Emp_idx` (`ID_Emp`),
  KEY `ID_Materia_idx` (`Materia`),
  KEY `ID_T_Tranajo_idx` (`T_Trabajo`),
  CONSTRAINT `ID_Emp` FOREIGN KEY (`ID_Emp`) REFERENCES `Empleado` (`ID_Empleado`),
  CONSTRAINT `ID_Materia` FOREIGN KEY (`Materia`) REFERENCES `Materia` (`ID_Materia`),
  CONSTRAINT `ID_T_Trabajo` FOREIGN KEY (`T_Trabajo`) REFERENCES `Docente_Tiempo_Trabajo` (`ID_T_Trabajo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla de Docentes de la Universidad';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Docente`
--

LOCK TABLES `Docente` WRITE;
/*!40000 ALTER TABLE `Docente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Docente_Tiempo_Trabajo`
--

DROP TABLE IF EXISTS `Docente_Tiempo_Trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Docente_Tiempo_Trabajo` (
  `ID_T_Trabajo` int NOT NULL AUTO_INCREMENT,
  `Descripción` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_T_Trabajo`),
  UNIQUE KEY `ID_T_Trabajo_UNIQUE` (`ID_T_Trabajo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Docente_Tiempo_Trabajo`
--

LOCK TABLES `Docente_Tiempo_Trabajo` WRITE;
/*!40000 ALTER TABLE `Docente_Tiempo_Trabajo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Docente_Tiempo_Trabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleado`
--

DROP TABLE IF EXISTS `Empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empleado` (
  `ID_Empleado` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador unico de empleado',
  `ID_Persona` int NOT NULL COMMENT 'Indetificador unico que hace referencia  a la tabla personas',
  PRIMARY KEY (`ID_Empleado`),
  UNIQUE KEY `ID_Empleado_UNIQUE` (`ID_Empleado`),
  KEY `ID_Persona_idx` (`ID_Persona`),
  CONSTRAINT `ID_Persona_Emp` FOREIGN KEY (`ID_Persona`) REFERENCES `Persona` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla de Empleados de la Universidad';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleado`
--

LOCK TABLES `Empleado` WRITE;
/*!40000 ALTER TABLE `Empleado` DISABLE KEYS */;
INSERT INTO `Empleado` VALUES (1,1);
/*!40000 ALTER TABLE `Empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Escuela`
--

DROP TABLE IF EXISTS `Escuela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Escuela` (
  `ID_Esceula` int NOT NULL AUTO_INCREMENT,
  `Descripción` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_Esceula`),
  UNIQUE KEY `ID_Esceula_UNIQUE` (`ID_Esceula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Escuela`
--

LOCK TABLES `Escuela` WRITE;
/*!40000 ALTER TABLE `Escuela` DISABLE KEYS */;
/*!40000 ALTER TABLE `Escuela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Facturas_MPago`
--

DROP TABLE IF EXISTS `Facturas_MPago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Facturas_MPago` (
  `ID_MPago` int NOT NULL AUTO_INCREMENT,
  `Descripción` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_MPago`),
  UNIQUE KEY `ID_MPago_UNIQUE` (`ID_MPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Facturas_MPago`
--

LOCK TABLES `Facturas_MPago` WRITE;
/*!40000 ALTER TABLE `Facturas_MPago` DISABLE KEYS */;
/*!40000 ALTER TABLE `Facturas_MPago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Facturas_PagosEst`
--

DROP TABLE IF EXISTS `Facturas_PagosEst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Facturas_PagosEst` (
  `ID_Factura` int NOT NULL AUTO_INCREMENT,
  `Alumno` int NOT NULL,
  `Metodo_P` int NOT NULL,
  `Fecha` datetime NOT NULL,
  `Costo` float NOT NULL,
  PRIMARY KEY (`ID_Factura`),
  UNIQUE KEY `ID_Factura_UNIQUE` (`ID_Factura`),
  KEY `ID_Alu1_idx` (`Alumno`),
  KEY `ID_MPago_idx` (`Metodo_P`),
  CONSTRAINT `ID_Alu1` FOREIGN KEY (`Alumno`) REFERENCES `Alumno` (`ID_Alumno`),
  CONSTRAINT `ID_MPago` FOREIGN KEY (`Metodo_P`) REFERENCES `Facturas_MPago` (`ID_MPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Facturas_PagosEst`
--

LOCK TABLES `Facturas_PagosEst` WRITE;
/*!40000 ALTER TABLE `Facturas_PagosEst` DISABLE KEYS */;
/*!40000 ALTER TABLE `Facturas_PagosEst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Facturas_Servicios`
--

DROP TABLE IF EXISTS `Facturas_Servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Facturas_Servicios` (
  `ID_Servicio` int NOT NULL AUTO_INCREMENT,
  `Descripción` varchar(45) DEFAULT NULL,
  `Costo` float DEFAULT NULL,
  PRIMARY KEY (`ID_Servicio`),
  UNIQUE KEY `ID_Servicio_UNIQUE` (`ID_Servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Facturas_Servicios`
--

LOCK TABLES `Facturas_Servicios` WRITE;
/*!40000 ALTER TABLE `Facturas_Servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `Facturas_Servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Facturas_SerxFact`
--

DROP TABLE IF EXISTS `Facturas_SerxFact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Facturas_SerxFact` (
  `Servicio` int NOT NULL,
  `Factura` int NOT NULL,
  KEY `ID_Fact_idx` (`Factura`),
  KEY `ID_Serv_idx` (`Servicio`),
  CONSTRAINT `ID_Fact` FOREIGN KEY (`Factura`) REFERENCES `Facturas_PagosEst` (`ID_Factura`),
  CONSTRAINT `ID_Serv` FOREIGN KEY (`Servicio`) REFERENCES `Facturas_Servicios` (`ID_Servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Facturas_SerxFact`
--

LOCK TABLES `Facturas_SerxFact` WRITE;
/*!40000 ALTER TABLE `Facturas_SerxFact` DISABLE KEYS */;
/*!40000 ALTER TABLE `Facturas_SerxFact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Facultad`
--

DROP TABLE IF EXISTS `Facultad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Facultad` (
  `ID_Facultad` int NOT NULL AUTO_INCREMENT,
  `Descripción` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_Facultad`),
  UNIQUE KEY `ID_Facultad_UNIQUE` (`ID_Facultad`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla de Facultades de la Universidad';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Facultad`
--

LOCK TABLES `Facultad` WRITE;
/*!40000 ALTER TABLE `Facultad` DISABLE KEYS */;
INSERT INTO `Facultad` VALUES (1,'Ciencias'),(22,'Quimica');
/*!40000 ALTER TABLE `Facultad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Horario`
--

DROP TABLE IF EXISTS `Horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Horario` (
  `ID_Horario` int NOT NULL,
  `Clase` int NOT NULL,
  `Hora` int NOT NULL,
  `Dia` int NOT NULL,
  PRIMARY KEY (`ID_Horario`),
  KEY `ID_Cls_idx` (`Clase`),
  KEY `ID_Hora_idx` (`Hora`),
  KEY `ID_Dia_idx` (`Dia`),
  CONSTRAINT `ID_Cls` FOREIGN KEY (`Clase`) REFERENCES `Clases` (`ID_Clase`),
  CONSTRAINT `ID_Dia` FOREIGN KEY (`Dia`) REFERENCES `Horario_Dia` (`ID_Dia`),
  CONSTRAINT `ID_Hora` FOREIGN KEY (`Hora`) REFERENCES `Horario_Horas` (`ID_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Horario`
--

LOCK TABLES `Horario` WRITE;
/*!40000 ALTER TABLE `Horario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Horario_Dia`
--

DROP TABLE IF EXISTS `Horario_Dia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Horario_Dia` (
  `ID_Dia` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_Dia`),
  UNIQUE KEY `ID_Dia_UNIQUE` (`ID_Dia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Horario_Dia`
--

LOCK TABLES `Horario_Dia` WRITE;
/*!40000 ALTER TABLE `Horario_Dia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Horario_Dia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Horario_Horas`
--

DROP TABLE IF EXISTS `Horario_Horas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Horario_Horas` (
  `ID_Hora` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_Hora`),
  UNIQUE KEY `ID_Hora_UNIQUE` (`ID_Hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Horario_Horas`
--

LOCK TABLES `Horario_Horas` WRITE;
/*!40000 ALTER TABLE `Horario_Horas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Horario_Horas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Materia`
--

DROP TABLE IF EXISTS `Materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Materia` (
  `ID_Materia` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador unico de materia',
  `Nombre` varchar(35) NOT NULL COMMENT 'Nomnre de a materia',
  `Abr` varchar(4) NOT NULL COMMENT 'Abrebiatura de a materia',
  `Cre` int NOT NULL COMMENT 'Cantidad de Cretditos de la materia',
  `Tipo` int DEFAULT NULL COMMENT 'Foreign Key del tipo de materia',
  PRIMARY KEY (`ID_Materia`),
  UNIQUE KEY `ID_Materia_UNIQUE` (`ID_Materia`),
  UNIQUE KEY `Abr_UNIQUE` (`Abr`),
  KEY `Tipo_idx` (`Tipo`),
  CONSTRAINT `Tipo` FOREIGN KEY (`Tipo`) REFERENCES `Materia_Tipo` (`ID_Tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que incluye todas las materias de la universidad';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Materia`
--

LOCK TABLES `Materia` WRITE;
/*!40000 ALTER TABLE `Materia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Materia_Tipo`
--

DROP TABLE IF EXISTS `Materia_Tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Materia_Tipo` (
  `ID_Tipo` int NOT NULL,
  `Descripción` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_Tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Materia_Tipo`
--

LOCK TABLES `Materia_Tipo` WRITE;
/*!40000 ALTER TABLE `Materia_Tipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Materia_Tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MateriaxPlan`
--

DROP TABLE IF EXISTS `MateriaxPlan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MateriaxPlan` (
  `ID_Plan` int NOT NULL,
  `Materia` int NOT NULL,
  KEY `ID_Mat_idx` (`Materia`),
  KEY `ID_Pla_idx` (`ID_Plan`),
  CONSTRAINT `ID_Mat` FOREIGN KEY (`Materia`) REFERENCES `Materia` (`ID_Materia`),
  CONSTRAINT `ID_Pla` FOREIGN KEY (`ID_Plan`) REFERENCES `Plan_Estudios` (`ID_Plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MateriaxPlan`
--

LOCK TABLES `MateriaxPlan` WRITE;
/*!40000 ALTER TABLE `MateriaxPlan` DISABLE KEYS */;
/*!40000 ALTER TABLE `MateriaxPlan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Matricula`
--

DROP TABLE IF EXISTS `Matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Matricula` (
  `ID_Matricula` int NOT NULL AUTO_INCREMENT,
  `Alumno` int NOT NULL,
  `Semestre` int NOT NULL,
  `Ano_L` year NOT NULL,
  `Total` float DEFAULT NULL,
  PRIMARY KEY (`ID_Matricula`),
  UNIQUE KEY `ID_Matricula_UNIQUE` (`ID_Matricula`),
  KEY `ID_Alm_idx` (`Alumno`),
  CONSTRAINT `ID_Alm` FOREIGN KEY (`Alumno`) REFERENCES `Alumno` (`ID_Alumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Matricula`
--

LOCK TABLES `Matricula` WRITE;
/*!40000 ALTER TABLE `Matricula` DISABLE KEYS */;
/*!40000 ALTER TABLE `Matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MatriculaxHorario`
--

DROP TABLE IF EXISTS `MatriculaxHorario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MatriculaxHorario` (
  `ID_Matricula` int NOT NULL,
  `ID_Horario` int NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  KEY `ID_Matr_idx` (`ID_Matricula`),
  KEY `ID_Hor_idx` (`ID_Horario`),
  CONSTRAINT `ID_Hor` FOREIGN KEY (`ID_Horario`) REFERENCES `Horario` (`ID_Horario`),
  CONSTRAINT `ID_Matr` FOREIGN KEY (`ID_Matricula`) REFERENCES `Matricula` (`ID_Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MatriculaxHorario`
--

LOCK TABLES `MatriculaxHorario` WRITE;
/*!40000 ALTER TABLE `MatriculaxHorario` DISABLE KEYS */;
/*!40000 ALTER TABLE `MatriculaxHorario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pagos_Planilla`
--

DROP TABLE IF EXISTS `Pagos_Planilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pagos_Planilla` (
  `ID_Pago` int NOT NULL AUTO_INCREMENT,
  `Empleado` int NOT NULL,
  `Monto` float NOT NULL,
  `Fecha` datetime NOT NULL,
  PRIMARY KEY (`ID_Pago`),
  UNIQUE KEY `ID_Pago_UNIQUE` (`ID_Pago`),
  KEY `ID_Emp1_idx` (`Empleado`),
  CONSTRAINT `ID_Emp1` FOREIGN KEY (`Empleado`) REFERENCES `Empleado` (`ID_Empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pagos_Planilla`
--

LOCK TABLES `Pagos_Planilla` WRITE;
/*!40000 ALTER TABLE `Pagos_Planilla` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pagos_Planilla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Persona`
--

DROP TABLE IF EXISTS `Persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Persona` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Cedula` varchar(13) NOT NULL COMMENT 'Cedula dela persona',
  `Nombre1` varchar(20) NOT NULL COMMENT 'Primer Nombre',
  `Nombre2` varchar(20) DEFAULT NULL COMMENT 'Segundo Nombre',
  `Apellido1` varchar(20) NOT NULL COMMENT '1er apellido',
  `Apellido2` varchar(20) DEFAULT NULL COMMENT '2do apellido',
  `Fecha_Nac` date NOT NULL COMMENT 'Fecha de nacimiento completa',
  `Direccion` varchar(45) DEFAULT NULL COMMENT 'Lugar de Residencia',
  `Sexo` varchar(1) DEFAULT NULL,
  `Correo_E` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Persona`
--

LOCK TABLES `Persona` WRITE;
/*!40000 ALTER TABLE `Persona` DISABLE KEYS */;
INSERT INTO `Persona` VALUES (1,'ADMIN','ADMIN','ADMIN','ADMIN','ADMIN','2020-02-03','ADMIN','M','ADMIN'),(2,'8-933-2067','Jonathan','Martin','Gantes','Muñoz','1998-06-19',NULL,'M','gantes1998@gmail.com'),(5,'8-918-218','Julissa','Mahelis','Grajales','Del','1997-03-29','Santa Ana','F','julissa@ucap.ac.pa');
/*!40000 ALTER TABLE `Persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Persona_Tels`
--

DROP TABLE IF EXISTS `Persona_Tels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Persona_Tels` (
  `ID_Persona` int NOT NULL,
  `Telefono` varchar(12) NOT NULL,
  `Descripción` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID_Persona`),
  CONSTRAINT `ID_Persona` FOREIGN KEY (`ID_Persona`) REFERENCES `Persona` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Directorio Telefonico de las personas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Persona_Tels`
--

LOCK TABLES `Persona_Tels` WRITE;
/*!40000 ALTER TABLE `Persona_Tels` DISABLE KEYS */;
/*!40000 ALTER TABLE `Persona_Tels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Plan_Estudios`
--

DROP TABLE IF EXISTS `Plan_Estudios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Plan_Estudios` (
  `ID_Plan` int NOT NULL AUTO_INCREMENT,
  `Descripción` varchar(45) DEFAULT NULL,
  `Fecha_Plan` date DEFAULT NULL,
  PRIMARY KEY (`ID_Plan`),
  UNIQUE KEY `ID_Plan_UNIQUE` (`ID_Plan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Listado de Planes de Estudi de la Universidad';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plan_Estudios`
--

LOCK TABLES `Plan_Estudios` WRITE;
/*!40000 ALTER TABLE `Plan_Estudios` DISABLE KEYS */;
/*!40000 ALTER TABLE `Plan_Estudios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'UCAP-Main'
--

--
-- Dumping routines for database 'UCAP-Main'
--
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-09 18:16:43
