-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2018 at 06:03 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xrplife`
--
CREATE DATABASE IF NOT EXISTS `xrplife` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `xrplife`;

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dob` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `bank` int(11) NOT NULL,
  `playerid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clothing`
--

CREATE TABLE IF NOT EXISTS `clothing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `face` text NOT NULL,
  `beard` text NOT NULL,
  `haircut` text NOT NULL,
  `shirt` text NOT NULL,
  `pants` text NOT NULL,
  `hands` text NOT NULL,
  `shoes` text NOT NULL,
  `eyes` text NOT NULL,
  `accessories` text NOT NULL,
  `items` text NOT NULL,
  `decals` text NOT NULL,
  `innershirts` text NOT NULL,
  `char_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `char_id` (`char_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE IF NOT EXISTS `inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weapons` text NOT NULL,
  `items` text NOT NULL,
  `char_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `char_id` (`char_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `rank` varchar(255) NOT NULL,
  `banned_data` text NOT NULL,
  `whitelisted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `props`
--

CREATE TABLE IF NOT EXISTS `props` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hats` text NOT NULL,
  `glasses` text NOT NULL,
  `ears` text NOT NULL,
  `char_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `char_id` (`char_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `turbo` tinyint(1) NOT NULL,
  `components` text NOT NULL,
  `char_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `char_id` (`char_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `characters`
--
ALTER TABLE `characters`
  ADD CONSTRAINT `characters_ibfk_1` FOREIGN KEY (`playerid`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `clothing`
--
ALTER TABLE `clothing`
  ADD CONSTRAINT `clothing_ibfk_1` FOREIGN KEY (`char_id`) REFERENCES `characters` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`char_id`) REFERENCES `characters` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `props`
--
ALTER TABLE `props`
  ADD CONSTRAINT `props_ibfk_1` FOREIGN KEY (`char_id`) REFERENCES `characters` (`id`);

--
-- Constraints for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `vehicles_ibfk_1` FOREIGN KEY (`char_id`) REFERENCES `characters` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
