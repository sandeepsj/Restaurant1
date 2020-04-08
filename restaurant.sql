-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2019 at 11:40 AM
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

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertHomeOrder` (IN `order_list` VARCHAR(100), IN `name_of_customer` VARCHAR(20), IN `cur_status` ENUM('OPEN','CLOSED','CANCELLED'), IN `total_amount` INT(11), IN `address` VARCHAR(300), IN `contact_number` VARCHAR(10), OUT `order_id` INT(11))  MODIFIES SQL DATA
BEGIN
set @poID = (SELECT MAX(oh.orderID)+1 FROM order_history oh);
INSERT INTO order_history VALUES(order_list,name_of_customer,cur_status,total_Amount,@poID,DEFAULT,'HOME');
INSERT INTO order_at_home VALUES(@poID,address,contact_number);
SELECT order_id = @poID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertTableOrder` (INOUT `order_list` VARCHAR(100), INOUT `name_of_customer` VARCHAR(20), INOUT `cur_status` ENUM('OPEN','CLOSED','CANCELLED'), INOUT `total_amount` INT(11), INOUT `table_no` INT(11), OUT `order_id` INT(11))  MODIFIES SQL DATA
BEGIN
set @poID = (SELECT MAX(oh.orderID)+1 FROM order_history oh);
INSERT INTO `order_history` (`order_list`, `Name_of_customer`, `cur_Status`, `Total_Amount`, `orderID`, `ord_date`, `order_mod`) VALUES (order_list,name_of_customer,cur_status,total_amount,@poID,DEFAULT,'TABLE');
INSERT INTO orders_on_table VALUES(@poID,table_no);
SELECT @poID INTO order_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `orderID` int(11) DEFAULT NULL,
  `Activity` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `SEEN` enum('SEEN','NOT SEEN') COLLATE utf8_bin DEFAULT 'NOT SEEN',
  `Activity_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`orderID`, `Activity`, `SEEN`, `Activity_id`) VALUES
(3, 'NEW_ORDER', 'SEEN', 3),
(3, 'CANCELLED', 'SEEN', 4),
(4, 'NEW_ORDER', 'SEEN', 5),
(5, 'NEW_ORDER', 'SEEN', 6),
(4, 'CANCELLED', 'SEEN', 7),
(5, 'CANCELLED', 'SEEN', 8),
(6, 'NEW_ORDER', 'SEEN', 9),
(6, 'CLOSED', 'NOT SEEN', 10),
(7, 'NEW_ORDER', 'SEEN', 11),
(8, 'NEW_ORDER', 'SEEN', 12),
(8, 'CANCELLED', 'SEEN', 13),
(9, 'NEW_ORDER', 'SEEN', 14),
(9, 'CLOSED', 'NOT SEEN', 15),
(9, 'CANCELLED', 'SEEN', 16);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `empid` int(11) NOT NULL,
  `name` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `address` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `designation` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `phone_number` varchar(10) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`empid`, `name`, `salary`, `address`, `designation`, `PASSWORD`, `phone_number`) VALUES
(3, 'Sandeep S J', 10000, 'Bangalore', 'Cook', 'sandeepsj', '7594018731'),
(4, 'Gopinath', 7000, 'Calicut', 'Supervisor', 'gopi', '676767'),
(5, 'Vijay', 1000, 'bangalore', 'Cook', 'vijay', '8822882288'),
(6, 'Mahi', 1200, 'chennai', 'manager', 'mahi', '6655774466'),
(7, 'Nandu', 12000, 'Calicut', 'Cook', 'asdf', '1199228833'),
(8, 'Baba', 34000, 'Delhi', 'watchman', 'asdf', '1928374658'),
(9, 'Babu', 3899, 'Mumbai', 'sdf', 'asdf', '3746283940'),
(10, 'Baro', 3900, 'jhsd', 'sdfkj', 'asdf', '1234123412'),
(11, 'Havo', 200, 'alsdf', 'asdf', 'asdf', '1234567812'),
(12, 'kuku', 23489, 'asdf', 'asdf', 'asdf', '1234567823'),
(13, 'sonu', 1830, 'ASDF', 'ASDF', 'asdf', '1234'),
(14, 'rishikesh', 12093, '1830', 'Sweeper', 'asdf', '8848931182'),
(15, 'Shahbaz', 3400, 'Mumbau', 'Gate keeper', 'asdf', '553727');

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
  `imagePath` varchar(100) COLLATE utf8_bin NOT NULL,
  `Description` varchar(300) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`ItemCode`, `FoodItemName`, `FoodDomain`, `Price`, `Rating`, `imagePath`, `Description`) VALUES
(2, 'Garlic Bread', 'STARTERS', '8.50', 4, 'images/menu-item-thumbnail-01.jpg', 'Donec vitae sapien ut libero venenatis fauci Nullam quis ante. Etiam sit amet rc,i eget eros'),
(3, 'Mixed Salad Special', 'STARTERS', '25.00', 3, 'images/menu-item-thumbnail-02.jpg', 'Donec vitae sapien ut libero venenatis fauci Nullam quis ante. Etiam sit amet rci eget eros.'),
(4, 'BBQ Chicken Wings', 'STARTERS', '10.00', 5, 'images/menu-item-thumbnail-03.jpg', 'Donec vitae sapien ut libero venenatis fauci Nullam quis ante. Etiam sit amet rci eget eros.'),
(5, 'Meat Feast Pizza', 'DRINKS', '5.00', 2, 'images/menu-item-thumbnail-04.jpg', 'Donec vitae sapien ut libero venenatis fauci Nullam quis ante. Etiam sit ame,,t rci eget eros'),
(6, 'Chocolate Fudgecake eeelkjlk', 'DESERTS', '4.50', 2, 'images/menu-item-thumbnail-07.jpg', 'Donec vitae sapien ut libero venenatis fauci Nullam quis ante. Etiam sit amet rci eget eros.'),
(7, 'Meat Feast Not a  pizza', 'DRINKS', '12.50', 1, 'images/menu-item-thumbnail-10.jpg', 'Donec vitae sapien ut libero venenatis fauci Nullam quis ante. Etiam sit am,et rci eget eros.'),
(8, 'Chicken Tikka Masala', 'MAIN_DISHES', '15.50', 2, 'images/menu-item-thumbnail-05.jpg', 'Donec vitae sapien ut libero venenatis fauci Nullam quis ante. Etiam sit amet rci eget eros.'),
(9, 'SPICY MEATBALL', 'MAIN_DISHES', '6.00', 3, 'images/menu-item-thumbnail-06.jpg', 'Donec vitae sapien ut libero venenatis fauci Nullam quis ante. Etiam sit amet rci eget eros.'),
(10, 'Chiken Tikka Masala', 'DESERTS', '4.50', 5, 'images/menu-item-thumbnail-08.jpg', 'Donec vitae sapien ut libero venenatis fauci Nullam quis ante. Etiam sit amet rci eget eros.'),
(11, 'Chiken Tikka Masala', 'DESERTS', '10.00', 3, 'images/menu-item-thumbnail-09.jpg', 'Donec vitae sapien ut libero venenatis fauci Nullam quis ante. Etiam sit amet rci eget eros.'),
(12, 'Kerala Poratta', 'MAIN_DISHES', '25.00', 5, 'images/poratta.jpg', 'Kerala special Food kerala poratta. made from maida.');

--
-- Triggers `foods`
--
DELIMITER $$
CREATE TRIGGER `syncTDmenuONdelete` AFTER DELETE ON `foods` FOR EACH ROW DELETE FROM todays_menu WHERE itemCode NOT IN (SELECT itemCode from foods)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `syncTDmenuONinsert` AFTER INSERT ON `foods` FOR EACH ROW INSERT INTO `todays_menu` SELECT itemCode,0 FROM foods WHERE itemCode = new.itemCode
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `orders_on_table`
--

CREATE TABLE `orders_on_table` (
  `orderID` int(11) DEFAULT NULL,
  `table_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `orders_on_table`
