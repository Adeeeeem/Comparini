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

INSERT INTO `product` (`id`, `is_enabled`, `name`, `quantity`, `unit`, `flavor`, `description`, `manufacture`, `sub_category_id`, `viewed`) VALUES
(1, 1, 'Nectar', '1', 'L', 'Orange', 'Nectar', 'ALMARAI', 1, 1),
(2, 1, 'Nectar', '1', 'L', 'Pomme', 'Nectar', 'ALMARAI', 1, 1),
(3, 1, 'Nectar', '1', 'L', 'Mangue', 'Nectar', 'ALMARAI', 1, 1),
(4, 1, 'Boisson Au Jus', '125', 'ML', 'Tropical', 'Juice', 'FRUZZY', 1, 1),
(5, 1, 'Boisson Au Jus', '20', 'CL', 'Poire', 'Juice', 'DÉLICE', 1, 1),
(6, 1, 'Boisson Au Jus', '20', 'CL', 'Ananas', 'Juice', 'DÉLICE', 1, 1),
(7, 1, 'Nectar', '20', 'CL', 'Mangue', 'Nectar', 'DÉLICE', 1, 1),
(8, 1, 'Boisson Au Jus', '20', 'CL', 'Orange', 'Juice', 'DÉLICE', 1, 1),
(9, 1, 'Nectar', '20', 'CL', 'Multivitaminé', 'Nectar', 'DÉLICE', 1, 1),
(10, 1, 'Boisson Instantanée', '30', 'GR', 'Peche', 'Instant Drink', 'FRUITO', 1, 1),
(11, 1, 'Boisson Instantanée', '30', 'GR', 'Mangue', 'Instant Drink', 'FRUITO', 1, 1),
(12, 1, 'Boisson Instantanée', '30', 'GR', 'Cocktail', 'Instant Drink', 'FRUITO', 1, 1),
(13, 1, 'Boisson Instantanée', '30', 'GR', 'Ananas', 'Instant Drink', 'FRUITO', 1, 1),
(14, 1, 'Boisson Instantanée', '30', 'GR', 'Orange', 'Instant Drink', 'FRUITO', 1, 1),
(15, 1, 'Boisson Instantanée', '30', 'GR', 'Fraise', 'Instant Drink', 'FRUITO', 1, 1),
(16, 1, 'Boisson Instantanée', '30', 'GR', 'Citron', 'Instant Drink', 'FRUITO', 1, 1),
(17, 1, 'Boisson Au Jus', '20', 'CL', 'Cocktail', 'Juice', 'TROPICO', 1, 1),
(18, 1, 'Boisson Au Jus', '20', 'CL', 'Ananas', 'Juice', 'STIL', 1, 1),
(19, 1, 'Boisson Au Jus', '20', 'CL', 'Orange', 'Juice', 'STIL', 1, 1),
(20, 1, 'Boisson Au Jus', '20', 'CL', 'Mangue', 'Juice', 'STIL', 1, 1),
(21, 1, 'Boisson Au Jus', '20', 'CL', 'Banane Fraise', 'Juice', 'STIL', 1, 1),
(22, 1, 'Boisson Au Jus', '25', 'CL', 'Banane Orange', 'Juice', 'OH', 1, 1),
(23, 1, 'Boisson Au Jus', '25', 'CL', 'Poire', 'Juice', 'OH', 1, 1),
(24, 1, 'Boisson Au Jus', '25', 'CL', 'Tropical', 'Juice', 'STIL', 1, 1),
(25, 1, 'Boisson Au Jus', '25', 'CL', 'Cocktail Energy', 'Juice', 'STIL', 1, 1),
(26, 1, 'Boisson Au Jus', '235', 'CL', 'Mangue', 'Juice', 'BEYTI', 1, 1),
(27, 1, 'Boisson Au Jus', '235', 'CL', 'Orange', 'Juice', 'BEYTI', 1, 1),
(28, 1, 'Citronnade Frais', '0330', 'L', '', 'Others', 'ORTO', 1, 1),
(29, 1, 'Boisson Au Jus', '250', 'ML', 'Tropical', 'Juice', 'LA FRUITIERE', 1, 1),
(30, 1, 'Boisson Au Jus', '250', 'ML', 'Citron Menthe', 'Juice', 'LA FRUITIERE', 1, 1),
(31, 1, 'Boisson Au Jus', '24', 'CL', 'Banane Fraise', 'Juice', 'RANI', 1, 1),
(32, 1, 'Boisson Au Jus', '24', 'CL', 'Ananas', 'Juice', 'RANI', 1, 1),
(33, 1, 'Boisson Au Jus', '24', 'CL', 'Peche', 'Juice', 'RANI', 1, 1),
(34, 1, 'Boisson Au Jus', '24', 'CL', 'Orange Pulpe', 'Juice', 'RANI', 1, 1),
(35, 1, 'Boisson Au Jus', '24', 'CL', 'Mangue', 'Juice', 'RANI', 1, 1),
(36, 1, 'Boisson Au Jus Au Pulpe', '24', 'CL', 'Cocktail', 'Juice', 'RANI', 1, 1),
(37, 1, 'Boisson Au Jus', '250', 'ML', 'Fruits Healthy Multi Smoothie', 'Juice', 'YUMY', 1, 1),
(38, 1, 'Boisson Au Jus', '250', 'ML', 'Healthy Smoothie Vert', 'Juice', 'YUMY', 1, 1),
(39, 1, 'Boisson Au Jus', '250', 'ML', 'Healthy Rouge Smoothie', 'Juice', 'YUMY', 1, 1),
(40, 1, 'Boisson Au Jus', '250', 'ML', 'Energie Healthy Smoothie', 'Juice', 'YUMY', 1, 1),
(41, 1, 'Nectar', '1', 'L', 'Tropical', 'Nectar', 'DÉLICE', 1, 1),
(42, 1, 'Boisson Au Jus', '1', 'L', 'Orange', 'Juice', 'DÉLICE', 1, 1),
(43, 1, 'Boisson Au Jus', '1', 'L', 'Poire', 'Juice', 'DÉLICE', 1, 1),
(44, 1, 'Nectar', '1', 'L', 'Mangue', 'Nectar', 'DÉLICE', 1, 1),
(45, 1, 'Nectar', '1', 'L', 'Multivitaminé', 'Nectar', 'DÉLICE', 1, 1),
(46, 1, 'Boisson Au Jus', '1', 'L', 'Mojito', 'Juice', 'DÉLICE', 1, 1),
(47, 1, 'Boisson Au Jus', '1', 'L', 'Ananas', 'Juice', 'DÉLICE', 1, 1),
(48, 1, 'Boisson Au Jus', '1', 'L', 'Cocktail', 'Juice', 'TROPICO', 1, 1),
(49, 1, 'Boisson Au Jus', '250', 'ML', 'Ananas', 'Juice', 'LA FRUITIERE', 1, 1),
(50, 1, 'Boisson Au Jus', '250', 'ML', 'Pomme', 'Juice', 'LA FRUITIERE', 1, 1),
(51, 1, 'Boisson Au Jus', '250', 'ML', 'Peche', 'Juice', 'LA FRUITIERE', 1, 1),
(52, 1, 'Boisson Au Jus', '250', 'ML', 'Orange', 'Juice', 'LA FRUITIERE', 1, 1),
(53, 1, 'Boisson Au Jus', '1', 'L', 'Ananas', 'Juice', 'DIVA', 1, 1),
(54, 1, 'Boisson Au Jus', '1', 'L', 'Orange', 'Juice', 'DIVA', 1, 1),
(55, 1, 'Boisson Au Jus', '1', 'L', 'Orange', 'Juice', 'STIL', 1, 1),
(56, 1, 'Boisson Au Jus', '1', 'L', 'Tropical', 'Juice', 'STIL', 1, 1),
(57, 1, 'Boisson Au Jus', '1', 'L', 'Ananas', 'Juice', 'STIL', 1, 1),
(58, 1, 'Boisson Au Jus', '1', 'L', 'Cocktail', 'Juice', 'STIL', 1, 1),
(59, 1, 'Boisson Au Jus', '1', 'L', '', 'Juice', 'OH', 1, 1),
(60, 1, 'Jus De Grenade', '330', 'ML', '', 'Juice', 'BOQUERIA', 1, 1),
(61, 1, 'Citronnade', '1', 'L', '', 'Others', 'BOQUERIA', 1, 1),
(62, 1, 'Citronnade Frais', '1', 'L', '', 'Others', 'ORTO', 1, 1),
(63, 1, 'Boisson Au Jus', '2', 'L', 'Orange', 'Juice', 'STIL', 1, 1),
(64, 1, 'Jus', '1', 'L', 'Mojito', 'Juice', 'BOQUERIA', 1, 1),
(65, 1, 'Jus 100% Naturel', '75', 'CL', 'Noir Raisin', 'Juice', 'NATURA', 1, 1),
(66, 1, 'Boisson Concentrée', '1', 'L', 'Citron Orgeat', 'Concentrated Drink', 'JAWHARA', 1, 1),
(67, 1, 'Boisson Concentrée', '1', 'L', 'Fraise', 'Concentrated Drink', 'JAWHARA', 1, 1),
(68, 1, 'Boisson Concentrée', '1', 'L', 'Cocktail', 'Concentrated Drink', 'JAWHARA', 1, 1),
(69, 1, 'Boisson Concentrée', '1', 'L', 'Orgeat', 'Concentrated Drink', 'HAZEM', 1, 1),
(70, 1, 'Boisson Concentrée', '1', 'L', 'Arôme Pistache', 'Concentrated Drink', 'HAZEM', 1, 1),
(71, 1, 'Boisson Concentrée', '1', 'L', 'Menthe', 'Concentrated Drink', 'HAZEM', 1, 1),
(72, 1, 'Boisson Concentrée', '1', 'L', 'Grenadine', 'Concentrated Drink', 'HAZEM', 1, 1),
(73, 1, 'Sirop', '075', 'L', 'Chocolat', 'Syrup', 'JAWHARA', 1, 1),
(74, 1, 'Jus 100% Naturel', '75', 'CL', 'Raisin Rouge', 'Juice', 'NATURA', 1, 1),
(75, 1, 'Jus 100% Naturel', '75', 'CL', 'Pomme', 'Juice', 'NATURA', 1, 1),
(76, 1, 'Jus 100% Naturel', '75', 'CL', 'Peche', 'Juice', 'NATURA', 1, 1),
(77, 1, 'Boisson Concentrée', '1', 'L', 'Citron', 'Concentrated Drink', 'HAZEM', 1, 1),
(78, 1, 'Boisson Concentrée', '1', 'L', 'Fraise', 'Concentrated Drink', 'HAZEM', 1, 1),
(79, 1, 'Boisson Concentrée', '1', 'L', 'Ananas', 'Concentrated Drink', 'HAZEM', 1, 1),
(80, 1, 'Boisson Concentrée', '1', 'L', 'Orange', 'Concentrated Drink', 'HAZEM', 1, 1),
(81, 1, 'Boisson Concentrée', '1', 'L', 'Cocktail', 'Concentrated Drink', 'HAZEM', 1, 1),
(82, 1, 'Sirop', '700', 'ML', 'Arôme Menthe', 'Syrup', 'LA FRUITIERE', 1, 1),
(83, 1, 'Sirop', '700', 'ML', 'Arôme Pêche', 'Syrup', 'LA FRUITIERE', 1, 1),
(84, 1, 'Sirop', '700', 'ML', 'Arôme Pinacolada', 'Syrup', 'LA FRUITIERE', 1, 1),
(85, 1, 'Sirop', '700', 'ML', 'Arôme Curacao', 'Syrup', 'LA FRUITIERE', 1, 1),
(86, 1, 'Sirop', '700', 'ML', 'Arôme Citron Kiwi Melon', 'Syrup', 'LA FRUITIERE', 1, 1),
(87, 1, 'Sirop', '700', 'ML', 'Arôme Vanille', 'Syrup', 'LA FRUITIERE', 1, 1),
(88, 1, 'Boisson Au Jus', '125', 'ML', 'Orange', 'Juice', 'FRUZZY', 1, 1),
(89, 1, 'Boisson Au Jus', '19', 'CL', 'Tropical', 'Juice', 'FRUZZY', 1, 1),
(90, 1, 'Boisson Au Jus', '20', 'CL', 'Pêche', 'Juice', 'STIL', 1, 1),
(91, 1, 'Boisson Au Jus', '20', 'CL', 'Cocktail', 'Juice', 'STIL', 1, 1),
(92, 1, 'Boisson Au Jus', '20', 'CL', 'Mangue', 'Juice', 'DÉLICE', 1, 1),
(93, 1, 'Boisson Instantanée', '30', 'GR', 'Fraise', 'Instant Drink', 'SANGO', 1, 1),
(94, 1, 'Boisson Instantanée', '30', 'GR', 'Tropical', 'Instant Drink', 'SANGO', 1, 1),
(95, 1, 'Boisson Au Jus', '25', 'CL', 'Energy Mangue', 'Juice', 'STIL', 1, 1),
(96, 1, 'Boisson Au Jus', '23.5', 'CL', 'Orange', 'Juice', 'BEYTI', 1, 1),
(97, 1, 'Boisson Au Jus', '23.5', 'CL', 'Mangue', 'Juice', 'BEYTI', 1, 1),
(98, 1, 'Citronnade', '330', 'ML', '', 'Others', 'BOQUERIA', 1, 1),
(99, 1, 'Boisson Au Jus', '1', 'L', 'Mangue', 'Juice', 'STIL', 1, 1),
(100, 1, 'Boisson Au Jus', '1', 'L', 'Raisin', 'Juice', 'DÉLICE', 1, 1),
(101, 1, 'Boisson Au Jus', '1', 'L', 'Pêche', 'Juice', 'DÉLICE', 1, 1),
(102, 1, 'Boisson Au Jus', '250', 'ML', 'Grenade', 'Juice', 'LA FRUITIERE', 1, 1),
(103, 1, 'Boisson Au Jus', '2', 'L', 'Cocktail', 'Juice', 'STIL', 1, 1),
(104, 1, 'Nectar', '1', 'L', 'Ananas Orange', 'Nectar', 'VITRAC', 1, 1),
(105, 1, 'Nectar', '1', 'L', 'Goyave', 'Nectar', 'VITRAC', 1, 1),
(106, 1, 'Nectar', '1', 'L', 'Pomme', 'Nectar', 'VITRAC', 1, 1),
(107, 1, 'Nectar', '1', 'L', 'Mangue', 'Nectar', 'VITRAC', 1, 1),
(108, 1, 'Boisson Au Jus', '1', 'L', 'Orange', 'Juice', 'BEYTI', 1, 1),
(109, 1, 'Boisson Au Jus', '1', 'L', 'Mangue', 'Juice', 'BEYTI', 1, 1),
(110, 1, 'Jus 100% Naturel', '75', 'CL', 'Fleur Grenade Oranger', 'Juice', 'NATURA', 1, 1),
(111, 1, 'Sirop', '1', 'L', 'Pistache', 'Syrup', 'JAWHARA', 1, 1),
(112, 1, 'Sirop', '1', 'L', 'Arôme Pistache', 'Syrup', 'HAZEM', 1, 1),
(113, 1, 'Sirop', '0.75', 'L', 'Framboise', 'Syrup', 'JAWHARA', 1, 1),
(114, 1, 'Sirop', '0.75', 'L', 'Chocolat', 'Syrup', 'JAWHARA', 1, 1),
(115, 1, 'Sirop', '0.75', 'L', 'Caramel', 'Syrup', 'JAWHARA', 1, 1),
(116, 1, 'Sirop', '0.75', 'L', 'Vanille', 'Syrup', 'JAWHARA', 1, 1),
(117, 1, 'Sirop', '700', 'ML', 'Plate Pêche', 'Syrup', 'LA FRUITIERE', 1, 1),
(118, 1, 'Boisson Concentrée', '4', 'L', 'Pêche', 'Concentrated Drink', 'HAZEM', 1, 1),
(119, 1, 'Boisson Concentrée', '3', 'L', 'Citron Orgeat', 'Concentrated Drink', 'JAWHARA', 1, 1),
(120, 1, 'Sirop', '700', 'ML', 'Fraise', 'Syrup', 'LA FRUITIERE', 1, 1),
(121, 1, 'Sirop', '700', 'ML', 'Mangue', 'Syrup', 'LA FRUITIERE', 1, 1),
(122, 1, 'Sirop', '700', 'ML', 'Ananas', 'Syrup', 'LA FRUITIERE', 1, 1),
(123, 1, 'Boisson Concentrée', '4', 'L', 'Citron', 'Concentrated Drink', 'HAZEM', 1, 1),
(124, 1, 'Sirop', '700', 'ML', 'Passion', 'Syrup', 'LA FRUITIERE', 1, 1),
(125, 1, 'Boisson Concentrée', '4', 'L', 'Ananas', 'Concentrated Drink', 'HAZEM', 1, 1),
(126, 1, 'Boisson Concentrée', '4', 'L', 'Cocktail', 'Concentrated Drink', 'HAZEM', 1, 1),
(127, 1, 'Boisson Concentrée', '4', 'L', 'Arôme Grenadine', 'Concentrated Drink', 'HAZEM', 1, 1),
(128, 1, 'Boisson Concentrée', '4', 'L', 'Arôme Pistache', 'Concentrated Drink', 'HAZEM', 1, 1),
(129, 1, 'Boisson Au Jus', '75', 'CL', 'Relax', 'Juice', 'DÉLICE', 1, 1),
(130, 1, 'Boisson Au Jus', '2', 'L', 'Mangue', 'Juice', 'STIL', 1, 1),
(131, 1, 'Jus', '1', 'L', 'Orange Sanguine', 'Juice', 'SANTAL', 1, 1),
(132, 1, 'Jus', '1', 'L', 'Poire', 'Juice', 'SANTAL', 1, 1),
(133, 1, 'Boisson Au Jus', '750', 'ML', 'Confort Pomme', 'Juice', 'DÉLICE', 1, 1),
(134, 1, 'Boisson Au Jus', '750', 'ML', 'Cocktail Exotique Relax', 'Juice', 'DÉLICE', 1, 1),
(135, 1, 'Nectar', '1', 'L', 'Raisin Rouge', 'Nectar', 'VITRAC', 1, 1),
(136, 1, 'Boisson Au Jus', '19', 'CL', 'Orange', 'Juice', 'Fruzzy', 1, 1),
(137, 1, 'Boisson Au Jus', '1', 'L', 'Limonade', 'Juice', 'DÉLICE', 1, 1),
(138, 1, 'Jus 100% Naturel', '75', 'CL', 'Fleur Orangers', 'Juice', 'NATURA', 1, 1),
(139, 1, 'Boisson Instantanée', '30', 'GR', 'Ananas', 'Instant Drink', 'SANGO', 1, 1),
(140, 1, 'Boisson Instantanée', '30', 'GR', 'Orange', 'Instant Drink', 'SANGO', 1, 1),
(141, 1, 'Boisson Instantanée', '30', 'GR', 'Citron', 'Instant Drink', 'SANGO', 1, 1),
(142, 1, 'Boisson Au Jus', '1', 'L', 'Orange', 'Juice', 'TROPICANA', 1, 1),
(143, 1, 'Boisson Au Jus', '25', 'CL', 'Orange', 'Juice', 'STIL', 1, 1),
(144, 1, 'Boisson Au Jus', '1', 'L', 'Bravo', 'Juice', 'RAUCH', 1, 1),
(145, 1, 'Boisson Au Jus', '1', 'L', 'Raisin', 'Juice', 'DIVA', 1, 1),
(146, 1, 'Boisson Au Jus', '1', 'L', 'Grenade', 'Juice', 'DIVA', 1, 1),
(147, 1, 'Boisson Au Jus', '1', 'L', 'Blancs Fruits', 'Juice', 'DÉLICE', 1, 1),
(148, 1, 'Boisson Au Jus', '1', 'L', 'Pomme Verte', 'Juice', 'DÉLICE', 1, 1),
(149, 1, 'Boisson Instantanée', '30', 'GR', 'Pêche', 'Instant Drink', 'SANGO', 1, 1),
(150, 1, 'Boisson Au Jus', '1', 'L', 'Mangue', 'Juice', 'DIVA', 1, 1),
(151, 1, 'Boisson Au Jus', '1', 'L', 'Multivitaminé', 'Juice', 'DIVA', 1, 1);

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

