-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2023 at 09:52 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `opd`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categorieId` int(12) NOT NULL,
  `categorieName` varchar(255) NOT NULL,
  `categorieDesc` text NOT NULL,
  `categorieCreateDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categorieId`, `categorieName`, `categorieDesc`, `categorieCreateDate`) VALUES
(1, 'CLASSIC SWEET', 'A delight for veggie lovers! Choose from our wide range of delicious vegetarian pizzas, it\'s softer and tastier', '2021-03-17 18:16:28'),
(2, 'WAFITO', 'Choose your favourite non-veg pizzas from the Domino\'s Pizza menu. Get fresh non-veg pizza with your choice of crusts & toppings', '2021-03-17 18:17:14'),
(3, 'SWEET CORN', 'Indulge into mouth-watering taste of Pizza mania range, perfect answer to all your food cravings', '2021-03-17 18:17:43'),
(4, 'GELATO TEMPO', 'Complement your pizza with wide range of sides available at Domino\'s Pizza India', '2021-03-17 18:19:10'),
(5, 'KORNJUZ', 'Complement your pizza with wide range of beverages available at Domino\'s Pizza India', '2021-03-17 21:58:58'),
(6, 'BLENDED SERIES', 'Fresh Pan Pizza Tastiest Pan Pizza. ... Domino\'s freshly made pan-baked pizza; deliciously soft ,buttery,extra cheesy and delightfully crunchy.', '2021-03-18 07:55:28'),
(7, 'COLD DRINKS', 'Domino’s Pizza Introducing all new Burger Pizza with the tag line looks like a burger, tastes like a pizza. Burger Pizza is burger sized but comes in a small pizza box. It is come with pizza toppings such as herbs, vegetables, tomato sauce and mozzarella,', '2021-03-18 08:06:30'),
(8, 'HOT DRINKS', 'CHOICE OF TOPPINGS', '2021-03-18 08:13:47');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contactId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `orderId` int(21) NOT NULL DEFAULT 0 COMMENT 'If problem is not related to the order then order id = 0',
  `message` text NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contactreply`
--

