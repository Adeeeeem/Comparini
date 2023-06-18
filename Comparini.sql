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
	`viewed` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncate table before insert `Product`
--

TRUNCATE TABLE `Product`;

--
-- Dumping data for table `Product`
--

INSERT INTO `product` (`id`, `is_enabled`, `name`, `quantity`, `unit`, `flavor`, `description`, `manufacture`, `viewed`) VALUES
(150, 1, 'Boisson Au Jus', '125', 'ML', 'Tropical', 'Jus', 'FRUZZY', 1),
(151, 1, 'Boisson Au Jus', '125', 'ML', 'Orange', 'Jus', 'FRUZZY', 1),
(152, 1, 'Boisson Instantanée', '30', 'GR', 'Orange', 'Boisson Instantanée', 'FRUITO', 1),
(153, 1, 'Boisson Instantanée', '30', 'GR', 'Citron', 'Boisson Instantanée', 'FRUITO', 1),
(154, 1, 'Boisson Instantanée', '30', 'GR', 'Fraise', 'Boisson Instantanée', 'FRUITO', 1),
(155, 1, 'Boisson Instantanée', '30', 'GR', 'Ananas', 'Boisson Instantanée', 'FRUITO', 1),
(156, 1, 'Boisson Instantanée', '30', 'GR', 'Cocktail', 'Boisson Instantanée', 'FRUITO', 1),
(157, 1, 'Boisson Instantanée', '30', 'GR', 'Peche', 'Boisson Instantanée', 'FRUITO', 1),
(158, 1, 'Boisson Instantanée', '30', 'GR', 'Mangue', 'Boisson Instantanée', 'FRUITO', 1),
(159, 1, 'Boisson Au Jus', '20', 'CL', 'Orange', 'Jus', 'DÉLICE', 1),
(160, 1, 'Boisson Au Jus', '20', 'CL', 'Ananas', 'Jus', 'DÉLICE', 1),
(161, 1, 'Boisson Au Jus', '20', 'CL', 'Mangue', 'Jus', 'STIL', 1),
(162, 1, 'Boisson Au Jus', '20', 'CL', 'Banane Fraise', 'Jus', 'STIL', 1),
(163, 1, 'Boisson Au Jus', '20', 'CL', 'Orange', 'Jus', 'STIL', 1),
(164, 1, 'Boisson Au Jus', '20', 'CL', 'Cocktail', 'Jus', 'STIL', 1),
(165, 1, 'Boisson Au Jus', '20', 'CL', 'Ananas', 'Jus', 'STIL', 1),
(166, 1, 'Boisson Au Jus', '25', 'CL', 'Mangue', 'Jus', 'STIL', 1),
(167, 1, 'Boisson Au Jus', '25', 'CL', 'Tropical', 'Jus', 'STIL', 1),
(168, 1, 'Boisson Au Jus', '25', 'CL', 'Cocktail Energy', 'Jus', 'STIL', 1),
(169, 1, 'Boisson Au Jus', '24', 'CL', 'Banane Fraise', 'Jus', 'RANI', 1),
(170, 1, 'Boisson Au Jus', '24', 'CL', 'Ananas', 'Jus', 'RANI', 1),
(171, 1, 'Boisson Au Jus', '24', 'CL', 'Peche', 'Jus', 'RANI', 1),
(172, 1, 'Boisson Au Jus', '24', 'CL', 'Orange Pulpe', 'Jus', 'RANI', 1),
(173, 1, 'Citronnade', '330', 'ML', '', NULL, 'BOQUERIA', 1),
(174, 1, 'Boisson Au Jus', '24', 'CL', 'Mangue', 'Jus', 'RANI', 1),
(175, 1, 'Boisson Au Jus', '250', 'ML', 'Orange', 'Jus', 'LA FRUITIERE', 1),
(176, 1, 'Boisson Au Jus', '250', 'ML', 'Peche', 'Jus', 'LA FRUITIERE', 1),
(177, 1, 'Boisson Au Jus', '250', 'ML', 'Pomme', 'Jus', 'LA FRUITIERE', 1),
(178, 1, 'Boisson Au Jus', '250', 'ML', 'Ananas', 'Jus', 'LA FRUITIERE', 1),
(179, 1, 'Boisson Au Jus', '250', 'ML', 'Citron Menthe', 'Jus', 'LA FRUITIERE', 1),
(180, 1, 'Boisson Au Jus', '250', 'ML', 'Tropical', 'Jus', 'LA FRUITIERE', 1),
(181, 1, 'Boisson Au Jus Au Pulpe', '24', 'CL', 'Cocktail', 'Jus', 'RANI', 1),
(182, 1, 'Boisson Au Jus', '250', 'ML', 'Energie Healthy Smoothie', 'Jus', 'YUMY', 1),
(183, 1, 'Boisson Au Jus', '250', 'ML', 'Healthy Rouge Smoothie', 'Jus', 'YUMY', 1),
(184, 1, 'Boisson Au Jus', '250', 'ML', 'Fruits Healthy Multi Smoothie', 'Jus', 'YUMY', 1),
(185, 1, 'Boisson Au Jus', '250', 'ML', 'Healthy Smoothie Vert', 'Jus', 'YUMY', 1),
(186, 1, 'Boisson Au Jus', '1', 'L', 'Mojito', 'Jus', 'DÉLICE', 1),
(187, 1, 'Boisson Au Jus', '1', 'L', 'Ananas', 'Jus', 'DÉLICE', 1),
(188, 1, 'Boisson Au Jus', '1', 'L', 'Peche', 'Jus', 'DÉLICE', 1),
(189, 1, 'Nectar', '1', 'L', 'Multivitaminé', 'Nectar', 'DÉLICE', 1),
(190, 1, 'Nectar', '1', 'L', 'Mangue', 'Nectar', 'DÉLICE', 1),
(191, 1, 'Boisson Au Jus', '1', 'L', 'Poire', 'Jus', 'DÉLICE', 1),
(192, 1, 'Boisson Au Jus', '1', 'L', 'Orange', 'Jus', 'DÉLICE', 1),
(193, 1, 'Boisson Au Jus', '1', 'L', 'Blancs Fruits', 'Jus', 'DÉLICE', 1),
(194, 1, 'Nectar', '1', 'L', 'Tropical', 'Nectar', 'DÉLICE', 1),
(195, 1, 'Boisson Au Jus', '1', 'L', 'Tropical', 'Jus', 'STIL', 1),
(196, 1, 'Boisson Au Jus', '1', 'L', 'Ananas', 'Jus', 'STIL', 1),
(197, 1, 'Boisson Au Jus', '1', 'L', 'Mangue', 'Jus', 'STIL', 1),
(198, 1, 'Boisson Au Jus', '1', 'L', 'Orange', 'Jus', 'DIVA', 1),
(199, 1, 'Boisson Au Jus', '1', 'L', 'Cocktail', 'Jus', 'STIL', 1),
(200, 1, 'Boisson Au Jus', '1', 'L', 'Orange', 'Jus', 'STIL', 1),
(201, 1, 'Boisson Au Jus', '1', 'L', 'Poire', 'Jus', 'OH', 1),
(202, 1, 'Citronnade', '1', 'L', '', NULL, 'BOQUERIA', 1),
(203, 1, 'Citronnade Frais', '1', 'L', '', NULL, 'ORTO', 1),
(204, 1, 'Boisson Au Jus', '2', 'L', 'Orange', 'Jus', 'STIL', 1),
(205, 1, 'Jus', '1', 'L', 'Mojito', 'Jus', 'BOQUERIA', 1),
(206, 1, 'Jus 100% Naturel', '75', 'CL', 'Raisin', 'Jus', 'NATURA', 1),
(207, 1, 'Boisson Concentrée', '1', 'L', 'Citron', 'Boisson Concentrée', 'JAWHARA', 1),
(208, 1, 'Boisson Concentrée', '1', 'L', 'Fraise', 'Boisson Concentrée', 'JAWHARA', 1),
(209, 1, 'Jus 100% Naturel', '75', 'CL', 'Peche', 'Jus', 'NATURA', 1),
(210, 1, 'Jus 100% Naturel', '75', 'CL', 'Pomme', 'Jus', 'NATURA', 1),
(211, 1, 'Boisson Concentrée', '1', 'L', 'Citron', 'Boisson Concentrée', 'HAZEM', 1),
(212, 1, 'Boisson Concentrée', '1', 'L', 'Orange', 'Boisson Concentrée', 'HAZEM', 1),
(213, 1, 'Boisson Concentrée', '1', 'L', 'Ananas', 'Boisson Concentrée', 'HAZEM', 1),
(214, 1, 'Boisson Concentrée', '1', 'L', 'Cocktail', 'Boisson Concentrée', 'HAZEM', 1),
(215, 1, 'Boisson Concentrée', '1', 'L', 'Fraise', 'Boisson Concentrée', 'HAZEM', 1),
(216, 1, 'Boisson Concentrée', '1', 'L', 'Grenadine', 'Boisson Concentrée', 'HAZEM', 1),
(217, 1, 'Boisson Concentrée', '1', 'L', 'Menthe', 'Boisson Concentrée', 'HAZEM', 1),
(218, 1, 'Boisson Concentrée', '1', 'L', 'Arôme Pistache', 'Boisson Concentrée', 'HAZEM', 1),
(219, 1, 'Boisson Concentrée', '1', 'L', 'Orgeat', 'Boisson Concentrée', 'HAZEM', 1),
(220, 1, 'Sirop', '700', 'ML', 'Arôme Pêche', 'Sirop', 'LA FRUITIERE', 1),
(221, 1, 'Sirop', '700', 'ML', 'Arôme Pinacolada', 'Sirop', 'LA FRUITIERE', 1),
(222, 1, 'Sirop', '700', 'ML', 'Arôme Curacao', 'Sirop', 'LA FRUITIERE', 1),
(223, 1, 'Sirop', '700', 'ML', 'Arôme Menthe', 'Sirop', 'LA FRUITIERE', 1),
(224, 1, 'Sirop', '700', 'ML', 'Arôme Citron Kiwi Melon', 'Sirop', 'LA FRUITIERE', 1),
(225, 1, 'Sirop', '700', 'ML', 'Arôme Vanille', 'Sirop', 'LA FRUITIERE', 1),
(226, 1, 'Boisson Au Jus', '19', 'CL', 'Tropical', 'Jus', 'FRUZZY', 1),
(227, 1, 'Nectar', '20', 'CL', 'Multivitaminé', 'Nectar', 'DÉLICE', 1),
(228, 1, 'Boisson Au Jus', '20', 'CL', 'Pêche', 'Jus', 'STIL', 1),
(229, 1, 'Boisson Au Jus', '20', 'CL', 'Poire', 'Jus', 'DÉLICE', 1),
(230, 1, 'Boisson Au Jus', '20', 'CL', 'Cocktail Fruits', 'Jus', 'TROPICO', 1),
(231, 1, 'Boisson Instantanée', '30', 'GR', 'Fraise', 'Boisson Instantanée', 'SANGO', 1),
(232, 1, 'Boisson Instantanée', '30', 'GR', 'Tropical', 'Boisson Instantanée', 'SANGO', 1),
(233, 1, 'Boisson Au Jus', '25', 'CL', 'Poire', 'Jus', 'OH', 1),
(234, 1, 'Boisson Au Jus', '25', 'CL', 'Banane Orange', 'Jus', 'OH', 1),
(235, 1, 'Boisson Au Jus', '23.5', 'CL', 'Orange', 'Jus', 'BEYTI', 1),
(236, 1, 'Boisson Au Jus', '23.5', 'CL', 'Mangue', 'Jus', 'BEYTI', 1),
(237, 1, 'Boisson Au Jus', '1', 'L', 'Raisin', 'Jus', 'DÉLICE', 1),
(238, 1, 'Boisson Au Jus', '1', 'L', 'Cocktail Fruits', 'Jus', 'TROPICO', 1),
(239, 1, 'Boisson Au Jus', '1', 'L', 'Ananas', 'Jus', 'DIVA', 1),
(240, 1, 'Boisson Au Jus', '1', 'L', 'Banane Orange', 'Jus', 'OH', 1),
(241, 1, 'Boisson Au Jus', '250', 'ML', 'Grenade', 'Jus', 'LA FRUITIERE', 1),
(242, 1, 'Nectar', '1', 'L', 'Pomme', 'Nectar', 'VITRAC', 1),
(243, 1, 'Nectar', '1', 'L', 'Orange', 'Nectar', 'VITRAC', 1),
(244, 1, 'Nectar', '1', 'L', 'Goyave', 'Nectar', 'VITRAC', 1),
(245, 1, 'Nectar', '1', 'L', 'Mangue', 'Nectar', 'VITRAC', 1),
(246, 1, 'Boisson Au Jus', '1', 'L', 'Orange', 'Jus', 'BEYTI', 1),
(247, 1, 'Boisson Au Jus', '1', 'L', 'Mangue', 'Jus', 'BEYTI', 1),
(248, 1, 'Jus 100% Naturel', '75', 'CL', 'Fleur Grenade Oranger', 'Jus', 'NATURA', 1),
(249, 1, 'Boisson Concentrée', '1', 'L', 'Cocktail', 'Boisson Concentrée', 'JAWHARA', 1),
(250, 1, 'Nectar', '1', 'L', 'Pomme', 'Nectar', 'ALMARAI', 1),
(251, 1, 'Nectar', '1', 'L', 'Mangue', 'Nectar', 'ALMARAI', 1),
(252, 1, 'Nectar', '1', 'L', 'Orange', 'Nectar', 'ALMARAI', 1),
(253, 1, 'Sirop', '1', 'L', 'Pistache', 'Sirop', 'JAWHARA', 1),
(254, 1, 'Boisson Concentrée', '1', 'L', 'Fruits Kiwi', 'Boisson Concentrée', 'HAZEM', 1),
(255, 1, 'Sirop', '1', 'L', 'Arôme Pistache', 'Sirop', 'HAZEM', 1),
(256, 1, 'Sirop', '0.75', 'L', 'Chocolat', 'Sirop', 'JAWHARA', 1),
(257, 1, 'Sirop', '0.75', 'L', 'Framboise', 'Sirop', 'JAWHARA', 1),
(258, 1, 'Sirop', '0.75', 'L', 'Caramel', 'Sirop', 'JAWHARA', 1),
(259, 1, 'Sirop', '0.75', 'L', 'Vanille', 'Sirop', 'JAWHARA', 1),
(260, 1, 'Sirop', '700', 'ML', 'Plate Pêche', 'Sirop', 'LA FRUITIERE', 1),
(261, 1, 'Boisson Concentrée', '4', 'L', 'Pêche', 'Boisson Concentrée', 'HAZEM', 1),
(262, 1, 'Boisson Concentrée', '3', 'L', 'Citron Orgeat', 'Boisson Concentrée', 'JAWHARA', 1),
(263, 1, 'Sirop', '700', 'ML', 'Fraise', 'Sirop', 'LA FRUITIERE', 1),
(264, 1, 'Boisson Concentrée', '4', 'L', 'Citron', 'Boisson Concentrée', 'HAZEM', 1),
(265, 1, 'Sirop', '700', 'ML', 'Mangue', 'Sirop', 'LA FRUITIERE', 1),
(266, 1, 'Sirop', '700', 'ML', 'Ananas', 'Sirop', 'LA FRUITIERE', 1),
(267, 1, 'Boisson Concentrée', '4', 'L', 'Ananas', 'Boisson Concentrée', 'HAZEM', 1),
(268, 1, 'Boisson Concentrée', '4', 'L', 'Cocktail', 'Boisson Concentrée', 'HAZEM', 1),
(269, 1, 'Sirop', '700', 'ML', 'Passion', 'Sirop', 'LA FRUITIERE', 1),
(270, 1, 'Boisson Concentrée', '4', 'L', 'Arôme Orgeat', 'Boisson Concentrée', 'HAZEM', 1),
(271, 1, 'Boisson Concentrée', '4', 'L', 'Arôme Grenadine', 'Boisson Concentrée', 'HAZEM', 1),
(272, 1, 'Boisson Concentrée', '4', 'L', 'Arôme Pistache', 'Boisson Concentrée', 'HAZEM', 1),
(273, 1, 'Boisson Au Jus', '75', 'CL', 'Relax', 'Jus', 'DÉLICE', 1),
(274, 1, 'Boisson Au Jus', '2', 'L', 'Mangue', 'Jus', 'STIL', 1),
(275, 1, 'Jus', '1', 'L', 'Orange Sanguine', 'Jus', 'SANTAL', 1),
(276, 1, 'Jus', '1', 'L', 'Poire', 'Jus', 'SANTAL', 1),
(277, 1, 'Boisson Au Jus', '750', 'ML', 'Confort Pomme', 'Jus', 'DÉLICE', 1),
(278, 1, 'Boisson Au Jus', '750', 'ML', 'Cocktail Exotique Relax', 'Jus', 'DÉLICE', 1),
(279, 1, 'Nectar', '1', 'L', 'Raisin Rouge', 'Nectar', 'VITRAC', 1),
(280, 1, 'Boisson Au Jus', '2', 'L', 'Cocktail', 'Jus', 'STIL', 1),
(281, 1, 'Boisson Au Jus', '19', 'CL', 'Orange', 'Jus', 'Fruzzy', 1),
(282, 1, 'Boisson Au Jus', '1', 'L', 'Limonade', 'Jus', 'DÉLICE', 1),
(283, 1, 'Jus 100% Naturel', '75', 'CL', 'Fleur Orangers', 'Jus', 'NATURA', 1),
(284, 1, 'Boisson Instantanée', '30', 'GR', 'Ananas', 'Boisson Instantanée', 'SANGO', 1),
(285, 1, 'Boisson Instantanée', '30', 'GR', 'Orange', 'Boisson Instantanée', 'SANGO', 1),
(286, 1, 'Boisson Instantanée', '30', 'GR', 'Citron', 'Boisson Instantanée', 'SANGO', 1),
(287, 1, 'Boisson Au Jus', '1', 'L', 'Orange', 'Jus', 'TROPICANA', 1),
(288, 1, 'Boisson Au Jus', '25', 'CL', 'Orange', 'Jus', 'STIL', 1),
(289, 1, 'Boisson Au Jus', '1', 'L', 'Bravo', 'Jus', 'RAUCH', 1),
(290, 1, 'Boisson Au Jus', '1', 'L', 'Raisin', 'Jus', 'DIVA', 1),
(291, 1, 'Boisson Au Jus', '1', 'L', 'Grenade', 'Jus', 'DIVA', 1),
(292, 1, 'Boisson Au Jus', '1', 'L', 'Pomme Verte', 'Jus', 'DÉLICE', 1),
(293, 1, 'Nectar', '20', 'CL', 'Mangue', 'Nectar', 'DÉLICE', 1),
(294, 1, 'Boisson Instantanée', '30', 'GR', 'Pêche', 'Boisson Instantanée', 'SANGO', 1),
(295, 1, 'Boisson Au Jus', '1', 'L', 'Mangue', 'Jus', 'DIVA', 1),
(296, 1, 'Boisson Au Jus', '1', 'L', 'Multivitaminé', 'Jus', 'DIVA', 1);

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
	`provider_id` int(11) NOT NULL,
	`sub_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Truncate table before insert `Product_Provider`
--

TRUNCATE TABLE `Product_Provider`;

--
-- Dumping data for table `Product_Provider`
--

INSERT INTO `product_provider` (`id`, `is_enabled`, `last_updated_date`, `price`, `image`, `link`, `product_id`, `provider_id`, `sub_category_id`) VALUES
(1, 1, '2023-06-18', 0.580, 'https://courses.monoprix.tn/ezzahra/131013-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/20407-boisson-au-jus.html', 150, 1, 1),
(2, 1, '2023-06-18', 0.580, 'https://courses.monoprix.tn/ezzahra/131012-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/20406-boisson-au-jus.html', 151, 1, 1),
(3, 1, '2023-06-18', 0.840, 'https://courses.monoprix.tn/ezzahra/130995-large_default/boisson-instantanée.jpg', 'https://courses.monoprix.tn/ezzahra/boissons-instantanées/20389-boisson-instantanée.html', 152, 1, 1),
(4, 1, '2023-06-18', 0.840, 'https://courses.monoprix.tn/ezzahra/130996-large_default/boisson-instantanée.jpg', 'https://courses.monoprix.tn/ezzahra/boissons-instantanées/20390-boisson-instantanée.html', 153, 1, 1),
(5, 1, '2023-06-18', 0.840, 'https://courses.monoprix.tn/ezzahra/130997-large_default/boisson-instantanée.jpg', 'https://courses.monoprix.tn/ezzahra/boissons-instantanées/20391-boisson-instantanée.html', 154, 1, 1),
(6, 1, '2023-06-18', 0.840, 'https://courses.monoprix.tn/ezzahra/130998-large_default/boisson-instantanée.jpg', 'https://courses.monoprix.tn/ezzahra/boissons-instantanées/20392-boisson-instantanée.html', 155, 1, 1),
(7, 1, '2023-06-18', 0.840, 'https://courses.monoprix.tn/ezzahra/130999-large_default/boisson-instantanée.jpg', 'https://courses.monoprix.tn/ezzahra/boissons-instantanées/20393-boisson-instantanée.html', 156, 1, 1),
(8, 1, '2023-06-18', 0.840, 'https://courses.monoprix.tn/ezzahra/132612-large_default/boisson-instantanée.jpg', 'https://courses.monoprix.tn/ezzahra/boissons-instantanées/22978-boisson-instantanée.html', 157, 1, 1),
(9, 1, '2023-06-18', 0.840, 'https://courses.monoprix.tn/ezzahra/132611-large_default/boisson-instantanée.jpg', 'https://courses.monoprix.tn/ezzahra/boissons-instantanées/22979-boisson-instantanée.html', 158, 1, 1),
(10, 1, '2023-06-18', 0.870, 'https://courses.monoprix.tn/ezzahra/155900-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/19196-boisson-au-jus.html', 159, 1, 1),
(11, 1, '2023-06-18', 0.870, 'https://courses.monoprix.tn/ezzahra/155211-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/32164-boisson-au-jus.html', 160, 1, 1),
(12, 1, '2023-06-18', 1.000, 'https://courses.monoprix.tn/ezzahra/155907-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/19203-boisson-au-jus.html', 161, 1, 1),
(13, 1, '2023-06-18', 1.000, 'https://courses.monoprix.tn/ezzahra/143003-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/27577-boisson-au-jus.html', 162, 1, 1),
(14, 1, '2023-06-18', 1.000, 'https://courses.monoprix.tn/ezzahra/155905-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/19201-boisson-au-jus.html', 163, 1, 1),
(15, 1, '2023-06-18', 1.000, 'https://courses.monoprix.tn/ezzahra/155906-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/19202-boisson-au-jus.html', 164, 1, 1),
(16, 1, '2023-06-18', 1.000, 'https://courses.monoprix.tn/ezzahra/146233-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16806-boisson-au-jus.html', 165, 1, 1),
(17, 1, '2023-06-18', 1.320, 'https://courses.monoprix.tn/ezzahra/129837-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16050-boisson-au-jus.html', 166, 1, 1),
(18, 1, '2023-06-18', 1.320, 'https://courses.monoprix.tn/ezzahra/129119-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16802-boisson-au-jus.html', 167, 1, 1),
(19, 1, '2023-06-18', 1.320, 'https://courses.monoprix.tn/ezzahra/129116-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16805-boisson-au-jus.html', 168, 1, 1),
(20, 1, '2023-06-18', 1.990, 'https://courses.monoprix.tn/ezzahra/154721-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16348-boisson-au-jus.html', 169, 1, 1),
(21, 1, '2023-06-18', 1.990, 'https://courses.monoprix.tn/ezzahra/154722-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16349-boisson-au-jus.html', 170, 1, 1),
(22, 1, '2023-06-18', 1.990, 'https://courses.monoprix.tn/ezzahra/154723-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16350-boisson-au-jus.html', 171, 1, 1),
(23, 1, '2023-06-18', 1.990, 'https://courses.monoprix.tn/ezzahra/129553-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16351-boisson-au-jus.html', 172, 1, 1),
(24, 1, '2023-06-18', 2.380, 'https://courses.monoprix.tn/ezzahra/152270-large_default/citronnade.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/28791-citronnade.html', 173, 1, 1),
(25, 1, '2023-06-18', 1.990, 'https://courses.monoprix.tn/ezzahra/154716-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/20399-boisson-au-jus.html', 174, 1, 1),
(26, 1, '2023-06-18', 2.490, 'https://courses.monoprix.tn/ezzahra/143023-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/27598-boisson-au-jus.html', 175, 1, 1),
(27, 1, '2023-06-18', 2.490, 'https://courses.monoprix.tn/ezzahra/143022-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/27597-boisson-au-jus.html', 176, 1, 1),
(28, 1, '2023-06-18', 2.490, 'https://courses.monoprix.tn/ezzahra/146222-large_default/nectar.jpg', 'https://courses.monoprix.tn/ezzahra/nectar-de-fruits/27595-nectar.html', 177, 1, 1),
(29, 1, '2023-06-18', 2.490, 'https://courses.monoprix.tn/ezzahra/146223-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/27594-boisson-au-jus.html', 178, 1, 1),
(30, 1, '2023-06-18', 2.700, 'https://courses.monoprix.tn/ezzahra/143021-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/27596-boisson-au-jus.html', 179, 1, 1),
(31, 1, '2023-06-18', 2.700, 'https://courses.monoprix.tn/ezzahra/143024-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/27599-boisson-au-jus.html', 180, 1, 1),
(32, 1, '2023-06-18', 2.790, 'https://courses.monoprix.tn/ezzahra/146221-large_default/boisson-au-jus-au-pulpe.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/23571-boisson-au-jus-au-pulpe.html', 181, 1, 1),
(33, 1, '2023-06-18', 2.990, 'https://courses.monoprix.tn/ezzahra/155082-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/32810-boisson-au-jus.html', 182, 1, 1),
(34, 1, '2023-06-18', 2.990, 'https://courses.monoprix.tn/ezzahra/155083-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/32811-boisson-au-jus.html', 183, 1, 1),
(35, 1, '2023-06-18', 2.990, 'https://courses.monoprix.tn/ezzahra/155084-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/32812-boisson-au-jus.html', 184, 1, 1),
(36, 1, '2023-06-18', 2.990, 'https://courses.monoprix.tn/ezzahra/155085-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/32813-boisson-au-jus.html', 185, 1, 1),
(37, 1, '2023-06-18', 3.120, 'https://courses.monoprix.tn/ezzahra/155913-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/19209-boisson-au-jus.html', 186, 1, 1),
(38, 1, '2023-06-18', 3.120, 'https://courses.monoprix.tn/ezzahra/143918-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/29318-boisson-au-jus.html', 187, 1, 1),
(39, 1, '2023-06-18', 3.120, 'https://courses.monoprix.tn/ezzahra/155910-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/19206-boisson-au-jus.html', 188, 1, 1),
(40, 1, '2023-06-18', 3.120, 'https://courses.monoprix.tn/ezzahra/155912-large_default/nectar.jpg', 'https://courses.monoprix.tn/ezzahra/nectar-de-fruits/19208-nectar.html', 189, 1, 1),
(41, 1, '2023-06-18', 3.120, 'https://courses.monoprix.tn/ezzahra/155911-large_default/nectar.jpg', 'https://courses.monoprix.tn/ezzahra/nectar-de-fruits/19207-nectar.html', 190, 1, 1),
(42, 1, '2023-06-18', 3.120, 'https://courses.monoprix.tn/ezzahra/155909-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/19205-boisson-au-jus.html', 191, 1, 1),
(43, 1, '2023-06-18', 3.120, 'https://courses.monoprix.tn/ezzahra/155908-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/19204-boisson-au-jus.html', 192, 1, 1),
(44, 1, '2023-06-18', 3.120, 'https://courses.monoprix.tn/ezzahra/129127-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16794-boisson-au-jus.html', 193, 1, 1),
(45, 1, '2023-06-18', 3.120, 'https://courses.monoprix.tn/ezzahra/129128-large_default/nectar.jpg', 'https://courses.monoprix.tn/ezzahra/nectar-de-fruits/16793-nectar.html', 194, 1, 1),
(46, 1, '2023-06-18', 3.400, 'https://courses.monoprix.tn/ezzahra/129129-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16792-boisson-au-jus.html', 195, 1, 1),
(47, 1, '2023-06-18', 3.400, 'https://courses.monoprix.tn/ezzahra/129123-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16798-boisson-au-jus.html', 196, 1, 1),
(48, 1, '2023-06-18', 3.400, 'https://courses.monoprix.tn/ezzahra/129122-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16799-boisson-au-jus.html', 197, 1, 1),
(49, 1, '2023-06-18', 2.890, 'https://courses.monoprix.tn/ezzahra/129105-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16816-boisson-au-jus.html', 198, 1, 1),
(50, 1, '2023-06-18', 3.400, 'https://courses.monoprix.tn/ezzahra/129121-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16800-boisson-au-jus.html', 199, 1, 1),
(51, 1, '2023-06-18', 3.400, 'https://courses.monoprix.tn/ezzahra/129120-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16801-boisson-au-jus.html', 200, 1, 1),
(52, 1, '2023-06-18', 3.940, 'https://courses.monoprix.tn/ezzahra/155892-large_default/nectar.jpg', 'https://courses.monoprix.tn/ezzahra/nectar-de-fruits/19187-nectar.html', 201, 1, 1),
(53, 1, '2023-06-18', 5.300, 'https://courses.monoprix.tn/ezzahra/152740-large_default/citronnade.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/28790-citronnade.html', 202, 1, 1),
(54, 1, '2023-06-18', 4.780, 'https://courses.monoprix.tn/ezzahra/147364-large_default/citronnade-frais.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/30735-citronnade-frais.html', 203, 1, 1),
(55, 1, '2023-06-18', 5.100, 'https://courses.monoprix.tn/ezzahra/129124-large_default/boisson-au-jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/16797-boisson-au-jus.html', 204, 1, 1),
(56, 1, '2023-06-18', 5.360, 'https://courses.monoprix.tn/ezzahra/152743-large_default/jus.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/28793-jus.html', 205, 1, 1),
(57, 1, '2023-06-18', 9.190, 'https://courses.monoprix.tn/ezzahra/134242-large_default/jus-100-naturel.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/23570-jus-100-naturel.html', 206, 1, 1),
(58, 1, '2023-06-18', 6.490, 'https://courses.monoprix.tn/ezzahra/131025-large_default/boisson-concentrée.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/20419-boisson-concentrée.html', 207, 1, 1),
(59, 1, '2023-06-18', 6.490, 'https://courses.monoprix.tn/ezzahra/132258-large_default/boisson-concentrée.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/22035-boisson-concentrée.html', 208, 1, 1),
(60, 1, '2023-06-18', 6.490, 'https://courses.monoprix.tn/ezzahra/134620-large_default/jus-100-naturel.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/24361-jus-100-naturel.html', 209, 1, 1),
(61, 1, '2023-06-18', 9.190, 'https://courses.monoprix.tn/ezzahra/135595-large_default/jus-100-naturel.jpg', 'https://courses.monoprix.tn/ezzahra/pur-jus-de-fruits/25359-jus-100-naturel.html', 210, 1, 1),
(62, 1, '2023-06-18', 7.390, 'https://courses.monoprix.tn/ezzahra/131020-large_default/boisson-concentrée.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/20414-boisson-concentrée.html', 211, 1, 1),
(63, 1, '2023-06-18', 9.490, 'https://courses.monoprix.tn/ezzahra/132245-large_default/boisson-concentrée.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/22022-boisson-concentrée.html', 212, 1, 1),
(64, 1, '2023-06-18', 9.490, 'https://courses.monoprix.tn/ezzahra/132246-large_default/boisson-concentrée.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/22023-boisson-concentrée.html', 213, 1, 1),
(65, 1, '2023-06-18', 9.490, 'https://courses.monoprix.tn/ezzahra/131022-large_default/boisson-concentrée.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/20416-boisson-concentrée.html', 214, 1, 1),
(66, 1, '2023-06-18', 9.490, 'https://courses.monoprix.tn/ezzahra/131021-large_default/boisson-concentrée.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/20415-boisson-concentrée.html', 215, 1, 1),
(67, 1, '2023-06-18', 10.490, 'https://courses.monoprix.tn/ezzahra/155442-large_default/boisson-concentrée.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/19711-boisson-concentrée.html', 216, 1, 1),
(68, 1, '2023-06-18', 10.490, 'https://courses.monoprix.tn/ezzahra/155443-large_default/boisson-concentrée.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/19712-boisson-concentrée.html', 217, 1, 1),
(69, 1, '2023-06-18', 10.490, 'https://courses.monoprix.tn/ezzahra/131019-large_default/boisson-concentrée.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/20413-boisson-concentrée.html', 218, 1, 1),
(70, 1, '2023-06-18', 10.490, 'https://courses.monoprix.tn/ezzahra/132609-large_default/boisson-concentrée.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/22981-boisson-concentrée.html', 219, 1, 1),
(71, 1, '2023-06-18', 11.990, 'https://courses.monoprix.tn/ezzahra/143061-large_default/sirop.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/27638-sirop.html', 220, 1, 1),
(72, 1, '2023-06-18', 13.990, 'https://courses.monoprix.tn/ezzahra/143058-large_default/sirop.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/27635-sirop.html', 221, 1, 1),
(73, 1, '2023-06-18', 14.990, 'https://courses.monoprix.tn/ezzahra/143002-large_default/sirop.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/27576-sirop.html', 222, 1, 1),
(74, 1, '2023-06-18', 15.530, 'https://courses.monoprix.tn/ezzahra/143060-large_default/sirop.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/27637-sirop.html', 223, 1, 1),
(75, 1, '2023-06-18', 15.990, 'https://courses.monoprix.tn/ezzahra/152563-large_default/sirop.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/27575-sirop.html', 224, 1, 1),
(76, 1, '2023-06-18', 16.990, 'https://courses.monoprix.tn/ezzahra/143059-large_default/sirop.jpg', 'https://courses.monoprix.tn/ezzahra/sirops-et-concentrés-de-sirop/27636-sirop.html', 225, 1, 1),
(77, 1, '2023-06-18', 0.550, 'https://www.geantdrive.tn/azur-city/322618-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/31276-boisson-au-jus.html', 151, 2, 1),
(78, 1, '2023-06-18', 0.550, 'https://www.geantdrive.tn/azur-city/322619-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/31277-boisson-au-jus.html', 150, 2, 1),
(79, 1, '2023-06-18', 0.790, 'https://www.geantdrive.tn/azur-city/322615-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/31273-boisson-au-jus.html', 226, 2, 1),
(80, 1, '2023-06-18', 0.840, 'https://www.geantdrive.tn/azur-city/314169-large_default/boisson-instantanee.jpg', 'https://www.geantdrive.tn/azur-city/boissons-instantanees/30638-boisson-instantanee.html', 153, 2, 1),
(81, 1, '2023-06-18', 0.840, 'https://www.geantdrive.tn/azur-city/314170-large_default/boisson-instantanee.jpg', 'https://www.geantdrive.tn/azur-city/boissons-instantanees/30639-boisson-instantanee.html', 158, 2, 1),
(82, 1, '2023-06-18', 0.840, 'https://www.geantdrive.tn/azur-city/314171-large_default/boisson-instantanee.jpg', 'https://www.geantdrive.tn/azur-city/boissons-instantanees/30640-boisson-instantanee.html', 154, 2, 1),
(83, 1, '2023-06-18', 0.840, 'https://www.geantdrive.tn/azur-city/314172-large_default/boisson-instantanee.jpg', 'https://www.geantdrive.tn/azur-city/boissons-instantanees/30641-boisson-instantanee.html', 155, 2, 1),
(84, 1, '2023-06-18', 0.840, 'https://www.geantdrive.tn/azur-city/314173-large_default/boisson-instantanee.jpg', 'https://www.geantdrive.tn/azur-city/boissons-instantanees/30642-boisson-instantanee.html', 157, 2, 1),
(85, 1, '2023-06-18', 0.840, 'https://www.geantdrive.tn/azur-city/314174-large_default/boisson-instantanee.jpg', 'https://www.geantdrive.tn/azur-city/boissons-instantanees/30643-boisson-instantanee.html', 156, 2, 1),
(86, 1, '2023-06-18', 0.840, 'https://www.geantdrive.tn/azur-city/314168-large_default/boisson-instantanee.jpg', 'https://www.geantdrive.tn/azur-city/boissons-instantanees/30637-boisson-instantanee.html', 152, 2, 1),
(87, 1, '2023-06-18', 0.870, 'https://www.geantdrive.tn/azur-city/894728-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/72656-boisson-au-jus.html', 160, 2, 1),
(88, 1, '2023-06-18', 0.870, 'https://www.geantdrive.tn/azur-city/317625-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/nectar-de-fruits/24663-nectar.html', 227, 2, 1),
(89, 1, '2023-06-18', 0.870, 'https://www.geantdrive.tn/azur-city/318171-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24593-boisson-au-jus.html', 164, 2, 1),
(90, 1, '2023-06-18', 0.870, 'https://www.geantdrive.tn/azur-city/978888-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/88172-boisson-au-jus.html', 228, 2, 1),
(91, 1, '2023-06-18', 0.870, 'https://www.geantdrive.tn/azur-city/318172-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24594-boisson-au-jus.html', 161, 2, 1),
(92, 1, '2023-06-18', 0.870, 'https://www.geantdrive.tn/azur-city/318170-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24340-boisson-au-jus.html', 163, 2, 1),
(93, 1, '2023-06-18', 0.870, 'https://www.geantdrive.tn/azur-city/318173-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24571-boisson-au-jus.html', 165, 2, 1),
(94, 1, '2023-06-18', 0.870, 'https://www.geantdrive.tn/azur-city/317626-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24596-boisson-au-jus.html', 229, 2, 1),
(95, 1, '2023-06-18', 0.870, 'https://www.geantdrive.tn/azur-city/317624-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24342-boisson-au-jus.html', 159, 2, 1),
(96, 1, '2023-06-18', 0.870, 'https://www.geantdrive.tn/azur-city/249737-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/45259-boisson-au-jus.html', 162, 2, 1),
(97, 1, '2023-06-18', 0.890, 'https://www.geantdrive.tn/azur-city/314193-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24601-boisson-au-jus.html', 230, 2, 1),
(98, 1, '2023-06-18', 0.940, 'https://www.geantdrive.tn/azur-city/317415-large_default/boisson-instantanee.jpg', 'https://www.geantdrive.tn/azur-city/boissons-instantanees/50733-boisson-instantanee.html', 231, 2, 1),
(99, 1, '2023-06-18', 0.940, 'https://www.geantdrive.tn/azur-city/316553-large_default/boisson-instantannee.jpg', 'https://www.geantdrive.tn/azur-city/boissons-instantanees/24343-boisson-instantannee.html', 232, 2, 1),
(100, 1, '2023-06-18', 1.190, 'https://www.geantdrive.tn/azur-city/314186-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/nectar-de-fruits/24666-nectar.html', 233, 2, 1),
(101, 1, '2023-06-18', 1.190, 'https://www.geantdrive.tn/azur-city/314192-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24598-boisson-au-jus.html', 234, 2, 1),
(102, 1, '2023-06-18', 1.200, 'https://www.geantdrive.tn/azur-city/324976-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24320-boisson-au-jus.html', 166, 2, 1),
(103, 1, '2023-06-18', 1.200, 'https://www.geantdrive.tn/azur-city/321120-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24576-boisson-au-jus.html', 167, 2, 1),
(104, 1, '2023-06-18', 1.200, 'https://www.geantdrive.tn/azur-city/321117-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24577-boisson-au-jus.html', 168, 2, 1),
(105, 1, '2023-06-18', 1.190, 'https://www.geantdrive.tn/azur-city/902320-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/75611-boisson-au-jus.html', 235, 2, 1),
(106, 1, '2023-06-18', 1.190, 'https://www.geantdrive.tn/azur-city/902321-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/75612-boisson-au-jus.html', 236, 2, 1),
(107, 1, '2023-06-18', 1.990, 'https://www.geantdrive.tn/azur-city/954952-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24406-boisson-au-jus.html', 172, 2, 1),
(108, 1, '2023-06-18', 1.990, 'https://www.geantdrive.tn/azur-city/954956-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24407-boisson-au-jus.html', 169, 2, 1),
(109, 1, '2023-06-18', 1.990, 'https://www.geantdrive.tn/azur-city/954953-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/50728-boisson-au-jus.html', 171, 2, 1),
(110, 1, '2023-06-18', 1.990, 'https://www.geantdrive.tn/azur-city/954983-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/50730-boisson-au-jus.html', 181, 2, 1),
(111, 1, '2023-06-18', 2.550, 'https://www.geantdrive.tn/azur-city/955361-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/46085-boisson-au-jus.html', 180, 2, 1),
(112, 1, '2023-06-18', 2.550, 'https://www.geantdrive.tn/azur-city/955364-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/46323-boisson-au-jus.html', 179, 2, 1),
(113, 1, '2023-06-18', 3.090, 'https://www.geantdrive.tn/azur-city/321122-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24579-boisson-au-jus.html', 199, 2, 1),
(114, 1, '2023-06-18', 3.090, 'https://www.geantdrive.tn/azur-city/321123-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24580-boisson-au-jus.html', 197, 2, 1),
(115, 1, '2023-06-18', 3.090, 'https://www.geantdrive.tn/azur-city/321124-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24502-boisson-au-jus.html', 196, 2, 1),
(116, 1, '2023-06-18', 3.090, 'https://www.geantdrive.tn/azur-city/321699-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24582-boisson-au-jus.html', 195, 2, 1),
(117, 1, '2023-06-18', 3.090, 'https://www.geantdrive.tn/azur-city/321121-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24333-boisson-au-jus.html', 200, 2, 1),
(118, 1, '2023-06-18', 3.100, 'https://www.geantdrive.tn/azur-city/894084-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24592-boisson-au-jus.html', 186, 2, 1),
(119, 1, '2023-06-18', 3.100, 'https://www.geantdrive.tn/azur-city/894058-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24336-boisson-au-jus.html', 192, 2, 1),
(120, 1, '2023-06-18', 3.100, 'https://www.geantdrive.tn/azur-city/894351-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/39352-boisson-au-jus.html', 237, 2, 1),
(121, 1, '2023-06-18', 3.100, 'https://www.geantdrive.tn/azur-city/894059-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24586-boisson-au-jus.html', 191, 2, 1),
(122, 1, '2023-06-18', 3.100, 'https://www.geantdrive.tn/azur-city/894062-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/nectar-de-fruits/24616-nectar.html', 194, 2, 1),
(123, 1, '2023-06-18', 3.100, 'https://www.geantdrive.tn/azur-city/894061-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24587-boisson-au-jus.html', 193, 2, 1),
(124, 1, '2023-06-18', 3.100, 'https://www.geantdrive.tn/azur-city/894063-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/nectar-de-fruits/24618-nectar.html', 190, 2, 1),
(125, 1, '2023-06-18', 2.890, 'https://www.geantdrive.tn/azur-city/314195-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24589-boisson-au-jus.html', 238, 2, 1),
(126, 1, '2023-06-18', 2.490, 'https://www.geantdrive.tn/azur-city/955363-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/46322-boisson-au-jus.html', 176, 2, 1),
(127, 1, '2023-06-18', 2.490, 'https://www.geantdrive.tn/azur-city/955365-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/46324-nectar.html', 177, 2, 1),
(128, 1, '2023-06-18', 2.490, 'https://www.geantdrive.tn/azur-city/955366-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/nectar-de-fruits/48644-boisson-au-jus.html', 178, 2, 1),
(129, 1, '2023-06-18', 2.490, 'https://www.geantdrive.tn/azur-city/955362-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/46321-boisson-au-jus.html', 175, 2, 1),
(130, 1, '2023-06-18', 2.890, 'https://www.geantdrive.tn/azur-city/867463-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24338-boisson-au-jus.html', 198, 2, 1),
(131, 1, '2023-06-18', 2.890, 'https://www.geantdrive.tn/azur-city/115709-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24569-boisson-au-jus.html', 239, 2, 1),
(132, 1, '2023-06-18', 3.500, 'https://www.geantdrive.tn/azur-city/314189-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24335-boisson-au-jus.html', 240, 2, 1),
(133, 1, '2023-06-18', 2.790, 'https://www.geantdrive.tn/azur-city/965751-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/74022-boisson-au-jus.html', 241, 2, 1),
(134, 1, '2023-06-18', 3.750, 'https://www.geantdrive.tn/azur-city/314185-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/nectar-de-fruits/24619-nectar.html', 201, 2, 1),
(135, 1, '2023-06-18', 4.200, 'https://www.geantdrive.tn/azur-city/321707-large_default/citronnade.jpg', 'https://www.geantdrive.tn/azur-city/jus-de-fruits-frais/33654-citronnade.html', 202, 2, 1),
(136, 1, '2023-06-18', 4.850, 'https://www.geantdrive.tn/azur-city/321125-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/24332-boisson-au-jus.html', 204, 2, 1),
(137, 1, '2023-06-18', 4.990, 'https://www.geantdrive.tn/azur-city/1068652-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/nectar-de-fruits/75512-nectar.html', 242, 2, 1),
(138, 1, '2023-06-18', 4.990, 'https://www.geantdrive.tn/azur-city/1068654-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/nectar-de-fruits/75514-nectar.html', 243, 2, 1),
(139, 1, '2023-06-18', 4.990, 'https://www.geantdrive.tn/azur-city/1068657-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/nectar-de-fruits/48645-nectar.html', 244, 2, 1),
(140, 1, '2023-06-18', 4.990, 'https://www.geantdrive.tn/azur-city/1068653-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/nectar-de-fruits/75513-nectar.html', 245, 2, 1),
(141, 1, '2023-06-18', 5.390, 'https://www.geantdrive.tn/azur-city/928830-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/75358-boisson-au-jus.html', 246, 2, 1),
(142, 1, '2023-06-18', 5.390, 'https://www.geantdrive.tn/azur-city/928829-large_default/boisson-au-jus.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/76123-boisson-au-jus.html', 247, 2, 1),
(143, 1, '2023-06-18', 7.800, 'https://www.geantdrive.tn/azur-city/864244-large_default/jus-de-fraise.jpg', 'https://www.geantdrive.tn/azur-city/jus-de-fruits-frais/41424-jus-de-fraise.html', 205, 2, 1),
(144, 1, '2023-06-18', 8.430, 'https://www.geantdrive.tn/azur-city/1072679-large_default/jus-100-naturel.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/31309-jus-100-naturel.html', 206, 2, 1),
(145, 1, '2023-06-18', 6.890, 'https://www.geantdrive.tn/azur-city/882119-large_default/jus-100-naturel.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/41774-jus-100-naturel.html', 210, 2, 1),
(146, 1, '2023-06-18', 8.430, 'https://www.geantdrive.tn/azur-city/584344-large_default/jus-100-naturel.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/33420-jus-100-naturel.html', 248, 2, 1),
(147, 1, '2023-06-18', 6.490, 'https://www.geantdrive.tn/azur-city/1072677-large_default/jus-100-naturel.jpg', 'https://www.geantdrive.tn/azur-city/pur-jus-de-fruits/31288-jus-100-naturel.html', 209, 2, 1),
(148, 1, '2023-06-18', 6.490, 'https://www.geantdrive.tn/azur-city/955043-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30929-boisson-concentree.html', 208, 2, 1),
(149, 1, '2023-06-18', 6.490, 'https://www.geantdrive.tn/azur-city/955044-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30930-boisson-concentree.html', 249, 2, 1),
(150, 1, '2023-06-18', 6.490, 'https://www.geantdrive.tn/azur-city/955041-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30928-boisson-concentree.html', 207, 2, 1),
(151, 1, '2023-06-18', 9.100, 'https://www.geantdrive.tn/azur-city/1071416-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/nectar-de-fruits/77810-nectar.html', 250, 2, 1),
(152, 1, '2023-06-18', 9.100, 'https://www.geantdrive.tn/azur-city/1071414-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/nectar-de-fruits/79814-nectar.html', 251, 2, 1),
(153, 1, '2023-06-18', 9.100, 'https://www.geantdrive.tn/azur-city/1071415-large_default/nectar.jpg', 'https://www.geantdrive.tn/azur-city/nectar-de-fruits/79815-nectar.html', 252, 2, 1),
(154, 1, '2023-06-18', 6.990, 'https://www.geantdrive.tn/azur-city/965134-large_default/sirop.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30922-sirop.html', 253, 2, 1),
(155, 1, '2023-06-18', 9.290, 'https://www.geantdrive.tn/azur-city/927726-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30613-boisson-concentree.html', 218, 2, 1),
(156, 1, '2023-06-18', 9.290, 'https://www.geantdrive.tn/azur-city/927729-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/24611-boisson-concentree.html', 217, 2, 1),
(157, 1, '2023-06-18', 9.290, 'https://www.geantdrive.tn/azur-city/927728-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/24612-boisson-concentree.html', 216, 2, 1),
(158, 1, '2023-06-18', 9.290, 'https://www.geantdrive.tn/azur-city/927727-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/24613-boisson-concentree.html', 219, 2, 1),
(159, 1, '2023-06-18', 7.390, 'https://www.geantdrive.tn/azur-city/965789-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/79282-boisson-concentree.html', 211, 2, 1),
(160, 1, '2023-06-18', 9.490, 'https://www.geantdrive.tn/azur-city/881484-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30616-boisson-concentree.html', 213, 2, 1),
(161, 1, '2023-06-18', 9.490, 'https://www.geantdrive.tn/azur-city/965788-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/79281-boisson-concentree.html', 254, 2, 1),
(162, 1, '2023-06-18', 9.490, 'https://www.geantdrive.tn/azur-city/881754-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30857-boisson-concentree.html', 214, 2, 1),
(163, 1, '2023-06-18', 27.000, 'https://www.geantdrive.tn/azur-city/415559-large_default/sirop.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30657-sirop.html', 255, 2, 1),
(164, 1, '2023-06-18', 11.490, 'https://www.geantdrive.tn/azur-city/976648-large_default/sirop.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30923-sirop.html', 256, 2, 1),
(165, 1, '2023-06-18', 11.490, 'https://www.geantdrive.tn/azur-city/893860-large_default/sirop.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30927-sirop.html', 257, 2, 1),
(166, 1, '2023-06-18', 11.490, 'https://www.geantdrive.tn/azur-city/976649-large_default/sirop.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30924-sirop.html', 258, 2, 1),
(167, 1, '2023-06-18', 11.490, 'https://www.geantdrive.tn/azur-city/976650-large_default/sirop.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30925-sirop.html', 259, 2, 1),
(168, 1, '2023-06-18', 11.990, 'https://www.geantdrive.tn/azur-city/882409-large_default/sirop.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/46081-sirop.html', 220, 2, 1),
(169, 1, '2023-06-18', 15.990, 'https://www.geantdrive.tn/azur-city/250584-large_default/sirop.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/46080-sirop.html', 224, 2, 1),
(170, 1, '2023-06-18', 15.990, 'https://www.geantdrive.tn/azur-city/955469-large_default/sirop.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/68346-sirop.html', 260, 2, 1),
(171, 1, '2023-06-18', 22.990, 'https://www.geantdrive.tn/azur-city/983876-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30989-boisson-concentree.html', 261, 2, 1),
(172, 1, '2023-06-18', 23.490, 'https://www.geantdrive.tn/azur-city/928087-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/33327-boisson-concentree.html', 262, 2, 1),
(173, 1, '2023-06-18', 17.990, 'https://www.geantdrive.tn/azur-city/784009-large_default/sirop.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/68347-sirop.html', 263, 2, 1),
(174, 1, '2023-06-18', 25.900, 'https://www.geantdrive.tn/azur-city/983874-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30988-boisson-concentree.html', 264, 2, 1),
(175, 1, '2023-06-18', 18.990, 'https://www.geantdrive.tn/azur-city/784010-large_default/sirop.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/68348-sirop.html', 265, 2, 1),
(176, 1, '2023-06-18', 18.990, 'https://www.geantdrive.tn/azur-city/784005-large_default/sirop.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/68343-sirop.html', 266, 2, 1),
(177, 1, '2023-06-18', 28.900, 'https://www.geantdrive.tn/azur-city/983879-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30992-boisson-concentree.html', 267, 2, 1),
(178, 1, '2023-06-18', 28.900, 'https://www.geantdrive.tn/azur-city/983880-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30993-boisson-concentree.html', 268, 2, 1),
(179, 1, '2023-06-18', 19.990, 'https://www.geantdrive.tn/azur-city/784007-large_default/sirop.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/68345-sirop.html', 269, 2, 1),
(180, 1, '2023-06-18', 30.900, 'https://www.geantdrive.tn/azur-city/802677-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30994-boisson-concentree.html', 270, 2, 1),
(181, 1, '2023-06-18', 30.900, 'https://www.geantdrive.tn/azur-city/802678-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30995-boisson-concentree.html', 271, 2, 1),
(182, 1, '2023-06-18', 30.900, 'https://www.geantdrive.tn/azur-city/802679-large_default/boisson-concentree.jpg', 'https://www.geantdrive.tn/azur-city/sirops-et-concentres-de-sirop/30996-boisson-concentree.html', 272, 2, 1),
(183, 1, '2023-06-18', 2.290, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534803633.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-relax-75cl-6191534803633.html', 273, 3, 1),
(184, 1, '2023-06-18', 4.850, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194001801545.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-mangue-stil-null-6194001801545.html', 274, 3, 1),
(185, 1, '2023-06-18', 6.300, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6223001875741_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dorange-1l-6223001875741.html', 246, 3, 1),
(186, 1, '2023-06-18', 6.300, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6223001875802_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-mangue-1l-6223001875802.html', 247, 3, 1),
(187, 1, '2023-06-18', 9.100, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/8/0/8002580028025.jpg', 'https://www.carrefour.tn/default/jus-dorange-sanguine-1l-8002580028025.html', 275, 3, 1),
(188, 1, '2023-06-18', 9.100, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/8/0/8002580028049.jpg', 'https://www.carrefour.tn/default/jus-de-poire-1l-8002580028049.html', 276, 3, 1),
(189, 1, '2023-06-18', 9.280, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6223007520737.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-pomme-6223007520737.html', 250, 3, 1),
(190, 1, '2023-06-18', 9.280, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6223007520751.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dorange-6223007520751.html', 252, 3, 1),
(191, 1, '2023-06-18', 9.280, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6223007520720.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-mangue-6223007520720.html', 251, 3, 1),
(192, 1, '2023-06-18', 2.290, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534803329.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-pomme-confort-null-6191534803329.html', 277, 3, 1),
(193, 1, '2023-06-18', 2.290, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534803336.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-cocktail-exotique-relax-null-6191534803336.html', 278, 3, 1),
(194, 1, '2023-06-18', 3.100, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191402602054.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dananas-250ml-6191402602054.html', 178, 3, 1),
(195, 1, '2023-06-18', 3.050, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191402602047.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-peche-250ml-6191402602047.html', 176, 3, 1),
(196, 1, '2023-06-18', 0.790, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191402902062.jpg', 'https://www.carrefour.tn/default/boisson-instantanee-fraise-30g-6191402902062.html', 231, 3, 1),
(197, 1, '2023-06-18', 5.290, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6221024992742.jpg', 'https://www.carrefour.tn/default/nectar-au-raisin-rouge-de-1l-1l-6221024992742.html', 279, 3, 1),
(198, 1, '2023-06-18', 5.290, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6221024240126-1_2.jpg', 'https://www.carrefour.tn/default/nectar-dorange-de-1l-1l-6221024240126.html', 243, 3, 1),
(199, 1, '2023-06-18', 5.290, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6221024240102_1.jpg', 'https://www.carrefour.tn/default/nectar-a-la-mangue-de-1l-1l-6221024240102.html', 245, 3, 1),
(200, 1, '2023-06-18', 5.290, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6221024240119png.jpg', 'https://www.carrefour.tn/default/nectar-de-goyave-de-1l-1l-6221024240119.html', 244, 3, 1),
(201, 1, '2023-06-18', 0.865, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534803411_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dananas-null-6191534803411.html', 160, 3, 1),
(202, 1, '2023-06-18', 3.910, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194001801095.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-cocktail-2l-6194001801095.html', 280, 3, 1),
(203, 1, '2023-06-18', 3.250, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534803404.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dananas-null-6191534803404.html', 187, 3, 1),
(204, 1, '2023-06-18', 2.450, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6281034903930-1_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-banane-et-fraise-null-6281034903930.html', 169, 3, 1),
(205, 1, '2023-06-18', 3.250, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802902-1_.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-raisin-null-6191534802902.html', 237, 3, 1),
(206, 1, '2023-06-18', 2.500, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6281034906115-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-cocktail-de-fruits-float-null-6281034906115.html', 181, 3, 1),
(207, 1, '2023-06-18', 2.450, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6281034903572-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-a-la-mangue-float-null-6281034903572.html', 174, 3, 1),
(208, 1, '2023-06-18', 2.450, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6281034900182-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dananas-float-null-6281034900182.html', 170, 3, 1),
(209, 1, '2023-06-18', 2.450, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6281034900175-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-peche-float-null-6281034900175.html', 171, 3, 1),
(210, 1, '2023-06-18', 2.450, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/2/6281034016029-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dorange-float-null-6281034016029.html', 172, 3, 1),
(211, 1, '2023-06-18', 0.460, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802667.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dorange-fruzzy-6191534802667.html', 151, 3, 1),
(212, 1, '2023-06-18', 0.790, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802629-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dorange-fruzzy-19cl-6191534802629.html', 281, 3, 1),
(213, 1, '2023-06-18', 3.050, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191402602030.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-orange-250ml-6191402602030.html', 175, 3, 1),
(214, 1, '2023-06-18', 3.100, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191402602061-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-pomme-250ml-6191402602061.html', 177, 3, 1),
(215, 1, '2023-06-18', 1.970, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191402602023-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-tropical-250ml-6191402602023.html', 180, 3, 1),
(216, 1, '2023-06-18', 1.970, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191402602016-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-menthe-citron-250ml-6191402602016.html', 179, 3, 1),
(217, 1, '2023-06-18', 3.250, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802155-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-limonade-1l-6191534802155.html', 282, 3, 1),
(218, 1, '2023-06-18', 8.430, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191470100032_-1.jpg', 'https://www.carrefour.tn/default/jus-de-fleur-dorangers-100-naturel-6191470100032.html', 283, 3, 1),
(219, 1, '2023-06-18', 8.430, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191470100117-1.jpg', 'https://www.carrefour.tn/default/jus-de-peche-100-naturel-6191470100117.html', 209, 3, 1),
(220, 1, '2023-06-18', 0.860, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191514015407-1.jpg', 'https://www.carrefour.tn/default/boisson-instantanee-citron-6191514015407.html', 153, 3, 1),
(221, 1, '2023-06-18', 0.860, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191514015001-1.jpg', 'https://www.carrefour.tn/default/boisson-instantanee-orange-6191514015001.html', 152, 3, 1),
(222, 1, '2023-06-18', 0.860, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191514015100-1.jpg', 'https://www.carrefour.tn/default/boisson-instantanee-mangue-6191514015100.html', 158, 3, 1),
(223, 1, '2023-06-18', 0.860, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191514018552-1.jpg', 'https://www.carrefour.tn/default/boisson-instantanee-cocktail-de-fruits-6191514018552.html', 156, 3, 1),
(224, 1, '2023-06-18', 0.860, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191514015506-1.jpg', 'https://www.carrefour.tn/default/boisson-instantanee-peche-6191514015506.html', 157, 3, 1),
(225, 1, '2023-06-18', 0.860, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191514015605-1.jpg', 'https://www.carrefour.tn/default/boisson-instantanee-ananas-6191514015605.html', 155, 3, 1),
(226, 1, '2023-06-18', 0.860, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191514015209-1.jpg', 'https://www.carrefour.tn/default/boisson-instantanee-fraise-6191514015209.html', 154, 3, 1),
(227, 1, '2023-06-18', 0.790, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191402901782-1_1_1.jpg', 'https://www.carrefour.tn/default/boisson-instantanee-ananas-6191402901782.html', 284, 3, 1),
(228, 1, '2023-06-18', 0.790, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191402901805-1_1_1.jpg', 'https://www.carrefour.tn/default/boisson-instantanee-orange-6191402901805.html', 285, 3, 1),
(229, 1, '2023-06-18', 0.790, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191402901812-1_1_1.jpg', 'https://www.carrefour.tn/default/boisson-instantanee-citron-6191402901812.html', 286, 3, 1),
(230, 1, '2023-06-18', 2.730, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194007880018-1_2.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-cocktail-de-fruits-null-6194007880018.html', 238, 3, 1),
(231, 1, '2023-06-18', 0.790, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194007891793_1_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-multi-vitaminee-20cl-6194007891793.html', 230, 3, 1),
(232, 1, '2023-06-18', 2.590, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191503203709-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dorange-6191503203709.html', 287, 3, 1),
(233, 1, '2023-06-18', 3.150, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194001801200-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-tropical-bnino-6194001801200.html', 195, 3, 1),
(234, 1, '2023-06-18', 2.700, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194001801064-1_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-mangue-1l-6194001801064.html', 197, 3, 1),
(235, 1, '2023-06-18', 2.700, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194001801057-1_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-cocktail-de-fruits-1l-6194001801057.html', 199, 3, 1),
(236, 1, '2023-06-18', 2.700, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194001801040-1_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-orange-1l-6194001801040.html', 200, 3, 1);
INSERT INTO `product_provider` (`id`, `is_enabled`, `last_updated_date`, `price`, `image`, `link`, `product_id`, `provider_id`, `sub_category_id`) VALUES
(237, 1, '2023-06-18', 1.200, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194001801033-1..jpg', 'https://www.carrefour.tn/default/boisson-au-jus-energy-cocktail-6194001801033.html', 168, 3, 1),
(238, 1, '2023-06-18', 1.200, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194001801026-1_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dorange-6194001801026.html', 288, 3, 1),
(239, 1, '2023-06-18', 1.220, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194001801163-1_2.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-tropical-bnino-25cl-6194001801163.html', 167, 3, 1),
(240, 1, '2023-06-18', 0.800, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194019803142-1_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-cocktail-6194001801378.html', 164, 3, 1),
(241, 1, '2023-06-18', 0.800, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194001801361-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-orange-6194001801361.html', 163, 3, 1),
(242, 1, '2023-06-18', 10.200, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/9/0/9008700125147-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-bravo-9008700125147.html', 289, 3, 1),
(243, 1, '2023-06-18', 2.990, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194007892691-1_1_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dorange-banane--6194007892691.html', 240, 3, 1),
(244, 1, '2023-06-18', 0.790, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802636-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-tropical-fruzzy-19cl-6191534802636.html', 226, 3, 1),
(245, 1, '2023-06-18', 3.390, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194007890208-1_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-nectar-de-raisin-6194007890208.html', 290, 3, 1),
(246, 1, '2023-06-18', 2.740, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194007850073.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-nectar-dananas-null-6194007850073.html', 239, 3, 1),
(247, 1, '2023-06-18', 2.740, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194007850066.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-nectar-dorange-null-6194007850066.html', 198, 3, 1),
(248, 1, '2023-06-18', 2.740, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191572143777-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-grenade-6191572143777.html', 291, 3, 1),
(249, 1, '2023-06-18', 0.460, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802674-1_2_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-tropical-fruzzy-6191534802674.html', 150, 3, 1),
(250, 1, '2023-06-18', 3.250, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802162.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-mojito-1l-6191534802162.html', 186, 3, 1),
(251, 1, '2023-06-18', 3.250, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802117.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-nectar-multivitaminee-null-6191534802117.html', 189, 3, 1),
(252, 1, '2023-06-18', 3.250, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802100.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-mangue-null-6191534802100.html', 190, 3, 1),
(253, 1, '2023-06-18', 3.250, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802179.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-nectar-tropical-null-6191534802179.html', 194, 3, 1),
(254, 1, '2023-06-18', 3.250, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802186.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-fruits-blancs-null-6191534802186.html', 193, 3, 1),
(255, 1, '2023-06-18', 3.250, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802148-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-pomme-verte-1l-6191534802148.html', 292, 3, 1),
(256, 1, '2023-06-18', 3.250, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802124.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-peche-null-6191534802124.html', 188, 3, 1),
(257, 1, '2023-06-18', 3.250, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802131.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-poire-null-6191534802131.html', 191, 3, 1),
(258, 1, '2023-06-18', 3.250, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534802094.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dorange-null-6191534802094.html', 192, 3, 1),
(259, 1, '2023-06-18', 0.870, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534801851-1_1.jpg', 'https://www.carrefour.tn/default/jus-multi-vitamine-nectar-5-fruits-6-vitamines-null-6191534801851.html', 227, 3, 1),
(260, 1, '2023-06-18', 0.870, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534801813-1_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-dorange-null-6191534801813.html', 159, 3, 1),
(261, 1, '2023-06-18', 0.870, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534801844-1_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-mangue-null-6191534801844.html', 293, 3, 1),
(262, 1, '2023-06-18', 0.870, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191534801820-1_2.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-poire-null-6191534801820.html', 229, 3, 1),
(263, 1, '2023-06-18', 0.790, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191402902093-1.jpg', 'https://www.carrefour.tn/default/boisson-instantanee-peche-6191402902093.html', 294, 3, 1),
(264, 1, '2023-06-18', 0.790, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6191402901799-1.jpg', 'https://www.carrefour.tn/default/boisson-instantanee-tropical-6191402901799.html', 232, 3, 1),
(265, 1, '2023-06-18', 3.800, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194007892684-1_1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-de-poire-6194007892684.html', 201, 3, 1),
(266, 1, '2023-06-18', 2.740, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194007890185.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-nectar-de-mangue-null-6194007890185.html', 295, 3, 1),
(267, 1, '2023-06-18', 2.740, 'https://media.carrefour.tn/catalog/product/cache/bbe61c5e1237d092bcb31b107702a416/6/1/6194007892936-1.jpg', 'https://www.carrefour.tn/default/boisson-au-jus-multi-vitaminee-null-6194007892936.html', 296, 3, 1);

-- Swap the images for both product 177 and 178

UPDATE Product_Provider SET image = 'https://courses.monoprix.tn/ezzahra/146223-large_default/boisson-au-jus.jpg' WHERE product_id = 177 and provider_id = 1;

UPDATE Product_Provider SET image = 'https://courses.monoprix.tn/ezzahra/146222-large_default/nectar.jpg' WHERE product_id = 178 and provider_id = 1;

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
	ADD PRIMARY KEY `pk_product` (`id`);

--
-- Indexes for table `Product_Provider`
--

ALTER TABLE `Product_Provider`
	ADD PRIMARY KEY `pk_product_provider` (`id`),
	ADD KEY `fk_product` (`product_id`),
	ADD KEY `fk_provider` (`provider_id`),
	ADD KEY `fk_sub_category` (`sub_category_id`);

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
	MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `Product`
--

ALTER TABLE `Product`
	MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `Product_Provider`
--

ALTER TABLE `Product_Provider`
	MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `Provider`
--

ALTER TABLE `Provider`
	MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Sub_Category`
--

ALTER TABLE `Sub_Category`
	MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Product_Provider`
--

ALTER TABLE `Product_Provider`
	ADD CONSTRAINT `fk_product` FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`),
	ADD CONSTRAINT `fk_provider` FOREIGN KEY (`provider_id`) REFERENCES `Provider` (`id`),
	ADD CONSTRAINT `fk_sub_category` FOREIGN KEY (`sub_category_id`) REFERENCES `Sub_Category` (`id`);

--
-- Constraints for table `Sub_Category`
--

ALTER TABLE `Sub_Category`
	ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
