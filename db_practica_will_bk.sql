-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_practica_will
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_clientes`
--

DROP TABLE IF EXISTS `tb_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_clientes` (
  `cliente_id` varchar(50) NOT NULL DEFAULT uuid(),
  `nombre_cliente` varchar(50) NOT NULL,
  `apellido_cliente` varchar(50) NOT NULL,
  `telefono_cliente` varchar(10) NOT NULL,
  `direccion_cliente` varchar(225) NOT NULL,
  PRIMARY KEY (`cliente_id`),
  UNIQUE KEY `telefono_cliente` (`telefono_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_clientes`
--

LOCK TABLES `tb_clientes` WRITE;
/*!40000 ALTER TABLE `tb_clientes` DISABLE KEYS */;
INSERT INTO `tb_clientes` VALUES ('5c7bc049-d683-11ee-b663-9c6b000a554a','Chris','Ponce','1324567891','Calle Principal 121'),('5c7cdc02-d683-11ee-b663-9c6b000a554a','Xochilt','Juarez','1234567898','Calle Principal 122'),('5c7d2f8e-d683-11ee-b663-9c6b000a554a','Eduardo','Gutierrez','1234567897','Calle Principal 124'),('5c7d86e1-d683-11ee-b663-9c6b000a554a','Fernando','Cuchittini','1234567896','Calle Principal 125'),('5c7ddc7a-d683-11ee-b663-9c6b000a554a','Daniel','Kike','1234567895','Calle Principal 126'),('5c7e2d4f-d683-11ee-b663-9c6b000a554a','Alessandro','Hernandez','1234567894','Calle Principal 127'),('5c7ed81c-d683-11ee-b663-9c6b000a554a','Javier','Donatelo','1234567893','Calle Principal 128'),('5c7f4bc7-d683-11ee-b663-9c6b000a554a','Hazel','Chica','1234567892','Calle Principal 129'),('5c7fc2db-d683-11ee-b663-9c6b000a554a','Xavi','Orellana','1234567891','Calle Principal 120'),('5c805eb8-d683-11ee-b663-9c6b000a554a','Messi','Murillo','1234567899','Calle Principal 111'),('5c80b04e-d683-11ee-b663-9c6b000a554a','Leo','Argueta','1234567889','Calle Principal 112'),('5c810429-d683-11ee-b663-9c6b000a554a','Cristiano','Grandos','1234567878','Calle Principal 113'),('5c816dbc-d683-11ee-b663-9c6b000a554a','Sebastian','Miguel','1234567812','Calle Principal 143'),('5c81d72f-d683-11ee-b663-9c6b000a554a','Gabi','Pereza','1234567813','Calle Principal 115'),('895bcf51-d682-11ee-b663-9c6b000a554a','Juan','Perez','1234567890','Calle Principal 123');
/*!40000 ALTER TABLE `tb_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_detalles_pedidos`
--

DROP TABLE IF EXISTS `tb_detalles_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_detalles_pedidos` (
  `detalle_id` varchar(50) NOT NULL DEFAULT uuid(),
  `pedido_id` varchar(50) DEFAULT NULL,
  `producto_id` varchar(50) DEFAULT NULL,
  `cantidad_detalle_pedido` int(11) NOT NULL CHECK (`cantidad_detalle_pedido` >= 0),
  `precio_unitario_detalle_pedido` decimal(10,2) NOT NULL CHECK (`precio_unitario_detalle_pedido` >= 0),
  `subtotal_detalle_pedido` decimal(10,2) NOT NULL CHECK (`subtotal_detalle_pedido` >= 0),
  PRIMARY KEY (`detalle_id`),
  KEY `pedido_id` (`pedido_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `tb_detalles_pedidos_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `tb_pedidos` (`pedido_id`),
  CONSTRAINT `tb_detalles_pedidos_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `tb_productos` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_detalles_pedidos`
--

LOCK TABLES `tb_detalles_pedidos` WRITE;
/*!40000 ALTER TABLE `tb_detalles_pedidos` DISABLE KEYS */;
INSERT INTO `tb_detalles_pedidos` VALUES ('76086ec0-d693-11ee-b663-9c6b000a554a','becbbad1-d68b-11ee-b663-9c6b000a554a','b90eb68d-d68d-11ee-b663-9c6b000a554a',3,15.99,47.97),('7608f107-d693-11ee-b663-9c6b000a554a','becc9770-d68b-11ee-b663-9c6b000a554a','b90f424b-d68d-11ee-b663-9c6b000a554a',2,10.49,20.98),('76098f65-d693-11ee-b663-9c6b000a554a','beccee17-d68b-11ee-b663-9c6b000a554a','b90fdd8f-d68d-11ee-b663-9c6b000a554a',5,8.75,43.75),('7609e227-d693-11ee-b663-9c6b000a554a','becd8210-d68b-11ee-b663-9c6b000a554a','b9104822-d68d-11ee-b663-9c6b000a554a',1,39.99,39.99),('760a3681-d693-11ee-b663-9c6b000a554a','becdd792-d68b-11ee-b663-9c6b000a554a','b9109c19-d68d-11ee-b663-9c6b000a554a',4,22.50,90.00),('760a8726-d693-11ee-b663-9c6b000a554a','bece2f11-d68b-11ee-b663-9c6b000a554a','b910ef7f-d68d-11ee-b663-9c6b000a554a',2,17.99,35.98),('760ad88e-d693-11ee-b663-9c6b000a554a','bece754f-d68b-11ee-b663-9c6b000a554a','b9114395-d68d-11ee-b663-9c6b000a554a',3,12.99,38.97),('760b293f-d693-11ee-b663-9c6b000a554a','becec491-d68b-11ee-b663-9c6b000a554a','b9118c20-d68d-11ee-b663-9c6b000a554a',2,29.99,59.98),('760b764e-d693-11ee-b663-9c6b000a554a','becf55d0-d68b-11ee-b663-9c6b000a554a','b911d13c-d68d-11ee-b663-9c6b000a554a',1,54.99,54.99),('760bbcb4-d693-11ee-b663-9c6b000a554a','becfa644-d68b-11ee-b663-9c6b000a554a','b912152b-d68d-11ee-b663-9c6b000a554a',3,7.99,23.97),('760c0d27-d693-11ee-b663-9c6b000a554a','becffe30-d68b-11ee-b663-9c6b000a554a','b912c7e0-d68d-11ee-b663-9c6b000a554a',2,14.99,29.98),('760c6163-d693-11ee-b663-9c6b000a554a','bed06be8-d68b-11ee-b663-9c6b000a554a','b9131514-d68d-11ee-b663-9c6b000a554a',4,19.99,79.96),('760cff7e-d693-11ee-b663-9c6b000a554a','bed0bcb6-d68b-11ee-b663-9c6b000a554a','b91368b3-d68d-11ee-b663-9c6b000a554a',1,27.50,27.50),('760d56ef-d693-11ee-b663-9c6b000a554a','bed10377-d68b-11ee-b663-9c6b000a554a','b913bf51-d68d-11ee-b663-9c6b000a554a',3,33.99,101.97),('760da7b4-d693-11ee-b663-9c6b000a554a','bed155c2-d68b-11ee-b663-9c6b000a554a','b91416cb-d68d-11ee-b663-9c6b000a554a',2,42.75,85.50);
/*!40000 ALTER TABLE `tb_detalles_pedidos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER descuento_existencias AFTER INSERT ON tb_detalles_pedidos
FOR EACH ROW
BEGIN
    UPDATE tb_productos
    SET existencia_producto = existencia_producto - NEW.cantidad_detalle_pedido
    WHERE producto_id = NEW.producto_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_empleados`
--

DROP TABLE IF EXISTS `tb_empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_empleados` (
  `empleado_id` varchar(50) NOT NULL DEFAULT uuid(),
  `nombre_empleado` varchar(50) NOT NULL,
  `apellido_empleado` varchar(50) NOT NULL,
  `cargo_empleado` varchar(50) NOT NULL,
  `fecha_contratacion` date DEFAULT current_timestamp(),
  `salario_empleado` decimal(10,2) DEFAULT NULL CHECK (`salario_empleado` >= 0),
  PRIMARY KEY (`empleado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_empleados`
--

LOCK TABLES `tb_empleados` WRITE;
/*!40000 ALTER TABLE `tb_empleados` DISABLE KEYS */;
INSERT INTO `tb_empleados` VALUES ('6538542c-d686-11ee-b663-9c6b000a554a','Juan','Perez','Gerente','2024-02-28',5000.00),('653955d1-d686-11ee-b663-9c6b000a554a','María','García','Asistente','2024-02-28',3000.00),('6539b73e-d686-11ee-b663-9c6b000a554a','Carlos','López','Analista','2024-02-28',3500.00),('653a221c-d686-11ee-b663-9c6b000a554a','Ana','Martínez','Desarrollador','2024-02-28',4000.00),('653a6909-d686-11ee-b663-9c6b000a554a','Pedro','Rodríguez','Diseñador','2024-02-28',3200.00),('653abecb-d686-11ee-b663-9c6b000a554a','Laura','Sánchez','Gerente','2024-02-28',5500.00),('653b14a0-d686-11ee-b663-9c6b000a554a','Diego','Gómez','Analista','2024-02-28',3800.00),('653b98da-d686-11ee-b663-9c6b000a554a','Sofía','Hernández','Desarrollador','2024-02-28',4200.00),('653bdf42-d686-11ee-b663-9c6b000a554a','Miguel','Ruiz','Diseñador','2024-02-28',3300.00),('653c2a90-d686-11ee-b663-9c6b000a554a','Elena','Díaz','Asistente','2024-02-28',3200.00),('653c6eff-d686-11ee-b663-9c6b000a554a','Alejandro','Torres','Gerente','2024-02-28',6000.00),('653cb31b-d686-11ee-b663-9c6b000a554a','Lucía','Fernández','Analista','2024-02-28',3700.00),('653cf7ff-d686-11ee-b663-9c6b000a554a','Gabriel','Jiménez','Desarrollador','2024-02-28',4300.00),('653d3cfd-d686-11ee-b663-9c6b000a554a','Marcela','Vargas','Diseñador','2024-02-28',3400.00),('653dc78f-d686-11ee-b663-9c6b000a554a','Javier','González','Asistente','2024-02-28',3100.00);
/*!40000 ALTER TABLE `tb_empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pedidos`
--

DROP TABLE IF EXISTS `tb_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_pedidos` (
  `pedido_id` varchar(50) NOT NULL DEFAULT uuid(),
  `cliente_id` varchar(50) DEFAULT NULL,
  `fecha_pedido` date NOT NULL DEFAULT current_timestamp(),
  `total_pedido` decimal(10,2) DEFAULT NULL CHECK (`total_pedido` >= 0),
  `estado_pedido` varchar(20) NOT NULL DEFAULT 'Activo',
  `empleado_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pedido_id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `empleado_id` (`empleado_id`),
  CONSTRAINT `tb_pedidos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `tb_clientes` (`cliente_id`),
  CONSTRAINT `tb_pedidos_ibfk_2` FOREIGN KEY (`empleado_id`) REFERENCES `tb_empleados` (`empleado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pedidos`
--

LOCK TABLES `tb_pedidos` WRITE;
/*!40000 ALTER TABLE `tb_pedidos` DISABLE KEYS */;
INSERT INTO `tb_pedidos` VALUES ('becbbad1-d68b-11ee-b663-9c6b000a554a','5c7bc049-d683-11ee-b663-9c6b000a554a','2024-02-28',150.50,'Pendiente','6538542c-d686-11ee-b663-9c6b000a554a'),('becc9770-d68b-11ee-b663-9c6b000a554a','5c7cdc02-d683-11ee-b663-9c6b000a554a','2024-02-28',220.75,'En proceso','653955d1-d686-11ee-b663-9c6b000a554a'),('beccee17-d68b-11ee-b663-9c6b000a554a','5c7d2f8e-d683-11ee-b663-9c6b000a554a','2024-02-28',75.20,'Completado','6539b73e-d686-11ee-b663-9c6b000a554a'),('becd8210-d68b-11ee-b663-9c6b000a554a','5c7d86e1-d683-11ee-b663-9c6b000a554a','2024-02-28',300.00,'Pendiente','653a221c-d686-11ee-b663-9c6b000a554a'),('becdd792-d68b-11ee-b663-9c6b000a554a','5c7ddc7a-d683-11ee-b663-9c6b000a554a','2024-02-28',180.90,'En proceso','653a6909-d686-11ee-b663-9c6b000a554a'),('bece2f11-d68b-11ee-b663-9c6b000a554a','5c7e2d4f-d683-11ee-b663-9c6b000a554a','2024-02-28',95.60,'Pendiente','653abecb-d686-11ee-b663-9c6b000a554a'),('bece754f-d68b-11ee-b663-9c6b000a554a','5c7ed81c-d683-11ee-b663-9c6b000a554a','2024-02-28',500.25,'Completado','653b14a0-d686-11ee-b663-9c6b000a554a'),('becec491-d68b-11ee-b663-9c6b000a554a','5c7f4bc7-d683-11ee-b663-9c6b000a554a','2024-02-28',250.80,'En proceso','653b98da-d686-11ee-b663-9c6b000a554a'),('becf55d0-d68b-11ee-b663-9c6b000a554a','5c7fc2db-d683-11ee-b663-9c6b000a554a','2024-02-28',175.30,'Pendiente','653bdf42-d686-11ee-b663-9c6b000a554a'),('becfa644-d68b-11ee-b663-9c6b000a554a','5c805eb8-d683-11ee-b663-9c6b000a554a','2024-02-28',400.60,'Completado','653c2a90-d686-11ee-b663-9c6b000a554a'),('becffe30-d68b-11ee-b663-9c6b000a554a','5c80b04e-d683-11ee-b663-9c6b000a554a','2024-02-28',120.40,'Pendiente','653c6eff-d686-11ee-b663-9c6b000a554a'),('bed06be8-d68b-11ee-b663-9c6b000a554a','5c810429-d683-11ee-b663-9c6b000a554a','2024-02-28',350.20,'En proceso','653cb31b-d686-11ee-b663-9c6b000a554a'),('bed0bcb6-d68b-11ee-b663-9c6b000a554a','5c816dbc-d683-11ee-b663-9c6b000a554a','2024-02-28',200.75,'Pendiente','653cf7ff-d686-11ee-b663-9c6b000a554a'),('bed10377-d68b-11ee-b663-9c6b000a554a','5c81d72f-d683-11ee-b663-9c6b000a554a','2024-02-28',280.90,'Completado','653d3cfd-d686-11ee-b663-9c6b000a554a'),('bed155c2-d68b-11ee-b663-9c6b000a554a','895bcf51-d682-11ee-b663-9c6b000a554a','2024-02-28',180.25,'En proceso','653dc78f-d686-11ee-b663-9c6b000a554a');
/*!40000 ALTER TABLE `tb_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_productos`
--

DROP TABLE IF EXISTS `tb_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_productos` (
  `producto_id` varchar(50) NOT NULL DEFAULT uuid(),
  `nombre_producto` varchar(100) NOT NULL,
  `descripcion_producto` varchar(225) NOT NULL,
  `precio_producto` decimal(10,2) NOT NULL CHECK (`precio_producto` >= 0),
  `existencia_producto` int(11) NOT NULL CHECK (`existencia_producto` >= 0),
  PRIMARY KEY (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_productos`
