CREATE DATABASE IF NOT EXISTS quanlybanhang;
USE quanlybanhang;

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `CatID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `CatName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CatID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `categories` VALUES ('1', 'Điện thoại');
INSERT INTO `categories` VALUES ('2', 'Máy tính bảng');

DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE `orderdetails` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `OrderID` int(11) NOT NULL,
  `ProID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` bigint(20) NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `OrderID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `OrderDate` datetime NOT NULL,
  `UserID` int(11) NOT NULL,
  `Total` bigint(20) NOT NULL,
	`Paid` bit NOT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `manufacturers`;
CREATE TABLE `manufacturers` (
	`ManID` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`ManName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
	PRIMARY KEY (`ManID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `manufacturers` VALUES ('1', 'Apple');
INSERT INTO `manufacturers` VALUES ('2', 'Samsung');
INSERT INTO `manufacturers` VALUES ('3', 'Oppo');
INSERT INTO `manufacturers` VALUES ('4', 'Sony');
INSERT INTO `manufacturers` VALUES ('5', 'Vivo');
INSERT INTO `manufacturers` VALUES ('6', 'Lenovo');
INSERT INTO `manufacturers` VALUES ('7', 'Masstel');
INSERT INTO `manufacturers` VALUES ('8', 'Huawei');

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `ProID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ProName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TinyDes` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `FullDes` text COLLATE utf8_unicode_ci NOT NULL,
  `Price` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `ReceiveDate` date NOT NULL,
	`View` int(11) NOT NULL,
	`CatID` int(11) NOT NULL,
	`ManID` int(11) NOT NULL,
	`Origin` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ProID`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `products` VALUES ('1', 'iPhone X 64GB', 'TinyDes', 'FullDes', '29990000', '50', '2018-06-23', '0', '1', '1', 'Trung Quốc');
INSERT INTO `products` VALUES ('2', 'Samsung Galaxy S9+', 'TinyDes', 'FullDes', '23490000', '50', '2018-06-23', '0', '1', '2', 'Hàn Quốc');
INSERT INTO `products` VALUES ('3', 'Oppo F7', 'TinyDes', 'FullDes', '7990000', '100', '2018-06-20', '0', '1', '3', 'Trung Quốc');
INSERT INTO `products` VALUES ('4', 'Sony Xperia XZ Premium', 'TinyDes', 'FullDes', '17990000', '110', '2018-06-02', '0', '1', '4', 'Nhật Bản');
INSERT INTO `products` VALUES ('5', 'Vivo V9', 'TinyDes', 'FullDes', '29990000', '60', '2018-06-23', '0', '1', '5', 'Trung Quốc');
INSERT INTO `products` VALUES ('6', 'Lenovo Tab 3 A8 ZA180001', 'TinyDes', 'FullDes', '3190000', '30', '2018-06-02', '0', '2', '6', 'Trung Quốc');
INSERT INTO `products` VALUES ('7', 'Masstel Tab 10', 'TinyDes', 'FullDes', '2790000', '50', '2018-06-02', '0', '2', '7', 'Trung Quốc');
INSERT INTO `products` VALUES ('8', 'Huawei MediaPad M3 8.0', 'TinyDes', 'FullDes', '5990000', '70', '2018-06-01', '0', '2', '8', 'Trung Quốc');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `f_ID` int(11) NOT NULL AUTO_INCREMENT,
  `f_Username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_Password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `f_Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_DOB` date NOT NULL,
  `f_Permission` int(11) NOT NULL,
  PRIMARY KEY (`f_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;