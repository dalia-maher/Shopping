-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2017 at 04:48 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--
CREATE DATABASE IF NOT EXISTS `shopping` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `shopping`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--
-- Creation: Feb 27, 2017 at 02:33 PM
--

CREATE TABLE `category` (
  `ID` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `category`:
--

-- --------------------------------------------------------

--
-- Table structure for table `credit`
--
-- Creation: Feb 27, 2017 at 03:41 PM
--

CREATE TABLE `credit` (
  `cardID` varchar(20) NOT NULL,
  `cardValue` double NOT NULL,
  `validity` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `credit`:
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--
-- Creation: Feb 27, 2017 at 02:53 PM
--

CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL,
  `email` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(8) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `credit` double NOT NULL,
  `addresse` varchar(100) NOT NULL,
  `type` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `customer`:
--

-- --------------------------------------------------------

--
-- Table structure for table `interests`
--
-- Creation: Feb 27, 2017 at 03:43 PM
--

CREATE TABLE `interests` (
  `customerID` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `interests`:
--

-- --------------------------------------------------------

--
-- Table structure for table `order`
--
-- Creation: Feb 27, 2017 at 03:37 PM
--

CREATE TABLE `order` (
  `orderID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `date` datetime NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `order`:
--   `customerID`
--       `customer` -> `customerID`
--   `productID`
--       `product` -> `ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--
-- Creation: Feb 27, 2017 at 02:36 PM
--

CREATE TABLE `product` (
  `ID` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `name` int(20) NOT NULL,
  `description` varchar(500) NOT NULL,
  `quality` decimal(10,0) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `product`:
--   `categoryID`
--       `category` -> `ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `productimages`
--
-- Creation: Feb 27, 2017 at 02:39 PM
--

CREATE TABLE `productimages` (
  `productID` int(11) NOT NULL,
  `imageURL` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `productimages`:
--

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcart`
--
-- Creation: Feb 27, 2017 at 02:55 PM
--

CREATE TABLE `shoppingcart` (
  `productID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `quantity` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `shoppingcart`:
--   `CustomerID`
--       `customer` -> `customerID`
--   `productID`
--       `product` -> `ID`
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `credit`
--
ALTER TABLE `credit`
  ADD PRIMARY KEY (`cardID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `interests`
--
ALTER TABLE `interests`
  ADD PRIMARY KEY (`customerID`,`categoryID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`orderID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `productimages`
--
ALTER TABLE `productimages`
  ADD PRIMARY KEY (`productID`,`imageURL`);

--
-- Indexes for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`productID`,`CustomerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

--------------------------------------------

ALTER TABLE `product` CHANGE `quality` `quality` DOUBLE NOT NULL;
ALTER TABLE `shoppingcart` CHANGE `quantity` `quantity` DOUBLE NOT NULL;
ALTER TABLE `product` CHANGE `name` `name` VARCHAR(20) NOT NULL;
ALTER TABLE `customer` ADD `BDate` DATE NOT NULL AFTER `type`, ADD `job` VARCHAR(20) NOT NULL AFTER `BDate`;
ALTER TABLE `order` CHANGE `quantity` `quantity` INT(11) NOT NULL;
ALTER TABLE `product` CHANGE `quality` `quality` INT NOT NULL;
ALTER TABLE `shoppingcart` CHANGE `quantity` `quantity` INT NOT NULL;
ALTER TABLE `category` ADD UNIQUE(`name`);
ALTER TABLE `product` ADD `images` INT NOT NULL AFTER `price`;
DROP TABLE productimages;
ALTER TABLE `credit` CHANGE `validity` `customerID` INT;

ALTER TABLE `product` CHANGE `quality` `quantity` INT(11) NOT NULL;
ALTER TABLE `credit` CHANGE `cardID` `cardID` INT NOT NULL;
ALTER TABLE `credit` CHANGE `cardValue` `cardValue` INT NOT NULL;

ALTER TABLE interests
ADD FOREIGN KEY (customerID)
REFERENCES customer(customerID);
ALTER TABLE interests
ADD FOREIGN KEY (categoryID)
REFERENCES category(ID);
ALTER TABLE `order`
ADD FOREIGN KEY (productID)
REFERENCES product(ID);
ALTER TABLE `order`
ADD FOREIGN KEY (customerID)
REFERENCES customer(customerID);
ALTER TABLE product
ADD FOREIGN KEY (categoryID)
REFERENCES category(ID);
ALTER TABLE productimages
ADD FOREIGN KEY (productID)
REFERENCES product(ID);
ALTER TABLE shoppingcart
ADD FOREIGN KEY (productID)
REFERENCES product(ID);
ALTER TABLE shoppingcart
ADD FOREIGN KEY (CustomerID)
REFERENCES customer(CustomerID);
ALTER TABLE credit
ADD FOREIGN KEY (customerID)
REFERENCES customer(customerID);