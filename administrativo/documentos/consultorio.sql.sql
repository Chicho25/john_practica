-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-11-2019 a las 18:58:52
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
-- Base de datos: `consultorio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita_medica`
--

CREATE TABLE `cita_medica` (
  `id` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `id_doctor` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL DEFAULT current_timestamp(),
  `id_user_reg` int(11) NOT NULL DEFAULT current_timestamp(),
  `comentario` varchar(250) NOT NULL,
  `stat` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cita_medica`
--

INSERT INTO `cita_medica` (`id`, `id_paciente`, `id_doctor`, `fecha_reg`, `id_user_reg`, `comentario`, `stat`) VALUES
(2, 2, 1, '2019-11-27 11:44:02', 2147483647, 'El paciente se siente mal', 2),
(3, 1, 2, '2019-11-27 11:44:41', 2147483647, 'le duele la cabeza', 1),
(4, 3, 4, '2019-11-27 11:46:20', 2147483647, 'chequeo regular', 1),
(5, 4, 3, '2019-11-27 11:46:45', 2147483647, 'bacteria en el estomago', 3),
(6, 5, 3, '2019-11-27 11:47:09', 2147483647, 'chequeo regular', 3),
(7, 7, 6, '2019-11-27 12:49:15', 2147483647, 'le duele la cabeza', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctores`
--

CREATE TABLE `doctores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `especialidad` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `doctores`
--

INSERT INTO `doctores` (`id`, `nombre`, `apellido`, `especialidad`) VALUES
(1, 'Cecilia', 'Arandias', 'pediatria'),
(2, 'Reinaldo', 'Pavan', 'Neurologo'),
(3, 'muchael', 'alduvez', 'gastro'),
(4, 'yoander', 'caseco', 'medicina general'),
(5, 'luis', 'hernandez', 'Otorrino'),
(6, 'micaela', 'nipa', 'sistema');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `fecha_reg` datetime NOT NULL DEFAULT current_timestamp(),
  `id_user_reg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `nombre`, `apellido`, `fecha_reg`, `id_user_reg`) VALUES
(1, 'Jose', 'maldonado', '2019-11-27 10:53:21', 1),
(2, 'Pedro', 'Arrieta', '2019-11-27 10:53:21', 1),
(3, 'Jorge ', 'Hassan', '2019-11-27 10:53:21', 1),
(4, 'Yulimar', 'Vilela', '2019-11-27 10:53:21', 1),
(5, 'Irene ', 'Perez', '2019-11-27 10:53:21', 1),
(6, 'luca', 'matheo', '2019-11-27 12:33:20', 0),
(7, 'felix', 'nose', '2019-11-27 12:48:39', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre_usuario` int(11) NOT NULL,
  `pass` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita_medica`
--
ALTER TABLE `cita_medica`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `doctores`
--
ALTER TABLE `doctores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
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
-- AUTO_INCREMENT de la tabla `cita_medica`
--
ALTER TABLE `cita_medica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `doctores`
--
ALTER TABLE `doctores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
