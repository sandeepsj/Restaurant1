-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2019 at 01:26 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `ItemCode` int(11) NOT NULL,
  `FoodItemName` varchar(50) COLLATE utf8_bin NOT NULL,
  `FoodDomain` enum('STARTERS','MAIN_DISHES','DESERTS','DRINKS') COLLATE utf8_bin NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Rating` int(11) NOT NULL,
  `imagePath` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`ItemCode`, `FoodItemName`, `FoodDomain`, `Price`, `Rating`, `imagePath`) VALUES
(1, 'Garlic Bread', 'STARTERS', '8.50', 4, 'images/menu-item-thumbnail-01.jpg'),
(2, 'Mixed Salad', 'STARTERS', '25.00', 3, 'images/menu-item-thumbnail-02.jpg'),
(3, 'BBQ Chicken Wings', 'STARTERS', '10.00', 5, 'images/menu-item-thumbnail-03.jpg'),
(4, 'Meat Feast Pizza', 'MAIN_DISHES', '5.00', 4, 'images/menu-item-thumbnail-04.jpg'),
(5, 'Chocolate Fudgecake', 'DESERTS', '4.50', 3, 'images/menu-item-thumbnail-07.jpg'),
(6, 'Meat Feast Pizza', 'DRINKS', '12.50', 2, 'images/menu-item-thumbnail-10.jpg'),
(7, 'Chicken Tikka Masala', 'MAIN_DISHES', '15.00', 3, 'images/menu-item-thumbnail-05.jpg'),
(8, 'SPICY MEATBALLS', 'MAIN_DISHES', '6.50', 4, 'images/menu-item-thumbnail-06.jpg'),
(9, 'Chiken Tikka Masala', 'DESERTS', '4.50', 5, 'images/menu-item-thumbnail-08.jpg'),
(10, 'Chiken Tikka Masala ', 'DESERTS', '10.00', 3, 'images/menu-item-thumbnail-09.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `todays_menu`
--

CREATE TABLE `todays_menu` (
  `itemCode` int(11) NOT NULL,
  `Available_in_stock` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `todays_menu`
--

INSERT INTO `todays_menu` (`itemCode`, `Available_in_stock`) VALUES
(1, b'1'),
(2, b'1'),
(3, b'1'),
(4, b'0'),
(5, b'1'),
(6, b'0'),
(7, b'1'),
(8, b'1'),
(9, b'0'),
(10, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `todays_orders`
--

CREATE TABLE `todays_orders` (
  `table_no` int(11) DEFAULT NULL,
  `order_list` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `Name_of_customer` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `cur_Status` enum('OPEN','CLOSED','CANCELLED') COLLATE utf8_bin DEFAULT NULL,
  `Total_Amount` int(11) DEFAULT NULL,
  `orderID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `todays_orders`
--

INSERT INTO `todays_orders` (`table_no`, `order_list`, `Name_of_customer`, `cur_Status`, `Total_Amount`, `orderID`) VALUES
(15, '2:3;', 'sandeep', 'OPEN', 75, 1),
(8, '2:5;7:2;', 'Zaki', 'OPEN', 155, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`ItemCode`);

--
-- Indexes for table `todays_menu`
--
ALTER TABLE `todays_menu`
  ADD PRIMARY KEY (`itemCode`);

--
-- Indexes for table `todays_orders`
--
ALTER TABLE `todays_orders`
  ADD PRIMARY KEY (`orderID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `todays_menu`
--
ALTER TABLE `todays_menu`
  ADD CONSTRAINT `todays_menu_ibfk_1` FOREIGN KEY (`itemCode`) REFERENCES `foods` (`ItemCode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
