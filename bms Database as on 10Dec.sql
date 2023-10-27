-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2021 at 09:01 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bms`
--

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE `buyer` (
  `name` varchar(50) NOT NULL,
  `contactno` bigint(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`name`, `contactno`, `email`, `address`) VALUES
('Hitesh', 123456789, 'hitesh@gmail.com', 'LKO');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `salesId` bigint(20) NOT NULL,
  `contactno` bigint(100) NOT NULL,
  `total` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`salesId`, `contactno`, `total`) VALUES
(1, 123456789, 4000);

-- --------------------------------------------------------

--
-- Table structure for table `ordersline`
--

CREATE TABLE `ordersline` (
  `salesId` bigint(20) NOT NULL,
  `pid` int(10) NOT NULL,
  `pName` varchar(100) NOT NULL,
  `quantity` int(20) NOT NULL,
  `lineAmount` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ordersline`
--

INSERT INTO `ordersline` (`salesId`, `pid`, `pName`, `quantity`, `lineAmount`) VALUES
(1, 1, 'Blue Jeans', 1, 2000),
(1, 2, 'Black Jeans', 1, 2000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pid` int(10) NOT NULL,
  `pName` varchar(100) DEFAULT NULL,
  `Rate` int(10) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `stock` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pid`, `pName`, `Rate`, `description`, `stock`) VALUES
(1, 'Blue Jeans', 2000, 'Blue', 99),
(2, 'Black Jeans', 2000, 'Black', 99),
(3, 'Sweatshirt', 800, 'Peach Color', 100);

-- --------------------------------------------------------

--
-- Table structure for table `tempsales_line`
--

CREATE TABLE `tempsales_line` (
  `salesId` bigint(20) NOT NULL,
  `pid` int(10) NOT NULL,
  `pName` varchar(100) NOT NULL,
  `quantity` int(20) NOT NULL,
  `lineAmount` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`contactno`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`salesId`),
  ADD KEY `contactno` (`contactno`);

--
-- Indexes for table `ordersline`
--
ALTER TABLE `ordersline`
  ADD KEY `salesId` (`salesId`),
  ADD KEY `ordersline_ibfk_2` (`pid`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`contactno`) REFERENCES `buyer` (`contactno`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ordersline`
--
ALTER TABLE `ordersline`
  ADD CONSTRAINT `ordersline_ibfk_1` FOREIGN KEY (`salesId`) REFERENCES `orders` (`salesId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ordersline_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `products` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
