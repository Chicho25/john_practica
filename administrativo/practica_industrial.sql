-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-12-2019 a las 03:00:33
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `practica_industrial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_negocios`
--

CREATE TABLE `area_negocios` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `stat` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `area_negocios`
--

INSERT INTO `area_negocios` (`id`, `descripcion`, `stat`) VALUES
(2, 'Transporte', 1),
(3, 'Telecomunicaciones', 1),
(4, 'Finanzas', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `stat` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carreras`
--

INSERT INTO `carreras` (`id`, `descripcion`, `stat`) VALUES
(1, 'Ing. en sistema g', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto_empresa`
--

CREATE TABLE `contacto_empresa` (
  `id` int(11) NOT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  `nombre_contacto` varchar(30) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `stat` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `id` int(11) NOT NULL,
  `ruta_doc` varchar(250) NOT NULL,
  `stat` int(1) NOT NULL,
  `feha` datetime NOT NULL DEFAULT current_timestamp(),
  `id_user` int(11) NOT NULL,
  `descripcion` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `documentos`
--

INSERT INTO `documentos` (`id`, `ruta_doc`, `stat`, `feha`, `id_user`, `descripcion`) VALUES
(2, 'documentos/consultorio.sql.sql', 1, '2019-12-09 18:28:12', 1, 'nomb1212121'),
(3, 'documentos/mozilla12-pdf.pdf', 1, '2019-12-09 18:33:41', 1, 'archivo pdf'),
(4, 'documentos/4.pdf', 1, '2019-12-09 18:33:54', 1, 'qwqw');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `espresas`
--

CREATE TABLE `espresas` (
  `id` int(11) NOT NULL,
  `nombre_empresa` varchar(200) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `area_negocios` int(3) DEFAULT NULL,
  `stat` int(1) DEFAULT NULL,
  `telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `espresas`
--

INSERT INTO `espresas` (`id`, `nombre_empresa`, `email`, `descripcion`, `area_negocios`, `stat`, `telefono`) VALUES
(1, 'algo22', 'alfo22', 'alfo22', 2, 1, 'alfo'),
(2, 'algo22', 'alfo22', 'alfo22', 2, 1, 'alfo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `carrera` int(1) DEFAULT NULL,
  `anio` int(1) DEFAULT NULL,
  `nivel_practica_industrial` int(1) DEFAULT NULL,
  `cedula` varchar(20) DEFAULT NULL,
  `img_cedula` varchar(250) DEFAULT NULL,
  `stat` int(1) DEFAULT NULL,
  `date_time` datetime DEFAULT current_timestamp(),
  `email_usma` varchar(30) DEFAULT NULL,
  `email_personal` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id`, `nombre`, `apellido`, `carrera`, `anio`, `nivel_practica_industrial`, `cedula`, `img_cedula`, `stat`, `date_time`, `email_usma`, `email_personal`) VALUES
(2, 'jonh', 'badvkajdvbbdj', 1, 1, 2, '123', 'cedulas/123.jpg', 1, '2016-12-07 17:38:50', 'luis@hormail.com', 'pedroarrieta25@gmail.com'),
(3, 'luis', 'PEREZ', 1, 2, 1, '123454', 'cedulas/123454.jpg', 1, '2017-12-14 18:54:16', 'luis@hormail.com', 'mugachicho25@hotmail.com'),
(4, 'jonh', '9999', 1, 2, 2, '123454', 'cedulas/123454.jpg', 1, '2018-12-14 18:54:57', 'luis@hormail.com', 'prueba@hotmail.com'),
(5, '76D61HZg7G', '76D61HZg7G', 1, 1, 3, '76D61HZg7G', '76D61HZg7G', 1, '2019-12-14 19:07:10', '76D61HZg7G', '76D61HZg7G'),
(6, 'S2qPT63ObO', 'S2qPT63ObO', 1, 2, 4, 'S2qPT63ObO', 'S2qPT63ObO', 1, '2016-12-14 19:07:10', 'S2qPT63ObO', 'S2qPT63ObO'),
(7, 'wxSjLzmirn', 'wxSjLzmirn', 1, 3, 1, 'wxSjLzmirn', 'wxSjLzmirn', 1, '2017-12-14 19:07:10', 'wxSjLzmirn', 'wxSjLzmirn'),
(8, '7rZLo2ttoc', '7rZLo2ttoc', 1, 4, 2, '7rZLo2ttoc', '7rZLo2ttoc', 1, '2018-12-14 19:07:10', '7rZLo2ttoc', '7rZLo2ttoc'),
(9, '8IzIvtULgy', '8IzIvtULgy', 1, 5, 2, '8IzIvtULgy', '8IzIvtULgy', 1, '2019-12-14 19:07:10', '8IzIvtULgy', '8IzIvtULgy'),
(10, 'goXFujhV0p', 'goXFujhV0p', 0, 5, 3, 'goXFujhV0p', 'goXFujhV0p', 1, '2016-12-14 19:07:10', 'goXFujhV0p', 'goXFujhV0p'),
(11, 'hy8XrkQSvp', 'hy8XrkQSvp', 0, 5, 1, 'hy8XrkQSvp', 'hy8XrkQSvp', 1, '2016-12-14 19:07:10', 'hy8XrkQSvp', 'hy8XrkQSvp'),
(12, 'tiolNwaFn5', 'tiolNwaFn5', 0, 5, 4, 'tiolNwaFn5', 'tiolNwaFn5', 1, '2016-12-14 19:07:10', 'tiolNwaFn5', 'tiolNwaFn5'),
(13, 'EdFN9qyUej', 'EdFN9qyUej', 0, 4, 3, 'EdFN9qyUej', 'EdFN9qyUej', 1, '2017-12-14 19:07:10', 'EdFN9qyUej', 'EdFN9qyUej'),
(14, 'lYGOOhxaCq', 'lYGOOhxaCq', 0, 4, 4, 'lYGOOhxaCq', 'lYGOOhxaCq', 1, '2018-12-14 19:07:10', 'lYGOOhxaCq', 'lYGOOhxaCq'),
(15, 'vGjOd5AqOV', 'vGjOd5AqOV', 0, 3, 2, 'vGjOd5AqOV', 'vGjOd5AqOV', 1, '2016-12-14 19:07:10', 'vGjOd5AqOV', 'vGjOd5AqOV'),
(16, 'cnjV26KDfr', 'cnjV26KDfr', 0, 2, 1, 'cnjV26KDfr', 'cnjV26KDfr', 1, '2016-12-14 19:07:10', 'cnjV26KDfr', 'cnjV26KDfr'),
(17, 'HFJliqApOF', 'HFJliqApOF', 0, 1, 1, 'HFJliqApOF', 'HFJliqApOF', 1, '2017-12-14 19:07:10', 'HFJliqApOF', 'HFJliqApOF'),
(18, 'Hd93sgVw1Y', 'Hd93sgVw1Y', 0, 1, 1, 'Hd93sgVw1Y', 'Hd93sgVw1Y', 1, '2017-12-14 19:07:10', 'Hd93sgVw1Y', 'Hd93sgVw1Y'),
(19, 'YPB9uJFal9', 'YPB9uJFal9', 0, 1, 1, 'YPB9uJFal9', 'YPB9uJFal9', 1, '2017-12-14 19:07:10', 'YPB9uJFal9', 'YPB9uJFal9'),
(20, 'EZ6MUBDesV', 'EZ6MUBDesV', 0, 2, 1, 'EZ6MUBDesV', 'EZ6MUBDesV', 1, '2018-12-14 19:07:10', 'EZ6MUBDesV', 'EZ6MUBDesV'),
(21, 'hQ1lBw81bc', 'hQ1lBw81bc', 0, 2, 2, 'hQ1lBw81bc', 'hQ1lBw81bc', 1, '2018-12-14 19:07:10', 'hQ1lBw81bc', 'hQ1lBw81bc'),
(22, 'ovo5Aj12Jb', 'ovo5Aj12Jb', 0, 1, 3, 'ovo5Aj12Jb', 'ovo5Aj12Jb', 1, '2018-12-14 19:07:10', 'ovo5Aj12Jb', 'ovo5Aj12Jb'),
(23, 'FRVAqcwaGJ', 'FRVAqcwaGJ', 0, 1, 4, 'FRVAqcwaGJ', 'FRVAqcwaGJ', 1, '2016-12-14 19:07:10', 'FRVAqcwaGJ', 'FRVAqcwaGJ'),
(24, 'Dpv8Nv2sHC', 'Dpv8Nv2sHC', 0, 2, 2, 'Dpv8Nv2sHC', 'Dpv8Nv2sHC', 1, '2017-12-14 19:07:10', 'Dpv8Nv2sHC', 'Dpv8Nv2sHC'),
(25, '7yWvfYqiEY', '7yWvfYqiEY', 7, 3, 1, '7yWvfYqiEY', '7yWvfYqiEY', 1, '2017-12-14 19:07:10', '7yWvfYqiEY', '7yWvfYqiEY'),
(26, 'Qxva0TWrtD', 'Qxva0TWrtD', 0, 3, 2, 'Qxva0TWrtD', 'Qxva0TWrtD', 1, '2018-12-14 19:07:10', 'Qxva0TWrtD', 'Qxva0TWrtD'),
(27, 'Bx5Yjsd3kj', 'Bx5Yjsd3kj', 0, 3, 3, 'Bx5Yjsd3kj', 'Bx5Yjsd3kj', 1, '2019-12-14 19:07:10', 'Bx5Yjsd3kj', 'Bx5Yjsd3kj'),
(28, 'CStVAhTYvY', 'CStVAhTYvY', 0, 3, 4, 'CStVAhTYvY', 'CStVAhTYvY', 1, '2018-12-14 19:07:10', 'CStVAhTYvY', 'CStVAhTYvY'),
(29, 'JCUftgJG1m', 'JCUftgJG1m', 0, 3, 1, 'JCUftgJG1m', 'JCUftgJG1m', 1, '2019-12-14 19:07:10', 'JCUftgJG1m', 'JCUftgJG1m'),
(30, 'JCSmN016sQ', 'JCSmN016sQ', 0, 3, 2, 'JCSmN016sQ', 'JCSmN016sQ', 1, '2019-12-14 19:07:10', 'JCSmN016sQ', 'JCSmN016sQ'),
(31, 'qzc61uZSkh', 'qzc61uZSkh', 0, 5, 3, 'qzc61uZSkh', 'qzc61uZSkh', 1, '2017-12-14 19:07:10', 'qzc61uZSkh', 'qzc61uZSkh'),
(32, 'ZkBg16SCm8', 'ZkBg16SCm8', 0, 5, 4, 'ZkBg16SCm8', 'ZkBg16SCm8', 1, '2019-12-14 19:07:10', 'ZkBg16SCm8', 'ZkBg16SCm8'),
(33, 'DxSr6itxPt', 'DxSr6itxPt', 0, 5, 3, 'DxSr6itxPt', 'DxSr6itxPt', 1, '2019-12-14 19:07:10', 'DxSr6itxPt', 'DxSr6itxPt'),
(34, 'v4OxB9TxMC', 'v4OxB9TxMC', 0, 4, 1, 'v4OxB9TxMC', 'v4OxB9TxMC', 1, '2019-12-14 19:07:10', 'v4OxB9TxMC', 'v4OxB9TxMC'),
(35, 'q2aW1c0C8U', 'q2aW1c0C8U', 0, 4, 3, 'q2aW1c0C8U', 'q2aW1c0C8U', 1, '2016-12-14 19:07:10', 'q2aW1c0C8U', 'q2aW1c0C8U'),
(36, 'mjrctZCL6b', 'mjrctZCL6b', 0, 4, 1, 'mjrctZCL6b', 'mjrctZCL6b', 1, '2019-12-14 19:07:10', 'mjrctZCL6b', 'mjrctZCL6b'),
(37, 'FqwljhEtwa', 'FqwljhEtwa', 0, 2, 3, 'FqwljhEtwa', 'FqwljhEtwa', 1, '2019-12-14 19:07:10', 'FqwljhEtwa', 'FqwljhEtwa'),
(38, '5SlB51WcGK', '5SlB51WcGK', 5, 2, 2, '5SlB51WcGK', '5SlB51WcGK', 1, '2019-12-14 19:07:10', '5SlB51WcGK', '5SlB51WcGK'),
(39, '5BI2kCng5h', '5BI2kCng5h', 5, 2, 1, '5BI2kCng5h', '5BI2kCng5h', 1, '2019-12-14 19:07:10', '5BI2kCng5h', '5BI2kCng5h'),
(40, 'ymvX7aEpue', 'ymvX7aEpue', 0, 2, 3, 'ymvX7aEpue', 'ymvX7aEpue', 1, '2019-12-14 19:07:10', 'ymvX7aEpue', 'ymvX7aEpue'),
(41, 'kv1LHd9UW6', 'kv1LHd9UW6', 0, 1, 4, 'kv1LHd9UW6', 'kv1LHd9UW6', 1, '2019-12-14 19:07:10', 'kv1LHd9UW6', 'kv1LHd9UW6'),
(42, 'YuAtN4n77W', 'YuAtN4n77W', 0, 1, 1, 'YuAtN4n77W', 'YuAtN4n77W', 1, '2019-12-14 19:07:10', 'YuAtN4n77W', 'YuAtN4n77W'),
(43, 'Vin8NBzs6L', 'Vin8NBzs6L', 0, 1, 2, 'Vin8NBzs6L', 'Vin8NBzs6L', 1, '2019-12-14 19:07:10', 'Vin8NBzs6L', 'Vin8NBzs6L'),
(44, 'FL5rPh0egr', 'FL5rPh0egr', 0, 1, 2, 'FL5rPh0egr', 'FL5rPh0egr', 1, '2019-12-14 19:07:10', 'FL5rPh0egr', 'FL5rPh0egr'),
(45, 'IQLE6HOKYa', 'IQLE6HOKYa', 0, 1, 2, 'IQLE6HOKYa', 'IQLE6HOKYa', 1, '2019-12-14 19:07:10', 'IQLE6HOKYa', 'IQLE6HOKYa'),
(46, 'WT2J9I2NVs', 'WT2J9I2NVs', 0, 3, 1, 'WT2J9I2NVs', 'WT2J9I2NVs', 1, '2019-12-14 19:07:10', 'WT2J9I2NVs', 'WT2J9I2NVs'),
(47, 'AVnXwHau9F', 'AVnXwHau9F', 0, 3, 1, 'AVnXwHau9F', 'AVnXwHau9F', 1, '2019-12-14 19:07:10', 'AVnXwHau9F', 'AVnXwHau9F'),
(48, 'W8aLhxUw33', 'W8aLhxUw33', 0, 3, 1, 'W8aLhxUw33', 'W8aLhxUw33', 1, '2019-12-14 19:07:10', 'W8aLhxUw33', 'W8aLhxUw33'),
(49, 'LNi1kG1zwH', 'LNi1kG1zwH', 0, 3, 1, 'LNi1kG1zwH', 'LNi1kG1zwH', 1, '2019-12-14 19:07:10', 'LNi1kG1zwH', 'LNi1kG1zwH'),
(50, 'OFeNoTg082', 'OFeNoTg082', 0, 3, 1, 'OFeNoTg082', 'OFeNoTg082', 1, '2019-12-14 19:07:10', 'OFeNoTg082', 'OFeNoTg082'),
(51, '2ino6MTItZ', '2ino6MTItZ', 2, 0, NULL, '2ino6MTItZ', '2ino6MTItZ', 1, '2019-12-14 19:07:10', '2ino6MTItZ', '2ino6MTItZ'),
(52, 'Dhf4rkyIyE', 'Dhf4rkyIyE', 0, NULL, NULL, 'Dhf4rkyIyE', 'Dhf4rkyIyE', 1, '2019-12-14 19:07:10', 'Dhf4rkyIyE', 'Dhf4rkyIyE'),
(53, 'MVhmpX27k6', 'MVhmpX27k6', 0, NULL, NULL, 'MVhmpX27k6', 'MVhmpX27k6', 1, '2019-12-14 19:07:10', 'MVhmpX27k6', 'MVhmpX27k6'),
(54, 'IHdMhCMXZ3', 'IHdMhCMXZ3', 0, NULL, NULL, 'IHdMhCMXZ3', 'IHdMhCMXZ3', 1, '2019-12-14 19:07:10', 'IHdMhCMXZ3', 'IHdMhCMXZ3'),
(55, 'P1f9ePvdCb', 'P1f9ePvdCb', 0, NULL, NULL, 'P1f9ePvdCb', 'P1f9ePvdCb', 1, '2019-12-14 19:07:10', 'P1f9ePvdCb', 'P1f9ePvdCb'),
(56, 'Cqwu6elbM6', 'Cqwu6elbM6', 0, NULL, NULL, 'Cqwu6elbM6', 'Cqwu6elbM6', 1, '2019-12-14 19:07:10', 'Cqwu6elbM6', 'Cqwu6elbM6'),
(57, 'bwA2uixl2O', 'bwA2uixl2O', 0, NULL, NULL, 'bwA2uixl2O', 'bwA2uixl2O', 1, '2019-12-14 19:07:10', 'bwA2uixl2O', 'bwA2uixl2O'),
(58, 'NjqML0BnlQ', 'NjqML0BnlQ', 0, NULL, NULL, 'NjqML0BnlQ', 'NjqML0BnlQ', 1, '2019-12-14 19:07:10', 'NjqML0BnlQ', 'NjqML0BnlQ'),
(59, 'hobqACsDoa', 'hobqACsDoa', 0, NULL, NULL, 'hobqACsDoa', 'hobqACsDoa', 1, '2019-12-14 19:07:10', 'hobqACsDoa', 'hobqACsDoa'),
(60, 'UrZUdMQAq3', 'UrZUdMQAq3', 0, NULL, NULL, 'UrZUdMQAq3', 'UrZUdMQAq3', 1, '2019-12-14 19:07:10', 'UrZUdMQAq3', 'UrZUdMQAq3'),
(61, '2BL7zXMUDv', '2BL7zXMUDv', 2, NULL, NULL, '2BL7zXMUDv', '2BL7zXMUDv', 1, '2019-12-14 19:07:10', '2BL7zXMUDv', '2BL7zXMUDv'),
(62, 'rRL6BLe1dx', 'rRL6BLe1dx', 0, NULL, NULL, 'rRL6BLe1dx', 'rRL6BLe1dx', 1, '2019-12-14 19:07:10', 'rRL6BLe1dx', 'rRL6BLe1dx'),
(63, 'QIqPVaBOuh', 'QIqPVaBOuh', 0, NULL, NULL, 'QIqPVaBOuh', 'QIqPVaBOuh', 1, '2019-12-14 19:07:10', 'QIqPVaBOuh', 'QIqPVaBOuh'),
(64, 'M9wUQtJFCg', 'M9wUQtJFCg', 0, NULL, NULL, 'M9wUQtJFCg', 'M9wUQtJFCg', 1, '2019-12-14 19:07:10', 'M9wUQtJFCg', 'M9wUQtJFCg'),
(65, 'ZXSgeG3cAe', 'ZXSgeG3cAe', 0, NULL, NULL, 'ZXSgeG3cAe', 'ZXSgeG3cAe', 1, '2019-12-14 19:07:10', 'ZXSgeG3cAe', 'ZXSgeG3cAe'),
(66, 'h5Ysg9Uelp', 'h5Ysg9Uelp', 0, NULL, NULL, 'h5Ysg9Uelp', 'h5Ysg9Uelp', 1, '2019-12-14 19:07:10', 'h5Ysg9Uelp', 'h5Ysg9Uelp'),
(67, 'VaoAZTCTxK', 'VaoAZTCTxK', 0, NULL, NULL, 'VaoAZTCTxK', 'VaoAZTCTxK', 1, '2019-12-14 19:07:10', 'VaoAZTCTxK', 'VaoAZTCTxK'),
(68, 'btya2ZKdii', 'btya2ZKdii', 0, NULL, NULL, 'btya2ZKdii', 'btya2ZKdii', 1, '2019-12-14 19:07:10', 'btya2ZKdii', 'btya2ZKdii'),
(69, 'eBiXToz3lH', 'eBiXToz3lH', 0, NULL, NULL, 'eBiXToz3lH', 'eBiXToz3lH', 1, '2019-12-14 19:07:10', 'eBiXToz3lH', 'eBiXToz3lH'),
(70, 'scZdc2Y6zF', 'scZdc2Y6zF', 0, NULL, NULL, 'scZdc2Y6zF', 'scZdc2Y6zF', 1, '2019-12-14 19:07:10', 'scZdc2Y6zF', 'scZdc2Y6zF'),
(71, 'zChUvj6e3V', 'zChUvj6e3V', 0, NULL, NULL, 'zChUvj6e3V', 'zChUvj6e3V', 1, '2019-12-14 19:07:10', 'zChUvj6e3V', 'zChUvj6e3V'),
(72, '6BXNJyV8H5', '6BXNJyV8H5', 6, NULL, NULL, '6BXNJyV8H5', '6BXNJyV8H5', 1, '2019-12-14 19:07:10', '6BXNJyV8H5', '6BXNJyV8H5'),
(73, '0HOXTYL1yP', '0HOXTYL1yP', 0, NULL, NULL, '0HOXTYL1yP', '0HOXTYL1yP', 1, '2019-12-14 19:07:10', '0HOXTYL1yP', '0HOXTYL1yP'),
(74, 'BMmtMgqUg2', 'BMmtMgqUg2', 0, NULL, NULL, 'BMmtMgqUg2', 'BMmtMgqUg2', 1, '2019-12-14 19:07:10', 'BMmtMgqUg2', 'BMmtMgqUg2'),
(75, 'sIFV5l3MZB', 'sIFV5l3MZB', 0, NULL, NULL, 'sIFV5l3MZB', 'sIFV5l3MZB', 1, '2019-12-14 19:07:10', 'sIFV5l3MZB', 'sIFV5l3MZB'),
(76, 'Cfv2IKbTIE', 'Cfv2IKbTIE', 0, NULL, NULL, 'Cfv2IKbTIE', 'Cfv2IKbTIE', 1, '2019-12-14 19:07:10', 'Cfv2IKbTIE', 'Cfv2IKbTIE'),
(77, 'Vdv30XoJhF', 'Vdv30XoJhF', 0, NULL, NULL, 'Vdv30XoJhF', 'Vdv30XoJhF', 1, '2019-12-14 19:07:10', 'Vdv30XoJhF', 'Vdv30XoJhF'),
(78, '6pDdms3Saa', '6pDdms3Saa', 6, NULL, NULL, '6pDdms3Saa', '6pDdms3Saa', 1, '2019-12-14 19:07:10', '6pDdms3Saa', '6pDdms3Saa'),
(79, '23q3msAbxr', '23q3msAbxr', 23, NULL, NULL, '23q3msAbxr', '23q3msAbxr', 1, '2019-12-14 19:07:10', '23q3msAbxr', '23q3msAbxr'),
(80, 'Ak7Umol09I', 'Ak7Umol09I', 0, NULL, NULL, 'Ak7Umol09I', 'Ak7Umol09I', 1, '2019-12-14 19:07:10', 'Ak7Umol09I', 'Ak7Umol09I'),
(81, 'VTOWnGpwKu', 'VTOWnGpwKu', 0, NULL, NULL, 'VTOWnGpwKu', 'VTOWnGpwKu', 1, '2019-12-14 19:07:10', 'VTOWnGpwKu', 'VTOWnGpwKu'),
(82, 'lCN6T0U8pL', 'lCN6T0U8pL', 0, NULL, NULL, 'lCN6T0U8pL', 'lCN6T0U8pL', 1, '2019-12-14 19:07:10', 'lCN6T0U8pL', 'lCN6T0U8pL'),
(83, 'GfEEr6MSWk', 'GfEEr6MSWk', 0, NULL, NULL, 'GfEEr6MSWk', 'GfEEr6MSWk', 1, '2019-12-14 19:07:10', 'GfEEr6MSWk', 'GfEEr6MSWk'),
(84, 'WKuyVQtouW', 'WKuyVQtouW', 0, NULL, NULL, 'WKuyVQtouW', 'WKuyVQtouW', 1, '2019-12-14 19:07:10', 'WKuyVQtouW', 'WKuyVQtouW'),
(85, 'oTFt0ixdRb', 'oTFt0ixdRb', 0, NULL, NULL, 'oTFt0ixdRb', 'oTFt0ixdRb', 1, '2019-12-14 19:07:10', 'oTFt0ixdRb', 'oTFt0ixdRb'),
(86, 'XiIWpIinoH', 'XiIWpIinoH', 0, NULL, NULL, 'XiIWpIinoH', 'XiIWpIinoH', 1, '2019-12-14 19:07:10', 'XiIWpIinoH', 'XiIWpIinoH'),
(87, 'H2VnmPPJSn', 'H2VnmPPJSn', 0, NULL, NULL, 'H2VnmPPJSn', 'H2VnmPPJSn', 1, '2019-12-14 19:07:10', 'H2VnmPPJSn', 'H2VnmPPJSn'),
(88, 'u3HQsofi0v', 'u3HQsofi0v', 0, NULL, NULL, 'u3HQsofi0v', 'u3HQsofi0v', 1, '2019-12-14 19:07:10', 'u3HQsofi0v', 'u3HQsofi0v'),
(89, 'ReIXFyT3Cx', 'ReIXFyT3Cx', 0, NULL, NULL, 'ReIXFyT3Cx', 'ReIXFyT3Cx', 1, '2019-12-14 19:07:10', 'ReIXFyT3Cx', 'ReIXFyT3Cx'),
(90, 'J3pYvfa1Af', 'J3pYvfa1Af', 0, NULL, NULL, 'J3pYvfa1Af', 'J3pYvfa1Af', 1, '2019-12-14 19:07:10', 'J3pYvfa1Af', 'J3pYvfa1Af'),
(91, 'nRAXhwDmAg', 'nRAXhwDmAg', 0, NULL, NULL, 'nRAXhwDmAg', 'nRAXhwDmAg', 1, '2019-12-14 19:07:10', 'nRAXhwDmAg', 'nRAXhwDmAg'),
(92, 'DLCsYWElIJ', 'DLCsYWElIJ', 0, NULL, NULL, 'DLCsYWElIJ', 'DLCsYWElIJ', 1, '2019-12-14 19:07:10', 'DLCsYWElIJ', 'DLCsYWElIJ'),
(93, 'kapMxPbyo2', 'kapMxPbyo2', 0, NULL, NULL, 'kapMxPbyo2', 'kapMxPbyo2', 1, '2019-12-14 19:07:10', 'kapMxPbyo2', 'kapMxPbyo2'),
(94, '7tHgoOcQtx', '7tHgoOcQtx', 7, NULL, NULL, '7tHgoOcQtx', '7tHgoOcQtx', 1, '2019-12-14 19:07:10', '7tHgoOcQtx', '7tHgoOcQtx'),
(95, 'bacYLeJNTI', 'bacYLeJNTI', 0, NULL, NULL, 'bacYLeJNTI', 'bacYLeJNTI', 1, '2019-12-14 19:07:10', 'bacYLeJNTI', 'bacYLeJNTI'),
(96, 'b4IEBj2cTQ', 'b4IEBj2cTQ', 0, NULL, NULL, 'b4IEBj2cTQ', 'b4IEBj2cTQ', 1, '2019-12-14 19:07:10', 'b4IEBj2cTQ', 'b4IEBj2cTQ'),
(97, 'vKBfm6eKig', 'vKBfm6eKig', 0, NULL, NULL, 'vKBfm6eKig', 'vKBfm6eKig', 1, '2019-12-14 19:07:10', 'vKBfm6eKig', 'vKBfm6eKig'),
(98, '8918E9YWR9', '8918E9YWR9', 2147483647, NULL, NULL, '8918E9YWR9', '8918E9YWR9', 1, '2019-12-14 19:07:10', '8918E9YWR9', '8918E9YWR9'),
(99, '9VEX5YXDj8', '9VEX5YXDj8', 9, NULL, NULL, '9VEX5YXDj8', '9VEX5YXDj8', 1, '2019-12-14 19:07:10', '9VEX5YXDj8', '9VEX5YXDj8'),
(100, 'cbvGOB17Yg', 'cbvGOB17Yg', 0, NULL, NULL, 'cbvGOB17Yg', 'cbvGOB17Yg', 1, '2019-12-14 19:07:10', 'cbvGOB17Yg', 'cbvGOB17Yg'),
(101, 'WmYuvJp4Jo', 'WmYuvJp4Jo', 0, NULL, NULL, 'WmYuvJp4Jo', 'WmYuvJp4Jo', 1, '2019-12-14 19:07:10', 'WmYuvJp4Jo', 'WmYuvJp4Jo'),
(102, 'YqZvgsMbez', 'YqZvgsMbez', 0, NULL, NULL, 'YqZvgsMbez', 'YqZvgsMbez', 1, '2019-12-14 19:07:10', 'YqZvgsMbez', 'YqZvgsMbez'),
(103, 'eEdpJTIGLz', 'eEdpJTIGLz', 0, NULL, NULL, 'eEdpJTIGLz', 'eEdpJTIGLz', 1, '2019-12-14 19:07:10', 'eEdpJTIGLz', 'eEdpJTIGLz'),
(104, 'ddzKYEuqtn', 'ddzKYEuqtn', 0, NULL, NULL, 'ddzKYEuqtn', 'ddzKYEuqtn', 1, '2019-12-14 19:07:10', 'ddzKYEuqtn', 'ddzKYEuqtn'),
(105, 'l4ASUY4IkC', 'l4ASUY4IkC', 0, NULL, NULL, 'l4ASUY4IkC', 'l4ASUY4IkC', 1, '2019-12-15 09:49:00', 'l4ASUY4IkC', 'l4ASUY4IkC'),
(106, 'eLzMPG71oQ', 'eLzMPG71oQ', 0, NULL, NULL, 'eLzMPG71oQ', 'eLzMPG71oQ', 1, '2019-12-15 09:49:00', 'eLzMPG71oQ', 'eLzMPG71oQ'),
(107, '7RTzqjx2M4', '7RTzqjx2M4', 7, NULL, NULL, '7RTzqjx2M4', '7RTzqjx2M4', 1, '2019-12-15 09:49:00', '7RTzqjx2M4', '7RTzqjx2M4'),
(108, 'ijraHlNCec', 'ijraHlNCec', 0, NULL, NULL, 'ijraHlNCec', 'ijraHlNCec', 1, '2019-12-15 09:49:00', 'ijraHlNCec', 'ijraHlNCec'),
(109, 'P3J4is2JDm', 'P3J4is2JDm', 0, NULL, NULL, 'P3J4is2JDm', 'P3J4is2JDm', 1, '2019-12-15 09:49:00', 'P3J4is2JDm', 'P3J4is2JDm'),
(110, 'HfgolY5QQm', 'HfgolY5QQm', 0, NULL, NULL, 'HfgolY5QQm', 'HfgolY5QQm', 1, '2019-12-15 09:49:00', 'HfgolY5QQm', 'HfgolY5QQm'),
(111, 'kxtHE0O2LO', 'kxtHE0O2LO', 0, NULL, NULL, 'kxtHE0O2LO', 'kxtHE0O2LO', 1, '2019-12-15 09:49:00', 'kxtHE0O2LO', 'kxtHE0O2LO'),
(112, 'L42b64S1kN', 'L42b64S1kN', 0, NULL, NULL, 'L42b64S1kN', 'L42b64S1kN', 1, '2019-12-15 09:49:00', 'L42b64S1kN', 'L42b64S1kN'),
(113, 'hnO5pq3mkj', 'hnO5pq3mkj', 0, NULL, NULL, 'hnO5pq3mkj', 'hnO5pq3mkj', 1, '2019-12-15 09:49:00', 'hnO5pq3mkj', 'hnO5pq3mkj'),
(114, 'bl0rFHjKgl', 'bl0rFHjKgl', 0, NULL, NULL, 'bl0rFHjKgl', 'bl0rFHjKgl', 1, '2019-12-15 09:49:00', 'bl0rFHjKgl', 'bl0rFHjKgl'),
(115, 'a7YaGkuV9c', 'a7YaGkuV9c', 0, NULL, NULL, 'a7YaGkuV9c', 'a7YaGkuV9c', 1, '2019-12-15 09:49:00', 'a7YaGkuV9c', 'a7YaGkuV9c'),
(116, 'FtjBjgLMNG', 'FtjBjgLMNG', 0, NULL, NULL, 'FtjBjgLMNG', 'FtjBjgLMNG', 1, '2019-12-15 09:49:00', 'FtjBjgLMNG', 'FtjBjgLMNG'),
(117, 'H22tgxU3RJ', 'H22tgxU3RJ', 0, NULL, NULL, 'H22tgxU3RJ', 'H22tgxU3RJ', 1, '2019-12-15 09:49:00', 'H22tgxU3RJ', 'H22tgxU3RJ'),
(118, 'N4jtZf671C', 'N4jtZf671C', 0, NULL, NULL, 'N4jtZf671C', 'N4jtZf671C', 1, '2019-12-15 09:49:00', 'N4jtZf671C', 'N4jtZf671C'),
(119, 'wJmN3F0eDz', 'wJmN3F0eDz', 0, NULL, NULL, 'wJmN3F0eDz', 'wJmN3F0eDz', 1, '2019-12-15 09:49:00', 'wJmN3F0eDz', 'wJmN3F0eDz'),
(120, '41AcQHTnEB', '41AcQHTnEB', 41, NULL, NULL, '41AcQHTnEB', '41AcQHTnEB', 1, '2019-12-15 09:49:00', '41AcQHTnEB', '41AcQHTnEB'),
(121, 'rR36bDCgq0', 'rR36bDCgq0', 0, NULL, NULL, 'rR36bDCgq0', 'rR36bDCgq0', 1, '2019-12-15 09:49:00', 'rR36bDCgq0', 'rR36bDCgq0'),
(122, 'pGr3oSZLGx', 'pGr3oSZLGx', 0, NULL, NULL, 'pGr3oSZLGx', 'pGr3oSZLGx', 1, '2019-12-15 09:49:00', 'pGr3oSZLGx', 'pGr3oSZLGx'),
(123, 'iEf5Up7Cvo', 'iEf5Up7Cvo', 0, NULL, NULL, 'iEf5Up7Cvo', 'iEf5Up7Cvo', 1, '2019-12-15 09:49:00', 'iEf5Up7Cvo', 'iEf5Up7Cvo'),
(124, 'abC6hpcVeM', 'abC6hpcVeM', 0, NULL, NULL, 'abC6hpcVeM', 'abC6hpcVeM', 1, '2019-12-15 09:49:00', 'abC6hpcVeM', 'abC6hpcVeM'),
(125, 'iDj4UHsi0O', 'iDj4UHsi0O', 0, NULL, NULL, 'iDj4UHsi0O', 'iDj4UHsi0O', 1, '2019-12-15 09:49:00', 'iDj4UHsi0O', 'iDj4UHsi0O'),
(126, 'cU7RXxzXCo', 'cU7RXxzXCo', 0, NULL, NULL, 'cU7RXxzXCo', 'cU7RXxzXCo', 1, '2019-12-15 09:49:00', 'cU7RXxzXCo', 'cU7RXxzXCo'),
(127, 'StCSKIbOME', 'StCSKIbOME', 0, NULL, NULL, 'StCSKIbOME', 'StCSKIbOME', 1, '2019-12-15 09:49:00', 'StCSKIbOME', 'StCSKIbOME'),
(128, 'Vu4aYbZkL5', 'Vu4aYbZkL5', 0, NULL, NULL, 'Vu4aYbZkL5', 'Vu4aYbZkL5', 1, '2019-12-15 09:49:00', 'Vu4aYbZkL5', 'Vu4aYbZkL5'),
(129, 'ngQsip2PbH', 'ngQsip2PbH', 0, NULL, NULL, 'ngQsip2PbH', 'ngQsip2PbH', 1, '2019-12-15 09:49:00', 'ngQsip2PbH', 'ngQsip2PbH'),
(130, 'OIqzVc8LSU', 'OIqzVc8LSU', 0, NULL, NULL, 'OIqzVc8LSU', 'OIqzVc8LSU', 1, '2019-12-15 09:49:00', 'OIqzVc8LSU', 'OIqzVc8LSU'),
(131, 'LHKOguBfP8', 'LHKOguBfP8', 0, NULL, NULL, 'LHKOguBfP8', 'LHKOguBfP8', 1, '2019-12-15 09:49:00', 'LHKOguBfP8', 'LHKOguBfP8'),
(132, 'dm7vdKZGIy', 'dm7vdKZGIy', 0, NULL, NULL, 'dm7vdKZGIy', 'dm7vdKZGIy', 1, '2019-12-15 09:49:00', 'dm7vdKZGIy', 'dm7vdKZGIy'),
(133, 'jJcyH8TKXb', 'jJcyH8TKXb', 0, NULL, NULL, 'jJcyH8TKXb', 'jJcyH8TKXb', 1, '2019-12-15 09:49:00', 'jJcyH8TKXb', 'jJcyH8TKXb'),
(134, 'vDeOoqrjEy', 'vDeOoqrjEy', 0, NULL, NULL, 'vDeOoqrjEy', 'vDeOoqrjEy', 1, '2019-12-15 09:49:00', 'vDeOoqrjEy', 'vDeOoqrjEy'),
(135, '6IZotnVLOR', '6IZotnVLOR', 6, NULL, NULL, '6IZotnVLOR', '6IZotnVLOR', 1, '2019-12-15 09:49:00', '6IZotnVLOR', '6IZotnVLOR'),
(136, 'Dfkjpa2ClJ', 'Dfkjpa2ClJ', 0, NULL, NULL, 'Dfkjpa2ClJ', 'Dfkjpa2ClJ', 1, '2019-12-15 09:49:00', 'Dfkjpa2ClJ', 'Dfkjpa2ClJ'),
(137, 'lcBd1Ab7Wb', 'lcBd1Ab7Wb', 0, NULL, NULL, 'lcBd1Ab7Wb', 'lcBd1Ab7Wb', 1, '2019-12-15 09:49:00', 'lcBd1Ab7Wb', 'lcBd1Ab7Wb'),
(138, 'sdkOsTVJ22', 'sdkOsTVJ22', 0, NULL, NULL, 'sdkOsTVJ22', 'sdkOsTVJ22', 1, '2019-12-15 09:49:00', 'sdkOsTVJ22', 'sdkOsTVJ22'),
(139, 'UK2gSeVl5J', 'UK2gSeVl5J', 0, NULL, NULL, 'UK2gSeVl5J', 'UK2gSeVl5J', 1, '2019-12-15 09:49:00', 'UK2gSeVl5J', 'UK2gSeVl5J'),
(140, 'o2VFgLAZ9b', 'o2VFgLAZ9b', 0, NULL, NULL, 'o2VFgLAZ9b', 'o2VFgLAZ9b', 1, '2019-12-15 09:49:00', 'o2VFgLAZ9b', 'o2VFgLAZ9b'),
(141, 'gIyfSNuDBP', 'gIyfSNuDBP', 0, NULL, NULL, 'gIyfSNuDBP', 'gIyfSNuDBP', 1, '2019-12-15 09:49:00', 'gIyfSNuDBP', 'gIyfSNuDBP'),
(142, 'uoBN3S5IEY', 'uoBN3S5IEY', 0, NULL, NULL, 'uoBN3S5IEY', 'uoBN3S5IEY', 1, '2019-12-15 09:49:00', 'uoBN3S5IEY', 'uoBN3S5IEY'),
(143, 'MpjaKOCQX3', 'MpjaKOCQX3', 0, NULL, NULL, 'MpjaKOCQX3', 'MpjaKOCQX3', 1, '2019-12-15 09:49:00', 'MpjaKOCQX3', 'MpjaKOCQX3'),
(144, 'gsKD6eW7cf', 'gsKD6eW7cf', 0, NULL, NULL, 'gsKD6eW7cf', 'gsKD6eW7cf', 1, '2019-12-15 09:49:00', 'gsKD6eW7cf', 'gsKD6eW7cf'),
(145, 'BMNM9wMpdG', 'BMNM9wMpdG', 0, NULL, NULL, 'BMNM9wMpdG', 'BMNM9wMpdG', 1, '2019-12-15 09:49:00', 'BMNM9wMpdG', 'BMNM9wMpdG'),
(146, '5V2GVye1cH', '5V2GVye1cH', 5, NULL, NULL, '5V2GVye1cH', '5V2GVye1cH', 1, '2019-12-15 09:49:00', '5V2GVye1cH', '5V2GVye1cH'),
(147, 'xjfzdY3Ymr', 'xjfzdY3Ymr', 0, NULL, NULL, 'xjfzdY3Ymr', 'xjfzdY3Ymr', 1, '2019-12-15 09:49:00', 'xjfzdY3Ymr', 'xjfzdY3Ymr'),
(148, 'nFVuCoIk5P', 'nFVuCoIk5P', 0, NULL, NULL, 'nFVuCoIk5P', 'nFVuCoIk5P', 1, '2019-12-15 09:49:00', 'nFVuCoIk5P', 'nFVuCoIk5P'),
(149, 'jjpQIfO1HU', 'jjpQIfO1HU', 0, NULL, NULL, 'jjpQIfO1HU', 'jjpQIfO1HU', 1, '2019-12-15 09:49:00', 'jjpQIfO1HU', 'jjpQIfO1HU'),
(150, 'aLPtCYO3lV', 'aLPtCYO3lV', 0, NULL, NULL, 'aLPtCYO3lV', 'aLPtCYO3lV', 1, '2019-12-15 09:49:00', 'aLPtCYO3lV', 'aLPtCYO3lV'),
(151, '0YpiW6DYVG', '0YpiW6DYVG', 0, NULL, NULL, '0YpiW6DYVG', '0YpiW6DYVG', 1, '2019-12-15 09:49:00', '0YpiW6DYVG', '0YpiW6DYVG'),
(152, 'uM8v2U9kq3', 'uM8v2U9kq3', 0, NULL, NULL, 'uM8v2U9kq3', 'uM8v2U9kq3', 1, '2019-12-15 09:49:00', 'uM8v2U9kq3', 'uM8v2U9kq3'),
(153, 'oHl0a5IdBn', 'oHl0a5IdBn', 0, NULL, NULL, 'oHl0a5IdBn', 'oHl0a5IdBn', 1, '2019-12-15 09:49:00', 'oHl0a5IdBn', 'oHl0a5IdBn'),
(154, '9npPAdMJVm', '9npPAdMJVm', 9, NULL, NULL, '9npPAdMJVm', '9npPAdMJVm', 1, '2019-12-15 09:49:00', '9npPAdMJVm', '9npPAdMJVm'),
(155, '35xNuYo4aR', '35xNuYo4aR', 35, NULL, NULL, '35xNuYo4aR', '35xNuYo4aR', 1, '2019-12-15 09:49:00', '35xNuYo4aR', '35xNuYo4aR'),
(156, 'O8N82NQdh9', 'O8N82NQdh9', 0, NULL, NULL, 'O8N82NQdh9', 'O8N82NQdh9', 1, '2019-12-15 09:49:00', 'O8N82NQdh9', 'O8N82NQdh9'),
(157, 'HXdVhTyVJk', 'HXdVhTyVJk', 0, NULL, NULL, 'HXdVhTyVJk', 'HXdVhTyVJk', 1, '2019-12-15 09:49:00', 'HXdVhTyVJk', 'HXdVhTyVJk'),
(158, 'mZGAVXFpbl', 'mZGAVXFpbl', 0, NULL, NULL, 'mZGAVXFpbl', 'mZGAVXFpbl', 1, '2019-12-15 09:49:00', 'mZGAVXFpbl', 'mZGAVXFpbl'),
(159, 'S42X0jSsvV', 'S42X0jSsvV', 0, NULL, NULL, 'S42X0jSsvV', 'S42X0jSsvV', 1, '2019-12-15 09:49:00', 'S42X0jSsvV', 'S42X0jSsvV'),
(160, 'myCkpLDwZE', 'myCkpLDwZE', 0, NULL, NULL, 'myCkpLDwZE', 'myCkpLDwZE', 1, '2019-12-15 09:49:00', 'myCkpLDwZE', 'myCkpLDwZE'),
(161, 'EYfQqYBlM6', 'EYfQqYBlM6', 0, NULL, NULL, 'EYfQqYBlM6', 'EYfQqYBlM6', 1, '2019-12-15 09:49:00', 'EYfQqYBlM6', 'EYfQqYBlM6'),
(162, 'N2tc3nJHs2', 'N2tc3nJHs2', 0, NULL, NULL, 'N2tc3nJHs2', 'N2tc3nJHs2', 1, '2019-12-15 09:49:00', 'N2tc3nJHs2', 'N2tc3nJHs2'),
(163, 'GUzfLI6IFJ', 'GUzfLI6IFJ', 0, NULL, NULL, 'GUzfLI6IFJ', 'GUzfLI6IFJ', 1, '2019-12-15 09:49:00', 'GUzfLI6IFJ', 'GUzfLI6IFJ'),
(164, 'iFhnjEkdJe', 'iFhnjEkdJe', 0, NULL, NULL, 'iFhnjEkdJe', 'iFhnjEkdJe', 1, '2019-12-15 09:49:00', 'iFhnjEkdJe', 'iFhnjEkdJe'),
(165, 'OF4Abs5fDJ', 'OF4Abs5fDJ', 0, NULL, NULL, 'OF4Abs5fDJ', 'OF4Abs5fDJ', 1, '2019-12-15 09:49:00', 'OF4Abs5fDJ', 'OF4Abs5fDJ'),
(166, '3NcWIx73mw', '3NcWIx73mw', 3, NULL, NULL, '3NcWIx73mw', '3NcWIx73mw', 1, '2019-12-15 09:49:00', '3NcWIx73mw', '3NcWIx73mw'),
(167, 'a6UQUY6LOZ', 'a6UQUY6LOZ', 0, NULL, NULL, 'a6UQUY6LOZ', 'a6UQUY6LOZ', 1, '2019-12-15 09:49:00', 'a6UQUY6LOZ', 'a6UQUY6LOZ'),
(168, '0XHLoy7Cmi', '0XHLoy7Cmi', 0, NULL, NULL, '0XHLoy7Cmi', '0XHLoy7Cmi', 1, '2019-12-15 09:49:00', '0XHLoy7Cmi', '0XHLoy7Cmi'),
(169, 'oR11kooemb', 'oR11kooemb', 0, NULL, NULL, 'oR11kooemb', 'oR11kooemb', 1, '2019-12-15 09:49:00', 'oR11kooemb', 'oR11kooemb'),
(170, 'n16mEsHizA', 'n16mEsHizA', 0, NULL, NULL, 'n16mEsHizA', 'n16mEsHizA', 1, '2019-12-15 09:49:00', 'n16mEsHizA', 'n16mEsHizA'),
(171, 'cUf0p227S8', 'cUf0p227S8', 0, NULL, NULL, 'cUf0p227S8', 'cUf0p227S8', 1, '2019-12-15 09:49:00', 'cUf0p227S8', 'cUf0p227S8'),
(172, 'v5wQ8rUo0m', 'v5wQ8rUo0m', 0, NULL, NULL, 'v5wQ8rUo0m', 'v5wQ8rUo0m', 1, '2019-12-15 09:49:00', 'v5wQ8rUo0m', 'v5wQ8rUo0m'),
(173, 'KIeKkGjasL', 'KIeKkGjasL', 0, NULL, NULL, 'KIeKkGjasL', 'KIeKkGjasL', 1, '2019-12-15 09:49:00', 'KIeKkGjasL', 'KIeKkGjasL'),
(174, 'lFXL87G2sF', 'lFXL87G2sF', 0, NULL, NULL, 'lFXL87G2sF', 'lFXL87G2sF', 1, '2019-12-15 09:49:00', 'lFXL87G2sF', 'lFXL87G2sF'),
(175, 'XfdOsrItdl', 'XfdOsrItdl', 0, NULL, NULL, 'XfdOsrItdl', 'XfdOsrItdl', 1, '2019-12-15 09:49:00', 'XfdOsrItdl', 'XfdOsrItdl'),
(176, '7IqKkjed58', '7IqKkjed58', 7, NULL, NULL, '7IqKkjed58', '7IqKkjed58', 1, '2019-12-15 09:49:00', '7IqKkjed58', '7IqKkjed58'),
(177, 'hPqwr8CW94', 'hPqwr8CW94', 0, NULL, NULL, 'hPqwr8CW94', 'hPqwr8CW94', 1, '2019-12-15 09:49:00', 'hPqwr8CW94', 'hPqwr8CW94'),
(178, 'yDjcRI7xHe', 'yDjcRI7xHe', 0, NULL, NULL, 'yDjcRI7xHe', 'yDjcRI7xHe', 1, '2019-12-15 09:49:00', 'yDjcRI7xHe', 'yDjcRI7xHe'),
(179, 'qsrvtCs0JS', 'qsrvtCs0JS', 0, NULL, NULL, 'qsrvtCs0JS', 'qsrvtCs0JS', 1, '2019-12-15 09:49:00', 'qsrvtCs0JS', 'qsrvtCs0JS'),
(180, 'BrbuMAXupQ', 'BrbuMAXupQ', 0, NULL, NULL, 'BrbuMAXupQ', 'BrbuMAXupQ', 1, '2019-12-15 09:49:00', 'BrbuMAXupQ', 'BrbuMAXupQ'),
(181, 'JEIdN3QfF3', 'JEIdN3QfF3', 0, NULL, NULL, 'JEIdN3QfF3', 'JEIdN3QfF3', 1, '2019-12-15 09:49:00', 'JEIdN3QfF3', 'JEIdN3QfF3'),
(182, 'T2Hq8YORLs', 'T2Hq8YORLs', 0, NULL, NULL, 'T2Hq8YORLs', 'T2Hq8YORLs', 1, '2019-12-15 09:49:00', 'T2Hq8YORLs', 'T2Hq8YORLs'),
(183, '2vKKouUikK', '2vKKouUikK', 2, NULL, NULL, '2vKKouUikK', '2vKKouUikK', 1, '2019-12-15 09:49:00', '2vKKouUikK', '2vKKouUikK'),
(184, 'dHlWkDFOFr', 'dHlWkDFOFr', 0, NULL, NULL, 'dHlWkDFOFr', 'dHlWkDFOFr', 1, '2019-12-15 09:49:00', 'dHlWkDFOFr', 'dHlWkDFOFr'),
(185, 'jVxfy8DcJn', 'jVxfy8DcJn', 0, NULL, NULL, 'jVxfy8DcJn', 'jVxfy8DcJn', 1, '2019-12-15 09:49:00', 'jVxfy8DcJn', 'jVxfy8DcJn'),
(186, 'yyYkoBRtxt', 'yyYkoBRtxt', 0, NULL, NULL, 'yyYkoBRtxt', 'yyYkoBRtxt', 1, '2019-12-15 09:49:00', 'yyYkoBRtxt', 'yyYkoBRtxt'),
(187, 'lpvooZb6Wo', 'lpvooZb6Wo', 0, NULL, NULL, 'lpvooZb6Wo', 'lpvooZb6Wo', 1, '2019-12-15 09:49:00', 'lpvooZb6Wo', 'lpvooZb6Wo'),
(188, 'e1HnTYcQ5Z', 'e1HnTYcQ5Z', 0, NULL, NULL, 'e1HnTYcQ5Z', 'e1HnTYcQ5Z', 1, '2019-12-15 09:49:00', 'e1HnTYcQ5Z', 'e1HnTYcQ5Z'),
(189, 'ZsQ4fwdbCk', 'ZsQ4fwdbCk', 0, NULL, NULL, 'ZsQ4fwdbCk', 'ZsQ4fwdbCk', 1, '2019-12-15 09:49:00', 'ZsQ4fwdbCk', 'ZsQ4fwdbCk'),
(190, 'lD1bb5YO4X', 'lD1bb5YO4X', 0, NULL, NULL, 'lD1bb5YO4X', 'lD1bb5YO4X', 1, '2019-12-15 09:49:00', 'lD1bb5YO4X', 'lD1bb5YO4X'),
(191, 'YbIMA7jYEl', 'YbIMA7jYEl', 0, NULL, NULL, 'YbIMA7jYEl', 'YbIMA7jYEl', 1, '2019-12-15 09:49:00', 'YbIMA7jYEl', 'YbIMA7jYEl'),
(192, 'p5RomhfItt', 'p5RomhfItt', 0, NULL, NULL, 'p5RomhfItt', 'p5RomhfItt', 1, '2019-12-15 09:49:00', 'p5RomhfItt', 'p5RomhfItt'),
(193, 'HGwIYAxG4K', 'HGwIYAxG4K', 0, NULL, NULL, 'HGwIYAxG4K', 'HGwIYAxG4K', 1, '2019-12-15 09:49:00', 'HGwIYAxG4K', 'HGwIYAxG4K'),
(194, 'mW2bf3xgO3', 'mW2bf3xgO3', 0, NULL, NULL, 'mW2bf3xgO3', 'mW2bf3xgO3', 1, '2019-12-15 09:49:00', 'mW2bf3xgO3', 'mW2bf3xgO3'),
(195, 'Xr3h3vvqzQ', 'Xr3h3vvqzQ', 0, NULL, NULL, 'Xr3h3vvqzQ', 'Xr3h3vvqzQ', 1, '2019-12-15 09:49:00', 'Xr3h3vvqzQ', 'Xr3h3vvqzQ'),
(196, '7fLTQeG3Pe', '7fLTQeG3Pe', 7, NULL, NULL, '7fLTQeG3Pe', '7fLTQeG3Pe', 1, '2019-12-15 09:49:00', '7fLTQeG3Pe', '7fLTQeG3Pe'),
(197, 'dE6NSJO4sC', 'dE6NSJO4sC', 0, NULL, NULL, 'dE6NSJO4sC', 'dE6NSJO4sC', 1, '2019-12-15 09:49:00', 'dE6NSJO4sC', 'dE6NSJO4sC'),
(198, 'JIq2w6MS9P', 'JIq2w6MS9P', 0, NULL, NULL, 'JIq2w6MS9P', 'JIq2w6MS9P', 1, '2019-12-15 09:49:00', 'JIq2w6MS9P', 'JIq2w6MS9P'),
(199, 'jHJVBtq8Vq', 'jHJVBtq8Vq', 0, NULL, NULL, 'jHJVBtq8Vq', 'jHJVBtq8Vq', 1, '2019-12-15 09:49:00', 'jHJVBtq8Vq', 'jHJVBtq8Vq'),
(200, 'lYAoFXgkXl', 'lYAoFXgkXl', 0, NULL, NULL, 'lYAoFXgkXl', 'lYAoFXgkXl', 1, '2019-12-15 09:49:00', 'lYAoFXgkXl', 'lYAoFXgkXl'),
(201, 'AGb1Mg9mAk', 'AGb1Mg9mAk', 0, NULL, NULL, 'AGb1Mg9mAk', 'AGb1Mg9mAk', 1, '2019-12-15 09:49:00', 'AGb1Mg9mAk', 'AGb1Mg9mAk'),
(202, 'kb1Zk5MeLF', 'kb1Zk5MeLF', 0, NULL, NULL, 'kb1Zk5MeLF', 'kb1Zk5MeLF', 1, '2019-12-15 09:49:00', 'kb1Zk5MeLF', 'kb1Zk5MeLF'),
(203, '4PWXxhsEiw', '4PWXxhsEiw', 4, NULL, NULL, '4PWXxhsEiw', '4PWXxhsEiw', 1, '2019-12-15 09:49:00', '4PWXxhsEiw', '4PWXxhsEiw'),
(204, 'Ta90lwnF5G', 'Ta90lwnF5G', 0, NULL, NULL, 'Ta90lwnF5G', 'Ta90lwnF5G', 1, '2019-12-15 09:49:00', 'Ta90lwnF5G', 'Ta90lwnF5G');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `user_name` varchar(30) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL,
  `stat` int(1) DEFAULT NULL,
  `img` varchar(250) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `user_name`, `pass`, `stat`, `img`, `date_time`) VALUES
(1, 'usuario1', '123', 1, '1.png', '2019-11-30 00:00:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area_negocios`
--
ALTER TABLE `area_negocios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contacto_empresa`
--
ALTER TABLE `contacto_empresa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `espresas`
--
ALTER TABLE `espresas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `area_negocios`
--
ALTER TABLE `area_negocios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `carreras`
--
ALTER TABLE `carreras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `contacto_empresa`
--
ALTER TABLE `contacto_empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `espresas`
--
ALTER TABLE `espresas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
