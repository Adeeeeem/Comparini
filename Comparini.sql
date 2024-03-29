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
	`id` int(2) NOT NULL,
	`is_enabled` tinyint(1) NOT NULL DEFAULT 1,
	`username` varchar(25) NOT NULL,
	`password` varchar(255) NOT NULL,
	`first_name` varchar(50) NOT NULL,
	`last_name` varchar(50) NOT NULL,
	`email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
	`id` int(11) NOT NULL,
	`is_enabled` tinyint(1) NOT NULL DEFAULT 1,
	`label` varchar(255) NOT NULL,
	`name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncate table before insert `Category`
--

TRUNCATE TABLE `Category`;

--
-- Dumping data for table `Category`
--

INSERT INTO `Category` (`id`, `is_enabled`, `label`, `name`) VALUES
(1, 1, 'beverages', 'Beverages'),
(2, 1, 'fruits_vegetables', 'Fruits and Vegetables'),
(3, 1, 'meat_poultry', 'Meat and Poultry'),
(4, 1, 'dairy_eggs', 'Dairy and Eggs'),
(5, 1, 'seafood', 'Seafood'),
(6, 1, 'bakery_bread', 'Bakery and Bread'),
(7, 1, 'cereal_products', 'Cereal Products');

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
CREATE TABLE IF NOT EXISTS `Product`
(
	`id` int(11) NOT NULL,
	`is_enabled` tinyint(1) NOT NULL DEFAULT 1,
	`name` varchar(255) NOT NULL,
	`quantity` varchar(50) DEFAULT NULL,
	`unit` varchar(50) DEFAULT NULL,
	`flavor` varchar(255) DEFAULT NULL,
	`description` varchar(255) DEFAULT NULL,
	`manufacture` VARCHAR(255) DEFAULT NULL,
	`sub_category_id` int(11) NOT NULL,
	`viewed` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncate table before insert `Product`
--

TRUNCATE TABLE `Product`;

--
-- Dumping data for table `Product`
--



-- --------------------------------------------------------

--
-- Table structure for table `Product_Provider`
--

DROP TABLE IF EXISTS `Product_Provider`;
CREATE TABLE IF NOT EXISTS `Product_Provider`
(
	`id` int(11) NOT NULL,
	`is_enabled` tinyint(1) NOT NULL DEFAULT 1,
	`last_updated_date` date DEFAULT NULL,
	`price` decimal(10,3) DEFAULT NULL,
	`image` varchar(255) DEFAULT NULL,
	`link` varchar(255) DEFAULT NULL,
	`product_id` int(11) NOT NULL,
	`provider_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncate table before insert `Product_Provider`
--

TRUNCATE TABLE `Product_Provider`;

--
-- Dumping data for table `Product_Provider`
--



-- --------------------------------------------------------

--
-- Table structure for table `Provider`
--

DROP TABLE IF EXISTS `Provider`;
CREATE TABLE IF NOT EXISTS `Provider`
(
	`id` int(11) NOT NULL,
	`is_enabled` tinyint(1) NOT NULL DEFAULT 1,
	`name` varchar(255) NOT NULL,
	`adresse` varchar(255) DEFAULT NULL,
	`link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncate table before insert `Provider`
--

TRUNCATE TABLE `Provider`;

--
-- Dumping data for table `Provider`
--

INSERT INTO `Provider` (`id`, `is_enabled`, `name`, `adresse`, `link`) VALUES
(1, 1, 'Monoprix', 'Avenue Taieb Mhiri, Ezzahra', 'https://courses.monoprix.tn/ezzahra/'),
(2, 1, 'Géant', 'Autoroute A1 - Km 2, Ben Arous', 'http://www.geantdrive.tn/azur-city/'),
(3, 1, 'Carrefour', NULL, 'https://www.carrefour.tn/default/');

-- --------------------------------------------------------

--
-- Table structure for table `Sub_Category`
--

DROP TABLE IF EXISTS `Sub_Category`;
CREATE TABLE IF NOT EXISTS `Sub_Category`
(
	`id` int(11) NOT NULL,
	`is_enabled` tinyint(1) NOT NULL DEFAULT 1,
	`label` varchar(255) NOT NULL,
	`name` varchar(255) NOT NULL,
	`category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncate table before insert `Sub_Category`
--

TRUNCATE TABLE `Sub_Category`;

--
-- Dumping data for table `Sub_Category`
--

INSERT INTO `sub_category` (`id`, `is_enabled`, `label`, `name`, `category_id`) VALUES
(1, 1, 'juice', 'Juice', 1),
(2, 1, 'soda', 'Soda', 1),
(3, 1, 'water', 'Water', 1),
(4, 1, 'fruits', 'Fruits', 2),
(5, 1, 'vegetables', 'Vegetables', 2),
(6, 1, 'nuts', 'Nuts', 2),
(7, 1, 'poultry', 'Poultry', 3),
(8, 1, 'beef', 'Beef', 3),
(9, 1, 'lamb', 'Lamb', 3),
(10, 1, 'rabbit', 'Rabbit', 3),
(11, 1, 'deli', 'Deli', 3),
(12, 1, 'milks', 'Milks', 4),
(13, 1, 'yogurt', 'Yogurt', 4),
(14, 1, 'butters', 'Butters', 4),
(15, 1, 'cheeses', 'Cheeses', 4),
(16, 1, 'cakes_ice_cream', 'Cakes and Ice Cream', 4),
(17, 1, 'eggs', 'Eggs', 4),
(18, 1, 'fish', 'Fish', 5),
(19, 1, 'shellfish', 'Shellfish', 5),
(20, 1, 'bread', 'Bread', 6),
(21, 1, 'cakes', 'Cakes', 6),
(22, 1, 'pasta', 'Pasta', 7),
(23, 1, 'flour_semolina', 'Flour And Semolina', 7),
(24, 1, 'couscous', 'Couscous', 7),
(25, 1, 'rice', 'Rice', 7);

-- --------------------------------------------------------


--
-- Indexes for dumped tables
--

--
-- Indexes for table `Admin`
--

ALTER TABLE `Admin`
	ADD PRIMARY KEY `pk_admin` (`id`),
	ADD UNIQUE KEY `uk_admin_username` (`username`),
	ADD UNIQUE KEY `uk_admin_email` (`email`);

--
-- Indexes for table `Category`
--

ALTER TABLE `Category`
	ADD PRIMARY KEY `pk_category` (`id`),
	ADD UNIQUE KEY `uk_category_label` (`label`);

--
-- Indexes for table `Product`
--

ALTER TABLE `Product`
	ADD PRIMARY KEY `pk_product` (`id`),
	ADD KEY `fk_sub_category` (`sub_category_id`);

--
-- Indexes for table `Product_Provider`
--

ALTER TABLE `Product_Provider`
	ADD PRIMARY KEY `pk_product_provider` (`id`),
	ADD KEY `fk_product` (`product_id`),
	ADD KEY `fk_provider` (`provider_id`);

--
-- Indexes for table `Provider`
--

ALTER TABLE `Provider`
	ADD PRIMARY KEY `pk_provider` (`id`);

--
-- Indexes for table `Sub_Category`
--

ALTER TABLE `Sub_Category`
	ADD PRIMARY KEY `pk_sub_category` (`id`),
	ADD KEY `fk_category` (`category_id`);

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

ALTER TABLE `Category`
	MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Product`
--

ALTER TABLE `Product`
	MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `Product_Provider`
--

ALTER TABLE `Product_Provider`
	MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `Provider`
--

ALTER TABLE `Provider`
	MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Sub_Category`
--

ALTER TABLE `Sub_Category`
	MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Product`
--

ALTER TABLE `Product`
	ADD CONSTRAINT `fk_sub_category` FOREIGN KEY (`sub_category_id`) REFERENCES `Sub_Category` (`id`);

--
-- Constraints for table `Product_Provider`
--

ALTER TABLE `Product_Provider`
	ADD CONSTRAINT `fk_product` FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`),
	ADD CONSTRAINT `fk_provider` FOREIGN KEY (`provider_id`) REFERENCES `Provider` (`id`);

--
-- Constraints for table `Sub_Category`
--

ALTER TABLE `Sub_Category`
	ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `Category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
