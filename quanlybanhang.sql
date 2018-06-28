-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 27, 2018 at 11:41 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quanlybanhang`
--

CREATE DATABASE IF NOT EXISTS quanlybanhang;
USE quanlybanhang;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `CatID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `CatName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CatID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CatID`, `CatName`) VALUES
(1, 'Điện thoại'),
(2, 'Máy tính bảng');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
CREATE TABLE IF NOT EXISTS `manufacturers` (
  `ManID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ManName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ManID`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`ManID`, `ManName`) VALUES
(1, 'Apple'),
(2, 'Samsung'),
(3, 'Oppo'),
(4, 'Sony'),
(5, 'Vivo'),
(6, 'Lenovo'),
(7, 'Masstel'),
(8, 'Huawei');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE IF NOT EXISTS `orderdetails` (
  `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `OrderID` int(11) NOT NULL,
  `ProID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` bigint(20) NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `OrderID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `OrderDate` datetime NOT NULL,
  `UserID` int(11) NOT NULL,
  `Total` bigint(20) NOT NULL,
  `State` int(1) NOT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `ProID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ProName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TinyDes` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `FullDes` text COLLATE utf8_unicode_ci NOT NULL,
  `Price` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Sold` int(11) NOT NULL,
  `ReceiveDate` date NOT NULL,
  `View` int(11) NOT NULL,
  `CatID` int(11) NOT NULL,
  `ManID` int(11) NOT NULL,
  `Origin` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Active` int(1) NOT NULL,
  PRIMARY KEY (`ProID`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProID`, `ProName`, `TinyDes`, `FullDes`, `Price`, `Quantity`, `Sold`, `ReceiveDate`, `View`, `CatID`, `ManID`, `Origin`, `Active`) VALUES
(1, 'iPhone X 64GB', 'TinyDes', 'FullDes', 29990000, 50, 10, '2018-06-23', 0, 1, 1, 'Trung Quốc', 1),
(2, 'Samsung Galaxy S9+', 'TinyDes', 'FullDes', 23490000, 50, 22, '2018-06-23', 0, 1, 2, 'Hàn Quốc', 1),
(3, 'Oppo F7', 'TinyDes', 'FullDes', 7990000, 100, 22, '2018-06-20', 0, 1, 3, 'Trung Quốc', 1),
(4, 'Sony Xperia XZ Premium', 'TinyDes', 'FullDes', 17990000, 110, 15, '2018-06-02', 0, 1, 4, 'Nhật Bản', 1),
(5, 'Vivo V9', 'TinyDes', 'FullDes', 29990000, 60, 30, '2018-06-23', 0, 1, 5, 'Trung Quốc', 1),
(6, 'Lenovo Tab 3 A8 ZA180001', 'TinyDes', 'FullDes', 3190000, 30, 11, '2018-06-02', 0, 2, 6, 'Trung Quốc', 1),
(7, 'Masstel Tab 10', 'TinyDes', 'FullDes', 2790000, 50, 15, '2018-06-02', 0, 2, 7, 'Trung Quốc', 1),
(8, 'Huawei MediaPad M3 8.0', 'TinyDes', 'FullDes', 5990000, 70, 26, '2018-06-01', 0, 2, 8, 'Trung Quốc', 1),
(9, 'Samsung Galaxy Tab E 9.6', 'TinyDes', 'FullDes', 5490000, 50, 36, '2018-05-30', 0, 2, 2, 'Hàn Quốc', 1),
(10, 'iPad Pro 12.9 Wifi 4G 512GB', 'TinyDes', 'FullDes', 32990000, 51, 33, '2018-05-29', 0, 2, 1, 'Hàn Quốc', 1),
(11, 'iPhone 8 Plus 64GB', 'TinyDes', 'FullDes', 23990000, 52, 22, '2018-05-28', 0, 1, 1, 'Trung Quốc', 1),
(12, 'iPhone 8 64GB', 'TinyDes', 'FullDes', 20990000, 53, 3, '2018-05-27', 0, 1, 1, 'Trung Quốc', 1),
(13, 'iPhone 7 Plus 32GB', 'TinyDes', 'FullDes', 19990000, 54, 23, '2018-05-26', 0, 1, 1, 'Trung Quốc', 1),
(14, 'iPhone 7 32GB', 'TinyDes', 'FullDes', 15990000, 55, 20, '2018-05-25', 0, 1, 1, 'Trung Quốc', 1),
(15, 'Samsung Galaxy S9', 'TinyDes', 'FullDes', 19990000, 56, 23, '2018-05-24', 0, 1, 2, 'Hàn Quốc', 1),
(16, 'Samsung Galaxy S8 Plus', 'TinyDes', 'FullDes', 17990000, 50, 21, '2018-05-23', 0, 1, 2, 'Hàn Quốc', 1),
(17, 'Samsung Galaxy S8', 'TinyDes', 'FullDes', 15990000, 50, 29, '2018-05-22', 0, 1, 2, 'Hàn Quốc', 1),
(18, 'Samsung Galaxy Note 8', 'TinyDes', 'FullDes', 22490000, 57, 22, '2018-05-21', 0, 1, 2, 'Hàn Quốc', 1),
(19, 'Oppp F5', 'TinyDes', 'FullDes', 6990000, 58, 26, '2018-05-20', 0, 1, 3, 'Trung Quốc', 1),
(20, 'Oppo F3', 'TinyDes', 'FullDes', 4990000, 59, 50, '2018-04-28', 0, 1, 3, 'Trung Quốc', 1),
(21, 'Oppo F1s', 'TinyDes', 'FullDes', 4990000, 60, 30, '2018-04-27', 0, 1, 3, 'Trung Quốc', 1),
(22, 'Oppo A83', 'TinyDes', 'FullDes', 4990000, 61, 31, '2018-04-26', 0, 1, 3, 'Trung Quốc', 1),
(23, 'Sony Xperia XZ1', 'TinyDes', 'FullDes', 13990000, 62, 25, '2018-04-25', 0, 1, 4, 'Nhật Bản', 1),
(24, 'Sony Xperia XA Ultra', 'TinyDes', 'FullDes', 6990000, 63, 32, '2018-04-24', 0, 1, 4, 'Nhật Bản', 1),
(25, 'Sony Xperia XZs', 'TinyDes', 'FullDes', 9990000, 64, 30, '2018-04-23', 0, 1, 4, 'Nhật Bản', 1),
(26, 'Sony Xperia L1 Dual', 'TinyDes', 'FullDes', 3590000, 65, 23, '2018-04-22', 0, 1, 4, 'Nhật Bản', 1),
(27, 'Vivo V7+', 'TinyDes', 'FullDes', 7990000, 66, 33, '2018-04-21', 0, 1, 5, 'Trung Quốc', 1),
(28, 'Vivo 5S', 'TinyDes', 'FullDes', 6690000, 67, 33, '2018-04-20', 0, 1, 5, 'Trung Quốc', 1),
(29, 'Vivo Y69', 'TinyDes', 'FullDes', 5490000, 68, 36, '2018-04-19', 0, 1, 5, 'Trung Quốc', 1),
(30, 'Vivo Y55', 'TinyDes', 'FullDes', 3990000, 70, 26, '2018-04-18', 0, 1, 5, 'Trung Quốc', 1),
(31, 'Lenovo Tab 3 A8 ZA180071', 'TinyDes', 'FullDes', 3190000, 30, 26, '2018-04-17', 0, 2, 6, 'Trung Quốc', 1),
(32, 'Lenovo Tab 3 710I MT8321', 'TinyDes', 'FullDes', 2190000, 30, 25, '2018-04-16', 0, 2, 6, 'Trung Quốc', 1),
(33, 'Lenovo Tab 3 730X ZA130063', 'TinyDes', 'FullDes', 2290000, 30, 19, '2018-04-15', 0, 2, 6, 'Trung Quốc', 1),
(34, 'Lenovo Tab 3 730X ZA130086', 'TinyDes', 'FullDes', 2290000, 30, 16, '2018-04-15', 0, 2, 6, 'Trung Quốc', 1),
(35, 'Masstel Tab 8', 'TinyDes', 'FullDes', 2290000, 50, 22, '2018-04-14', 0, 2, 7, 'Trung Quốc', 1),
(36, 'Masstel Tab 825', 'TinyDes', 'FullDes', 2190000, 50, 40, '2018-04-14', 0, 2, 7, 'Trung Quốc', 1),
(37, 'Masstel Tab 7 LTE', 'TinyDes', 'FullDes', 2090000, 50, 15, '2018-04-13', 0, 2, 7, 'Trung Quốc', 1),
(38, 'Masstel Tab 7', 'TinyDes', 'FullDes', 1790000, 50, 25, '2018-04-12', 0, 2, 7, 'Trung Quốc', 1),
(39, 'Huawei MediaPad T3 10', 'TinyDes', 'FullDes', 4990000, 70, 45, '2018-04-11', 0, 2, 8, 'Trung Quốc', 1),
(40, 'Huawei MediaPad T3 8.0', 'TinyDes', 'FullDes', 3990000, 70, 56, '2018-04-10', 0, 2, 8, 'Trung Quốc', 1),
(41, 'Huawei MediaPad T1 8.0', 'TinyDes', 'FullDes', 2990000, 70, 59, '2018-04-09', 0, 2, 8, 'Trung Quốc', 1),
(42, 'Huawei MediaPad T1-701u', 'TinyDes', 'FullDes', 2090000, 70, 63, '2018-04-08', 0, 2, 8, 'Trung Quốc', 1),
(43, 'Samsung Galaxy Tab A6 ', 'TinyDes', 'FullDes', 7990000, 50, 32, '2018-04-07', 0, 2, 2, 'Hàn Quốc', 1),
(44, 'Samsung Galaxy Tab A 8.0', 'TinyDes', 'FullDes', 5490000, 50, 33, '2018-04-06', 0, 2, 2, 'Hàn Quốc', 1),
(45, 'Samsung Galaxy Tab A SM-T285', 'TinyDes', 'FullDes', 3590000, 50, 30, '2018-04-05', 0, 2, 2, 'Hàn Quốc', 1),
(46, 'Samsung Galaxy Tab A6 7.0', 'TinyDes', 'FullDes', 3590000, 50, 20, '2017-04-04', 0, 2, 2, 'Hàn Quốc', 1),
(47, 'iPad Pro 10.5 Wifi 64GB', 'TinyDes', 'FullDes', 16990000, 51, 19, '2018-04-04', 0, 2, 1, 'Hàn Quốc', 1),
(48, 'iPad Air 2 Cellular 128GB', 'TinyDes', 'FullDes', 15490000, 51, 15, '2018-04-04', 0, 2, 1, 'Hàn Quốc', 1),
(49, 'iPad Wifi Cellular 128GB', 'TinyDes', 'FullDes', 14990000, 51, 16, '2018-04-03', 0, 2, 1, 'Hàn Quốc', 1),
(50, 'iPad Mini 4 Wifi 128GB', 'TinyDes', 'FullDes', 10990000, 51, 16, '2018-04-03', 0, 2, 1, 'Hàn Quốc', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `f_ID` int(11) NOT NULL AUTO_INCREMENT,
  `f_Username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_Password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `f_Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_DOB` date NOT NULL,
  `f_Permission` int(11) NOT NULL,
  PRIMARY KEY (`f_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
