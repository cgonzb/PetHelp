-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2016 at 04:16 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `netbau_perros`
--

--
-- Dumping data for table `perro`
--

INSERT INTO `perro` (`idPerro`, `Nombre`, `Fecha_Nacimiento`, `Peso`, `Tamanio_idTamanio`, `Fecha_Ultima_Desparacitacion`, `Color_idColor`, `Largo_Pelo_idLargo_Pelo`, `Ubicacion_idUbicacion`, `Est_Perros`, `Est_Ninios`, `Descripcion`, `Est_Ener`, `Estado_idEstado`, `id_Foto_Principal`, `Ultima_Mod`) VALUES
(1, 'Rihanna', '2014-06-30', 20, 3, '0000-00-00 00:00:00', 8, 1, 10, 0, 3, 'null', 5, 3, 1, '0000-00-00 00:00:00'),
(2, 'Rodolfo', '2014-01-30', 20, 2, '0000-00-00 00:00:00', 8, 1, 10, 0, 5, 'null', 3, 3, 2, '0000-00-00 00:00:00'),
(3, 'Loba', '2014-06-30', 20, 3, '0000-00-00 00:00:00', 5, 1, 10, 0, 5, 'null', 4, 3, 3, '0000-00-00 00:00:00'),
(4, 'Piolina', '2006-06-30', 16, 2, '0000-00-00 00:00:00', 6, 2, 10, 0, 3, 'null', 2, 3, 4, '0000-00-00 00:00:00'),
(5, 'Coyote', '2014-10-30', 20, 3, '0000-00-00 00:00:00', 8, 2, 10, 0, 3, 'null', 3, 3, 5, '0000-00-00 00:00:00'),
(6, 'Alfonso', '2015-06-30', 20, 2, '0000-00-00 00:00:00', 8, 1, 10, 0, 5, 'null', 4, 3, 6, '0000-00-00 00:00:00'),
(7, 'Gordis', '2011-06-30', 25, 2, '0000-00-00 00:00:00', 6, 1, 10, 0, 3, 'null', 2, 2, 7, '0000-00-00 00:00:00'),
(8, 'Cholo', '2013-06-30', 26, 3, '0000-00-00 00:00:00', 8, 1, 12, 0, 0, 'null', 0, 3, 0, '0000-00-00 00:00:00'),
(9, 'Lana', '2012-06-30', 14, 1, '0000-00-00 00:00:00', 4, 2, 9, 0, 0, 'null', 0, 2, 0, '0000-00-00 00:00:00'),
(10, 'Choca', '2011-06-30', 13, 2, '0000-00-00 00:00:00', 6, 1, 9, 0, 0, 'null', 0, 3, 0, '0000-00-00 00:00:00'),
(11, 'Daniela', '2013-06-30', 16, 2, '0000-00-00 00:00:00', 5, 1, 9, 0, 0, 'null', 0, 2, 0, '0000-00-00 00:00:00'),
(12, 'Leoncio', '2013-06-30', 20, 3, '0000-00-00 00:00:00', 8, 2, 9, 0, 3, 'null', 4, 2, 12, '0000-00-00 00:00:00'),
(13, 'Lipigas', '2014-06-30', 13, 2, '0000-00-00 00:00:00', 8, 2, 11, 0, 0, 'null', 0, 2, 0, '0000-00-00 00:00:00'),
(14, 'Manchas', '2015-06-30', 13, 2, '0000-00-00 00:00:00', 4, 1, 11, 0, 0, 'null', 0, 2, 0, '0000-00-00 00:00:00'),
(15, 'Rucia', '2015-03-02', 15, 2, '0000-00-00 00:00:00', 6, 1, 11, 0, 0, 'null', 0, 2, 0, '0000-00-00 00:00:00'),
(16, 'Romulo', '2014-12-30', 24, 4, '0000-00-00 00:00:00', 8, 2, 11, 0, 5, 'null', 5, 3, 16, '0000-00-00 00:00:00'),
(17, 'Remo', '2014-12-30', 24, 4, '0000-00-00 00:00:00', 8, 2, 11, 0, 0, 'null', 0, 3, 0, '0000-00-00 00:00:00'),
(18, 'Viejita', '2011-06-30', 16, 2, '0000-00-00 00:00:00', 8, 1, 11, 0, 0, 'null', 0, 2, 0, '0000-00-00 00:00:00'),
(19, 'Zar', '2015-01-30', 15, 2, '0000-00-00 00:00:00', 8, 2, 11, 0, 5, 'null', 4, 3, 19, '0000-00-00 00:00:00'),
(20, 'Orejas', '2015-03-02', 15, 2, '0000-00-00 00:00:00', 8, 1, 11, 0, 4, 'null', 3, 3, 20, '0000-00-00 00:00:00'),
(21, 'Zapatilla', '2010-06-30', 25, 3, '0000-00-00 00:00:00', 4, 1, 11, 0, 0, 'null', 0, 2, 0, '0000-00-00 00:00:00'),
(22, 'Negro_1', '2014-06-30', 16, 2, '0000-00-00 00:00:00', 8, 1, 11, 0, 3, 'null', 5, 2, 22, '0000-00-00 00:00:00'),
(23, 'Lobita', '2013-06-30', 13, 2, '0000-00-00 00:00:00', 6, 1, 11, 0, 4, 'null', 4, 3, 23, '0000-00-00 00:00:00'),
(24, 'Pamela', '2014-06-30', 25, 4, '0000-00-00 00:00:00', 8, 2, 4, 0, 0, 'null', 0, 1, 0, '0000-00-00 00:00:00'),
(25, 'Octavio', '2012-06-30', 20, 3, '0000-00-00 00:00:00', 6, 1, 4, 0, 1, 'null', 3, 3, 25, '0000-00-00 00:00:00'),
(26, 'Hellen', '2015-03-02', 15, 2, '0000-00-00 00:00:00', 8, 2, 2, 0, 0, 'null', 0, 1, 0, '0000-00-00 00:00:00'),
(27, 'Ulises/chiquitin', '2012-06-30', 6, 1, '0000-00-00 00:00:00', 6, 2, 2, 0, 0, 'null', 0, 2, 0, '0000-00-00 00:00:00'),
(28, 'Nonno', '2013-06-30', 13, 2, '0000-00-00 00:00:00', 2, 2, 1, 0, 2, 'null', 5, 1, 28, '0000-00-00 00:00:00'),
(30, 'Pitty', '2013-06-30', 15, 2, '0000-00-00 00:00:00', 6, 1, 1, 0, 0, 'null', 0, 1, 0, '0000-00-00 00:00:00'),
(31, 'Tigrillo', '2010-06-30', 27, 4, '0000-00-00 00:00:00', 2, 1, 3, 0, 0, 'null', 0, 1, 0, '0000-00-00 00:00:00'),
(32, 'Onka', '2009-06-30', 20, 3, '0000-00-00 00:00:00', 2, 1, 3, 0, 4, 'null', 4, 1, 32, '0000-00-00 00:00:00'),
(33, 'Luly', '2008-06-30', 25, 3, '0000-00-00 00:00:00', 6, 1, 3, 0, 1, 'null', 3, 1, 33, '0000-00-00 00:00:00'),
(34, 'Negro_2', '2015-06-30', 15, 2, '0000-00-00 00:00:00', 8, 1, 3, 0, 0, 'null', 0, 1, 0, '0000-00-00 00:00:00'),
(35, 'Pepa', '2013-06-30', 13, 2, '0000-00-00 00:00:00', 6, 1, 5, 0, 0, 'null', 0, 2, 0, '0000-00-00 00:00:00'),
(36, 'Pepe', '2012-06-30', 16, 2, '0000-00-00 00:00:00', 8, 1, 6, 0, 0, 'null', 0, 2, 0, '0000-00-00 00:00:00'),
(37, 'Pepita', '2015-06-30', 10, 1, '0000-00-00 00:00:00', 6, 1, 6, 0, 0, 'null', 0, 2, 0, '0000-00-00 00:00:00'),
(38, 'Soprole', '2014-06-30', 10, 2, '0000-00-00 00:00:00', 4, 2, 7, 0, 3, 'null', 4, 3, 38, '0000-00-00 00:00:00'),
(39, 'Canela_1', '2016-03-30', 6, 2, '0000-00-00 00:00:00', 8, 2, 7, 0, 0, 'null', 0, 3, 0, '0000-00-00 00:00:00'),
(40, 'Lucas', '2015-10-30', 13, 2, '0000-00-00 00:00:00', 6, 2, 7, 0, 0, 'null', 0, 3, 0, '0000-00-00 00:00:00'),
(41, 'Princesa', '2012-06-30', 8, 1, '0000-00-00 00:00:00', 4, 2, 7, 0, 0, 'null', 0, 3, 0, '0000-00-00 00:00:00'),
(42, 'Canela_2', '2012-06-30', 20, 2, '0000-00-00 00:00:00', 6, 1, 8, 0, 0, 'null', 0, 1, 0, '0000-00-00 00:00:00'),
(43, 'Negrita (tuerta)', '2011-06-30', 20, 2, '0000-00-00 00:00:00', 8, 1, 8, 0, 0, 'null', 0, 1, 0, '0000-00-00 00:00:00'),
(44, 'El Pinto', '2012-06-30', 20, 3, '0000-00-00 00:00:00', 8, 1, 8, 0, 0, 'null', 0, 1, 0, '0000-00-00 00:00:00'),
(45, 'Blanca', '2013-06-30', 16, 2, '0000-00-00 00:00:00', 6, 1, 8, 0, 0, 'null', 0, 1, 0, '0000-00-00 00:00:00'),
(46, 'Reina Madre', '2012-06-30', 20, 3, '0000-00-00 00:00:00', 8, 1, 8, 0, 0, 'null', 0, 1, 0, '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
