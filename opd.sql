-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2023 at 05:50 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
(1, 'CLASSIC SWEET', 'The Classic one for you', '2021-03-17 18:16:28'),
(2, 'WAFITO', 'a delightful creation that marries the beloved aspects of waffles and burritos, is a portable and indulgent culinary treat', '2021-03-17 18:17:14'),
(3, 'SWEET CORN', 'the peak of ripeness, sweet corn offers a burst of flavor that instantly evokes the essence of summertime', '2021-03-17 18:17:43'),
(4, 'GELATO TEMPO', 'smooth, creamy texture and intense flavors', '2021-03-17 18:19:10'),
(5, 'KORNJUZ', 'Complement your pizza with wide range of beverages available at Domino\'s Pizza Indiamildly sweet, with a subtle nuttiness and a hint of the natural sweetness of corn', '2021-03-17 21:58:58'),
(6, 'BLENDED SERIES', 'creamy texture, refreshing taste, and versatility in terms of flavors and ingredients', '2021-03-18 07:55:28'),
(7, 'COLD DRINKS', 'efreshing and enjoyable way to quench your thirst, especially on a hot day', '2021-03-18 08:06:30'),
(8, 'HOT DRINKS', 'comforting and invigorating beverages enjoyed worldwide, especially during colder weather or when seeking a cozy moment of relaxation', '2021-03-18 08:13:47');

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
(1, 'Kaya', 5, 'The authentic kaya flavour will make you addicted \r\n', 1, '2021-03-17 21:03:26'),
(2, 'Peanut', 5, 'made from ground peanuts that have been roasted', 1, '2021-03-17 21:20:58'),
(3, 'Margerine', 5, 'Classic flavour for you\r\n', 1, '2021-03-17 21:22:07'),
(4, 'Chocolate ', 5, 'Indulge your senses in the heavenly fusion of warm, golden waffles embraced by a velvety cascade of rich, melted chocolate\r\n\r\n', 1, '2021-03-17 21:23:05'),
(5, 'Blueberry', 5, 'Each bite of a blueberry waffle is a celebration of nature\'s goodness\r\n', 1, '2021-03-17 21:23:48'),
(6, 'Strawberry', 5, 'comforting embrace of the waffle perfectly complemented by the zesty brightness of the strawberries\r\n\r\n', 1, '2021-03-17 21:24:38'),
(7, 'Chicken Floss', 7, ' balance of sweet, salty, and savory flavors, with a subtle smokiness from the roasting process', 2, '2021-03-17 21:38:13'),
(8, 'Cocoa Deluxe ', 7, 'deep, bittersweet essence of premium cocoa\r\n', 2, '2021-03-17 21:37:21'),
(9, 'Japanese BBQ', 7, 'grilling with the rich flavors of marinated meats', 2, '2021-03-17 21:40:58'),
(10, 'Pandan Kaya', 7, 'enjoyed for its rich, creamy texture and distinctive pandan flavor.', 2, '2021-03-17 21:41:49'),
(11, 'Nyonya Coconut', 7, 'perfect balance of sweet, savory, spicy, and sour flavors', 2, '2021-03-17 21:39:49'),
(12, 'Original', 4, 'Classic one for you', 3, '2021-03-17 21:45:34'),
(13, 'Margarine Condensed milk', 5, 'delightful and creamy concoction that combines the smoothness of sweetened condensed milk with the richness of margarine', 3, '2021-03-17 21:46:21'),
(14, 'Cheezy Chili', 6, 'spicy chili flavors and the rich, creamy goodness of cheese', 3, '2021-03-17 21:47:51'),
(15, 'Cheezy', 6, 'rich, savory, and often salty taste of cheese', 3, '2021-03-17 21:47:07'),
(16, 'Cheezy Mayo Chilli', 6, ' delightful fusion of creamy mayonnaise, sharp cheese, and spicy chili', 3, '2021-03-17 21:49:36'),
(17, 'Cheezy Mayo', 6, ' a delightful combination of creamy mayonnaise and the rich, savory flavor of cheese', 3, '2021-03-17 21:48:44'),
(18, 'Spicy Cheezy', 6, 'combines the bold kick of spice with the creamy richness of cheese', 3, '2021-03-17 21:50:20'),
(19, 'Chocolate', 8, 'ts rich, intense flavor and incredibly smooth texture, is a symphony of chocolatey delights', 4, '2021-03-17 22:02:50'),
(20, 'Mango', 8, 'smooth texture and intense flavor, is a celebration of the sweet, fragrant mango fruit', 4, '2021-03-17 22:01:33'),
(21, ' Butterscotch', 8, 'buttery sweetness of butterscotch with the velvety smoothness', 4, '2021-03-17 22:06:59'),
(22, 'Blueberry', 8, 'he essence of ripe, juicy blueberries to life in a rich, creamy concoction', 4, '2021-03-17 22:06:06'),
(23, 'Strawberry', 8, 'sweet, juicy strawberries, delivering a burst of fruity freshness with every spoonful', 4, '2021-03-17 22:05:08'),
(24, 'Coffee', 8, 'captures the robust essence of freshly brewed coffee in a luxuriously creamy and velvety form', 4, '2021-03-17 22:08:58'),
(25, 'Caramel', 8, 'the rich, buttery sweetness of caramelized sugar', 4, '2021-03-17 22:08:13'),
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
(1, 'Daily Fresh', 'dailyfresh9718@gmail.com', 123402506, 192230159, 'PLO 16, Jalan SR/3, Kawasan Perindustrian Simpang Renggam 1, 86200 Simpang Renggam, Johor.', '2021-03-23 19:56:25');

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
(3, 'zulaikha', 'Nur', 'Zulaikha', 'nurzul2003@gmail.com', 1164905003, '0', '$2y$10$fdjTTpgLKKnjHym/n7A8ouSuFbyAEqVkJYeJGnSBlHQyPqejw5/1K', '0', 0, NULL, '2023-09-11 16:45:32'),
(4, 'Zulaikha 23', '2003', '2003', 'zulaikha23@gmail.com', 123456789, '0', '$2y$10$yPJU9ZZQIOV1uzld/7Q0v.Bd8Ge4EkBSCP1LzobDu45vbUrhpnG6.', '0', 0, NULL, '2023-09-11 17:29:55'),
(5, 'zulaikha 03', '1234', '1234', 'zul2003@gmail.com', 1926573390, '0', '$2y$10$mJRt3dKlwTjdEZWmsHepMeQ3m0x6.ap4vVx13idj8BFvKZPL7t79m', '0', 0, NULL, '2023-09-11 20:58:07'),
(6, 'zuu', 'Nurzulaikha', 'Mohd Isa', 'nrzulykha1501@gmail.com', 192230159, '0', '$2y$10$RFWwLW1ibO7bt.tpOynj4O0Cgl77RvY4IxGEfXgd4SURGrjlatw1a', '0', 0, NULL, '2023-09-12 16:57:06'),
(7, '', '', '', 'nrzulykha1501@gmail.com', 0, '0', '$2y$10$RFWwLW1ibO7bt.tpOynj4O0Cgl77RvY4IxGEfXgd4SURGrjlatw1a', '0bc4f51931be6f79456df29e6ecf8788', 0, NULL, '2023-09-12 22:06:34'),
(11, 'zuuu', 'Nurzulaikha', 'Mohd Isa', 'nrzulykha1501@gmail.com', 192230159, '0', '$2y$10$RFWwLW1ibO7bt.tpOynj4O0Cgl77RvY4IxGEfXgd4SURGrjlatw1a', '', 0, NULL, '2023-09-21 18:39:15'),
(14, 'alees', 'alees', 'ayuni', 'yayaysriiy@gmail.com', 123402506, '0', '$2y$10$Ert3BcOrY/tCooAi7t.dj.IQmElSQz3no2bOpRVdVkge56hUBoipC', '4cbc6d4e741770f0fd7320680ebd0d5e', 1, NULL, '2023-09-25 09:59:25'),
(15, 'amira', 'nur', 'amira', 'rajanurallea@gmail.com', 1234567893, '0', '$2y$10$22q./tLf5OPROtZFbD0VlOlEYgwhNCh1b4WqRFhxGctzVuAfIemt2', 'bb59fe4317abfa59ca9c86193822175f', 0, NULL, '2023-09-25 10:31:42'),
(16, 'yayayusri', 'Raja ', 'Nur Allea', 'rajanurallea@gmail.com', 1212340250, '1', '$2y$10$Oi6g5nqJSfwPwfIVwpaX9.PXfxVLn33fN0BxLvgDA2ciowAh8Yxvm', '', 0, NULL, '2023-09-25 21:46:12'),
(17, 'zulaikhaz', 'NURZULAIKHA', 'ISA', 'nrzulykha1501@gmail.com', 192230159, '0', '$2y$10$RFWwLW1ibO7bt.tpOynj4O0Cgl77RvY4IxGEfXgd4SURGrjlatw1a', '33e711c8b8f773785e9b9227518eede6', 1, NULL, '2023-10-01 23:44:45');

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
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `viewcart`
--
ALTER TABLE `viewcart`
  MODIFY `cartItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
