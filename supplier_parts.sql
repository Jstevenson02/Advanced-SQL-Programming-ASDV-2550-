-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 19, 2022 at 09:02 PM
-- Server version: 8.0.27
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `supplier_parts`
--

-- --------------------------------------------------------

--
-- Table structure for table `part`
--

DROP TABLE IF EXISTS `part`;
CREATE TABLE IF NOT EXISTS `part` (
  `pnumber` varchar(20) NOT NULL,
  `pname` varchar(20) NOT NULL,
  `color` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  PRIMARY KEY (`pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `part`
--

INSERT INTO `part` (`pnumber`, `pname`, `color`, `city`) VALUES
('p1', 'tv', 'black', 'paris'),
('p2', 'tv', 'gray', 'london'),
('p3', 'mixer', 'black', 'paris');

-- --------------------------------------------------------

--
-- Table structure for table `sp`
--

DROP TABLE IF EXISTS `sp`;
CREATE TABLE IF NOT EXISTS `sp` (
  `snumber` varchar(20) NOT NULL,
  `pnumber` varchar(20) NOT NULL,
  `qty` int DEFAULT NULL,
  PRIMARY KEY (`snumber`,`pnumber`),
  KEY `FK_PNUMBER` (`pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp`
--

INSERT INTO `sp` (`snumber`, `pnumber`, `qty`) VALUES
('s1', 'p1', 200),
('s1', 'p2', 300),
('s1', 'p3', 300),
('s2', 'p1', 300),
('s2', 'p2', 300),
('s3', 'p2', 200),
('s3', 'p3', 500),
('s4', 'p1', 200);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `supplier` (
  `snumber` varchar(20) NOT NULL,
  `sname` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `birthday` date NOT NULL DEFAULT '2022-09-10',
  `city` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`snumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`snumber`, `sname`, `status`, `birthday`, `city`) VALUES
('s1', 'white', 20, '1970-08-12', 'paris'),
('s2', 'black', 25, '1980-12-12', 'washington'),
('s3', 'green', 30, '1980-12-12', 'lafayette'),
('s4', 'gray', 30, '1990-12-27', 'paris'),
('s5', 'blue', 25, '2002-12-12', 'london');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sp`
--
ALTER TABLE `sp`
  ADD CONSTRAINT `FK_PNUMBER` FOREIGN KEY (`pnumber`) REFERENCES `part` (`pnumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SNUMBER` FOREIGN KEY (`snumber`) REFERENCES `supplier` (`snumber`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