--

LOCK TABLES `tb_productos` WRITE;
/*!40000 ALTER TABLE `tb_productos` DISABLE KEYS */;
INSERT INTO `tb_productos` VALUES ('b90eb68d-d68d-11ee-b663-9c6b000a554a','Camisa','Camisa de algodón de manga larga',29.99,97),('b90f424b-d68d-11ee-b663-9c6b000a554a','Pantalón','Pantalón vaquero para hombre',39.99,78),('b90fdd8f-d68d-11ee-b663-9c6b000a554a','Zapatos','Zapatos de vestir para mujer',49.99,115),('b9104822-d68d-11ee-b663-9c6b000a554a','Gorra','Gorra ajustable con logo bordado',9.99,199),('b9109c19-d68d-11ee-b663-9c6b000a554a','Chaqueta','Chaqueta impermeable para exterior',59.99,46),('b910ef7f-d68d-11ee-b663-9c6b000a554a','Vestido','Vestido elegante para ocasiones especiales',79.99,68),('b9114395-d68d-11ee-b663-9c6b000a554a','Sudadera','Sudadera con capucha y bolsillo canguro',34.99,87),('b9118c20-d68d-11ee-b663-9c6b000a554a','Falda','Falda plisada de estilo vintage',24.99,108),('b911d13c-d68d-11ee-b663-9c6b000a554a','Bufanda','Bufanda de lana suave y cálida',14.99,149),('b912152b-d68d-11ee-b663-9c6b000a554a','Botines','Botines de cuero con tacón bajo',54.99,57),('b912c7e0-d68d-11ee-b663-9c6b000a554a','Pantalones cortos','Pantalones cortos de verano para hombre',19.99,178),('b9131514-d68d-11ee-b663-9c6b000a554a','Bolsa','Bolsa de tela resistente con asas',7.99,246),('b91368b3-d68d-11ee-b663-9c6b000a554a','Camiseta','Camiseta básica de algodón para mujer',12.99,159),('b913bf51-d68d-11ee-b663-9c6b000a554a','Chaqueta deportiva','Chaqueta deportiva ligera con cremallera',29.99,97),('b91416cb-d68d-11ee-b663-9c6b000a554a','Sombrero','Sombrero de paja para protección solar',17.99,138);
/*!40000 ALTER TABLE `tb_productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-28 18:20:06