--

INSERT INTO `orders_on_table` (`orderID`, `table_no`) VALUES
(3, 6),
(6, 5),
(8, 6),
(9, 3);

-- --------------------------------------------------------

--
-- Table structure for table `order_at_home`
--

CREATE TABLE `order_at_home` (
  `orderID` int(11) DEFAULT NULL,
  `address` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `contact_number` varchar(10) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `order_at_home`
--

INSERT INTO `order_at_home` (`orderID`, `address`, `contact_number`) VALUES
(4, 'SJBIT BOYS HOSTEL BLOCK 2,KENG', '12342342'),
(5, 'Bihar', '553727'),
(7, 'mUMBAI', '773662884');

-- --------------------------------------------------------

--
-- Table structure for table `order_history`
--

CREATE TABLE `order_history` (
  `order_list` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `Name_of_customer` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `cur_Status` enum('OPEN','CLOSED','CANCELLED','REJECTED') COLLATE utf8_bin DEFAULT NULL,
  `Total_Amount` int(11) DEFAULT NULL,
  `orderID` int(11) NOT NULL,
  `ord_date` date DEFAULT curdate(),
  `order_mod` enum('TABLE','HOME') COLLATE utf8_bin DEFAULT 'TABLE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `order_history`
--

INSERT INTO `order_history` (`order_list`, `Name_of_customer`, `cur_Status`, `Total_Amount`, `orderID`, `ord_date`, `order_mod`) VALUES
('2:2;4:2;', 'Gokul', 'CANCELLED', 37, 3, '2019-11-07', 'TABLE'),
('8:1;', 'San', 'CANCELLED', 15, 4, '2019-11-07', 'HOME'),
('2:1;9:1;', 'Shahbaz', 'CANCELLED', 14, 5, '2019-11-07', 'HOME'),
('2:2;6:2;', 'Sundara', 'CLOSED', 26, 6, '2019-11-08', 'TABLE'),
('6:2;9:1;10:4;', 'kenny', 'OPEN', 33, 7, '2019-11-08', 'HOME'),
('4:3;', 'Sruthi', 'CANCELLED', 30, 8, '2019-11-08', 'TABLE'),
('6:2;', 'Sonum', 'CANCELLED', 9, 9, '2019-11-08', 'TABLE');

--
-- Triggers `order_history`
--
DELIMITER $$
CREATE TRIGGER `ActivityTracerOnInsert` AFTER INSERT ON `order_history` FOR EACH ROW INSERT INTO activity_log VALUES(new.orderID ,'NEW_ORDER',DEFAULT,null)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ActivityTracerOnUpdate` AFTER UPDATE ON `order_history` FOR EACH ROW INSERT INTO activity_log VALUES(new.orderID,new.cur_status,DEFAULT,null)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `todays_menu`
--

CREATE TABLE `todays_menu` (
  `itemCode` int(11) DEFAULT NULL,
  `Available_in_stock` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `todays_menu`
--

INSERT INTO `todays_menu` (`itemCode`, `Available_in_stock`) VALUES
(2, b'1'),
(3, b'0'),
(4, b'1'),
(5, b'1'),
(6, b'1'),
(7, b'1'),
(8, b'1'),
(9, b'1'),
(10, b'1'),
(11, b'1'),
(12, b'0');

-- --------------------------------------------------------

--
-- Stand-in structure for view `todays_orders`
-- (See below for the actual view)
--
CREATE TABLE `todays_orders` (
`order_list` varchar(100)
,`Name_of_customer` varchar(20)
,`cur_Status` enum('OPEN','CLOSED','CANCELLED','REJECTED')
,`Total_Amount` int(11)
,`orderID` int(11)
,`ord_date` date
,`order_mod` enum('TABLE','HOME')
);

-- --------------------------------------------------------

--
-- Structure for view `todays_orders`
--
DROP TABLE IF EXISTS `todays_orders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `todays_orders`  AS  select `order_history`.`order_list` AS `order_list`,`order_history`.`Name_of_customer` AS `Name_of_customer`,`order_history`.`cur_Status` AS `cur_Status`,`order_history`.`Total_Amount` AS `Total_Amount`,`order_history`.`orderID` AS `orderID`,`order_history`.`ord_date` AS `ord_date`,`order_history`.`order_mod` AS `order_mod` from `order_history` where `order_history`.`ord_date` = curdate() ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`Activity_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`empid`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`ItemCode`);

--
-- Indexes for table `order_history`
--
ALTER TABLE `order_history`
  ADD PRIMARY KEY (`orderID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `Activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `empid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `foods`
--
ALTER TABLE `foods`
  MODIFY `ItemCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