INSERT INTO `product_provider` (`id`, `is_enabled`, `last_updated_date`, `price`, `image`, `link`, `product_id`, `provider_id`) VALUES
(1, 1, '2023-07-08', 7.990, 'https://courses.monoprix.tn/ezzahra/159911-large_default/nectar.jpg', 'https://courses.monoprix.tn/ezzahra/nectar-de-fruits/34037-nectar.html', 1, 1),
(2, 1, '2023-07-08', 9.990, 'https://courses.monoprix.tn/ezzahra/159910-large_default/nectar.jpg', 'https://courses.monoprix.tn/ezzahra/nectar-de-fruits/34036-nectar.html', 2, 1),
(3, 1, '2023-07-08', 9.990, 'https://courses.monoprix.tn/ezzahra/159912-large_default/nectar.jpg', 'https://courses.monoprix.tn/ezzahra/nectar-de-fruits/34038-nectar.html', 3, 1),
(4, 1, '2023-07-08', 0.580, 'https://courses.monoprix.tn/ezzahra/131013-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/20407-boisson-au-jus.html', 4, 1),
(5, 1, '2023-07-08', 0.800, 'https://courses.monoprix.tn/ezzahra/129112-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16809-boisson-au-jus.html', 5, 1),
(6, 1, '2023-07-08', 0.800, 'https://courses.monoprix.tn/ezzahra/155211-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/32164-boisson-au-jus.html', 6, 1),
(7, 1, '2023-07-08', 0.800, 'https://courses.monoprix.tn/ezzahra/155902-large_default/nectar.jpg', 'https://courses.monoprix.tn/ezzahra/nectar-de-fruits/19198-nectar.html', 7, 1),
(8, 1, '2023-07-08', 0.800, 'https://courses.monoprix.tn/ezzahra/155900-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/19196-boisson-au-jus.html', 8, 1),
(9, 1, '2023-07-08', 0.800, 'https://courses.monoprix.tn/ezzahra/155901-large_default/nectar.jpg', 'https://courses.monoprix.tn/ezzahra/nectar-de-fruits/19197-nectar.html', 9, 1),
(10, 1, '2023-07-08', 0.840, 'https://courses.monoprix.tn/ezzahra/132612-large_default/boisson-instantanée.jpg', 'https://courses.monoprix.tn/ezzahra/boissons-instantanées/22978-boisson-instantanée.html', 10, 1),
(11, 1, '2023-07-08', 0.840, 'https://courses.monoprix.tn/ezzahra/132611-large_default/boisson-instantanée.jpg', 'https://courses.monoprix.tn/ezzahra/boissons-instantanées/22979-boisson-instantanée.html', 11, 1),
(12, 1, '2023-07-08', 0.840, 'https://courses.monoprix.tn/ezzahra/130999-large_default/boisson-instantanée.jpg', 'https://courses.monoprix.tn/ezzahra/boissons-instantanées/20393-boisson-instantanée.html', 12, 1),
(13, 1, '2023-07-08', 0.840, 'https://courses.monoprix.tn/ezzahra/130998-large_default/boisson-instantanée.jpg', 'https://courses.monoprix.tn/ezzahra/boissons-instantanées/20392-boisson-instantanée.html', 13, 1),
(14, 1, '2023-07-08', 0.840, 'https://courses.monoprix.tn/ezzahra/130995-large_default/boisson-instantanée.jpg', 'https://courses.monoprix.tn/ezzahra/boissons-instantanées/20389-boisson-instantanée.html', 14, 1),
(15, 1, '2023-07-08', 0.840, 'https://courses.monoprix.tn/ezzahra/130997-large_default/boisson-instantanée.jpg', 'https://courses.monoprix.tn/ezzahra/boissons-instantanées/20391-boisson-instantanée.html', 15, 1),
(16, 1, '2023-07-08', 0.840, 'https://courses.monoprix.tn/ezzahra/130996-large_default/boisson-instantanée.jpg', 'https://courses.monoprix.tn/ezzahra/boissons-instantanées/20390-boisson-instantanée.html', 16, 1),
(17, 1, '2023-07-08', 0.890, 'https://courses.monoprix.tn/ezzahra/155897-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/19192-boisson-au-jus.html', 17, 1),
(18, 1, '2023-07-08', 1.000, 'https://courses.monoprix.tn/ezzahra/146233-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16806-boisson-au-jus.html', 18, 1),
(19, 1, '2023-07-08', 1.000, 'https://courses.monoprix.tn/ezzahra/155905-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/19201-boisson-au-jus.html', 19, 1),
(20, 1, '2023-07-08', 1.000, 'https://courses.monoprix.tn/ezzahra/155907-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/19203-boisson-au-jus.html', 20, 1),
(21, 1, '2023-07-08', 1.000, 'https://courses.monoprix.tn/ezzahra/143003-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/27577-boisson-au-jus.html', 21, 1),
(22, 1, '2023-07-08', 1.250, 'https://courses.monoprix.tn/ezzahra/129103-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16818-boisson-au-jus.html', 22, 1),
(23, 1, '2023-07-08', 1.250, 'https://courses.monoprix.tn/ezzahra/129097-large_default/nectar.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16824-nectar.html', 23, 1),
(24, 1, '2023-07-08', 1.320, 'https://courses.monoprix.tn/ezzahra/129119-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16802-boisson-au-jus.html', 24, 1),
(25, 1, '2023-07-08', 1.320, 'https://courses.monoprix.tn/ezzahra/129116-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16805-boisson-au-jus.html', 25, 1),
(26, 1, '2023-07-08', 1.590, 'https://courses.monoprix.tn/ezzahra/158551-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/33778-boisson-au-jus.html', 26, 1),
(27, 1, '2023-07-08', 1.590, 'https://courses.monoprix.tn/ezzahra/158552-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/33779-boisson-au-jus.html', 27, 1),
(28, 1, '2023-07-08', 1.990, 'https://courses.monoprix.tn/ezzahra/152960-large_default/citronnade-frais.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/28934-citronnade-frais.html', 28, 1),
(29, 1, '2023-07-08', 2.290, 'https://courses.monoprix.tn/ezzahra/143024-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/27599-boisson-au-jus.html', 29, 1),
(30, 1, '2023-07-08', 2.290, 'https://courses.monoprix.tn/ezzahra/143021-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/27596-boisson-au-jus.html', 30, 1),
(31, 1, '2023-07-08', 2.790, 'https://courses.monoprix.tn/ezzahra/154721-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16348-boisson-au-jus.html', 31, 1),
(32, 1, '2023-07-08', 2.790, 'https://courses.monoprix.tn/ezzahra/154722-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16349-boisson-au-jus.html', 32, 1),
(33, 1, '2023-07-08', 2.790, 'https://courses.monoprix.tn/ezzahra/154723-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16350-boisson-au-jus.html', 33, 1),
(34, 1, '2023-07-08', 2.790, 'https://courses.monoprix.tn/ezzahra/129553-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16351-boisson-au-jus.html', 34, 1),
(35, 1, '2023-07-08', 2.790, 'https://courses.monoprix.tn/ezzahra/154716-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/20399-boisson-au-jus.html', 35, 1),
(36, 1, '2023-07-08', 2.790, 'https://courses.monoprix.tn/ezzahra/146221-large_default/boisson-au-jus-au-pulpe.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/23571-boisson-au-jus-au-pulpe.html', 36, 1),
(37, 1, '2023-07-08', 2.990, 'https://courses.monoprix.tn/ezzahra/158894-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/32812-boisson-au-jus.html', 37, 1),
(38, 1, '2023-07-08', 2.990, 'https://courses.monoprix.tn/ezzahra/158895-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/32813-boisson-au-jus.html', 38, 1),
(39, 1, '2023-07-08', 2.990, 'https://courses.monoprix.tn/ezzahra/158893-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/32811-boisson-au-jus.html', 39, 1),
(40, 1, '2023-07-08', 2.990, 'https://courses.monoprix.tn/ezzahra/158892-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/32810-boisson-au-jus.html', 40, 1),
(41, 1, '2023-07-08', 3.120, 'https://courses.monoprix.tn/ezzahra/129128-large_default/nectar.jpg', 'https://courses.monoprix.tn/ezzahra/nectar-de-fruits/16793-nectar.html', 41, 1),
(42, 1, '2023-07-08', 3.120, 'https://courses.monoprix.tn/ezzahra/155908-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/19204-boisson-au-jus.html', 42, 1),
(43, 1, '2023-07-08', 3.120, 'https://courses.monoprix.tn/ezzahra/155909-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/19205-boisson-au-jus.html', 43, 1),
(44, 1, '2023-07-08', 3.120, 'https://courses.monoprix.tn/ezzahra/155911-large_default/nectar.jpg', 'https://courses.monoprix.tn/ezzahra/nectar-de-fruits/19207-nectar.html', 44, 1),
(45, 1, '2023-07-08', 3.120, 'https://courses.monoprix.tn/ezzahra/155912-large_default/nectar.jpg', 'https://courses.monoprix.tn/ezzahra/nectar-de-fruits/19208-nectar.html', 45, 1),
(46, 1, '2023-07-08', 3.120, 'https://courses.monoprix.tn/ezzahra/155913-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/19209-boisson-au-jus.html', 46, 1),
(47, 1, '2023-07-08', 3.120, 'https://courses.monoprix.tn/ezzahra/143918-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/29318-boisson-au-jus.html', 47, 1),
(48, 1, '2023-07-08', 3.190, 'https://courses.monoprix.tn/ezzahra/155898-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/19193-boisson-au-jus.html', 48, 1),
(49, 1, '2023-07-08', 2.290, 'https://courses.monoprix.tn/ezzahra/146223-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/27594-boisson-au-jus.html', 49, 1),
(50, 1, '2023-07-08', 2.290, 'https://courses.monoprix.tn/ezzahra/146222-large_default/nectar.jpg', 'https://courses.monoprix.tn/ezzahra/nectar-de-fruits/27595-nectar.html', 50, 1),
(51, 1, '2023-07-08', 2.290, 'https://courses.monoprix.tn/ezzahra/143022-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/27597-boisson-au-jus.html', 51, 1),
(52, 1, '2023-07-08', 2.290, 'https://courses.monoprix.tn/ezzahra/143023-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/27598-boisson-au-jus.html', 52, 1),
(53, 1, '2023-07-08', 2.740, 'https://courses.monoprix.tn/ezzahra/129106-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16815-boisson-au-jus.html', 53, 1),
(54, 1, '2023-07-08', 2.740, 'https://courses.monoprix.tn/ezzahra/129105-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16816-boisson-au-jus.html', 54, 1),
(55, 1, '2023-07-08', 3.390, 'https://courses.monoprix.tn/ezzahra/129120-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16801-boisson-au-jus.html', 55, 1),
(56, 1, '2023-07-08', 3.400, 'https://courses.monoprix.tn/ezzahra/129129-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16792-boisson-au-jus.html', 56, 1),
(57, 1, '2023-07-08', 3.400, 'https://courses.monoprix.tn/ezzahra/129123-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16798-boisson-au-jus.html', 57, 1),
(58, 1, '2023-07-08', 3.400, 'https://courses.monoprix.tn/ezzahra/129121-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16800-boisson-au-jus.html', 58, 1),
(59, 1, '2023-07-08', 3.940, 'https://courses.monoprix.tn/ezzahra/155893-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/nectar-de-fruits/19188-boisson-au-jus.html', 59, 1),
(60, 1, '2023-07-08', 4.100, 'https://courses.monoprix.tn/ezzahra/157256-large_default/jus-de-grenade.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/32161-jus-de-grenade.html', 60, 1),
(61, 1, '2023-07-08', 5.300, 'https://courses.monoprix.tn/ezzahra/152740-large_default/citronnade.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/28790-citronnade.html', 61, 1),
(62, 1, '2023-07-08', 4.780, 'https://courses.monoprix.tn/ezzahra/147364-large_default/citronnade-frais.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/30735-citronnade-frais.html', 62, 1),
(63, 1, '2023-07-08', 5.100, 'https://courses.monoprix.tn/ezzahra/129124-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16797-boisson-au-jus.html', 63, 1),
(64, 1, '2023-07-08', 7.580, 'https://courses.monoprix.tn/ezzahra/152743-large_default/jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/28793-jus.html', 64, 1),
(65, 1, '2023-07-08', 9.190, 'https://courses.monoprix.tn/ezzahra/154074-large_default/jus-100-naturel.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/29886-jus-100-naturel.html', 65, 1),
(66, 1, '2023-07-08', 9.290, 'https://courses.monoprix.tn/ezzahra/129131-large_default/boisson-concentrée.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/16790-boisson-concentrée.html', 66, 1),
(67, 1, '2023-07-08', 9.290, 'https://courses.monoprix.tn/ezzahra/132258-large_default/boisson-concentrée.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/22035-boisson-concentrée.html', 67, 1),
(68, 1, '2023-07-08', 9.290, 'https://courses.monoprix.tn/ezzahra/132259-large_default/boisson-concentrée.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/22036-boisson-concentrée.html', 68, 1),
(69, 1, '2023-07-08', 7.990, 'https://courses.monoprix.tn/ezzahra/132609-large_default/boisson-concentrée.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/22981-boisson-concentrée.html', 69, 1),
(70, 1, '2023-07-08', 7.990, 'https://courses.monoprix.tn/ezzahra/131019-large_default/boisson-concentrée.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/20413-boisson-concentrée.html', 70, 1),
(71, 1, '2023-07-08', 9.490, 'https://courses.monoprix.tn/ezzahra/161439-large_default/boisson-concentrée.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/19712-boisson-concentrée.html', 71, 1),
(72, 1, '2023-07-08', 8.390, 'https://courses.monoprix.tn/ezzahra/161440-large_default/boisson-concentrée.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/19711-boisson-concentrée.html', 72, 1),
(73, 1, '2023-07-08', 8.990, 'https://courses.monoprix.tn/ezzahra/159909-large_default/sirop.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/34035-sirop.html', 73, 1),
(74, 1, '2023-07-08', 9.190, 'https://courses.monoprix.tn/ezzahra/154075-large_default/jus-100-naturel.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/27588-jus-100-naturel.html', 74, 1),
(75, 1, '2023-07-08', 9.190, 'https://courses.monoprix.tn/ezzahra/135595-large_default/jus-100-naturel.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/25359-jus-100-naturel.html', 75, 1),
(76, 1, '2023-07-08', 9.190, 'https://courses.monoprix.tn/ezzahra/134620-large_default/jus-100-naturel.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/24361-jus-100-naturel.html', 76, 1),
(77, 1, '2023-07-08', 9.490, 'https://courses.monoprix.tn/ezzahra/131020-large_default/boisson-concentrée.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/20414-boisson-concentrée.html', 77, 1),
(78, 1, '2023-07-08', 9.490, 'https://courses.monoprix.tn/ezzahra/131021-large_default/boisson-concentrée.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/20415-boisson-concentrée.html', 78, 1),
(79, 1, '2023-07-08', 9.490, 'https://courses.monoprix.tn/ezzahra/132246-large_default/boisson-concentrée.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/22023-boisson-concentrée.html', 79, 1),
(80, 1, '2023-07-08', 9.490, 'https://courses.monoprix.tn/ezzahra/132245-large_default/boisson-concentrée.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/22022-boisson-concentrée.html', 80, 1),
(81, 1, '2023-07-08', 9.490, 'https://courses.monoprix.tn/ezzahra/131022-large_default/boisson-concentrée.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/20416-boisson-concentrée.html', 81, 1),
(82, 1, '2023-07-08', 15.530, 'https://courses.monoprix.tn/ezzahra/143060-large_default/sirop.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/27637-sirop.html', 82, 1),
(83, 1, '2023-07-08', 17.440, 'https://courses.monoprix.tn/ezzahra/143061-large_default/sirop.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/27638-sirop.html', 83, 1),
(84, 1, '2023-07-08', 19.550, 'https://courses.monoprix.tn/ezzahra/143058-large_default/sirop.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/27635-sirop.html', 84, 1),
(85, 1, '2023-07-08', 20.610, 'https://courses.monoprix.tn/ezzahra/143002-large_default/sirop.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/27576-sirop.html', 85, 1),
(86, 1, '2023-07-08', 22.720, 'https://courses.monoprix.tn/ezzahra/152563-large_default/sirop.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/27575-sirop.html', 86, 1),
(87, 1, '2023-07-08', 23.780, 'https://courses.monoprix.tn/ezzahra/143059-large_default/sirop.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/27636-sirop.html', 87, 1),
(88, 1, '2023-07-08', 0.550, 'https://www.geantdrive.tn/azur-city/1143615-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/31276-boisson-au-jus.html', 88, 2),
(89, 1, '2023-07-08', 0.550, 'https://www.geantdrive.tn/azur-city/1143618-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/31277-boisson-au-jus.html', 4, 2),
(90, 1, '2023-07-08', 0.790, 'https://www.geantdrive.tn/azur-city/1143609-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/31273-boisson-au-jus.html', 89, 2),
(91, 1, '2023-07-08', 0.840, 'https://www.geantdrive.tn/azur-city/1217215-large_default/boisson-instantanee.jpg', 'https://www.geantdrive.tn/azur-city/boissons-instantanees/30643-boisson-instantanee.html', 12, 2),
(92, 1, '2023-07-08', 0.840, 'https://www.geantdrive.tn/azur-city/1217199-large_default/boisson-instantanee.jpg', 'https://www.geantdrive.tn/azur-city/boissons-instantanees/30637-boisson-instantanee.html', 14, 2),
(93, 1, '2023-07-08', 0.840, 'https://www.geantdrive.tn/azur-city/1217204-large_default/boisson-instantanee.jpg', 'https://www.geantdrive.tn/azur-city/boissons-instantanees/30638-boisson-instantanee.html', 16, 2),
(94, 1, '2023-07-08', 0.840, 'https://www.geantdrive.tn/azur-city/1217207-large_default/boisson-instantanee.jpg', 'https://www.geantdrive.tn/azur-city/boissons-instantanees/30639-boisson-instantanee.html', 11, 2),
(95, 1, '2023-07-08', 0.840, 'https://www.geantdrive.tn/azur-city/1217208-large_default/boisson-instantanee.jpg', 'https://www.geantdrive.tn/azur-city/boissons-instantanees/30640-boisson-instantanee.html', 15, 2),
(96, 1, '2023-07-08', 0.840, 'https://www.geantdrive.tn/azur-city/1217211-large_default/boisson-instantanee.jpg', 'https://www.geantdrive.tn/azur-city/boissons-instantanees/30641-boisson-instantanee.html', 13, 2),
(97, 1, '2023-07-08', 0.840, 'https://www.geantdrive.tn/azur-city/1217214-large_default/boisson-instantanee.jpg', 'https://www.geantdrive.tn/azur-city/boissons-instantanees/30642-boisson-instantanee.html', 10, 2),
(98, 1, '2023-07-08', 0.870, 'https://www.geantdrive.tn/azur-city/1195854-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24340-boisson-au-jus.html', 19, 2),
(99, 1, '2023-07-08', 1.600, 'https://www.geantdrive.tn/azur-city/1193367-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24342-boisson-au-jus.html', 8, 2),
(100, 1, '2023-07-08', 1.600, 'https://www.geantdrive.tn/azur-city/1105735-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/72656-boisson-au-jus.html', 6, 2),
(101, 1, '2023-07-08', 0.870, 'https://www.geantdrive.tn/azur-city/1159847-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/45259-boisson-au-jus.html', 21, 2),
(102, 1, '2023-07-08', 0.870, 'https://www.geantdrive.tn/azur-city/1161683-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/88172-boisson-au-jus.html', 90, 2),
(103, 1, '2023-07-08', 0.870, 'https://www.geantdrive.tn/azur-city/1195857-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24593-boisson-au-jus.html', 91, 2),
(104, 1, '2023-07-08', 0.870, 'https://www.geantdrive.tn/azur-city/1193376-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24662-nectar.html', 92, 2),
(105, 1, '2023-07-08', 0.870, 'https://www.geantdrive.tn/azur-city/1195863-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24571-boisson-au-jus.html', 18, 2),
(106, 1, '2023-07-08', 0.870, 'https://www.geantdrive.tn/azur-city/1195859-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24594-boisson-au-jus.html', 20, 2),
(107, 1, '2023-07-08', 1.600, 'https://www.geantdrive.tn/azur-city/1193370-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/nectar-de-fruits/24663-nectar.html', 9, 2),
(108, 1, '2023-07-08', 1.600, 'https://www.geantdrive.tn/azur-city/1193373-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24596-boisson-au-jus.html', 5, 2),
(109, 1, '2023-07-08', 0.890, 'https://www.geantdrive.tn/azur-city/1164339-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24601-boisson-au-jus.html', 17, 2),
(110, 1, '2023-07-08', 0.850, 'https://www.geantdrive.tn/azur-city/1192853-large_default/boisson-instantanee.jpg', 'https://www.geantdrive.tn/azur-city/boissons-instantanees/50733-boisson-instantanee.html', 93, 2),
(111, 1, '2023-07-08', 0.850, 'https://www.geantdrive.tn/azur-city/1187983-large_default/boisson-instantannee.jpg', 'https://www.geantdrive.tn/azur-city/boissons-instantanees/24343-boisson-instantannee.html', 94, 2),
(112, 1, '2023-07-08', 1.190, 'https://www.geantdrive.tn/azur-city/1165685-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/nectar-de-fruits/24666-nectar.html', 23, 2),
(113, 1, '2023-07-08', 1.190, 'https://www.geantdrive.tn/azur-city/1163670-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24598-boisson-au-jus.html', 22, 2),
(114, 1, '2023-07-08', 1.200, 'https://www.geantdrive.tn/azur-city/1145997-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24320-boisson-au-jus.html', 95, 2),
(115, 1, '2023-07-08', 1.200, 'https://www.geantdrive.tn/azur-city/1207414-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24576-boisson-au-jus.html', 24, 2),
(116, 1, '2023-07-08', 1.200, 'https://www.geantdrive.tn/azur-city/1207406-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24577-boisson-au-jus.html', 25, 2),
(117, 1, '2023-07-08', 1.490, 'https://www.geantdrive.tn/azur-city/902320-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/75611-boisson-au-jus.html', 96, 2),
(118, 1, '2023-07-08', 1.490, 'https://www.geantdrive.tn/azur-city/902321-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/75612-boisson-au-jus.html', 97, 2),
(119, 1, '2023-07-08', 1.600, 'https://www.geantdrive.tn/azur-city/1076371-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/eaux-et-boissons/96660-nectar.html', 7, 2),
(120, 1, '2023-07-08', 2.400, 'https://www.geantdrive.tn/azur-city/1210558-large_default/citronnade.jpg', 'https://www.geantdrive.tn/azur-city/jus-de-fruits-frais/97237-citronnade.html', 98, 2),
(121, 1, '2023-07-08', 2.290, 'https://www.geantdrive.tn/azur-city/1160379-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/46323-boisson-au-jus.html', 30, 2),
(122, 1, '2023-07-08', 2.290, 'https://www.geantdrive.tn/azur-city/1160374-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/46085-boisson-au-jus.html', 29, 2),
(123, 1, '2023-07-08', 3.090, 'https://www.geantdrive.tn/azur-city/1207419-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24579-boisson-au-jus.html', 58, 2),
(124, 1, '2023-07-08', 3.090, 'https://www.geantdrive.tn/azur-city/1207422-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24580-boisson-au-jus.html', 99, 2),
(125, 1, '2023-07-08', 3.090, 'https://www.geantdrive.tn/azur-city/1207417-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24333-boisson-au-jus.html', 55, 2),
(126, 1, '2023-07-08', 3.090, 'https://www.geantdrive.tn/azur-city/1211188-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24582-boisson-au-jus.html', 56, 2),
(127, 1, '2023-07-08', 3.100, 'https://www.geantdrive.tn/azur-city/1151129-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/39352-boisson-au-jus.html', 100, 2),
(128, 1, '2023-07-08', 3.100, 'https://www.geantdrive.tn/azur-city/1210050-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24588-boisson-au-jus.html', 101, 2),
(129, 1, '2023-07-08', 3.100, 'https://www.geantdrive.tn/azur-city/1210064-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/nectar-de-fruits/24617-nectar.html', 45, 2),
(130, 1, '2023-07-08', 3.100, 'https://www.geantdrive.tn/azur-city/1106276-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/60791-boisson-au-jus.html', 47, 2),
(131, 1, '2023-07-08', 3.100, 'https://www.geantdrive.tn/azur-city/1210058-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/nectar-de-fruits/24616-nectar.html', 41, 2),
(132, 1, '2023-07-08', 3.100, 'https://www.geantdrive.tn/azur-city/1210061-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/nectar-de-fruits/24618-nectar.html', 44, 2),
(133, 1, '2023-07-08', 3.190, 'https://www.geantdrive.tn/azur-city/1164916-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24589-boisson-au-jus.html', 48, 2),
(134, 1, '2023-07-08', 2.290, 'https://www.geantdrive.tn/azur-city/1160377-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/46322-boisson-au-jus.html', 51, 2),
(135, 1, '2023-07-08', 2.290, 'https://www.geantdrive.tn/azur-city/1160382-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/46324-nectar.html', 50, 2),
(136, 1, '2023-07-08', 2.290, 'https://www.geantdrive.tn/azur-city/1160383-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/nectar-de-fruits/48644-boisson-au-jus.html', 49, 2),
(137, 1, '2023-07-08', 2.290, 'https://www.geantdrive.tn/azur-city/1160376-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/46321-boisson-au-jus.html', 52, 2),
(138, 1, '2023-07-08', 2.740, 'https://www.geantdrive.tn/azur-city/1217280-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24569-boisson-au-jus.html', 53, 2),
(139, 1, '2023-07-08', 2.740, 'https://www.geantdrive.tn/azur-city/1217279-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24338-boisson-au-jus.html', 54, 2),
(140, 1, '2023-07-08', 3.750, 'https://www.geantdrive.tn/azur-city/1164679-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24335-boisson-au-jus.html', 59, 2),
(141, 1, '2023-07-08', 3.250, 'https://www.geantdrive.tn/azur-city/1105734-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/74022-boisson-au-jus.html', 102, 2),
(142, 1, '2023-07-08', 4.700, 'https://www.geantdrive.tn/azur-city/1210561-large_default/citronnade.jpg', 'https://www.geantdrive.tn/azur-city/jus-de-fruits-frais/33654-citronnade.html', 61, 2),
(143, 1, '2023-07-08', 4.850, 'https://www.geantdrive.tn/azur-city/1207431-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24581-boisson-au-jus.html', 103, 2),
(144, 1, '2023-07-08', 5.790, 'https://www.geantdrive.tn/azur-city/1157867-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/nectar-de-fruits/75515-nectar.html', 104, 2),
(145, 1, '2023-07-08', 5.790, 'https://www.geantdrive.tn/azur-city/1160476-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/nectar-de-fruits/48645-nectar.html', 105, 2),
(146, 1, '2023-07-08', 5.790, 'https://www.geantdrive.tn/azur-city/1157862-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/nectar-de-fruits/75512-nectar.html', 106, 2),
(147, 1, '2023-07-08', 5.990, 'https://www.geantdrive.tn/azur-city/1157864-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/nectar-de-fruits/75513-nectar.html', 107, 2),
(148, 1, '2023-07-08', 6.690, 'https://www.geantdrive.tn/azur-city/928830-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/75358-boisson-au-jus.html', 108, 2),
(149, 1, '2023-07-08', 6.690, 'https://www.geantdrive.tn/azur-city/928829-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/76123-boisson-au-jus.html', 109, 2),
(150, 1, '2023-07-08', 7.800, 'https://www.geantdrive.tn/azur-city/1210556-large_default/jus-de-fraise.jpg', 'https://www.geantdrive.tn/azur-city/jus-de-fruits-frais/41424-jus-de-fraise.html', 64, 2),
(151, 1, '2023-07-08', 8.430, 'https://www.geantdrive.tn/azur-city/1144719-large_default/jus-100-naturel.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/41774-jus-100-naturel.html', 75, 2),
(152, 1, '2023-07-08', 8.430, 'https://www.geantdrive.tn/azur-city/1158989-large_default/jus-100-naturel.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/67232-jus-100-naturel.html', 74, 2),
(153, 1, '2023-07-08', 8.430, 'https://www.geantdrive.tn/azur-city/1105788-large_default/jus-100-naturel.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/67248-jus-100-naturel.html', 65, 2),
(154, 1, '2023-07-08', 8.430, 'https://www.geantdrive.tn/azur-city/1143962-large_default/jus-100-naturel.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/33420-jus-100-naturel.html', 110, 2),
(155, 1, '2023-07-08', 8.430, 'https://www.geantdrive.tn/azur-city/1143960-large_default/jus-100-naturel.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/31288-jus-100-naturel.html', 76, 2),
(156, 1, '2023-07-08', 8.690, 'https://www.geantdrive.tn/azur-city/1195160-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/24604-boisson-concentree.html', 66, 2),
(157, 1, '2023-07-08', 8.690, 'https://www.geantdrive.tn/azur-city/1195165-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30930-boisson-concentree.html', 68, 2),
(158, 1, '2023-07-08', 7.990, 'https://www.geantdrive.tn/azur-city/1077606-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/nectar-de-fruits/79815-nectar.html', 1, 2),
(159, 1, '2023-07-08', 7.990, 'https://www.geantdrive.tn/azur-city/1077607-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/nectar-de-fruits/77810-nectar.html', 2, 2),
(160, 1, '2023-07-08', 9.190, 'https://www.geantdrive.tn/azur-city/1195146-large_default/sirop.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30922-sirop.html', 111, 2),
(161, 1, '2023-07-08', 9.390, 'https://www.geantdrive.tn/azur-city/1217105-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/24611-boisson-concentree.html', 71, 2),
(162, 1, '2023-07-08', 7.990, 'https://www.geantdrive.tn/azur-city/1217102-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/24612-boisson-concentree.html', 72, 2),
(163, 1, '2023-07-08', 7.990, 'https://www.geantdrive.tn/azur-city/1217099-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/24613-boisson-concentree.html', 69, 2),
(164, 1, '2023-07-08', 7.990, 'https://www.geantdrive.tn/azur-city/1217097-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30613-boisson-concentree.html', 70, 2),
(165, 1, '2023-07-08', 27.000, 'https://www.geantdrive.tn/azur-city/1167965-large_default/sirop.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30657-sirop.html', 112, 2),
(166, 1, '2023-07-08', 8.990, 'https://www.geantdrive.tn/azur-city/1195156-large_default/sirop.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30927-sirop.html', 113, 2),
(167, 1, '2023-07-08', 8.990, 'https://www.geantdrive.tn/azur-city/1195148-large_default/sirop.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30923-sirop.html', 114, 2),
(168, 1, '2023-07-08', 8.990, 'https://www.geantdrive.tn/azur-city/1195150-large_default/sirop.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30924-sirop.html', 115, 2),
(169, 1, '2023-07-08', 8.990, 'https://www.geantdrive.tn/azur-city/1195152-large_default/sirop.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30925-sirop.html', 116, 2),
(170, 1, '2023-07-08', 16.910, 'https://www.geantdrive.tn/azur-city/1160365-large_default/sirop.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/46081-sirop.html', 83, 2),
(171, 1, '2023-07-08', 22.400, 'https://www.geantdrive.tn/azur-city/1160364-large_default/sirop.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/46080-sirop.html', 86, 2),
(172, 1, '2023-07-08', 22.500, 'https://www.geantdrive.tn/azur-city/1106038-large_default/sirop.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/68346-sirop.html', 117, 2),
(173, 1, '2023-07-08', 22.990, 'https://www.geantdrive.tn/azur-city/1200329-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30989-boisson-concentree.html', 118, 2),
(174, 1, '2023-07-08', 23.490, 'https://www.geantdrive.tn/azur-city/1195166-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/33327-boisson-concentree.html', 119, 2),
(175, 1, '2023-07-08', 25.500, 'https://www.geantdrive.tn/azur-city/1106039-large_default/sirop.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/68347-sirop.html', 120, 2),
(176, 1, '2023-07-08', 25.900, 'https://www.geantdrive.tn/azur-city/1106040-large_default/sirop.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/68348-sirop.html', 121, 2),
(177, 1, '2023-07-08', 26.900, 'https://www.geantdrive.tn/azur-city/1106035-large_default/sirop.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/68343-sirop.html', 122, 2),
(178, 1, '2023-07-08', 28.900, 'https://www.geantdrive.tn/azur-city/1200324-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30988-boisson-concentree.html', 123, 2),
(179, 1, '2023-07-08', 28.900, 'https://www.geantdrive.tn/azur-city/1106037-large_default/sirop.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/68345-sirop.html', 124, 2),
(180, 1, '2023-07-08', 28.900, 'https://www.geantdrive.tn/azur-city/1200337-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30992-boisson-concentree.html', 125, 2),
(181, 1, '2023-07-08', 28.900, 'https://www.geantdrive.tn/azur-city/1200341-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30993-boisson-concentree.html', 126, 2),
(182, 1, '2023-07-08', 30.590, 'https://www.geantdrive.tn/azur-city/1200347-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30995-boisson-concentree.html', 127, 2),
(183, 1, '2023-07-08', 30.590, 'https://www.geantdrive.tn/azur-city/1200350-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30996-boisson-concentree.html', 128, 2),
(184, 1, '2023-07-08', 0.870, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194001801606.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-6194001801606.html', 18, 3),
(185, 1, '2023-07-08', 2.290, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534803633.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-relax-75cl-6191534803633.html', 129, 3),
(186, 1, '2023-07-08', 4.850, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194001801545.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-mangue-stil-null-6194001801545.html', 130, 3),
(187, 1, '2023-07-08', 6.300, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6223001875741_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dorange-1l-6223001875741.html', 108, 3),
(188, 1, '2023-07-08', 6.300, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6223001875802_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-mangue-1l-6223001875802.html', 109, 3),
(189, 1, '2023-07-08', 9.100, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/8/0/8002580028025.jpg', 'https://www.carrefour.tn/default/jus-dorange-sanguine-1l-8002580028025.html', 131, 3),
(190, 1, '2023-07-08', 9.100, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/8/0/8002580028049.jpg', 'https://www.carrefour.tn/default/jus-de-poire-1l-8002580028049.html', 132, 3),
(191, 1, '2023-07-08', 9.280, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6223007520737.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-pomme-6223007520737.html', 2, 3),
(192, 1, '2023-07-08', 9.280, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6223007520751.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dorange-6223007520751.html', 1, 3),
(193, 1, '2023-07-08', 9.280, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6223007520720.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-mangue-6223007520720.html', 3, 3),
(194, 1, '2023-07-08', 2.290, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534803329.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-pomme-confort-null-6191534803329.html', 133, 3),
(195, 1, '2023-07-08', 2.290, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534803336.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-cocktail-exotique-relax-null-6191534803336.html', 134, 3),
(196, 1, '2023-07-08', 3.100, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191402602054.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dananas-250ml-6191402602054.html', 49, 3),
(197, 1, '2023-07-08', 3.050, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191402602047.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-peche-250ml-6191402602047.html', 51, 3),
(198, 1, '2023-07-08', 0.790, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191402902062.jpg', 'https://www.carrefour.tn/default/boisson-instantanee-fraise-30g-6191402902062.html', 93, 3),
(199, 1, '2023-07-08', 5.290, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6221024992742.jpg', 'https://www.carrefour.tn/default/nectar-au-raisin-rouge-de-1l-1l-6221024992742.html', 135, 3),
(200, 1, '2023-07-08', 5.290, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6221024240126-1_2.jpg', 'https://www.carrefour.tn/default/nectar-dorange-de-1l-1l-6221024240126.html', 104, 3),
(201, 1, '2023-07-08', 5.290, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6221024240102_1.jpg', 'https://www.carrefour.tn/default/nectar-a-la-mangue-de-1l-1l-6221024240102.html', 107, 3),
(202, 1, '2023-07-08', 5.290, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6221024240119png.jpg', 'https://www.carrefour.tn/default/nectar-de-goyave-de-1l-1l-6221024240119.html', 105, 3),
(203, 1, '2023-07-08', 0.865, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534803411_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dananas-null-6191534803411.html', 6, 3),
(204, 1, '2023-07-08', 3.910, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194001801095.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-cocktail-2l-6194001801095.html', 103, 3),
(205, 1, '2023-07-08', 3.250, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534803404.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dananas-null-6191534803404.html', 47, 3),
(206, 1, '2023-07-08', 2.450, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6281034903930-1_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-banane-et-fraise-null-6281034903930.html', 31, 3),
(207, 1, '2023-07-08', 3.250, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802902-1_.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-raisin-null-6191534802902.html', 100, 3),
(208, 1, '2023-07-08', 2.500, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6281034906115-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-cocktail-de-fruits-float-null-6281034906115.html', 36, 3),
(209, 1, '2023-07-08', 2.450, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6281034903572-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-a-la-mangue-float-null-6281034903572.html', 35, 3),
(210, 1, '2023-07-08', 2.450, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6281034900182-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dananas-float-null-6281034900182.html', 32, 3),
(211, 1, '2023-07-08', 2.450, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6281034900175-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-peche-float-null-6281034900175.html', 33, 3),
(212, 1, '2023-07-08', 2.450, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6281034016029-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dorange-float-null-6281034016029.html', 34, 3),
(213, 1, '2023-07-08', 0.460, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802667.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dorange-fruzzy-6191534802667.html', 88, 3),
(214, 1, '2023-07-08', 0.790, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802629-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dorange-fruzzy-19cl-6191534802629.html', 136, 3),
(215, 1, '2023-07-08', 3.050, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191402602030.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-orange-250ml-6191402602030.html', 52, 3),
(216, 1, '2023-07-08', 3.100, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191402602061-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-pomme-250ml-6191402602061.html', 50, 3),
(217, 1, '2023-07-08', 1.970, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191402602023-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-tropical-250ml-6191402602023.html', 29, 3),
(218, 1, '2023-07-08', 1.970, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191402602016-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-menthe-citron-250ml-6191402602016.html', 30, 3),
(219, 1, '2023-07-08', 3.250, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802155-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-limonade-1l-6191534802155.html', 137, 3),
(220, 1, '2023-07-08', 8.430, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191470100032_-1.jpg', 'https://www.carrefour.tn/default/jus-de-fleur-dorangers-100-naturel-6191470100032.html', 138, 3),
(221, 1, '2023-07-08', 8.430, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191470100117-1.jpg', 'https://www.carrefour.tn/default/jus-de-peche-100-naturel-6191470100117.html', 76, 3),
(222, 1, '2023-07-08', 0.860, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191514015407-1.jpg', 'https://www.carrefour.tn/default/boisson-instantanee-citron-6191514015407.html', 16, 3),
(223, 1, '2023-07-08', 0.860, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191514015001-1.jpg', 'https://www.carrefour.tn/default/boisson-instantanee-orange-6191514015001.html', 14, 3),
(224, 1, '2023-07-08', 0.860, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191514015100-1.jpg', 'https://www.carrefour.tn/default/boisson-instantanee-mangue-6191514015100.html', 11, 3),
(225, 1, '2023-07-08', 0.860, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191514018552-1.jpg', 'https://www.carrefour.tn/default/boisson-instantanee-cocktail-de-fruits-6191514018552.html', 12, 3),
(226, 1, '2023-07-08', 0.860, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191514015506-1.jpg', 'https://www.carrefour.tn/default/boisson-instantanee-peche-6191514015506.html', 10, 3),
(227, 1, '2023-07-08', 0.860, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191514015605-1.jpg', 'https://www.carrefour.tn/default/boisson-instantanee-ananas-6191514015605.html', 13, 3),
(228, 1, '2023-07-08', 0.860, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191514015209-1.jpg', 'https://www.carrefour.tn/default/boisson-instantanee-fraise-6191514015209.html', 15, 3),
(229, 1, '2023-07-08', 0.790, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191402901782-1_1_1.jpg', 'https://www.carrefour.tn/default/boisson-instantanee-ananas-6191402901782.html', 139, 3),
(230, 1, '2023-07-08', 0.790, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191402901805-1_1_1.jpg', 'https://www.carrefour.tn/default/boisson-instantanee-orange-6191402901805.html', 140, 3),
(231, 1, '2023-07-08', 0.790, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191402901812-1_1_1.jpg', 'https://www.carrefour.tn/default/boisson-instantanee-citron-6191402901812.html', 141, 3),
(232, 1, '2023-07-08', 2.730, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194007880018-1_2.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-cocktail-de-fruits-null-6194007880018.html', 48, 3),
(233, 1, '2023-07-08', 0.790, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194007891793_1_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-multi-vitaminee-20cl-6194007891793.html', 17, 3),
(234, 1, '2023-07-08', 2.590, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191503203709-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dorange-6191503203709.html', 142, 3),
(235, 1, '2023-07-08', 3.150, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194001801200-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-tropical-bnino-6194001801200.html', 56, 3),
(236, 1, '2023-07-08', 2.700, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194001801064-1_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-mangue-1l-6194001801064.html', 99, 3),
(237, 1, '2023-07-08', 2.700, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194001801057-1_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-cocktail-de-fruits-1l-6194001801057.html', 58, 3),
(238, 1, '2023-07-08', 2.700, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194001801040-1_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-orange-1l-6194001801040.html', 55, 3),
(239, 1, '2023-07-08', 1.200, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194001801033-1..jpg', 'https://www.carrefour.tn/default/boisson-au-jus-energy-cocktail-6194001801033.html', 25, 3),
(240, 1, '2023-07-08', 1.200, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194001801026-1_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dorange-6194001801026.html', 143, 3),
(241, 1, '2023-07-08', 1.220, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194001801163-1_2.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-tropical-bnino-25cl-6194001801163.html', 24, 3);
INSERT INTO `product_provider` (`id`, `is_enabled`, `last_updated_date`, `price`, `image`, `link`, `product_id`, `provider_id`) VALUES
(242, 1, '2023-07-08', 0.800, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194019803142-1_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-cocktail-6194001801378.html', 91, 3),
(243, 1, '2023-07-08', 0.800, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194001801361-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-orange-6194001801361.html', 19, 3),
(244, 1, '2023-07-08', 10.200, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/9/0/9008700125147-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-bravo-9008700125147.html', 144, 3),
(245, 1, '2023-07-08', 3.800, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194007892691-1_1_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dorange-banane--6194007892691.html', 59, 3),
(246, 1, '2023-07-08', 0.790, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802636-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-tropical-fruzzy-19cl-6191534802636.html', 89, 3),
(247, 1, '2023-07-08', 3.390, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194007890208-1_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-nectar-de-raisin-6194007890208.html', 145, 3),
(248, 1, '2023-07-08', 2.740, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194007850073.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-nectar-dananas-null-6194007850073.html', 53, 3),
(249, 1, '2023-07-08', 2.740, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194007850066.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-nectar-dorange-null-6194007850066.html', 54, 3),
(250, 1, '2023-07-08', 2.740, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191572143777-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-grenade-6191572143777.html', 146, 3),
(251, 1, '2023-07-08', 0.460, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802674-1_2_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-tropical-fruzzy-6191534802674.html', 4, 3),
(252, 1, '2023-07-08', 3.250, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802162.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-mojito-1l-6191534802162.html', 46, 3),
(253, 1, '2023-07-08', 3.250, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802117.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-nectar-multivitaminee-null-6191534802117.html', 45, 3),
(254, 1, '2023-07-08', 3.250, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802100.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-mangue-null-6191534802100.html', 44, 3),
(255, 1, '2023-07-08', 3.250, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802179.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-nectar-tropical-null-6191534802179.html', 41, 3),
(256, 1, '2023-07-08', 3.250, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802186.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-fruits-blancs-null-6191534802186.html', 147, 3),
(257, 1, '2023-07-08', 3.250, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802148-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-pomme-verte-1l-6191534802148.html', 148, 3),
(258, 1, '2023-07-08', 3.250, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802124.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-peche-null-6191534802124.html', 101, 3),
(259, 1, '2023-07-08', 3.250, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802131.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-poire-null-6191534802131.html', 43, 3),
(260, 1, '2023-07-08', 3.250, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802094.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dorange-null-6191534802094.html', 42, 3),
(261, 1, '2023-07-08', 0.870, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534801851-1_1.jpg', 'https://www.carrefour.tn/default/jus-multi-vitamine-nectar-5-fruits-6-vitamines-null-6191534801851.html', 9, 3),
(262, 1, '2023-07-08', 0.870, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534801813-1_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dorange-null-6191534801813.html', 8, 3),
(263, 1, '2023-07-08', 0.870, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534801844-1_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-mangue-null-6191534801844.html', 7, 3),
(264, 1, '2023-07-08', 0.870, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534801820-1_2.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-poire-null-6191534801820.html', 5, 3),
(265, 1, '2023-07-08', 0.790, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191402902093-1.jpg', 'https://www.carrefour.tn/default/boisson-instantanee-peche-6191402902093.html', 149, 3),
(266, 1, '2023-07-08', 0.790, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191402901799-1.jpg', 'https://www.carrefour.tn/default/boisson-instantanee-tropical-6191402901799.html', 94, 3),
(267, 1, '2023-07-08', 2.740, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194007890185.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-nectar-de-mangue-null-6194007890185.html', 150, 3),
(268, 1, '2023-07-08', 2.740, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194007892936-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-multi-vitaminee-null-6194007892936.html', 151, 3);

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

INSERT INTO `provider` (`id`, `is_enabled`, `name`, `adresse`, `link`) VALUES
(1, 1, 'Monoprix', 'Avenue Taieb Mhiri, Ezzahra', 'https://courses.monoprix.tn/ezzahra/'),
(2, 1, 'Géant', 'Autoroute A1 - Km 2, Ben Arous', 'http://www.geantdrive.tn/azur-city/'),
(3, 1, 'Carrefour', null, 'https://www.carrefour.tn/default/');

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
(3, 1,  'water','Water', 1),
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
	MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `Product_Provider`
--

ALTER TABLE `Product_Provider`
	MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=269;

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
	ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
