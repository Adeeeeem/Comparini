-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Comparini`
--
CREATE DATABASE IF NOT EXISTS `Comparini` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `Comparini`;

-- --------------------------------------------------------

--
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
CREATE TABLE IF NOT EXISTS `Admin` (
	`id` int(2) NOT NULL,
	`is_enabled` tinyint(1) NOT NULL DEFAULT 1,
	`username` varchar(25) NOT NULL,
	`password` varchar(255) NOT NULL,
	`first_name` varchar(50) NOT NULL,
	`last_name` varchar(50) NOT NULL,
	`email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `Admin`:
--

--
-- Truncate table before insert `admin`
--

TRUNCATE TABLE `Admin`;
--
-- Dumping data for table `Admin`
--

INSERT INTO `Admin` (`id`, `is_enabled`, `username`, `password`, `first_name`, `last_name`, `email`) VALUES
(1, 1, 'admin', '$2y$10$PG7XDyG.umXMdG36sutkG.IZI6XW8jnciKtOMhD4/2Eov4WlNeiIu', 'Mohamed Adem', 'Ben Moussa', 'MohamedAdemBenMoussa@Gmail.com');
COMMIT;

-- --------------------------------------------------------

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `label` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONSHIPS FOR TABLE `Category`:
--

--
-- Truncate table before insert `Category`
--

TRUNCATE TABLE `Category`;
--
-- Dumping data for table `Category`
--

INSERT INTO `Category` (`id`, `is_enabled`, `label`, `name`) VALUES
(1, 1, 'fruits_vegetables', 'Fruits and Vegetables'),
(2, 1, 'meat_poultry', 'Meat and Poultry'),
(3, 1, 'seafood', 'Seafood'),
(4, 1, 'dairy_eggs', 'Dairy and Eggs'),
(5, 1, 'bakery_bread', 'Bakery and Bread'),
(6, 1, 'canned_packaged_foods', 'Canned and Packaged Foods'),
(7, 1, 'snacks_confectionery', 'Snacks and Confectionery'),
(8, 1, 'beverages', 'Beverages'),
(9, 1, 'spices_seasonings', 'Spices and Seasonings'),
(10, 1, 'sauces_condiments', 'Sauces and Condiments'),
(11, 1, 'frozen_foods', 'Frozen Foods'),
(12, 1, 'baby_toddler_foods', 'Baby and Toddler Foods'),
(13, 1, 'pet_foods', 'Pet Foods'),
(14, 1, 'health_foods_supplements', 'Health Foods and Supplements'),
(15, 1, 'electronics', 'Electronics');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `label` (`label`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Admin`
--
ALTER TABLE `Admin`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
