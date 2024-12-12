-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 12-12-2024 a las 22:51:00
-- Versión del servidor: 8.3.0
-- Versión de PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cafeteria`
--
CREATE DATABASE cafeteria;

USE cafeteria;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `imagen` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `imagen`, `estado`) VALUES
(1, 'TECNOLOGIA', 'assets/images/categorias/20220805093011.jpg', 0),
(2, 'DISEÑO WEB', 'assets/images/categorias/20220805093028.jpg', 0),
(3, 'FASHION', 'NO', 0),
(4, 'PRUEBA', '', 0),
(5, 'Bebidas', '', 1),
(6, 'Comida Rapida', '', 1),
(7, 'Platillos Fuertes', '', 1),
(8, 'Postres', '', 1),
(9, 'Snacks', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `correo` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `clave` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `perfil` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default.png',
  `token` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `verify` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `correo`, `clave`, `perfil`, `token`, `verify`) VALUES
(1, 'Carlos', 'espanaa42@gmail.com', '$2y$10$oPQJVM2flJd9yIiBked2du6ojImIhniCJVd31O1J/Io0omwczlhFm', 'default.png', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

DROP TABLE IF EXISTS `detalle_pedidos`;
CREATE TABLE IF NOT EXISTS `detalle_pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int NOT NULL,
  `id_pedido` int NOT NULL,
  `id_producto` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_transaccion` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `estado` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `fecha` datetime NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `apellido` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `ciudad` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `id_cliente` int NOT NULL,
  `proceso` enum('1','2','3') COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1',
  `tiempo_recoleccion` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int NOT NULL,
  `imagen` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  `id_categoria` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `cantidad`, `imagen`, `estado`, `id_categoria`) VALUES
(1, 'PARLANTE HILON', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consectetur aperiam accusamus incidunt cum laudantium laborum ipsum magni sequi expedita ad, rem esse rerum ea saepe provident! Temporibus corporis atque earum?\r\n', 10.00, 10, 'assets/images/productos/20220805093212.jpg', 0, 1),
(2, 'CAMARA WEB', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consectetur aperiam accusamus incidunt cum laudantium laborum ipsum magni sequi expedita ad, rem esse rerum ea saepe provident! Temporibus corporis atque earum?', 20.00, 15, 'assets/images/productos/20220805093304.jpg', 0, 1),
(3, 'TELEVISOR LG', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consectetur aperiam accusamus incidunt cum laudantium laborum ipsum magni sequi expedita ad, rem esse rerum ea saepe provident! Temporibus corporis atque earum?', 10.00, 40, 'assets/images/productos/20220805093355.jpg', 0, 1),
(4, 'MICROFONO', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consectetur aperiam accusamus incidunt cum laudantium laborum ipsum magni sequi expedita ad, rem esse rerum ea saepe provident! Temporibus corporis atque earum?', 8.00, 5, 'assets/images/productos/20220805093426.jpg', 0, 1),
(5, 'LAPTOP LENOVO', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consectetur aperiam accusamus incidunt cum laudantium laborum ipsum magni sequi expedita ad, rem esse rerum ea saepe provident! Temporibus corporis atque earum?', 30.00, 12, 'assets/images/productos/20220805093535.jpg', 0, 1),
(6, 'NUEVO PRODUCTO', '<p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Incidunt, facere.</p><ol><li>Lorem ipsum, dolor sit amet <strong>consectetur</strong> adipisicing elit. Incidunt, facere.</li><li><a href=\"https://angelsifuentes.com/pos\">https://angelsifuentes.com/pos</a></li></ol>', 5.00, 16, 'assets/images/productos/20220806090232.jpg', 0, 2),
(7, 'FASHION1', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consectetur aperiam accusamus incidunt cum laudantium laborum ipsum magni sequi expedita ad, rem esse rerum ea saepe provident! Temporibus corporis atque earum?', 8.00, 5, 'assets/images/productos/fashion1.png', 0, 3),
(8, 'FASHION 2', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consectetur aperiam accusamus incidunt cum laudantium laborum ipsum magni sequi expedita ad, rem esse rerum ea saepe provident! Temporibus corporis atque earum?', 3.00, 12, 'assets/images/productos/fashion2.png', 0, 3),
(10, 'vamos', 'si se puede', 12.00, 12, 'assets/images/productos/20230710235600.jpg', 0, 4),
(11, 'Cafe', '', 10.00, 40, 'assets/images/productos/20241206122608.jpg', 1, 5),
(12, 'Boing 500ml', '', 12.00, 23, 'assets/images/productos/20241206122139.jpg', 1, 5),
(13, 'Coca Cola 600ml', '', 15.00, 23, 'assets/images/productos/20241206122841.jpg', 1, 5),
(14, 'Te', '', 10.00, 50, 'assets/images/productos/20241206122904.jpg', 1, 5),
(15, 'Jugo del Valle', '', 14.00, 30, 'assets/images/productos/20241206123049.jpg', 1, 5),
(16, 'Tortas', '', 15.00, 22, 'assets/images/productos/20241206124549.jpg', 1, 6),
(17, 'Gelatinas', '', 12.00, 20, 'assets/images/productos/20241206123411.jpg', 1, 8),
(18, 'Donas', '', 10.00, 23, 'assets/images/productos/20241206123600.jpg', 1, 8),
(19, 'Flan', '', 15.00, 12, 'assets/images/productos/20241206123617.jpg', 1, 8),
(20, 'Galletas', '', 17.00, 23, 'assets/images/productos/20241206123810.jpg', 1, 9),
(21, 'Sabritas', '', 17.00, 12, 'assets/images/productos/20241206123852.jpg', 1, 9),
(22, 'Tacos', '', 15.00, 14, 'assets/images/productos/20241206124627.jpg', 1, 6),
(23, 'Chilaquiles Verdes', '', 35.00, 20, 'assets/images/productos/20241206124716.jpg', 1, 7),
(24, 'Chilaquiles Rojos', '', 35.00, 15, 'assets/images/productos/20241206124742.jpg', 1, 7),
(25, 'Pozole', '', 35.00, 30, 'assets/images/productos/20241206124916.jpg', 1, 7),
(26, 'Salsa de Chicharron', '', 35.00, 25, 'assets/images/productos/20241206124937.jpg', 1, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `clave` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `perfil` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `correo`, `clave`, `perfil`, `estado`) VALUES
(1, 'Flavio', 'Merecias', 'mere@gmail.com', '$2y$10$XtV68JJ/fABHwWMARZotF.9BHbkwBpquycry2HYOlS.QaUGt/mls2', NULL, 1),
(2, 'hola', 'como', 'esta@gmail.com', '$2y$10$ZX9BeymxshOoe/I3pGoIp.6Ai5mrVxN1rdS4nrAQILsOjE9DPwdXW', NULL, 0);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `detalle_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
