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
CREATE TABLE IF NOT EXISTS `Admin`
(
	`id` int(2) NOT NULL AUTO_INCREMENT,
	`is_enabled` tinyint(1) NOT NULL DEFAULT 1,
	`username` varchar(25) NOT NULL,
	`password` varchar(255) NOT NULL,
	`first_name` varchar(50) NOT NULL,
	`last_name` varchar(50) NOT NULL,
	`email` varchar(100) DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `username` (`username`),
	UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncate table before insert `admin`
--

TRUNCATE TABLE `Admin`;

--
-- Dumping data for table `Admin`
--

INSERT INTO `Admin` (`id`, `is_enabled`, `username`, `password`, `first_name`, `last_name`, `email`) VALUES
(1, 1, 'admin', '$2y$10$PG7XDyG.umXMdG36sutkG.IZI6XW8jnciKtOMhD4/2Eov4WlNeiIu', 'Mohamed Adem', 'Ben Moussa', 'MohamedAdemBenMoussa@Gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
CREATE TABLE IF NOT EXISTS `Category`
(
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`is_enabled` tinyint(1) NOT NULL DEFAULT 1,
	`label` varchar(255) NOT NULL,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `label` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
CREATE TABLE IF NOT EXISTS `Product`
(
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`is_enabled` tinyint(1) NOT NULL DEFAULT 1,
	`name` varchar(255) NOT NULL,
	`description` varchar(255) DEFAULT NULL,
	`image` varchar(255) NOT NULL,
	`viewed` int(11) NOT NULL DEFAULT 1,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncate table before insert `Product`
--

TRUNCATE TABLE `Product`;

--
-- Dumping data for table `Product`
--

-- INSERT

-- --------------------------------------------------------

--
-- Table structure for table `Product_Provider`
--

DROP TABLE IF EXISTS `Product_Provider`;
CREATE TABLE IF NOT EXISTS `Product_Provider`
(
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`is_enabled` tinyint(1) NOT NULL DEFAULT 1,
	`price` decimal(10,0) NOT NULL,
	`link` varchar(255) DEFAULT NULL,
	`product_id` int(11) NOT NULL,
	`provider_id` int(11) NOT NULL,
	`sub_category_id` int(11) NOT NULL,
	PRIMARY KEY (`id`),
	KEY `fk_product` (`product_id`),
	KEY `fk_provider` (`provider_id`),
	KEY `fk_sub_category` (`sub_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncate table before insert `Product_Provider`
--

TRUNCATE TABLE `Product_Provider`;

--
-- Dumping data for table `Product_Provider`
--

-- INSERT

-- --------------------------------------------------------

--
-- Table structure for table `Provider`
--

DROP TABLE IF EXISTS `Provider`;
CREATE TABLE IF NOT EXISTS `Provider`
(
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`is_enabled` tinyint(1) NOT NULL DEFAULT 1,
	`name` varchar(255) NOT NULL,
	`adresse` varchar(255) NOT NULL,
	`image` varchar(255) NOT NULL,
	`link` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncate table before insert `Provider`
--

TRUNCATE TABLE `Provider`;

--
-- Dumping data for table `Provider`
--

-- INSERT

-- --------------------------------------------------------

--
-- Table structure for table `Sub_Category`
--

DROP TABLE IF EXISTS `Sub_Category`;
CREATE TABLE IF NOT EXISTS `Sub_Category`
(
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`is_enabled` tinyint(1) NOT NULL DEFAULT 1,
	`name` varchar(255) NOT NULL,
	`category_id` int(11) NOT NULL,
	PRIMARY KEY (`id`),
	KEY `fk_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncate table before insert `Sub_Category`
--

TRUNCATE TABLE `Sub_Category`;

--
-- Dumping data for table `Sub_Category`
--

-- INSERT

-- --------------------------------------------------------

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Product_Provider`
--

ALTER TABLE `product_provider`
	ADD CONSTRAINT `fk_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	ADD CONSTRAINT `fk_provider` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	ADD CONSTRAINT `fk_sub_category` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_category`
--

ALTER TABLE `sub_category`
	ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
