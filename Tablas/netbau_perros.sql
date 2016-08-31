-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 03, 2016 at 06:19 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `netbau_perros`
--

-- --------------------------------------------------------

--
-- Table structure for table `apadrina`
--

CREATE TABLE `apadrina` (
  `Persona_idPersona` int(11) NOT NULL,
  `Perro_idPerro` int(11) NOT NULL,
  `Fecha_Inicio` datetime DEFAULT NULL,
  `Fecha_Fin` datetime DEFAULT NULL,
  `Ultima_Mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `apadrina_has_aporte`
--

CREATE TABLE `apadrina_has_aporte` (
  `Apadrina_Perro_idPerro` int(11) NOT NULL,
  `Aporte_idAporte` int(11) NOT NULL,
  `Ultima_Mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `aporte`
--

CREATE TABLE `aporte` (
  `idAporte` int(11) NOT NULL,
  `Cantidad` varchar(45) DEFAULT NULL,
  `Tipo_Aporte_idTipo_Aporte` int(11) NOT NULL,
  `Persona_idPersona` int(11) NOT NULL,
  `Periodicidad` binary(1) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Ultima_Mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `idColor` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Ultima_Mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`idColor`, `Nombre`, `Ultima_Mod`) VALUES
(1, 'negro/cafe', '2016-07-02 21:56:45'),
(2, 'atigrado cafe', '2016-07-02 21:56:47'),
(3, 'blanco/negro', '2016-07-02 21:56:49'),
(4, 'blanco/cafe', '2016-07-02 21:56:50'),
(5, 'blanco/negro/cafe', '2016-07-02 21:56:52'),
(6, 'cafe', '2016-07-02 21:56:57'),
(7, 'negro', '2016-07-02 21:56:59'),
(8, 'gris', '2016-07-02 21:57:00');

-- --------------------------------------------------------

--
-- Table structure for table `enfermedad`
--

CREATE TABLE `enfermedad` (
  `idEnfermedad` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Ultima_Mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enfermedad`
--

INSERT INTO `enfermedad` (`idEnfermedad`, `Nombre`, `Descripcion`, `Ultima_Mod`) VALUES
(1, 'Tuerto', 'asd', '2016-07-02 22:09:52'),
(2, 'Cojo', '', '2016-07-02 22:30:50'),
(3, 'Artrosis', '', '2016-07-02 22:31:57'),
(4, 'Tumor', '', '2016-07-02 22:32:10'),
(5, 'Obesidad', '', '2016-07-02 22:32:12'),
(6, 'Cataratas', '', '2016-07-02 22:32:14');

-- --------------------------------------------------------

--
-- Table structure for table `estado`
--

CREATE TABLE `estado` (
  `idEstado` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Ultima_Mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `estado`
--

INSERT INTO `estado` (`idEstado`, `Nombre`, `Descripcion`, `Ultima_Mod`) VALUES
(1, 'calle', NULL, NULL),
(2, 'constructora', NULL, NULL),
(3, 'en adopción', NULL, NULL),
(4, 'Fallecido', NULL, NULL),
(5, 'En Veterinario', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `foto`
--

CREATE TABLE `foto` (
  `idFoto` int(11) NOT NULL,
  `Perro_idPerro` int(11) NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Ultima_Mod` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frecuencia`
--

CREATE TABLE `frecuencia` (
  `idFrecuencia` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `largo_pelo`
--

CREATE TABLE `largo_pelo` (
  `idLargo_Pelo` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Ultima_Mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `largo_pelo`
--

INSERT INTO `largo_pelo` (`idLargo_Pelo`, `Nombre`, `Ultima_Mod`) VALUES
(1, 'Corto', '0000-00-00 00:00:00'),
(2, 'Largo', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `operaciones`
--

CREATE TABLE `operaciones` (
  `idOperaciones` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Ultima_Mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `operaciones`
--

INSERT INTO `operaciones` (`idOperaciones`, `Nombre`, `Descripcion`, `Ultima_Mod`) VALUES
(1, 'Esterilización', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `operaciones_has_perro`
--

CREATE TABLE `operaciones_has_perro` (
  `Operaciones_idOperaciones` int(11) NOT NULL,
  `Perro_idPerro` int(11) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Observaciones` varchar(45) DEFAULT NULL,
  `Ultima_Mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `perro`
--

CREATE TABLE `perro` (
  `idPerro` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Fecha_Nacimiento` datetime NOT NULL,
  `Peso` int(11) NOT NULL,
  `Tamanio_idTamanio` int(11) NOT NULL,
  `Fecha_Ultima_Desparacitacion` datetime DEFAULT NULL,
  `Color_idColor` int(11) NOT NULL,
  `Largo_Pelo_idLargo_Pelo` int(11) NOT NULL,
  `Ubicacion_idUbicacion` int(11) NOT NULL,
  `Est_Perros` int(11) NOT NULL,
  `Est_Ninios` int(11) NOT NULL,
  `Est_Personas` int(11) NOT NULL,
  `Est_Ener` int(11) NOT NULL,
  `Estado_idEstado` int(11) NOT NULL,
  `id_Foto_Principal` int(11) DEFAULT NULL,
  `Ultima_Mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `perro`
--

INSERT INTO `perro` (`idPerro`, `Nombre`, `Fecha_Nacimiento`, `Peso`, `Tamanio_idTamanio`, `Fecha_Ultima_Desparacitacion`, `Color_idColor`, `Largo_Pelo_idLargo_Pelo`, `Ubicacion_idUbicacion`, `Est_Perros`, `Est_Ninios`, `Est_Personas`, `Est_Ener`, `Estado_idEstado`, `id_Foto_Principal`, `Ultima_Mod`) VALUES
(1, 'Rihanna', '0000-00-00 00:00:00', 20, 3, '0000-00-00 00:00:00', 8, 1, 10, 0, 0, 0, 0, 3, 0, '0000-00-00 00:00:00'),
(2, 'Rodolfo', '0000-00-00 00:00:00', 20, 2, '0000-00-00 00:00:00', 8, 1, 10, 0, 0, 0, 0, 3, 0, '0000-00-00 00:00:00'),
(3, 'Loba', '0000-00-00 00:00:00', 20, 3, '0000-00-00 00:00:00', 5, 1, 10, 0, 0, 0, 0, 3, 0, '0000-00-00 00:00:00'),
(4, 'Piolina', '0000-00-00 00:00:00', 16, 2, '0000-00-00 00:00:00', 6, 2, 10, 0, 0, 0, 0, 3, 0, '0000-00-00 00:00:00'),
(5, 'Coyote', '0000-00-00 00:00:00', 20, 3, '0000-00-00 00:00:00', 8, 2, 10, 0, 0, 0, 0, 3, 0, '0000-00-00 00:00:00'),
(6, 'Alfonso', '0000-00-00 00:00:00', 20, 2, '0000-00-00 00:00:00', 8, 1, 10, 0, 0, 0, 0, 3, 0, '0000-00-00 00:00:00'),
(7, 'Gordis', '0000-00-00 00:00:00', 25, 2, '0000-00-00 00:00:00', 6, 1, 10, 0, 0, 0, 0, 2, 0, '0000-00-00 00:00:00'),
(8, 'Cholo', '0000-00-00 00:00:00', 26, 3, '0000-00-00 00:00:00', 8, 1, 12, 0, 0, 0, 0, 3, 0, '0000-00-00 00:00:00'),
(9, 'Lana', '0000-00-00 00:00:00', 14, 1, '0000-00-00 00:00:00', 4, 2, 9, 0, 0, 0, 0, 2, 0, '0000-00-00 00:00:00'),
(10, 'Choca', '0000-00-00 00:00:00', 13, 2, '0000-00-00 00:00:00', 6, 1, 9, 0, 0, 0, 0, 3, 0, '0000-00-00 00:00:00'),
(11, 'Daniela', '0000-00-00 00:00:00', 16, 2, '0000-00-00 00:00:00', 5, 1, 9, 0, 0, 0, 0, 2, 0, '0000-00-00 00:00:00'),
(12, 'Leoncio', '0000-00-00 00:00:00', 20, 3, '0000-00-00 00:00:00', 8, 2, 9, 0, 0, 0, 0, 2, 0, '0000-00-00 00:00:00'),
(13, 'Lipigas', '0000-00-00 00:00:00', 13, 2, '0000-00-00 00:00:00', 8, 2, 11, 0, 0, 0, 0, 2, 0, '0000-00-00 00:00:00'),
(14, 'Manchas', '0000-00-00 00:00:00', 13, 2, '0000-00-00 00:00:00', 4, 1, 11, 0, 0, 0, 0, 2, 0, '0000-00-00 00:00:00'),
(15, 'Rucia', '0000-00-00 00:00:00', 15, 2, '0000-00-00 00:00:00', 6, 1, 11, 0, 0, 0, 0, 2, 0, '0000-00-00 00:00:00'),
(16, 'Romulo', '0000-00-00 00:00:00', 24, 4, '0000-00-00 00:00:00', 8, 2, 11, 0, 0, 0, 0, 3, 0, '0000-00-00 00:00:00'),
(17, 'Remo', '0000-00-00 00:00:00', 24, 4, '0000-00-00 00:00:00', 8, 2, 11, 0, 0, 0, 0, 3, 0, '0000-00-00 00:00:00'),
(18, 'Viejita', '0000-00-00 00:00:00', 16, 2, '0000-00-00 00:00:00', 8, 1, 11, 0, 0, 0, 0, 2, 0, '0000-00-00 00:00:00'),
(19, 'Zar', '0000-00-00 00:00:00', 15, 2, '0000-00-00 00:00:00', 8, 2, 11, 0, 0, 0, 0, 3, 0, '0000-00-00 00:00:00'),
(20, 'Orejas', '0000-00-00 00:00:00', 15, 2, '0000-00-00 00:00:00', 8, 1, 11, 0, 0, 0, 0, 3, 0, '0000-00-00 00:00:00'),
(21, 'Zapatilla', '0000-00-00 00:00:00', 25, 3, '0000-00-00 00:00:00', 4, 1, 11, 0, 0, 0, 0, 2, 0, '0000-00-00 00:00:00'),
(22, 'Negro_1', '0000-00-00 00:00:00', 16, 2, '0000-00-00 00:00:00', 8, 1, 11, 0, 0, 0, 0, 2, 0, '0000-00-00 00:00:00'),
(23, 'Lobita', '0000-00-00 00:00:00', 13, 2, '0000-00-00 00:00:00', 6, 1, 11, 0, 0, 0, 0, 3, 0, '0000-00-00 00:00:00'),
(24, 'Pamela', '0000-00-00 00:00:00', 25, 4, '0000-00-00 00:00:00', 8, 2, 4, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00'),
(25, 'Octavio', '0000-00-00 00:00:00', 20, 3, '0000-00-00 00:00:00', 6, 1, 4, 0, 0, 0, 0, 3, 0, '0000-00-00 00:00:00'),
(26, 'Hellen', '0000-00-00 00:00:00', 15, 2, '0000-00-00 00:00:00', 8, 2, 2, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00'),
(27, 'Ulises/chiquitin', '0000-00-00 00:00:00', 6, 1, '0000-00-00 00:00:00', 6, 2, 2, 0, 0, 0, 0, 2, 0, '0000-00-00 00:00:00'),
(28, 'Nonno', '0000-00-00 00:00:00', 13, 2, '0000-00-00 00:00:00', 2, 2, 1, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00'),
(30, 'Pitty', '0000-00-00 00:00:00', 15, 2, '0000-00-00 00:00:00', 6, 1, 1, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00'),
(31, 'Tigrillo', '0000-00-00 00:00:00', 27, 4, '0000-00-00 00:00:00', 2, 1, 3, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00'),
(32, 'Onka', '0000-00-00 00:00:00', 20, 3, '0000-00-00 00:00:00', 2, 1, 3, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00'),
(33, 'Luly', '0000-00-00 00:00:00', 25, 3, '0000-00-00 00:00:00', 6, 1, 3, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00'),
(34, 'Negro_2', '0000-00-00 00:00:00', 15, 2, '0000-00-00 00:00:00', 8, 1, 3, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00'),
(35, 'Pepa', '0000-00-00 00:00:00', 13, 2, '0000-00-00 00:00:00', 6, 1, 5, 0, 0, 0, 0, 2, 0, '0000-00-00 00:00:00'),
(36, 'Pepe', '0000-00-00 00:00:00', 16, 2, '0000-00-00 00:00:00', 8, 1, 6, 0, 0, 0, 0, 2, 0, '0000-00-00 00:00:00'),
(37, 'Pepita', '0000-00-00 00:00:00', 10, 1, '0000-00-00 00:00:00', 6, 1, 6, 0, 0, 0, 0, 2, 0, '0000-00-00 00:00:00'),
(38, 'Soprole', '0000-00-00 00:00:00', 10, 2, '0000-00-00 00:00:00', 4, 2, 7, 0, 0, 0, 0, 3, 0, '0000-00-00 00:00:00'),
(39, 'Canela_1', '0000-00-00 00:00:00', 6, 2, '0000-00-00 00:00:00', 8, 2, 7, 0, 0, 0, 0, 3, 0, '0000-00-00 00:00:00'),
(40, 'Lucas', '0000-00-00 00:00:00', 13, 2, '0000-00-00 00:00:00', 6, 2, 7, 0, 0, 0, 0, 3, 0, '0000-00-00 00:00:00'),
(41, 'Princesa', '0000-00-00 00:00:00', 8, 1, '0000-00-00 00:00:00', 4, 2, 7, 0, 0, 0, 0, 3, 0, '0000-00-00 00:00:00'),
(42, 'Canela_2', '0000-00-00 00:00:00', 20, 2, '0000-00-00 00:00:00', 6, 1, 8, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00'),
(43, 'Negrita (tuerta)', '0000-00-00 00:00:00', 20, 2, '0000-00-00 00:00:00', 8, 1, 8, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00'),
(44, 'El Pinto', '0000-00-00 00:00:00', 20, 3, '0000-00-00 00:00:00', 8, 1, 8, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00'),
(45, 'Blanca (mestiza labradora)', '0000-00-00 00:00:00', 16, 2, '0000-00-00 00:00:00', 6, 1, 8, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00'),
(46, 'Reina Madre', '0000-00-00 00:00:00', 20, 3, '0000-00-00 00:00:00', 8, 1, 8, 0, 0, 0, 0, 1, 0, '0000-00-00 00:00:00'),
(47, 'Nombre', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `perro_has_enfermedad`
--

CREATE TABLE `perro_has_enfermedad` (
  `Perro_idPerro` int(11) NOT NULL,
  `Enfermedad_idEnfermedad` int(11) NOT NULL,
  `Fecha_Inicio` datetime DEFAULT NULL,
  `Fecha_Fin` datetime DEFAULT NULL,
  `Solucionado` int(11) DEFAULT NULL,
  `Ultima_Mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `perro_has_vacunas`
--

CREATE TABLE `perro_has_vacunas` (
  `Perro_idPerro` int(11) NOT NULL,
  `Vacunas_idVacunas` int(11) NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Ultima_Mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `persona`
--

CREATE TABLE `persona` (
  `idPersona` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `Telefono` int(11) DEFAULT NULL,
  `Mail` varchar(45) DEFAULT NULL,
  `Usuario` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `Nivel_Acceso` int(11) DEFAULT NULL,
  `Ultima_Mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `persona_has_aporte`
--

CREATE TABLE `persona_has_aporte` (
  `Persona_idPersona` int(11) NOT NULL,
  `Aporte_idAporte` int(11) NOT NULL,
  `Ultima_Mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tamanio`
--

CREATE TABLE `tamanio` (
  `idTamanio` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  `Ultima_Mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tamanio`
--

INSERT INTO `tamanio` (`idTamanio`, `Nombre`, `Descripcion`, `Ultima_Mod`) VALUES
(1, 'Pequeño', 'desc', NULL),
(2, 'Mediano', 'desc', NULL),
(3, 'Grande', 'desc', NULL),
(4, 'Gigante', 'desc', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tipo_aporte`
--

CREATE TABLE `tipo_aporte` (
  `idTipo_Aporte` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Unidad` varchar(45) DEFAULT NULL,
  `Ultima_Mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_aporte`
--

INSERT INTO `tipo_aporte` (`idTipo_Aporte`, `Nombre`, `Unidad`, `Ultima_Mod`) VALUES
(1, 'Alimento', 'Kg', '0000-00-00 00:00:00'),
(2, 'Dinero', 'CLP', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ubicacion`
--

CREATE TABLE `ubicacion` (
  `idUbicacion` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Lat` double DEFAULT NULL,
  `Longi` double DEFAULT NULL,
  `Ultima_Mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ubicacion`
--

INSERT INTO `ubicacion` (`idUbicacion`, `Nombre`, `Descripcion`, `Lat`, `Longi`, `Ultima_Mod`) VALUES
(1, 'Alvaro Casanova II', 'null', 0, 0, '2016-07-02 22:41:04'),
(2, 'calle Las Pircas', 'null', 0, 0, '0000-00-00 00:00:00'),
(3, 'El bosque/Alvaro Casanova I', 'null', 0, 0, '0000-00-00 00:00:00'),
(4, 'El Prado/ Los Presidentes', 'null', 0, 0, '0000-00-00 00:00:00'),
(5, 'frenta al Prado', 'null', 0, 0, '0000-00-00 00:00:00'),
(6, 'frenta condominio al Prado', 'null', 0, 0, '0000-00-00 00:00:00'),
(7, 'hogar temporal', 'null', 0, 0, '0000-00-00 00:00:00'),
(8, 'La Viña Aquitania', 'null', 0, 0, '0000-00-00 00:00:00'),
(9, 'Maquinaria', 'null', 0, 0, '0000-00-00 00:00:00'),
(10, 'puesto 2', 'null', 0, 0, '0000-00-00 00:00:00'),
(11, 'Puesto 20', 'null', 0, 0, '0000-00-00 00:00:00'),
(12, 'puesto 8', 'null', 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `vacunas`
--

CREATE TABLE `vacunas` (
  `idVacunas` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Ultima_Mod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vacunas`
--

INSERT INTO `vacunas` (`idVacunas`, `Nombre`, `Descripcion`, `Ultima_Mod`) VALUES
(1, 'Octuple', 'null', '0000-00-00 00:00:00'),
(2, 'Antirrabica', 'null', '0000-00-00 00:00:00'),
(3, 'Nombre', 'Descripcion', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apadrina`
--
ALTER TABLE `apadrina`
  ADD KEY `fk_Persona_has_Perro_Perro1_idx` (`Perro_idPerro`),
  ADD KEY `fk_Persona_has_Perro_Persona1_idx` (`Persona_idPersona`);

--
-- Indexes for table `apadrina_has_aporte`
--
ALTER TABLE `apadrina_has_aporte`
  ADD KEY `fk_Apadrina_has_Aporte_Apadrina1_idx` (`Apadrina_Perro_idPerro`),
  ADD KEY `fk_Apadrina_has_Aporte_Aporte1_idx` (`Aporte_idAporte`);

--
-- Indexes for table `aporte`
--
ALTER TABLE `aporte`
  ADD PRIMARY KEY (`idAporte`),
  ADD KEY `fk_Aporte_Tipo_Aporte1_idx` (`Tipo_Aporte_idTipo_Aporte`),
  ADD KEY `fk_Aporte_Persona1_idx` (`Persona_idPersona`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`idColor`);

--
-- Indexes for table `enfermedad`
--
ALTER TABLE `enfermedad`
  ADD PRIMARY KEY (`idEnfermedad`);

--
-- Indexes for table `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`idEstado`);

--
-- Indexes for table `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`idFoto`),
  ADD KEY `fk_Foto_Perro1_idx` (`Perro_idPerro`);

--
-- Indexes for table `frecuencia`
--
ALTER TABLE `frecuencia`
  ADD PRIMARY KEY (`idFrecuencia`);

--
-- Indexes for table `largo_pelo`
--
ALTER TABLE `largo_pelo`
  ADD PRIMARY KEY (`idLargo_Pelo`);

--
-- Indexes for table `operaciones`
--
ALTER TABLE `operaciones`
  ADD PRIMARY KEY (`idOperaciones`);

--
-- Indexes for table `operaciones_has_perro`
--
ALTER TABLE `operaciones_has_perro`
  ADD KEY `fk_Operaciones_has_Perro_Perro1_idx` (`Perro_idPerro`),
  ADD KEY `fk_Operaciones_has_Perro_Operaciones1_idx` (`Operaciones_idOperaciones`);

--
-- Indexes for table `perro`
--
ALTER TABLE `perro`
  ADD PRIMARY KEY (`idPerro`),
  ADD KEY `fk_Perro_Tamanio1_idx` (`Tamanio_idTamanio`),
  ADD KEY `fk_Perro_Color1_idx` (`Color_idColor`),
  ADD KEY `fk_Perro_LargoPelo1_idx` (`Largo_Pelo_idLargo_Pelo`),
  ADD KEY `fk_Perro_Ubicacion1_idx` (`Ubicacion_idUbicacion`),
  ADD KEY `fk_Perro_Estado1_idx` (`Estado_idEstado`);

--
-- Indexes for table `perro_has_enfermedad`
--
ALTER TABLE `perro_has_enfermedad`
  ADD KEY `fk_Perro_has_Enfermedad_Enfermedad1_idx` (`Enfermedad_idEnfermedad`),
  ADD KEY `fk_Perro_has_Enfermedad_Perro1_idx` (`Perro_idPerro`);

--
-- Indexes for table `perro_has_vacunas`
--
ALTER TABLE `perro_has_vacunas`
  ADD KEY `fk_Perro_has_Vacunas_Vacunas1_idx` (`Vacunas_idVacunas`),
  ADD KEY `fk_Perro_has_Vacunas_Perro1_idx` (`Perro_idPerro`);

--
-- Indexes for table `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idPersona`);

--
-- Indexes for table `persona_has_aporte`
--
ALTER TABLE `persona_has_aporte`
  ADD KEY `fk_Persona_has_Aporte_Persona1_idx` (`Persona_idPersona`),
  ADD KEY `fk_Persona_has_Aporte_Aporte1_idx` (`Aporte_idAporte`);

--
-- Indexes for table `tamanio`
--
ALTER TABLE `tamanio`
  ADD PRIMARY KEY (`idTamanio`);

--
-- Indexes for table `tipo_aporte`
--
ALTER TABLE `tipo_aporte`
  ADD PRIMARY KEY (`idTipo_Aporte`);

--
-- Indexes for table `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`idUbicacion`);

--
-- Indexes for table `vacunas`
--
ALTER TABLE `vacunas`
  ADD PRIMARY KEY (`idVacunas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aporte`
--
ALTER TABLE `aporte`
  MODIFY `idAporte` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `idColor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `enfermedad`
--
ALTER TABLE `enfermedad`
  MODIFY `idEnfermedad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `estado`
--
ALTER TABLE `estado`
  MODIFY `idEstado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `largo_pelo`
--
ALTER TABLE `largo_pelo`
  MODIFY `idLargo_Pelo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `operaciones`
--
ALTER TABLE `operaciones`
  MODIFY `idOperaciones` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `perro`
--
ALTER TABLE `perro`
  MODIFY `idPerro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `persona`
--
ALTER TABLE `persona`
  MODIFY `idPersona` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tamanio`
--
ALTER TABLE `tamanio`
  MODIFY `idTamanio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tipo_aporte`
--
ALTER TABLE `tipo_aporte`
  MODIFY `idTipo_Aporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `idUbicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `vacunas`
--
ALTER TABLE `vacunas`
  MODIFY `idVacunas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `apadrina`
--
ALTER TABLE `apadrina`
  ADD CONSTRAINT `fk_Persona_has_Perro_Perro1` FOREIGN KEY (`Perro_idPerro`) REFERENCES `perro` (`idPerro`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Persona_has_Perro_Persona1` FOREIGN KEY (`Persona_idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `apadrina_has_aporte`
--
ALTER TABLE `apadrina_has_aporte`
  ADD CONSTRAINT `fk_Apadrina_has_Aporte_Apadrina1` FOREIGN KEY (`Apadrina_Perro_idPerro`) REFERENCES `apadrina` (`Perro_idPerro`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Apadrina_has_Aporte_Aporte1` FOREIGN KEY (`Aporte_idAporte`) REFERENCES `aporte` (`idAporte`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `aporte`
--
ALTER TABLE `aporte`
  ADD CONSTRAINT `fk_Aporte_Persona1` FOREIGN KEY (`Persona_idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Aporte_Tipo_Aporte1` FOREIGN KEY (`Tipo_Aporte_idTipo_Aporte`) REFERENCES `tipo_aporte` (`idTipo_Aporte`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `fk_Foto_Perro1` FOREIGN KEY (`Perro_idPerro`) REFERENCES `perro` (`idPerro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `operaciones_has_perro`
--
ALTER TABLE `operaciones_has_perro`
  ADD CONSTRAINT `fk_Operaciones_has_Perro_Operaciones1` FOREIGN KEY (`Operaciones_idOperaciones`) REFERENCES `operaciones` (`idOperaciones`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Operaciones_has_Perro_Perro1` FOREIGN KEY (`Perro_idPerro`) REFERENCES `perro` (`idPerro`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `perro`
--
ALTER TABLE `perro`
  ADD CONSTRAINT `fk_Perro_Color1` FOREIGN KEY (`Color_idColor`) REFERENCES `color` (`idColor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Perro_Estado1` FOREIGN KEY (`Estado_idEstado`) REFERENCES `estado` (`idEstado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Perro_LargoPelo1` FOREIGN KEY (`Largo_Pelo_idLargo_Pelo`) REFERENCES `largo_pelo` (`idLargo_Pelo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Perro_Tamanio1` FOREIGN KEY (`Tamanio_idTamanio`) REFERENCES `tamanio` (`idTamanio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Perro_Ubicacion1` FOREIGN KEY (`Ubicacion_idUbicacion`) REFERENCES `ubicacion` (`idUbicacion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `perro_has_enfermedad`
--
ALTER TABLE `perro_has_enfermedad`
  ADD CONSTRAINT `fk_Perro_has_Enfermedad_Enfermedad1` FOREIGN KEY (`Enfermedad_idEnfermedad`) REFERENCES `enfermedad` (`idEnfermedad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Perro_has_Enfermedad_Perro1` FOREIGN KEY (`Perro_idPerro`) REFERENCES `perro` (`idPerro`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `perro_has_vacunas`
--
ALTER TABLE `perro_has_vacunas`
  ADD CONSTRAINT `fk_Perro_has_Vacunas_Perro1` FOREIGN KEY (`Perro_idPerro`) REFERENCES `perro` (`idPerro`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Perro_has_Vacunas_Vacunas1` FOREIGN KEY (`Vacunas_idVacunas`) REFERENCES `vacunas` (`idVacunas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `persona_has_aporte`
--
ALTER TABLE `persona_has_aporte`
  ADD CONSTRAINT `fk_Persona_has_Aporte_Aporte1` FOREIGN KEY (`Aporte_idAporte`) REFERENCES `aporte` (`idAporte`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Persona_has_Aporte_Persona1` FOREIGN KEY (`Persona_idPersona`) REFERENCES `persona` (`idPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
