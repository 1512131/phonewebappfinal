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
  `Paid` bit(1) NOT NULL,
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
  `ReceiveDate` date NOT NULL,
  `View` int(11) NOT NULL,
  `CatID` int(11) NOT NULL,
  `ManID` int(11) NOT NULL,
  `Origin` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Producer` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ProID`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProID`, `ProName`, `TinyDes`, `FullDes`, `Price`, `Quantity`, `ReceiveDate`, `View`, `CatID`, `ManID`, `Origin`, `Producer`) VALUES
(1, 'iPhone X 64GB', 'iPhone X mang trên mình thiết kế hoàn toàn mới với màn hình Super Retina viền cực mỏng và trang bị nhiều công nghệ hiện đại như nhận diện khuôn mặt Face ID, sạc pin nhanh và sạc không dây cùng khả năng chống nước bụi cao cấp', 'Điện thoại', 29990000, 50, '2018-06-23', 6521, 1, 1, 'Trung Quốc', 'Apple'),
(2, 'Samsung Galaxy S9+', 'Samsung Galaxy S9 Plus 128GB Hoàng Kim, siêu phẩm smartphone hàng đầu trong thế giới Android đã ra mắt với màn hình vô cực, camera chuyên nghiệp như máy ảnh và hàng loạt những tính năng cao cấp đầy hấp dẫn.', 'Điện thoại', 23490000, 50, '2018-06-23', 6015, 1, 2, 'Hàn Quốc', 'SamSung'),
(3, 'Oppo F7', 'Tiếp nối sự thành công của OPPO F5 thì OPPO tiếp tục tung ra OPPO F7 với điểm nhấn vẫn là camera selfie và thiết kế \"tai thỏ độc đáo\".', 'Điện thoại', 7990000, 100, '2018-06-20', 3122, 1, 3, 'Trung Quốc', 'Oppo'),
(4, 'Sony Xperia XZ Premium', 'Sony Xperia XZ Premium là flagship của Sony trong năm 2017 với vẻ ngoài hào nhoáng, màn hình cao cấp cũng nhiều trang bị hàng đầu khác.', 'Điện thoại', 17990000, 110, '2018-06-02', 3012, 1, 4, 'Nhật Bản', 'Sony'),
(5, 'Vivo V9', 'Vivo V9 là chiếc smartphone tầm trung cận cao cấp với điểm nhấn là máy có camera kép phía sau và camera selfie độ phân giải cao 24 MP.', 'Điện thoại', 29990000, 60, '2018-06-23', 2980, 1, 5, 'Trung Quốc', 'Vivo'),
(6, 'Lenovo Tab 3 A8 ZA180001', 'Hãng Lenovo được nhiều biết đến với các thiết bị có dung lượng pin siêu khủng, máy tính bảng Lenovo Tab 3 A8 ZA180001VN cũng không ngoại lệ. Sở hữu viên pin dung lượng lớn 4290mAh, máy tính bảng Lenovo Tab 3 A8 ZA180001VN cho thời gian sử dụng dài hơn các tablet cùng giá khác, thích hợp với người thường xuyên di chuyển nhiều hay những bạn trẻ thích chơi game.', 'Máy tính bảng', 3190000, 30, '2018-06-02', 1101, 2, 6, 'Trung Quốc', 'Lenovo'),
(7, 'Masstel Tab 10', 'Masstel Tab 10 máy tính bảng có thiết kế gọn nhẹ, màn hình lớn hiển thị sắc nét đến từng chi tiết. Và máy có 2 sim 2 sóng giúp bạn nghẹ gọi như 1 smartphone rất tiện lợi. Camera thông minh cùng hiệu năng hoạt động ổn định trong ngày. Đem đến cho người dùng sự tiện lợi và đỉnh cao giải trí đa phương tiện.', 'Máy tính bảng', 2790000, 50, '2018-06-02', 2110, 2, 7, 'Trung Quốc', 'Masstel'),
(8, 'Huawei MediaPad M3 8.0', 'Huawei MediaPad M3 8.0 là mẫu máy tính bảng chủ lực của Huawei trong năm 2017 với điểm nhấn là cấu hình mạnh mẽ cùng hệ thống âm thanh được đầu tư kỹ lưỡng.', 'Máy tính bảng', 5990000, 70, '2018-06-01', 1914, 2, 8, 'Trung Quốc', 'Huawei'),
(9, 'Samsung Galaxy Tab E 9.6', 'Samsung Galaxy Tab E 9.6 là một sự lựa chọn cho bạn thích một chiếc máy có màn hình lớn để giải trí thoải mái hơn nhưng cấu hình không quá thấp.', 'Máy tính bảng', 5490000, 50, '2018-05-30', 2545, 2, 2, 'Hàn Quốc', 'SamSung'),
(10, 'iPad Pro 12.9 Wifi 4G 512GB', 'iPad Pro 12.9 phiên bản mới 2017 cung cấp thông số kỹ thuật được cải tiến đáng kể, bao gồm một màn hình lên đến 12.9 inch mới với một tốc độ tốc độ phản hồi nhanh hơn và hỗ trợ tốt hơn Apple Pencil. Hiệu suất cũng được nâng cấp mới so với các model trước', 'Máy tính bảng', 32990000, 51, '2018-05-29', 6223, 2, 1, 'Hàn Quốc', 'Apple'),
(11, 'iPhone 8 Plus 64GB', 'iPhone 8 Plus 64Gb đã thay đổi về mặt thiết kế so với những đời iPhone cũ: mặt sau đã chuyển sang chất liệu kính bo cong 2.5D đẹp mắt hơn, loại bỏ viền ăng-ten, bộ khung kim loại cứng cáp hơn cùng với 7 lớp xử lý màu tăng mạnh khả năng chống trầy xước', 'Điện thoại', 23990000, 52, '2018-05-28', 5990, 1, 1, 'Trung Quốc', 'Apple'),
(12, 'iPhone 8 64GB', 'iPhone 8 64GB nổi bật với điểm nhấn mặt lưng kính kết hợp cạnh viền và mặt trước giữ nguyên thiết kế như iPhone 7, cùng với đó là hàng loạt công nghệ đáng mong đợi như sạc nhanh, không dây hay hỗ trợ thực tế ảo AR.iPhone 8 64GB nổi bật với điểm nhấn mặt lưng kính kết hợp cạnh viền và mặt trước giữ nguyên thiết kế như iPhone 7, cùng với đó là hàng loạt công nghệ đáng mong đợi như sạc nhanh, không dây hay hỗ trợ thực tế ảo AR.', 'Điện thoại', 20990000, 53, '2018-05-27', 5436, 1, 1, 'Trung Quốc', 'Apple'),
(13, 'iPhone 7 Plus 32GB', 'iPhone 7 Plus dường như là sản phẩm được Apple chăm chút để vượt xa iPhone 7, trở thành sản phẩm rất đáng để nâng cấp so với iPhone 6s Plus khi được nâng cấp thêm camera kép cùng chức năng chụp chân dung xoá phông cực \"hot\"', 'Điện thoại', 19990000, 54, '2018-05-26', 5120, 1, 1, 'Trung Quốc', 'Apple'),
(14, 'iPhone 7 32GB', 'iPhone 7 dường như đã gay sốt ngay từ khi ra mắt bởi những nâng cấp đáng giá về tốc độ xử lý, khả năng chụp ảnh, tính năng chống nước, bụi hiện đại', 'Điện thoại', 15990000, 55, '2018-05-25', 4916, 1, 1, 'Trung Quốc', 'Apple'),
(15, 'Samsung Galaxy S9', 'Siêu phẩm Samsung Galaxy S9 chính thức ra mắt mang theo hàng loạt cải tiến, tính năng cao cấp như camera thay đổi khẩu độ, quay phim siêu chậm 960 fps, AR Emoji... nhanh chóng gây sốt làng công nghệ.', 'Điện thoại', 19990000, 56, '2018-05-24', 5879, 1, 2, 'Hàn Quốc', 'SamSung'),
(16, 'Samsung Galaxy S8 Plus', 'S8 Plus hiện đang là chuẩn mực smartphone về thiết kế trong tương lai. Sau nhiều ngày được sử dụng, mình xin chia sẻ những cảm nhận chi tiết nhất về chiếc Galaxy S8 Plus - thiết bị đang có doanh số đặt hàng khủng nhất hiện tại.', 'Điện thoại', 17990000, 50, '2018-05-23', 5412, 1, 2, 'Hàn Quốc', 'SamSung'),
(17, 'Samsung Galaxy S8', 'Đặc điểm nổi bật của Samsung Galaxy S8\r\nTìm hiểu thêm\r\nTìm hiểu thêm\r\nTìm hiểu thêm\r\nTìm hiểu thêm\r\nTìm hiểu thêm\r\nBộ sản phẩm chuẩn: Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp OTG (2 đầu chuyển: USB-C sang micro USB, USB-C sang USB-C), Cáp, Cây lấy sim\r\n\r\nGalaxy S8 là siêu phẩm mới nhất được Samsung ra mắt vào ngày 29/3 với thiết kế nhỏ gọn hoàn toàn mới, màn hình vô cực viền siêu mỏng.', 'Điện thoại', 15990000, 50, '2018-05-22', 4821, 1, 2, 'Hàn Quốc', 'SamSung'),
(18, 'Samsung Galaxy Note 8', 'Galaxy Note 8 là niềm hy vọng vực lại dòng Note danh tiếng của Samsung với diện mạo nam tính, sang trọng. Trang bị camera kép xóa phông thời thượng, màn hình vô cực như trên S8 Plus, bút Spen với nhiều tính năng mới và nhiều công nghệ được Samsung ưu ái đem lên Note 8.', 'Điện thoại', 22490000, 57, '2018-05-21', 4910, 1, 2, 'Hàn Quốc', 'SamSung'),
(19, 'Oppp F5', 'Đặc điểm nổi bật của OPPO F5 6GB\r\n\r\nBộ sản phẩm chuẩn: Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp, Cây lấy sim, Ốp lưng\r\n\r\nOPPO F5 6GB là phiên bản nâng cấp cấu hình của chiếc OPPO F5, chuyên gia selfie làm đẹp thông minh và màn hình tràn viền tuyệt đẹp.\r\nOppp F5 là phiên bản nâng cấp cấu hình của chiếc OPPO F5, chuyên gia selfie làm đẹp thông minh và màn hình tràn viền tuyệt đẹp.', 'Điện thoại', 6990000, 58, '2018-05-20', 2878, 1, 3, 'Trung Quốc', 'Oppo'),
(20, 'Oppo F3', 'Cuối cùng thì mẫu \"chuyên gia selfie\" mới OPPO F3 cũng đã chính thức được trình làng với cụm camera trước kép trang bị nhiều tính năng selfie tuyệt vời hứa hẹn sẽ đem đến trải nghiệm đáng giá cho người dùng.', 'Điện thoại', 4990000, 59, '2018-04-28', 2376, 1, 3, 'Trung Quốc', 'Oppo'),
(21, 'Oppo F1s', 'OPPO F1s sẽ là chiếc điện thoại được OPPO giới thiệu tại Việt Nam nhằm đánh vào sở thích selfie của giới trẻ với điểm nhấn là camera trước có độ phân giải lên tới 16 MP.', 'Điện thoại', 4990000, 60, '2018-04-27', 2218, 1, 3, 'Trung Quốc', 'Oppo'),
(22, 'Oppo A83', 'OPPO A83 là chiếc smartphone dòng A đầu tiên sở hữu cho mình màn hình tràn viền và cùng với đó là camera với khả năng làm đẹp bằng AI nổi tiếng của OPPO.', 'Điện thoại', 4990000, 61, '2018-04-26', 2134, 1, 3, 'Trung Quốc', 'Oppo'),
(23, 'Sony Xperia XZ1', 'Sony Xperia XZ1 là mẫu flagship kế tiếp của Sony tiếp nối sự thành công của chiếc Xperia XZs đã ra mắt trước đó với những nâng cấp nhẹ về mặt cấu hình và thiết kế.', 'Điện thoại', 13990000, 62, '2018-04-25', 3190, 1, 4, 'Nhật Bản', 'Sony'),
(24, 'Sony Xperia XA Ultra', 'Sony Xperia XA Ultra sở hữu màn hình lớn cùng camera trước có độ phân giải cao cùng nhiều tính năng cao cấp.', 'Điện thoại', 6990000, 63, '2018-04-24', 2806, 1, 4, 'Nhật Bản', 'Sony'),
(25, 'Sony Xperia XZs', 'Sony Xperia XZs là smartphone được Sony đầu tư mạnh mẽ về camera với hàng loạt các trang bị cao cấp và sở hữu cho mình một mức giá bán hợp lý với người tiêu dùng.', 'Điện thoại', 9990000, 64, '2018-04-23', 2793, 1, 4, 'Nhật Bản', 'Sony'),
(26, 'Sony Xperia L1 Dual', 'Sony Xperia L1 Dual với màn hình lớn 5.5 inch, cấu hình phù hợp và đặt biêt nằm ở mức giá rất vùa túi tiền, đây chắc chắn sẽ đánh dấu sự trở lại của Sony trong thị trường điện thoại thông minh tại Việt Nam.', 'Điện thoại', 3590000, 65, '2018-04-22', 2185, 1, 4, 'Nhật Bản', 'Sony'),
(27, 'Vivo V7+', 'Vivo V7 Plus là chiếc smartphone mang tính cách mạng của Vivo với phần viền màn hình siêu mỏng cùng cụm camera độ phân giải siêu lớn 24 MP ở mặt trước ấn tượng.', 'Điện thoại', 7990000, 66, '2018-04-21', 2564, 1, 5, 'Trung Quốc', 'Vivo'),
(28, 'Vivo 5S', 'Vivo Xplay 5S là dòng điện thoại được đánh giá thuộc phân khúc cao cấp với cấu hình có thể xem là hàng đầu thời điểm hiện tại. Điểm đáng chú ý ở đây là sản phẩm có thiết kế tựa như chiếc iPhone 6s Plus của Apple.', 'Điện thoại', 6690000, 67, '2018-04-20', 2315, 1, 5, 'Trung Quốc', 'Vivo'),
(29, 'Vivo Y69', 'Vivo Y69 là mẫu smartphone thuộc phân khúc tầm trung của Vivo với thiết kế thời trang, camera selfie độ phân giải lớn đón đầu xu thế tự sướng của giới trẻ.', 'Điện thoại', 5490000, 68, '2018-04-19', 2246, 1, 5, 'Trung Quốc', 'Vivo'),
(30, 'Vivo Y55', 'Vivo Y55 có thiết kế khá quen thuộc của Vivo cho các smartphone giá rẻ của họ trong năm 2017 với thiết kế nguyên khối sang trọng, các góc cạnh bo cong mềm mại.', 'Điện thoại', 3990000, 70, '2018-04-18', 2189, 1, 5, 'Trung Quốc', 'Vivo'),
(31, 'Lenovo Tab 3 A8 ZA180071', 'Vẻ ngoài thời trang, trẻ trung, cấu hình hoạt động mạnh mẽ so với tầm giá, máy tính bảng Lenovo Tab 3 A8 ZA180071VN là tablet được giới văn phòng và học sinh, sinh viên yêu thích. Thêm vào đó, dung lượng pin khủng cho thời gian sử dụng dài. Bộ nhớ trong dung lượng 16GB, máy tính bảng Lenovo Tab 3 A8 ZA180071VN để người dùng lưu trữ được nhiều dữ liệu.', 'Máy tính bảng', 3190000, 30, '2018-04-17', 2106, 2, 6, 'Trung Quốc', 'Lenovo'),
(32, 'Lenovo Tab 3 710I MT8321', 'Lenovo Tab 3 710I MT8321 trang bị một màn hình IPS kích thước 7 inches cùng khe gắn Micro Sim, máy tính bảng Lenovo Tab 3 710I MT8321 có khả năng đàm thoại, kết nối 3G, 4G để bạn có những trải nghiệm thú vị khi thực hiện các cuộc gọi trên màn hình lớn', 'Máy tính bảng', 2190000, 30, '2018-04-16', 1979, 2, 6, 'Trung Quốc', 'Lenovo'),
(33, 'Lenovo Tab 3 730X ZA130063', 'Lenovo Tab 3 730X ZA130063 là dòng máy tính bảng phổ thông tầm trung phù hợp với những khách hàng như học sinh, sinh viên. Tuy là thiết bị tầm trung nhưng cấu hình của chiếc máy tính bảng Lenovo Tab 3 730X ZA130063VN rất ổn để lướt web, chơi game liên tục trong nhiều giờ. Thiết kế hiện đại tôn lên được vẻ sang trọng cho người sử dụng.', 'Máy tính bảng', 2290000, 30, '2018-04-15', 1856, 2, 6, 'Trung Quốc', 'Lenovo'),
(34, 'Lenovo Tab 3 730X ZA130086', 'Lenovo Tab 3 730X ZA130086 có thiết kế đơn giản nhưng đầy tiện ích khi sử dụng', 'Máy tính bảng', 2290000, 30, '2018-04-15', 1762, 2, 6, 'Trung Quốc', 'Lenovo'),
(35, 'Masstel Tab 8', 'Masstel Tab 8 Máy tính bảng có thiết kế gọn nhẹ, màn hình lớn hiển thị sắc nét đến từng chi tiết. Và máy có 2 sim 2 sóng giúp bạn nghẹ gọi như 1 smartphone rất tiện lợi. Camera thông minh cùng hiệu năng hoạt động ổn định trong ngày. Đem đến cho người dùng sự tiện lợi và đỉnh cao giải trí đa phương tiện.', 'Máy tính bảng', 2290000, 50, '2018-04-14', 1948, 2, 7, 'Trung Quốc', 'Masstel'),
(36, 'Masstel Tab 825', 'Masstel Tab 825 là mẫu máy tính bảng Android sở hữu thiết kế kim loại nguyên khối đẹp mắt, vi xử lý mạnh mẽ đến từ Intel và có mức giá hấp dẫn.', 'Máy tính bảng', 2190000, 50, '2018-04-14', 1892, 2, 7, 'Trung Quốc', 'Masstel'),
(37, 'Masstel Tab 7 LTE', 'Masstel Tab 7 LTE máy tính bảng có thiết kế gọn nhẹ, màn hình lớn hiển thị sắc nét đến từng chi tiết. Và máy có 2 sim 2 sóng giúp bạn nghẹ gọi như 1 smartphone rất tiện lợi. Camera thông minh cùng hiệu năng hoạt động ổn định trong ngày. Đem đến cho người dùng sự tiện lợi và đỉnh cao giải trí đa phương tiện.', 'Máy tính bảng', 2090000, 50, '2018-04-13', 1634, 2, 7, 'Trung Quốc', 'Masstel'),
(38, 'Masstel Tab 7', 'Masstel Tab 7 Máy tính bảng có thiết kế gọn nhẹ, màn hình lớn hiển thị sắc nét đến từng chi tiết. Và máy có 2 sim 2 sóng giúp bạn nghẹ gọi như 1 smartphone rất tiện lợi. Camera thông minh cùng hiệu năng hoạt động ổn định trong ngày. Đem đến cho người dùng sự tiện lợi và đỉnh cao giải trí đa phương tiện.', 'Máy tính bảng', 1790000, 50, '2018-04-12', 1816, 2, 7, 'Trung Quốc', 'Masstel'),
(39, 'Huawei MediaPad T3 10', 'Huawei MediaPad T3 10 (2017) là chiếc máy tính bảng với màn hình kích thước lớn cùng khe cắm sim tiện lợi giúp người dùng có thể nghe gọi như một chiếc smartphone.\r\n\r\n \r\n\r\n\r\nHuawei MediaPad T3 10 (2017) là chiếc máy tính bảng với màn hình kích thước lớn cùng khe cắm sim tiện lợi giúp người dùng có thể nghe gọi như một chiếc smartphone, thiết kế mỏng, đẹp\r\n', 'Máy tính bảng', 4990000, 70, '2018-04-11', 1856, 2, 8, 'Trung Quốc', 'Huawei'),
(40, 'Huawei MediaPad T3 8.0', 'Huawei MediaPad T3 8.0, máy tính bảng giá rẻ có thẻ sim nghe gọi, nhắn tin thả ga, cấu hình 4 nhân giải trí tiện dụng đi kèm tích hợp sẵn Android 7.', 'Máy tính bảng', 3990000, 70, '2018-04-10', 1734, 2, 8, 'Trung Quốc', 'Huawei'),
(41, 'Huawei MediaPad T1 8.0', 'Huawei MediaPad T1-8 là tablet giá rẻ sở hữu màn hình 8 inch, cấu hình đáp ứng tốt các nhu cầu công việc và giải trí, hỗ trợ đàm thoại và truy cập internet di động tốc độ cao thông qua kết nối 3G, thiết kế trang nhã, thanh thoát', 'Máy tính bảng', 2990000, 70, '2018-04-09', 1652, 2, 8, 'Trung Quốc', 'Huawei'),
(42, 'Huawei MediaPad T1-701u', 'Huawei MediaPad T1-701u là mẫu tablet giá rẻ sở hữu kích thước màn hình 7 inch cùng khả năng hỗ trợ đàm thoại và kết nối 3G. Trong phân khúc giá 3 triệu đồng, đây là sự lựa chọn hợp lý cho những người dùng muốn trải nghiệm việc sử dụng máy tính bảng với chi phí thấp.', 'Máy tính bảng', 2090000, 70, '2018-04-08', 1511, 2, 8, 'Trung Quốc', 'Huawei'),
(43, 'Samsung Galaxy Tab A6 ', 'Samsung tiếp tục giới thiệu máy tính bảng Galaxy Tab A6 10.1 tại thị trường Việt Nam. Với cấu hình mạnh mẽ, màn hình chuẩn Full HD cùng thời lượng pin bền bỉ, máy tính bảng Galaxy Tab A6 10.1 xứng đáng là thiết bị giải trí đỉnh cao cho giới trẻ.', 'Máy tính bảng', 7990000, 50, '2018-04-07', 2478, 2, 2, 'Hàn Quốc', 'SamSung'),
(44, 'Samsung Galaxy Tab A 8.0', 'Samsung Galaxy Tab A 8.0 (2017) mới có màn hình tỉ lệ 4:3 với không gian hiển thị rộng thông minh cho người dùng.', 'Máy tính bảng', 5490000, 50, '2018-04-06', 2367, 2, 2, 'Hàn Quốc', 'SamSung'),
(45, 'Samsung Galaxy Tab A SM-T285', 'Samsung Galaxy Tab A SM-T285 rất thích hợp để sử dụng hỗ trợ công việc văn phòng và giải trí nếu bạn muốn chọn một chiếc tablet ở mức giá tầm trung.', 'Máy tính bảng', 3590000, 50, '2018-04-05', 2210, 2, 2, 'Hàn Quốc', 'SamSung'),
(46, 'Samsung Galaxy Tab A6 7.0', 'Samsung Galaxy Tab A6 7.0 với thiết kế vẫn mang vẻ truyền thống và cấu hình tốt, khả năng hiển thị cải thiện, cùng kết nối 4G.', 'Máy tính bảng', 3590000, 50, '2017-04-04', 2898, 2, 2, 'Hàn Quốc', 'SamSung'),
(47, 'iPad Pro 10.5 Wifi 64GB', 'Apple đã làm cho máy tính bảng của mình hoàn hảo hơn các model trước đây khi tinh chỉnh kể cả thiết kế, phần mềm và nâng cấp phần cứng trên iPad Pro 10.5 inch. Với cấu hình ấn tượng, màn hình sáng hơn, chip mạnh mẽ hơn và một tính năng ProMotion làm tăng tốc độ tươi của màn hình', 'Máy tính bảng', 16990000, 51, '2018-04-04', 6120, 2, 1, 'Hàn Quốc', 'Apple'),
(48, 'iPad Air 2 Cellular 128GB', 'iPad Air 2 Cellular 128GB mang trong mình thiết kế sang trọng, bộ nhớ trong lớn cùng kết nối 3G/4G tiện lợi sẽ đáp ứng tốt cho bạn trong mọi nhu cầu sử dụng, thiết kế mỏng nhẹ', 'Máy tính bảng', 15490000, 51, '2018-04-04', 5945, 2, 1, 'Hàn Quốc', 'Apple'),
(49, 'iPad Wifi Cellular 128GB', 'iPad Wifi Cellular 128GB là một trong những sản phẩm mới của Apple, với những điểm nâng cấp vô cùng sáng giá như: mỏng nhẹ, sang trọng, màn hình tuyệt đẹp, cấu hình mạnh mẽ, camera đẳng cấp, cùng nhiều chức năng khác', 'Máy tính bảng', 14990000, 51, '2018-04-03', 5817, 2, 1, 'Hàn Quốc', 'Apple'),
(50, 'iPad Mini 4 Wifi 128GB', 'iPad mini 4 là sản phẩm tiếp nối của dòng iPad kích thước nhỏ đến từ Apple trong năm 2015. So với phiên bản tiền nhiệm iPad mini 3, thiết bị này đã có rất nhiều cải tiến, từ thiết kế mỏng gọn hơn, màn hình hiển thị tốt hơn, camera được nâng cấp và đặc biệt là con chip xử lý Apple A8 mang đến hiệu năng vượt trội', 'Máy tính bảng', 10990000, 51, '2018-04-03', 5759, 2, 1, 'Hàn Quốc', 'Apple');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('5ypsnn82D57p3gfPXWwm3nCZzEnm-rDE', 1530123872, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":false}'),
('7YmB4_chPQGq3yDMLpQd8gpfr2-Du7Is', 1530173808, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"user\":{\"f_ID\":1,\"f_Username\":\"customer\",\"f_Password\":\"03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4\",\"f_Name\":\"Ducmap\",\"f_Email\":\"Ducmap@gmail.com\",\"f_DOB\":\"1997-09-02T17:00:00.000Z\",\"f_Permission\":0},\"cart\":[]}'),
('7jI9ttB4B8C8fjsASDmu15cJ6Ukn0_Gt', 1530100038, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":false}'),
('DAvwE2494UWJr74qFcYm-gQAGyi-i5OU', 1530185658, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"user\":{\"f_ID\":1,\"f_Username\":\"customer\",\"f_Password\":\"03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4\",\"f_Name\":\"Ducmap\",\"f_Email\":\"Ducmap@gmail.com\",\"f_DOB\":\"1997-09-02T17:00:00.000Z\",\"f_Permission\":0},\"cart\":[]}'),
('uMnf8T4HX84qRonNN4_5yLeaLntg2pJZ', 1530104456, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":false}');

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

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`f_ID`, `f_Username`, `f_Password`, `f_Name`, `f_Email`, `f_DOB`, `f_Permission`) VALUES
(1, 'customer', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'Ducmap', 'Ducmap@gmail.com', '1997-09-03', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