CREATE TABLE `contactreply` (
  `id` int(21) NOT NULL,
  `contactId` int(21) NOT NULL,
  `userId` int(23) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deliverydetails`
--

CREATE TABLE `deliverydetails` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `deliveryBoyName` varchar(35) NOT NULL,
  `deliveryBoyPhoneNo` bigint(25) NOT NULL,
  `deliveryTime` int(200) NOT NULL COMMENT 'Time in minutes',
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `pizzaId` int(21) NOT NULL,
  `itemQuantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipCode` int(21) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `amount` int(200) NOT NULL,
  `paymentMode` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=cash on delivery, \r\n1=online ',
  `orderStatus` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0' COMMENT '0=Order Placed.\r\n1=Order Confirmed.\r\n2=Preparing your Order.\r\n3=Your order is on the way!\r\n4=Order Delivered.\r\n5=Order Denied.\r\n6=Order Cancelled.',
  `orderDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_temp`
--

CREATE TABLE `password_reset_temp` (
  `email` varchar(250) NOT NULL,
  `key` varchar(250) NOT NULL,
  `expDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `password_reset_temp`
--

INSERT INTO `password_reset_temp` (`email`, `key`, `expDate`) VALUES
('nrzulykha1501@gmail.com', '93650b4996fe414667f6e615bc6c6096', '2023-09-13 15:00:06'),
('nrzulykha1501@gmail.com', '144054e6d47e98015c76d95be62890fc', '2023-09-13 15:00:47'),
('nrzulykha1501@gmail.com', 'faa10d56c60942500479b5227d15ab51', '2023-09-13 15:03:09'),
('nrzulykha1501@gmail.com', 'c13cb9c5ce5b268bed622f90a50996ff', '2023-09-13 15:06:52'),
('nrzulykha1501@gmail.com', '92d956fb5c3d4d032645dd9420fc4889', '2023-09-13 15:07:32'),
('nrzulykha1501@gmail.com', '5cb3d2286365ef9d6a6cf46eb5ea6528', '2023-09-13 15:11:14'),
('nrzulykha1501@gmail.com', '5a2aea0fe8a288c759e10a1b471c90bd', '2023-09-13 15:11:46'),
('nrzulykha1501@gmail.com', '9a6128f8200e119a50b7d1d284c1a27c', '2023-09-13 15:22:55'),
('nrzulykha1501@gmail.com', '93f5fb62d119cd53b4e47f81023b9288', '2023-09-13 16:29:46'),
('nrzulykha1501@gmail.com', '82169308a571403781733a7c046b375c', '2023-09-13 17:05:14'),
('nrzulykha1501@gmail.com', 'bd69433b2cc401373822edf01334b19a', '2023-09-13 17:06:10'),
('nrzulykha1501@gmail.com', '45614abf771d5aac993c2ea43a27e990', '2023-09-13 17:08:17'),
('nrzulykha1501@gmail.com', 'c3c797d67da02aef7023f2e69ca0141f', '2023-09-13 17:15:27'),
('nrzulykha1501@gmail.com', '4c3446e15cc69fab3425c9cac326cee6', '2023-09-13 17:17:17'),
('nrzulykha1501@gmail.com', '2aed66ff526b84628cb6f4ff0b65b406', '2023-09-13 17:27:29'),
('nrzulykha1501@gmail.com', '11209da3999b813e5ff7f61a73bfcd7c', '2023-09-13 17:34:37'),
('nrzulykha1501@gmail.com', '24523714f8e17b61455963da548c6f16', '2023-09-13 17:38:26'),
('nrzulykha1501@gmail.com', '6b7509b8812c6bade99794d40e2d4a59', '2023-09-14 08:12:59'),
('nrzulykha1501@gmail.com', 'd43030d746d13ae3a8d28d8655f15d22', '2023-09-21 12:09:53'),
('nrzulykha1501@gmail.com', '58127b7ba077416c081baf9497f3a589', '2023-09-21 14:27:23'),
('nrzulykha1501@gmail.com', 'da57ec92c76cb315dc98972d73aa751f', '2023-09-21 14:36:22'),
('nrzulykha1501@gmail.com', 'eb3a90d4e4b329a1577a950d1948b74f', '2023-09-21 14:40:11'),
('nrzulykha1501@gmail.com', '8375f59a0d9bae7047b57d7e2a15c73e', '2023-09-21 14:54:06'),
('nrzulykha1501@gmail.com', 'cb65a49f1db0fbd2015765a0ea461d4d', '2023-09-21 15:04:13'),
('nrzulykha1501@gmail.com', '089fff9129417c8ae7a6d04748eada1a', '2023-09-21 15:04:59'),
('nrzulykha1501@gmail.com', '4819cea384e6aa389bd8270163666f34', '2023-09-21 15:17:31'),
('nrzulykha1501@gmail.com', '8baccbab7e99c5e57209d8e62b20d1c5', '2023-09-21 15:20:26'),
('nrzulykha1501@gmail.com', '3a56440cfa23728946cdb6bb663bd9d4', '2023-09-21 15:27:40'),
('nrzulykha1501@gmail.com', '0d5881b2e62149f5208082bc2a266d5e', '2023-09-21 15:30:03'),
('nrzulykha1501@gmail.com', '748050094e29311aa2b74cb342a8d8f0', '2023-09-21 15:32:46'),
('nrzulykha1501@gmail.com', '5ae6a9925376d2464aeab0dd22d1d9f5', '2023-09-22 10:45:25'),
('nrzulykha1501@gmail.com', 'e67e80ed9c8ff34da6a520513ce50731', '2023-09-22 11:22:58'),
('nrzulykha1501@gmail.com', 'ded0505f869ed3842ce55364664712b7', '2023-09-22 11:30:36'),
('nrzulykha1501@gmail.com', '34ebb3d976869a4fe1c8b918db6a9f00', '2023-09-22 11:33:34'),
('nrzulykha1501@gmail.com', '211f9ccf6909af978127403377ff8dea', '2023-09-22 11:33:37'),
('nrzulykha1501@gmail.com', '3873ee1f01d8974b4f0f45213bdfea45', '2023-09-22 11:37:29'),
('nrzulykha1501@gmail.com', 'dba6bafd962b8724a45433a98bcde5c1', '2023-09-22 11:46:03'),
('nrzulykha1501@gmail.com', '755c9d21245a19f699c5b8111cde213d', '2023-09-22 11:46:26'),
('nrzulykha1501@gmail.com', 'e03547ebacc653007bf47613ee6d7323', '2023-09-22 11:47:11'),
('nrzulykha1501@gmail.com', '7eb8c140a6d2f3e905ccfe81471355ef', '2023-09-22 12:21:38'),
('nrzulykha1501@gmail.com', '65d5d15ad05118f06d501fae0c292339', '2023-09-22 12:22:22'),
('nrzulykha1501@gmail.com', 'fb1971659e9d956c4ccaabb63bf0fb11', '2023-09-22 12:23:08'),
('nrzulykha1501@gmail.com', '5d02de071d9bc43d66a1cc9e0c8bddd9', '2023-09-22 12:24:51'),
('nrzulykha1501@gmail.com', 'f3462669bf5fed5a824bcfde1097536b', '2023-09-22 12:25:11'),
('nrzulykha1501@gmail.com', '5378ded44d4f9553dedb8d0ff45680d5', '2023-09-22 12:34:40'),
('nrzulykha1501@gmail.com', 'fdc561f306c4d386a8ecbb2f88faa85e', '2023-09-22 12:35:03'),
('nrzulykha1501@gmail.com', '094275d2ccf24880b4f58bc5b5f53548', '2023-09-22 12:39:49'),
('nrzulykha1501@gmail.com', 'e7baa9b729ca847defb65aeeb0944ae3', '2023-09-22 12:40:39'),
('nrzulykha1501@gmail.com', 'ad21f18cae8f9f8d52174f03f4b9be2e', '2023-09-22 12:47:55'),
('nrzulykha1501@gmail.com', 'b12427da4dae325618fcedd5e3247b84', '2023-09-22 12:48:23'),
('nrzulykha1501@gmail.com', 'ec26f7e8a01e0a8ccd872d6365228cc8', '2023-09-22 12:54:35'),
('nrzulykha1501@gmail.com', '8498f70dfb3278684c930fa3c708d9ec', '2023-09-22 12:55:46'),
('nrzulykha1501@gmail.com', '37ac30b010450539e5f76cd66168425b', '2023-09-22 13:57:39'),
('nrzulykha1501@gmail.com', '74801edcddf197e0aa75d7a43ffa5e33', '2023-09-22 13:58:39'),
('nrzulykha1501@gmail.com', 'b68b77abfdb1e64434e3dbd53b24e974', '2023-09-22 13:59:09'),
('nrzulykha1501@gmail.com', 'a5b84d33d5a06b14d359d8e3eaf972a5', '2023-09-22 14:01:07'),
('nrzulykha1501@gmail.com', 'cede937c91385945efa759a1013051c0', '2023-09-22 14:01:27'),
('nrzulykha1501@gmail.com', '84faaff7b0c2f54782b345eb65b7f0f2', '2023-09-22 14:01:29'),
('nrzulykha1501@gmail.com', '184f7ee10e9059a9e4421ed35ff26775', '2023-09-22 14:09:54'),
('nrzulykha1501@gmail.com', '3c34361dcfebad2bafbf707297aa629f', '2023-09-22 14:10:24'),
('nrzulykha1501@gmail.com', 'c3d98e0792a2ddfc9ef43a2fb5003ba4', '2023-09-22 14:15:17'),
('nrzulykha1501@gmail.com', 'c772a381c9ac2b650563288d41061b7d', '2023-09-22 14:15:48'),
('nrzulykha1501@gmail.com', '22a762c140064205919b63d799ed5f60', '2023-09-22 14:20:06'),
('nrzulykha1501@gmail.com', '5d77e61a69c5d289df2d935c902ec04a', '2023-09-22 14:20:58'),
('nrzulykha1501@gmail.com', '39495e15514523cfd70d29155ef40e00', '2023-09-22 14:37:10'),
('nrzulykha1501@gmail.com', 'b18f11dacd0b1fb3d2551912f8d9acbc', '2023-09-22 14:37:30'),
('nrzulykha1501@gmail.com', '93650b4996fe414667f6e615bc6c6096', '2023-09-13 15:00:06'),
('nrzulykha1501@gmail.com', '144054e6d47e98015c76d95be62890fc', '2023-09-13 15:00:47'),
('nrzulykha1501@gmail.com', 'faa10d56c60942500479b5227d15ab51', '2023-09-13 15:03:09'),
('nrzulykha1501@gmail.com', 'c13cb9c5ce5b268bed622f90a50996ff', '2023-09-13 15:06:52'),
('nrzulykha1501@gmail.com', '92d956fb5c3d4d032645dd9420fc4889', '2023-09-13 15:07:32'),
('nrzulykha1501@gmail.com', '5cb3d2286365ef9d6a6cf46eb5ea6528', '2023-09-13 15:11:14'),
('nrzulykha1501@gmail.com', '5a2aea0fe8a288c759e10a1b471c90bd', '2023-09-13 15:11:46'),
('nrzulykha1501@gmail.com', '9a6128f8200e119a50b7d1d284c1a27c', '2023-09-13 15:22:55'),
('nrzulykha1501@gmail.com', '93f5fb62d119cd53b4e47f81023b9288', '2023-09-13 16:29:46'),
('nrzulykha1501@gmail.com', '82169308a571403781733a7c046b375c', '2023-09-13 17:05:14'),
('nrzulykha1501@gmail.com', 'bd69433b2cc401373822edf01334b19a', '2023-09-13 17:06:10'),
('nrzulykha1501@gmail.com', '45614abf771d5aac993c2ea43a27e990', '2023-09-13 17:08:17'),
('nrzulykha1501@gmail.com', 'c3c797d67da02aef7023f2e69ca0141f', '2023-09-13 17:15:27'),
('nrzulykha1501@gmail.com', '4c3446e15cc69fab3425c9cac326cee6', '2023-09-13 17:17:17'),
('nrzulykha1501@gmail.com', '2aed66ff526b84628cb6f4ff0b65b406', '2023-09-13 17:27:29'),
('nrzulykha1501@gmail.com', '11209da3999b813e5ff7f61a73bfcd7c', '2023-09-13 17:34:37'),
('nrzulykha1501@gmail.com', '24523714f8e17b61455963da548c6f16', '2023-09-13 17:38:26'),
('nrzulykha1501@gmail.com', '6b7509b8812c6bade99794d40e2d4a59', '2023-09-14 08:12:59'),
('nrzulykha1501@gmail.com', 'd43030d746d13ae3a8d28d8655f15d22', '2023-09-21 12:09:53'),
('nrzulykha1501@gmail.com', '58127b7ba077416c081baf9497f3a589', '2023-09-21 14:27:23'),
('nrzulykha1501@gmail.com', 'da57ec92c76cb315dc98972d73aa751f', '2023-09-21 14:36:22'),
('nrzulykha1501@gmail.com', 'eb3a90d4e4b329a1577a950d1948b74f', '2023-09-21 14:40:11'),
('nrzulykha1501@gmail.com', '8375f59a0d9bae7047b57d7e2a15c73e', '2023-09-21 14:54:06'),
('nrzulykha1501@gmail.com', 'cb65a49f1db0fbd2015765a0ea461d4d', '2023-09-21 15:04:13'),
('nrzulykha1501@gmail.com', '089fff9129417c8ae7a6d04748eada1a', '2023-09-21 15:04:59'),
('nrzulykha1501@gmail.com', '4819cea384e6aa389bd8270163666f34', '2023-09-21 15:17:31'),
('nrzulykha1501@gmail.com', '8baccbab7e99c5e57209d8e62b20d1c5', '2023-09-21 15:20:26'),
('nrzulykha1501@gmail.com', '3a56440cfa23728946cdb6bb663bd9d4', '2023-09-21 15:27:40'),
('nrzulykha1501@gmail.com', '0d5881b2e62149f5208082bc2a266d5e', '2023-09-21 15:30:03'),
('nrzulykha1501@gmail.com', '748050094e29311aa2b74cb342a8d8f0', '2023-09-21 15:32:46'),
('nrzulykha1501@gmail.com', '5ae6a9925376d2464aeab0dd22d1d9f5', '2023-09-22 10:45:25'),
('nrzulykha1501@gmail.com', 'e67e80ed9c8ff34da6a520513ce50731', '2023-09-22 11:22:58'),
('nrzulykha1501@gmail.com', 'ded0505f869ed3842ce55364664712b7', '2023-09-22 11:30:36'),
('nrzulykha1501@gmail.com', '34ebb3d976869a4fe1c8b918db6a9f00', '2023-09-22 11:33:34'),
('nrzulykha1501@gmail.com', '211f9ccf6909af978127403377ff8dea', '2023-09-22 11:33:37'),
('nrzulykha1501@gmail.com', '3873ee1f01d8974b4f0f45213bdfea45', '2023-09-22 11:37:29'),
('nrzulykha1501@gmail.com', 'dba6bafd962b8724a45433a98bcde5c1', '2023-09-22 11:46:03'),
('nrzulykha1501@gmail.com', '755c9d21245a19f699c5b8111cde213d', '2023-09-22 11:46:26'),
('nrzulykha1501@gmail.com', 'e03547ebacc653007bf47613ee6d7323', '2023-09-22 11:47:11'),
('nrzulykha1501@gmail.com', '7eb8c140a6d2f3e905ccfe81471355ef', '2023-09-22 12:21:38'),
('nrzulykha1501@gmail.com', '65d5d15ad05118f06d501fae0c292339', '2023-09-22 12:22:22'),
('nrzulykha1501@gmail.com', 'fb1971659e9d956c4ccaabb63bf0fb11', '2023-09-22 12:23:08'),
('nrzulykha1501@gmail.com', '5d02de071d9bc43d66a1cc9e0c8bddd9', '2023-09-22 12:24:51'),
('nrzulykha1501@gmail.com', 'f3462669bf5fed5a824bcfde1097536b', '2023-09-22 12:25:11'),
('nrzulykha1501@gmail.com', '5378ded44d4f9553dedb8d0ff45680d5', '2023-09-22 12:34:40'),
('nrzulykha1501@gmail.com', 'fdc561f306c4d386a8ecbb2f88faa85e', '2023-09-22 12:35:03'),
('nrzulykha1501@gmail.com', '094275d2ccf24880b4f58bc5b5f53548', '2023-09-22 12:39:49'),
('nrzulykha1501@gmail.com', 'e7baa9b729ca847defb65aeeb0944ae3', '2023-09-22 12:40:39'),
('nrzulykha1501@gmail.com', 'ad21f18cae8f9f8d52174f03f4b9be2e', '2023-09-22 12:47:55'),
('nrzulykha1501@gmail.com', 'b12427da4dae325618fcedd5e3247b84', '2023-09-22 12:48:23'),
('nrzulykha1501@gmail.com', 'ec26f7e8a01e0a8ccd872d6365228cc8', '2023-09-22 12:54:35'),
('nrzulykha1501@gmail.com', '8498f70dfb3278684c930fa3c708d9ec', '2023-09-22 12:55:46'),
('nrzulykha1501@gmail.com', '37ac30b010450539e5f76cd66168425b', '2023-09-22 13:57:39'),
('nrzulykha1501@gmail.com', '74801edcddf197e0aa75d7a43ffa5e33', '2023-09-22 13:58:39'),
('nrzulykha1501@gmail.com', 'b68b77abfdb1e64434e3dbd53b24e974', '2023-09-22 13:59:09'),
('nrzulykha1501@gmail.com', 'a5b84d33d5a06b14d359d8e3eaf972a5', '2023-09-22 14:01:07'),
('nrzulykha1501@gmail.com', 'cede937c91385945efa759a1013051c0', '2023-09-22 14:01:27'),
('nrzulykha1501@gmail.com', '84faaff7b0c2f54782b345eb65b7f0f2', '2023-09-22 14:01:29'),
('nrzulykha1501@gmail.com', '184f7ee10e9059a9e4421ed35ff26775', '2023-09-22 14:09:54'),
('nrzulykha1501@gmail.com', '3c34361dcfebad2bafbf707297aa629f', '2023-09-22 14:10:24'),
('nrzulykha1501@gmail.com', 'c3d98e0792a2ddfc9ef43a2fb5003ba4', '2023-09-22 14:15:17'),
('nrzulykha1501@gmail.com', 'c772a381c9ac2b650563288d41061b7d', '2023-09-22 14:15:48'),
('nrzulykha1501@gmail.com', '22a762c140064205919b63d799ed5f60', '2023-09-22 14:20:06'),
('nrzulykha1501@gmail.com', '5d77e61a69c5d289df2d935c902ec04a', '2023-09-22 14:20:58'),
('nrzulykha1501@gmail.com', '39495e15514523cfd70d29155ef40e00', '2023-09-22 14:37:10'),
('nrzulykha1501@gmail.com', 'b18f11dacd0b1fb3d2551912f8d9acbc', '2023-09-22 14:37:30');

-- --------------------------------------------------------

--
-- Table structure for table `pizza`
--

CREATE TABLE `pizza` (
  `pizzaId` int(12) NOT NULL,
  `pizzaName` varchar(255) NOT NULL,
  `pizzaPrice` int(12) NOT NULL,
  `pizzaDesc` text NOT NULL,
  `pizzaCategorieId` int(12) NOT NULL,
  `pizzaPubDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pizza`
--

INSERT INTO `pizza` (`pizzaId`, `pizzaName`, `pizzaPrice`, `pizzaDesc`, `pizzaCategorieId`, `pizzaPubDate`) VALUES
(1, 'Kaya', 5, 'A hugely popular margherita, with a deliciously tangy single cheese topping\r\n\r\n', 1, '2021-03-17 21:03:26'),
(2, 'Peanut', 5, 'The ever-popular Margherita - loaded with extra cheese... oodies of it', 1, '2021-03-17 21:20:58'),
(3, 'Margerine', 5, 'A pizza that goes ballistic on veggies! Check out this mouth watering overload of crunchy, crisp capsicum, succulent mushrooms and fresh tomatoes\r\n\r\n', 1, '2021-03-17 21:22:07'),
(4, 'Chocolate ', 5, 'Chunky paneer with crisp capsicum and spicy red pepper - quite a mouthful!\r\n\r\n', 1, '2021-03-17 21:23:05'),
(5, 'Blueberry', 5, 'A pizza loaded with crunchy onions, crisp capsicum, juicy tomatoes and jalapeno with a liberal sprinkling of exotic Mexican herbs.\r\n\r\n', 1, '2021-03-17 21:23:48'),
(6, 'Strawberry', 319, 'For a vegetarian looking for a BIG treat that goes easy on the spices, this one\'s got it all.. The onions, the capsicum, those delectable mushrooms - with paneer and golden corn to top it all.\r\n\r\n', 1, '2021-03-17 21:24:38'),
(16, 'Non Veg Supreme\r\n', 399, 'Bite into supreme delight of Black Olives, Onions, Grilled Mushrooms, Pepper BBQ Chicken, Peri-Peri Chicken, Grilled Chicken Rashers\r\n\r\n', 2, '2021-03-17 21:37:21'),
(17, 'Chicken Dominator', 319, 'Treat your taste buds with Double Pepper Barbecue Chicken, Peri-Peri Chicken, Chicken Tikka & Grilled Chicken Rashers', 2, '2021-03-17 21:38:13'),
(18, 'PEPPER BARBECUE & ONION\r\n', 249, 'Pepper Barbecue Chicken I Onion', 2, '2021-03-17 21:39:49'),
(19, 'CHICKEN FIESTA', 199, 'Grilled Chicken Rashers I Peri-Peri Chicken I Onion I Capsicum', 2, '2021-03-17 21:40:58'),
(20, 'Indi Chicken Tikka', 349, 'The wholesome flavour of tandoori masala with Chicken tikka I onion I red paprika I mint mayo', 2, '2021-03-17 21:41:49'),
(22, 'VEG LOADED', 149, 'Tomato | Grilled Mushroom |Jalapeno |Golden Corn | Beans in a fresh pan crust', 3, '2021-03-17 21:45:34'),
(23, 'CHEESY', 99, 'Orange Cheddar Cheese I Mozzarella', 3, '2021-03-17 21:46:21'),
(24, 'CAPSICUM', 99, 'Capsicum', 3, '2021-03-17 21:47:07'),
(25, 'ONION', 99, 'onion', 3, '2021-03-17 21:47:51'),
(26, 'GOLDEN CORN', 139, 'Golden Corn', 3, '2021-03-17 21:48:44'),
(27, 'PANEER & ONION', 149, 'Creamy Paneer | Onion', 3, '2021-03-17 21:49:36'),
(28, 'CHEESE N TOMATO', 149, 'A delectable combination of cheese and juicy tomato', 3, '2021-03-17 21:50:20'),
(29, 'Garlic Breadsticks', 99, 'The endearing tang of garlic in breadstics baked to perfection.', 4, '2021-03-17 22:01:33'),
(30, 'Stuffed Garlic Bread', 99, 'Freshly Baked Garlic Bread stuffed with mozzarella cheese, sweet corns & tangy and spicy jalapeños', 4, '2021-03-17 22:02:50'),
(32, 'Non Veg Pasta Italiano White', 99, 'Penne Pasta tossed with extra virgin olive oil, exotic herbs & a generous helping of new flavoured sauce.', 4, '2021-03-17 22:05:08'),
(33, 'Cheese Jalapeno Dip', 35, 'A soft creamy cheese dip spiced with jalapeno.', 4, '2021-03-17 22:06:06'),
(34, 'Cheese Dip', 35, 'A dreamy creamy cheese dip to add that extra tang to your snack.', 4, '2021-03-17 22:06:59'),
(35, 'Lava Cake', 99, 'Filled with delecious molten chocolate inside.', 4, '2021-03-17 22:08:13'),
(36, 'Butterscotch Mousse Cake', 149, 'A Creamy & Chocolaty indulgence with layers of rich, fluffy Butterscotch Cream and delicious Dark Chocolate Cake, topped with crunchy Dark Chocolate morsels - for a perfect dessert treat!', 4, '2021-03-17 22:08:58'),
(37, 'Lipton Ice Tea', 25, ' 250ml', 5, '2021-03-17 22:12:53'),
(38, 'Mirinda', 35, '500ml', 5, '2021-03-17 22:13:38'),
(39, 'PEPSI BLACK CAN', 45, 'PEPSI BLACK CAN', 5, '2021-03-17 22:14:24'),
(40, 'Pepsi\r\n', 52, '500ml', 5, '2021-03-17 22:16:29'),
(41, '7Up', 52, '500ml', 5, '2021-03-17 22:17:08'),
(42, 'Cheese Burst', 249, 'Crust with oodles of yummy liquid cheese filled inside.', 6, '2021-03-18 07:57:27'),
(43, 'Classic Hand Tossed', 249, 'Dominos traditional hand stretched crust, crisp on outside, soft & light inside.', 6, '2021-03-18 07:59:52'),
(44, 'Wheat Thin Crust', 299, 'Presenting the light healthier and delicious light wheat thin crust from Dominos.', 6, '2021-03-18 08:00:39'),
(45, 'Fresh Pan Pizza', 299, 'Tastiest Pan Pizza.Ever.\r\nDomino’s freshly made pan-baked pizza; deliciously soft ,buttery,extra cheesy and delightfully crunchy.', 6, '2021-03-18 08:01:29'),
(46, 'New Hand Tossed', 299, 'Classic Domino\'s crust. Fresh, hand stretched.', 6, '2021-03-18 08:03:17'),
(47, 'BURGER PIZZA- CLASSIC VEG', 129, 'Bite into delight! Witness the epic combination of pizza and burger with our classic Burger Pizza, that looks good and tastes great!', 7, '2021-03-18 08:09:17'),
(48, 'BURGER PIZZA- PREMIUM VEG', 139, 'The good just got better! Treat yourself to the premium taste of the Burger Pizza, that looks good and tastes great with paneer and red paprika.', 7, '2021-03-18 08:09:59'),
(49, 'BURGER PIZZA- CLASSIC NON VEG', 149, 'For all the meat cravers, try the classic non-veg Burger Pizza loaded with the goodness of burger and the greatness of pizza.', 7, '2021-03-18 08:10:37'),
(52, 'Non Veg Toppings', 55, 'Barbeque Chicken, Hot \'n\' Spicy Chicken,Chunky Chicken and Chicken Salami.', 8, '2021-03-18 08:16:29'),
(53, 'Packaged Drinking Water', 20, 'Drinking Water	', 5, '2021-03-18 08:20:40');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password` varchar(400) NOT NULL,
  `ip` varchar(200) NOT NULL,
  `member_since` varchar(100) NOT NULL,
  `membership` int(11) NOT NULL,
  `dom` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `courtry` varchar(100) NOT NULL,
  `activate` tinyint(4) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `about_me` varchar(1000) NOT NULL,
  `re_emai` varchar(150) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `ccode` int(11) NOT NULL,
  `activation_has` varchar(300) NOT NULL,
  `activation_time` varchar(200) NOT NULL,
  `website` varchar(300) NOT NULL,
  `fb` varchar(1000) NOT NULL,
  `twitter` varchar(1000) NOT NULL,
  `fb_id` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`id`, `username`, `email`, `password`, `ip`, `member_since`, `membership`, `dom`, `city`, `courtry`, `activate`, `first_name`, `last_name`, `about_me`, `re_emai`, `gender`, `mobile`, `ccode`, `activation_has`, `activation_time`, `website`, `fb`, `twitter`, `fb_id`) VALUES
(30, 'stint', 'gajanand.kgn@rediffmail.com', '$2y$10$9ND.xDaDLZnMup6I4qHfzOpj05zH6AsW4RzHODiWkzmQQllo2UyQC', '113.193.102.61', '2017/09/03 14:50:35', 1, '', 'Indore', 'India', 1, 'Gajanand', 'Rathor', '', '', 'M', '', 0, 'null', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `sitedetail`
--

CREATE TABLE `sitedetail` (
  `tempId` int(11) NOT NULL,
  `systemName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `contact1` bigint(21) NOT NULL,
  `contact2` bigint(21) DEFAULT NULL COMMENT 'Optional',
  `address` text NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sitedetail`
--

INSERT INTO `sitedetail` (`tempId`, `systemName`, `email`, `contact1`, `contact2`, `address`, `dateTime`) VALUES
(1, 'Pizza World', 'darshanparmar263@gmail.com', 2515469442, 6304468851, '601 Sherwood Ave.<br> San Bernandino', '2021-03-23 19:56:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(21) NOT NULL,
  `username` varchar(21) NOT NULL,
  `firstName` varchar(21) NOT NULL,
  `lastName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `userType` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=user\r\n1=admin',
  `password` varchar(255) NOT NULL,
  `verify_token` varchar(255) NOT NULL,
  `verify_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0=no, 1=yes',
  `expDate` datetime DEFAULT NULL,
  `joinDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `email`, `phone`, `userType`, `password`, `verify_token`, `verify_status`, `expDate`, `joinDate`) VALUES
(1, 'admin', 'admin', 'admin', 'admin@gmail.com', 1111111111, '1', '$2y$10$AAfxRFOYbl7FdN17rN3fgeiPu/xQrx6MnvRGzqjVHlGqHAM4d9T1i', '0', 0, NULL, '2021-04-11 11:40:58'),
(2, 'yayayusrii', 'RAJA NUR ALLEA DEWI M', 'RAJA MOHD YUSRI', 'rajanurallea@gmail.com', 123402506, '0', '$2y$10$ixThCLiH1oNada3h5Ab3NuLA0N6il.AQiEsImGWRdZgIpQufO86ci', '0', 0, NULL, '2023-09-03 21:39:40'),
(3, 'zulaikha', 'Nur', 'Zulaikha', 'nurzul2003@gmail.com', 1164905003, '0', '$2y$10$fdjTTpgLKKnjHym/n7A8ouSuFbyAEqVkJYeJGnSBlHQyPqejw5/1K', '0', 0, NULL, '2023-09-11 16:45:32'),
(4, 'Zulaikha 23', '2003', '2003', 'zulaikha23@gmail.com', 123456789, '0', '$2y$10$yPJU9ZZQIOV1uzld/7Q0v.Bd8Ge4EkBSCP1LzobDu45vbUrhpnG6.', '0', 0, NULL, '2023-09-11 17:29:55'),
(5, 'zulaikha 03', '1234', '1234', 'zul2003@gmail.com', 1926573390, '0', '$2y$10$mJRt3dKlwTjdEZWmsHepMeQ3m0x6.ap4vVx13idj8BFvKZPL7t79m', '0', 0, NULL, '2023-09-11 20:58:07'),
(6, 'zuu', 'Nurzulaikha', 'Mohd Isa', 'nrzulykha1501@gmail.com', 192230159, '0', '$2y$10$eloMAUJX91LDIG03Jydw9.jvGjhYsQAsXlWqq6efjFTpAwmJWrcNG', '0', 0, NULL, '2023-09-12 16:57:06'),
(7, '', '', '', 'nrzulykha1501@gmail.com', 0, '0', '', '0bc4f51931be6f79456df29e6ecf8788', 0, NULL, '2023-09-12 22:06:34'),
(11, 'zuuu', 'Nurzulaikha', 'Mohd Isa', 'nrzulykha1501@gmail.com', 192230159, '0', '$2y$10$kLTD6gGuRDg/FBpGy7QO6e0/0eKqkW5AMtx.R87xmdK49wAgxBbF.', '', 0, NULL, '2023-09-21 18:39:15');

-- --------------------------------------------------------

--
-- Table structure for table `viewcart`
--

CREATE TABLE `viewcart` (
  `cartItemId` int(11) NOT NULL,
  `pizzaId` int(11) NOT NULL,
  `itemQuantity` int(100) NOT NULL,
  `userId` int(11) NOT NULL,
  `addedDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `viewcart`
--

INSERT INTO `viewcart` (`cartItemId`, `pizzaId`, `itemQuantity`, `userId`, `addedDate`) VALUES
(1, 1, 1, 3, '2023-09-12 13:48:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categorieId`);
ALTER TABLE `categories` ADD FULLTEXT KEY `categorieName` (`categorieName`,`categorieDesc`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactId`);

--
-- Indexes for table `contactreply`
--
ALTER TABLE `contactreply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderId` (`orderId`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`pizzaId`);
ALTER TABLE `pizza` ADD FULLTEXT KEY `pizzaName` (`pizzaName`,`pizzaDesc`);

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `signup` ADD FULLTEXT KEY `ft_signup` (`username`);

--
-- Indexes for table `sitedetail`
--
ALTER TABLE `sitedetail`
  ADD PRIMARY KEY (`tempId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `viewcart`
--
ALTER TABLE `viewcart`
  ADD PRIMARY KEY (`cartItemId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categorieId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contactId` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contactreply`
--
ALTER TABLE `contactreply`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pizza`
--
ALTER TABLE `pizza`
  MODIFY `pizzaId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `signup`
--
ALTER TABLE `signup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `sitedetail`
--
ALTER TABLE `sitedetail`
  MODIFY `tempId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `viewcart`
--
ALTER TABLE `viewcart`
  MODIFY `cartItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
