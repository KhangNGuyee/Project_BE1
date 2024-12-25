-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 19, 2024 at 03:54 AM
-- Server version: 8.0.31
-- PHP Version: 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `computer_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `ad_id` int NOT NULL AUTO_INCREMENT,
  `ad_user` varchar(30) NOT NULL,
  `ad_pwd` varchar(30) NOT NULL,
  `ad_name` varchar(30) NOT NULL,
  `ad_email` varchar(50) NOT NULL,
  `ad_phone` varchar(15) NOT NULL,
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ad_id`, `ad_user`, `ad_pwd`, `ad_name`, `ad_email`, `ad_phone`) VALUES
(1, 'admin', 'admin', 'Group1', '22211tt3320@mail.tdc.edu.vn', '0342981407');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `cat_id` int NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(50) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`) VALUES
(1, 'RAM'),
(2, 'VGA'),
(3, 'PSU - Nguồn'),
(4, 'CPU'),
(5, 'Mainboard'),
(6, 'Case máy tính'),
(8, 'Tản nhiệt'),
(9, 'Ố cứng'),
(10, 'Ổ đĩa ngoài');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `comment_content` varchar(500) NOT NULL,
  `comment_date` datetime NOT NULL,
  `comment_rate` smallint NOT NULL DEFAULT '0',
  `product_id` int NOT NULL,
  `user_id` varchar(30) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `FK_COMMENT_PRODUCT` (`product_id`),
  KEY `FK_COMMENT_USER` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL,
  `consignee_name` varchar(30) NOT NULL,
  `consignee_phone` varchar(15) NOT NULL,
  `consignee_address` varchar(50) NOT NULL,
  `order_status` tinyint(1) NOT NULL,
  `user_id` varchar(30) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK_ORDER_USER` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `order_date`, `consignee_name`, `consignee_phone`, `consignee_address`, `order_status`, `user_id`) VALUES
(86, '2024-12-19', 'test1', '0349538456', 'HCM', 0, 'test1'),
(87, '2024-12-19', 'test1', '0349538456', 'HCM', 0, 'test1'),
(88, '2024-12-19', 'test1', '0349538456', 'Cu Chi', 0, 'test1');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE IF NOT EXISTS `order_detail` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` tinyint NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `FK_ORDERDETAIL_PRODUCT` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`order_id`, `product_id`, `quantity`) VALUES
(86, 4, 1),
(87, 2, 1),
(88, 39, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(150) NOT NULL,
  `product_price` int NOT NULL,
  `product_img` varchar(50) NOT NULL,
  `product_date` date NOT NULL DEFAULT '2019-11-18',
  `product_quantity` int NOT NULL DEFAULT '0',
  `product_description` varchar(500) NOT NULL,
  `product_detail` varchar(1000) NOT NULL,
  `cat_id` int NOT NULL,
  `provider_id` int NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FK_PRODUCT_CAT` (`cat_id`),
  KEY `FK_PRODUCT_PROVIDER` (`provider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_price`, `product_img`, `product_date`, `product_quantity`, `product_description`, `product_detail`, `cat_id`, `provider_id`) VALUES
(2, 'CPU Intel Core I3-7100 (3.9GHz)', 3360000, 'intel_i3_7100.jpg', '2024-11-08', 37, 'Tên sản phẩm: Bộ vi xử lý/ CPU Intel Core i3-7100 (3M Cache, 3.9GHz)\r\n- Socket: LGA 1151 , Intel Core thế hệ thứ 7\r\n- Tốc độ xử lý: 3.9 GHz ( 2 nhân, 4 luồng)\r\n- Bộ nhớ đệm: 3MB\r\n- Đồ họa tích hợp: Intel HD Graphics 630\r\n', 'Sơ lược\r\nINTEL đã chính thức ra mắt dòng CPU thế hệ thứ 7 của mình với tên mã Kaby Lake. Đây vẫn là dòng CPU được sản xuất trên công nghệ 14nm của Intel, nhưng đã được cải tiến đáng kể về hiệu năng xử lý đồ họa và tiết kiệm điện năng. Các CPU Kaby Lake sẽ tập trung rất nhiều vào khả năng xử lý đồ họa, đặc biệt là video với độ phân giải 4K, các video 360 độ và công nghệ thực tế ảo. Đồng thời hiệu năng xử lý các ứng dụng cũng được tăng lên 12%, còn hiệu năng duyệt web cao hơn 19% so với Skylake. Đặc biệt các dòng CPU sử dụng cho laptop mỏng, nhẹ sẽ đem lại hiệu năng và thời lượng pin được cải thiện rất nhiều.\r\nSáng tạo hơn\r\nLàm việc, vui chơi và tạo ra lâu hơn với một lần sạc. Tuổi thọ pin nâng cao giúp bạn tự do hoạt động không giới hạn đến 10 giờ2, cộng với thiết bị mỏng hơn và nhẹ hơn sẽ làm cho việc di chuyển trở nên dễ dàng hơn bao giờ hết. Thậm chí xem được đến 9,5 giờ video Ultra HD 4K với một lần sạc.', 4, 3),
(3, 'CPU Intel Core I3-8100 (3.6GHz)', 3150000, 'intel_i3_8100.jpg', '2024-11-08', 26, 'Tên sản phẩm: Bộ vi xử lý/ CPU Intel Core i3-9100 (6M Cache, up to 4.20GHz)\r\n\r\nSocket: 1151, Intel Core thế hệ thứ 9\r\nTốc độ: 3.60 GHz - 4.20 GHz (4nhân, 4 luồng)\r\nBộ nhớ đệm: 6MB\r\nChip đồ họa tích hợp: Intel UHD Graphics 630', 'Giới thiệu CPU Intel Core i3-9100\r\nMặc dù với sự cải thiện vượt trội của các dòng CPU cao cấp i5, i7, i9. Nhưng Core i3 lại là sự lựa chọn của đại đa số người sử dụng, sở hữu hiệu năng tốt, khả năng linh hoạt cao và đặc biệt là mức giá cực kì tốt, là những đặc điểm giúp cho Core i3 trở nên cực kì phổ biến.\r\n\r\nMới đây, Intel vừa mới cho ra mắt Core i3-9100, đại diện cho dòng Core i3 thế hệ thứ 9. Được sản xuất trên kiến trúc Coffee Lake với công nghệ 14nm mới nhất, Core i3-9100 chắc chắn sẽ tiếp tục khẳng định vị thế của Intel ở phân khúc tầm trung trước sự bành trường của AMD.\r\nHiệu năng\r\nVới hiệu năng được cải thiện rõ rệt so với thế hệ trước, sở hữu tốc độ xử lý lên tới 4.2GHz, thay vì chỉ ở mức 3.6GHz như Core i3-8100. Kết hợp với 4 nhân xử lý mạnh mẽ bên trong, đem lại hiệu năng chơi game tuyệt vời khi đi chung với một chiếc card màn hình tầm trung.', 4, 3),
(4, 'CPU Intel Core I5-7500 (3.4GHz - 3.8GHz)', 5970000, 'intel_i5_7500.jpg', '2024-11-08', 28, 'Tên sản phẩm: Bộ vi xử lý/ CPU Intel Core i5-7500 (6M Cache, up to 3.8GHz)\r\n\r\n- Socket: LGA 1151 , Intel Core thế hệ thứ 7\r\n- Tốc độ xử lý: 3.4 GHz - 3.8 GHz ( 4 nhân, 4 luồng)\r\n- Bộ nhớ đệm: 6MB\r\n- Đồ họa tích hợp: Intel HD Graphics 630', 'Turbo Boosted Hiệu suất cao \r\n\r\nDành ít thời gian hơn để chờ đợi với công suất và khả năng phản ứng nhanh của công nghệ Intel® Turbo Boost 2.0. Tuổi thọ pin lâu hơn và sạc nhanh hơn giúp bạn tự do trải nghiệm tốc độ và hiệu năng được cải tiến. Tạo, chỉnh sửa và chia sẻ nội dung 4K một cách dễ dàng và khám phá chế độ xem 4K và 360 đầy đủ trên màn hình. Nói cách khác, bộ xử lý tốt nhất của Intel thậm chí còn tốt hơn.\r\nTốc độ bạn cần cho máy tính\r\n\r\nĐược trang bị phản hồi nhanh, bộ xử lý Intel® Core ™ thế hệ thứ 7 có sức mạnh và tốc độ để đáp ứng nhu cầu của bạn. Mở tập tin và chương trình một cách nhanh chóng, cộng với việc chuyển đổi giữa các ứng dụng và trang web một cách liền mạch không chậm trễ.', 4, 3),
(5, 'CPU Intel Core i5-9400F (6C/6T, 2.9 - 4.1 GHz, 9MB) - LGA 1151-v2', 3790000, 'intel_i5_9400F.jpg', '2024-11-08', 32, 'Tên sản phẩm: Bộ vi xử lý/ CPU Intel Core i5-9400F (9M Cache, up to 4.10GHz)\r\n\r\n- Socket: LGA 1151-v2 , Intel Core thế hệ thứ 9\r\n- Tốc độ xử lý: 2.9 - 4.1 GHz ( 6 nhân, 6 luồng)\r\n- Bộ nhớ đệm: 9MB', 'Giới Thiệu Sản Phẩm\r\nCPU intel Core i5-9400F đã lên kệ tại Phong Vũ với 6 nhân thuộc dòng Coffee Lake Refresh và được sản xuất trên tiến trình xử lý 14nm của hãng. CPU Intel Core i5-9400F với hậu tố F khá mới mẻ đến từ việc lược giản GPU onboard với I5-9400. CPU Intel Core i5-9400F hướng đến phục vụ các PC hiệu năng trung bình có nhu cầu khai thác khoảng 6 nhân vật lý và sở hữu card màn hình rời. \r\nCPU Core i5-9400F có nhân nhưng không có Hyper-Threading (siêu phân luồng) hoạt động ở mức 2.9 – 4.1 GHz, 9 MB cache – bộ nhớ đệm. Hỗ trợ bộ nhớ RAM DDR4-2666 và đòi hỏi công suất TDP là 65 W. Core i5-9400F là một trong những bộ xử lý sáu nhân phổ thông của Intel dành cho máy tính để bàn và do đó sẽ là một trong những CPU rẻ nhất có sáu nhân.', 4, 3),
(6, 'CPU Intel Core I7-7700 (3.6GHz)', 9100000, 'intel_i7_7700.jpg', '2024-11-08', 34, 'Tên sản phẩm: Bộ vi xử lý/ CPU Intel Core i7-7700 (8M Cache, up to 4.2GHz)\r\n\r\n- Socket: LGA 1151 , Intel Core thế hệ thứ 7\r\n- Tốc độ xử lý: 3.6 GHz ( 4 nhân, 8 luồng)\r\n- Bộ nhớ đệm: 8MB\r\n- Đồ họa tích hợp: Intel HD Graphics 630', 'Công nghệ bảo vệ dữ liệu Intel®:\r\n\r\nIntel® AES New Instructions Có\r\nKhóa bảo mật Có\r\nMở Rộng Bảo Vệ Phần Mềm Intel® (Intel® SGX) Có\r\nIntel® Memory Protection Extensions (Intel® MPX) Có\r\nCông nghệ bảo vệ nền tảng Intel®:\r\n\r\nBảo vệ HĐH Có\r\nCông nghệ thực thi tin cậy Intel® ‡ Có\r\nBit vô hiệu hoá thực thi ‡ Có\r\nIntel® Device Protection Technology với Boot Guard\r\nCác tùy chọn mở rộng:\r\n\r\nKhả năng mở rộng 1S Only\r\nPhiên bản PCI Express 3.0\r\nCấu hình PCI Express ‡ Up to 1x16, 2x8, 1x8+2x4 Số cổng\r\nPCI Express tối đa 16', 4, 3),
(7, 'CPU Intel Pentium G5400 (2C/4T, 3.7 GHz, 4MB) - LGA 1151-v2', 1590000, 'intel_pentium_G5400.jpg', '2024-11-08', 25, 'Tên sản phẩm: Bộ vi xử lý/ CPU Intel Pentium Gold G5400 (4M Cache, 3.7GHz)\r\n\r\n- Socket: LGA 1151-v2 , Intel Pentium Gold\r\n- Tốc độ xử lý: 3.7 GHz ( 2 nhân, 4 luồng)\r\n- Bộ nhớ đệm: 4MB\r\n- Đồ họa tích hợp: Intel UHD Graphics 610', 'Hiệu suất\r\nCPU Pentium G5400 là bộ xử lý 2 nhân 4 luồng, xung nhịp 3.7GHz đảm bảo máy tính đa nhiệm mượt mà, ổn định với tốc độ khá cao. Đặc biệt, đây là nhân Coffee Lake, dòng nhân CPU “xịn xò” nhất hiện nay được trang bị trên cả các dòng Core i5, i7, i9.\r\n\r\nChip được sản xuất trên công nghệ 14 nm và bộ nhớ cache 4MB giúp tăng tốc độ xử lý của chip lên khá cao, trong khi giảm điện năng tiêu thụ và lượng nhiệt tỏa ra (trung bình tiêu thụ 54W).\r\nBộ nhớ\r\nCPU Pentium G5400 có chuẩn bộ nhớ DDR4 với xung nhịp bus 2400MHz, là chuẩn RAM phổ biến nhất hiện nay, mang đến dung lượng băng thông tối đa 37.5GB/s, cao hơn đến 50% so với DDR3, đồng thời điện năng tiêu thụ cũng ít hơn, các thông số chỉ kém phiên bản DDR5 mới ra mắt vào 2018.', 4, 3),
(8, 'Mainboard ASUS TUF B450M-PLUS GAMING', 2090000, 'asus_tuf_B450M.jpg', '2024-11-08', 15, 'Tên sản phẩm: Bo mạch chính/ Mainboard Asus TUF B450M-PLUS GAMING\r\n\r\n- Chuẩn mainboard: Micro-ATX\r\n- Socket: AM4 , Chipset: B450\r\n- Hỗ trợ RAM: DDR4 , tối đa 64GB\r\n- Cổng cắm lưu trữ: 1 x M.2 SATA/NVMe; 6 x SATA 3 6Gb/s\r\n- Cổng xuất hình: 1 x DVI-D; 1 x HDMI', 'GIỚI THIỆU SẢN PHẨM\r\nBo mạch chính/ Mainboard Asus TUF B450M-PLUS GAMING đóng vai trò là một bản mạch trung gian giao tiếp giữa các thiết bị với nhau. Thiết bị là mạch điện chính của một hệ thống hay thiết bị điện tử (ví dụ như nguồn máy tính, CPU, bo mạch đồ họa, bo mạch âm thanh, bo mạch mạng, ổ cứng, màn hình, máy in, máy  quét,…) bằng cách trực tiếp trên bề mặt thiết bị đó hoặc thông qua các kết nối cắm vào hoặc dây dẫn liên kết.\r\nĐẶC ĐIỂM NỔI BẬT\r\nTrải nghiệm DIY PC dễ dàng Các bo mạch chủ của TUF Gaming cung cấp các bản vẽ DIY dễ dàng  bằng cách tận dụng thiết kế và kỹ thuật sáng tạo với các nhà sản xuất linh kiện chính. Sự kết hợp vô song của các thành phần TUF, TUF Protection và TUF Gaming Alliance hứa hẹn đem lại trải nghiệm chơi game thú vị.', 5, 2),
(9, 'Mainboard ASUS ROG Strix Z390-F Gaming', 5320000, 'asus_rog_strix_Z390.jpg', '2024-11-08', 12, 'Tên sản phẩm: Bo mạch chính/ Mainboard Asus ROG Strix Z390-F Gaming\r\n\r\n- Chuẩn mainboard: ATX\r\n- Socket: LGA 1151-v2 , Chipset: Z390\r\n- Hỗ trợ RAM: DDR4 , tối đa 64GB\r\n- Cổng cắm lưu trữ: 1 x M.2 NVMe; 1 x M.2 SATA/NVMe; 6 x SATA 3 6Gb/s; Hỗ trợ Intel Optane\r\n- Cổng xuất hình: 1 x DisplayPort; 1 x HDMI', 'Giới thiệu chi tiết Mainboard Asus ROG Strix Z390-F Gaming\r\nKhác với dòng Z390-H Gaming, Mainboard Asus ROG Strix Z390-F Gaming mang màu sắc mềm mại hơn nhưng vẫn giữ được hiệu năng nổi trội cùng hỗ trợ nhiều tính năng thông minh. Sản phẩm vẫn cùng với các dòng Z390 khác tạo nên những lựa chọn lý tưởng cho những người dùng có nhu cầu cao nói chung và các game thủ khó tính nói riêng.\r\nHỗ trợ RAM: DDR4\r\nTốc độ xử lý và khả năng truy xuất dữ liệu được cải thiện đáng kể. Cụ thể hơn, với hỗ trợ RAM DDR4, không những bạn được cung cấp tốc độ nhanh hơn mà nó còn giúp tiết kiệm năng lượng đáng kể so với DDR3 trước đây, góp phần tăng hiệu suất công việc tuyệt vời.', 5, 2),
(10, 'RAM laptop Kingston KVR26S19S8/8 (1x8GB) DDR4 2666MHz', 910000, 'kingston_KVR26S19S8.jpg', '2024-11-08', 13, 'Tên sản phẩm: Bộ nhớ laptop DDR4 Kingston 8GB (2666) (KVR26S19S8/8)\r\n\r\n- Dung lượng: 1 x 8GB\r\n- Thế hệ: DDR4\r\n- Bus: 2666MHz\r\n- Cas: 19', 'Chi tiết\r\nKingston KVR26S19S8/8 là bộ nhớ RAM DDR4 có tốc độ xử lý đạt 2666MHz, giúp tối ưu hiệu năng cho bộ xử lý CPU đến từ cả Intel lẫn AMD. Sử dụng chip nhớ Micron cao cấp với độ trễ đạt 19-19-19 ở thiết lập mặc định, bạn sẽ không phải lo lắng về việc tốc độ của bộ nhớ sẽ làm chậm tốc độ xử lý của CPU.\r\n\r\nVới dung lượng bộ nhớ lên tới 8GB, đem lại một khoảng nâng cấp bộ nhớ khá lớn cho laptop của bạn chỉ với một khe cắm duy nhất. Trong trường hợp laptop của bạn có hai khe cắm, thì chỉ cần hai thanh RAM Kingston KVR26S19S8/8 là bạn đã nâng cấp dung lượng RAM của laptop lên tới 16GB rồi, đem lại khả năng đa nhiệm cực kì tốt.', 1, 4),
(11, 'Card màn hình ASUS GeForce RTX 2080Ti 11GB GDDR6 ROG Strix OC (ROG-STRIX-RTX2080TI-O11G-GAMING)', 36990000, 'asus_rtx_2080Ti.jpg', '2024-11-08', 3, 'Tên sản phẩm: Card màn hình Asus Rog Strix GeForce RTX 2080 Ti OC edition 11GB GDDR6 (ROG-STRIX-RTX2080TI-O11G-GAMING)\r\n\r\n- Chip đồ họa: NVIDIA GeForce RTX 2080Ti\r\n- Bộ nhớ: 11GB GDDR6 ( 352-bit )\r\n- GPU clock OC Mode - GPU Boost Clock : 1665 MHz , GPU Base Clock : 1350 MHz Gaming Mode (Default) - GPU Boost Clock : 1650 MHz , GPU Base Clock : 1350 MHz\r\n- Nguồn phụ: 2 x 8-pin', 'Giới thiệu card đồ họa ASUS GeForce RTX 2080Ti 11GB GDDR6 ROG Strix OC\r\nGeForce RTX 2080Ti 11GB GDDR6 ROG Strix OC có thể được xem là chiếc card đồ họa nhanh nhất và tốt nhất được ASUS sản xuất tính đến thời điểm hiện tại, sử dụng bộ xử lý đồ họa RTX 2080Ti với tốc độ xử lý tuyệt vời và hỗ trợ nhiều công nghệ mới nhất của NVIDIA như DLSS, Ray tracing, VRS đem lại trải nghiệm chơi game tốt nhất tới tay game thủ.\r\nHệ thống làm mát\r\nĐi với GeForce RTX 2080Ti 11GB GDDR6 ROG Strix OC là 3 chiếc quạt làm mát được ASUS thiết kế với hình dáng được tối ưu cho việc tạo lực ép của không khí xuống tản nhiệt. Giúp áp lưc không khí được cải thiện 105% so với các thiết kế quạt truyền thống, thậm chí phần trục của cả 3 chiếc quạt làm mát này còn đạt chuẩn kháng bụi IP5X, nhằm đảm bảo tuổi thọ và khả năng hoạt động ổn định.', 2, 2),
(12, 'Card màn hình ASUS GeForce GTX 1650 4GB GDDR5 DUAL OC (DUAL-GTX1650-O4G)', 4860000, 'asus_gtx_1650.jpg', '2024-11-08', 10, 'Tên sản phẩm: Card màn hình Asus Dual GeForce GTX 1650 OC 4GB GDDR5 (DUAL-GTX1650-O4G)\r\n\r\n- Chip đồ họa: NVIDIA GeForce GTX 1650\r\n- Bộ nhớ: 4GB GDDR5 ( 128-bit )\r\n- GPU clock OC Mode - GPU Boost Clock : 1755 MHz , GPU Base Clock : 1485 MHz Gaming Mode (Default) - GPU Boost Clock : 1725 MHz , GPU Base Clock : 1485 MHz', 'Giới thiệu card màn hình ASUS GeForce GTX 1650 4GB GDDR5 DUAL OC\r\nThiết kế\r\nGTX 1650 4GB GDDR6 DUAL OC là 1 trong những chiếc card màn hình tầm trung mới nhất đến từ thương hiệu ASUS, sử dụng bộ xử lý GTX 1650 cải thiện hiệu năng chơi game trên độ phân giải full HD đáng kể so với thế hệ trước là GTX 1050Ti\r\nG-Sync\r\nHỗ trợ tính năng G-Sync, GTX 1650 4GB GDDR6 DUAL OC sẽ đem lại chất lượng hình tốt nhất, loại bỏ hoàn toàn hiện tượng \"xé hình\" (tearing) thường gặp phải khi chơi game.', 2, 2),
(13, 'Nguồn máy tính AcBel HK  - 450W', 595000, 'AcBel_450W.jpg', '2024-11-08', 15, 'Tên sản phẩm: Nguồn/ Power Acbel HK + 450W\r\n\r\n- Công suất: 450W\r\n- Quạt: 1 x 120 mm', 'Đảm bảo dòng điện ổn định tập trung công suất cho card đồ họa\r\n\r\nChịu được mức tải nặng tập trung vào 1 đường điện 12 V\r\n\r\nCông nghệ quạt thông minh\r\n\r\nDòng nguồn này sử dụng 1 quạt tản nhiệt có đường kính 120 mm hoạt động êm ái\r\n\r\nQuạt cân bằng giữa hiệu năng làm mát và tiếng ồn\r\n\r\nHỗ trợ công nghệ Active PFC\r\n\r\nĐem lại hiệu suất chuyển đổi dòng điện lên tới 99%, không cần lo lắng về tổn hao và lẵng phí điện năng.\r\n\r\nĐạt chứng chỉ 2013 Erp/Eup\r\n\r\nTiêu thụ điện dưới mức 0,5 W khi máy tính ở chế độ nghỉ\r\n\r\nĐạt chứng nhận hỗ trợ đầy đủ cho các dòng vi xử lý Intel\r\n\r\nHỗ trợ dòng điện cho đầy đủ các dòng vi xử lý Intel Skylake\r\n\r\nCông suất 450W\r\n\r\nĐảm bảo cung cấp đủ nguồn để các bộ PC thông thường cũng như PC gaming và đồ họa hiện tại có khẳ năng hoạt động tốt và trơn tru mang lại những trải nghiệm về công nghệ và giải trí tốt nhất đến cho người sử dụng.', 3, 5),
(14, 'Nguồn máy tính AcBel iPower G600 - 600W - 80 Plus White', 1110000, 'AcBel_600W.jpg', '2024-11-08', 11, 'Tên sản phẩm: Nguồn/ Power Acbel 600W iPower G600\r\n\r\n- Công suất: 600W\r\n- Chuẩn hiệu suất: 80 Plus White\r\n- Quạt: 1 x 120 mm', 'Bộ nguồn Acbel 600W I G600 được thiết kế để sử dụng cho các mainboard chuẩn ATX tương thích với các mainboard được người dùng ưa chuộng trên thị trường hiện nay. Bộ nguồn được thiết kế với công nghệ Active PFC – dùng mạch để điều chỉnh hệ số công suất  – giúp cho PSU có thể tự điều chỉnh sao cho phù hợp với nguồn điện ở nơi cung cấp là 100V – 110V hoặc 220V – 230V. Ngoài ra, PSU còn được thiết kế với đường 12V single rail có khả năng hỗ trợ các card VGA rời.\r\nBộ nguồn Acbel 600W I G600 được thiết kế với quạt 12 cm và thiết kế vỏ dập lưới tổ ong tăng diện tích tiếp xúc với không khí với hệ thống điều khiển quạt thông minh làm giảm thiểu nhiệt tích tụ, giảm độ ồn và đảm bảo cho PSU hoạt động hết vòng đời. Ngoài ra, PSU còn được trang bị với chế độ bảo vệ khi gặp các tình trạng quá công suất, quá dòng, chạm tải cùng với các chức năng bảo vệ khác', 3, 5),
(15, 'Case máy tính Cooler Master Masterbox 5 MSI Edition', 1650000, 'coolermaster_masterbox5msi.jpg', '2024-11-08', 8, 'Tên sản phẩm: Thùng máy/ Case Cooler Master Masterbox 5 MSI Edition (No power)\r\n\r\n\r\n- Hỗ trợ mainboard: ATX\r\n1 x 2.5\"\r\n- Cổng USB: 2 x USB 3.0\r\n- Số quạt tặng kèm: Không có', 'GIỚI THIỆU SẢN PHẨM\r\nCooler Master được biết đến là một thương hiệu nổi tiếng với các sản phẩm, linh kiện máy như Case, gaming gear hay các loại tản nhiệt. Nhà sản xuất này cung cấp khá nhiều chủng loại sản phẩm phù hợp gần như cho mọi cấp độ người dùng với giá thành hợp lý. Case Cooler Master Masterbox 5 - MSI Edition là một sản phẩm cao cấp với mức giá tầm trung đáp ứng nhu cầu thiết kế dàn PC hiện đại nhưng vẫn đầy cá tính, tùy biến theo cách của bạn.\r\nĐẶC ĐIỂM CHI TIẾT\r\nThùng máy tính được thiết kế thân máy bằng thép, lưới nhựa Bezel với tông màu đỏ đen chủ đạo vừa mạnh mẽ, cá tính vừa tinh tế giúp hoàn chỉnh case máy tính khủng của bạn thêm hoàn hảo hơn. Thiết bị có độ bền cao, có khả năng chống trầy xước, va đập, bảo vệ các linh kiện máy tính bên trong trước các tác động của ngoại lực nhờ chất liệu thép cao cấp.', 6, 6),
(16, 'Case máy tính Cooler Master MasterBox Q300P', 1700000, 'coolermaster_masterbox_Q300P.jpg', '2024-11-08', 14, 'Tên sản phẩm: Thùng máy/ Case Cooler Master MasterBox Q300P RGB\r\n\r\n- Loại case: Mini Tower\r\n- Hỗ trợ mainboard: Micro-ATX; Mini-ITX\r\n- Khay mở rộng tối đa: 1 x 3.5\" , 2 x 2.5\"\r\n- Cổng USB: 2 x USB 3.0\r\n- Số quạt tặng kèm: 3 x 120 mm', 'Giới thiệu Thùng máy/ Case Cooler Master MasterBox Q300P RGB\r\nCase Cooler Master MasterBox Q300P RGB được sản xuất bởi Cool Master, nhà sản xuất phần cứng máy tính tại Đài Loan. Được thành lập vào năm 1992, sản xuất vỏ máy tính, nguồn, bộ làm mát... Các sản phẩm của Cooler Master mang chất lượng tốt và đều được đánh giá cao của người tiêu dùng và các chuyên gia.\r\nThiết kế cá tính\r\nCase Cooler Master MasterBox Q300P RGB được thiết kế di động cùng 4 thanh cầm nhằm nâng PC, mang lại tính linh hoạt cho case. Cạnh bên và mặt trước được thiết kế mặt kính, có thể nhìn phía trong. Hiệu ứng ánh sáng LED đi kèm kết nối ba quạt LED RGB được đặt sẵn và nút nguồn RGB tạo hiệu ứng ánh sáng tuyệt đẹp.', 6, 6),
(17, 'Tản khí Cooler Master XDream i117', 220000, 'coolermaster_xdreami117.jpg', '2024-11-08', 35, 'Tên sản phẩm: Quạt CPU Cooler Master X Dream i117\r\n\r\n- Kích thước 112.2 x 112.2 x 60.4 mm - Tốc độ 1,800 ± 10 % RPM - Độ ồn 19 dBA - Lưu lượng gió 36.5 CFM ±10% - Tương thích Intel 1156 / 1155 / 1151 / 1150 / 775\r\n', 'Model	RR-X117-18FP-R1\r\nCPU Socket	Intel Socket LGA 1156 / 1155 / 1151 / 1150 / 775\r\nCPU Support	Intel Socket 1156 / 1155 / 1150 / 775 CPU\r\n- Intel Core™ i7\r\n- Intel Core™ i5\r\n- Intel Core™ i3\r\n- Intel Pentium\r\n- Intel Celeron\r\nDimension	112.2 x 112.2 x 60.4 mm\r\nWeight	370g\r\nHeat Sink Material	Aluminum\r\nFan Dimension	ø95 x 20 mm\r\nFan Speed	1800RPM ±10%\r\nFan Airflow	36.5 CFM ±10%\r\nFan Air Pressure	1.55 mm H2O ±10%\r\nBearing Type	Rifle bearing\r\nFan Life Expectancy	40,000 hours\r\nFan Noise Level (dB-A)	19 dBA\r\nConnector	3-pin\r\nRated Voltage	12 VDC\r\nRated Current	0.18A\r\nPower Consumption	2.16W', 8, 6),
(18, 'Tản khí Cooler Master Hyper 212 LED Turbo', 820000, 'coolermaster_hyper212LEDTurbo.jpg', '2024-11-08', 34, 'Tên sản phẩm: Quạt CPU CM Hyper 212 LED Turbo (Đỏ)\r\n\r\n- Kích thước 120 x 108 x 163 mm - Tốc độ 1,600 ± 10 % RPM - Độ ồn 31 dBA - Lưu lượng gió 66.3 CFM ±10% - Tương thích + Intel LGA 2066 / 2011-3 / 2011 / 1366 / 1156 / 1155 / 1151 / 1150 / 775 + AMD AM4 / AM3+ / AM3 / AM2+ / FM2+ / FM2 / FM1', 'Product Name	Hyper 212 LED Turbo\r\nModel number	RR-212TK-16PR-R1 (Black Top Cover)	RR-212TR-16PR-R1 (Red Top Cover)\r\nCPU Socket	Intel® LGA 2066 / 2011-3 / 2011 / 1366 / 1156 / 1155 / 1151 / 1150 / 775 socket\r\n\r\nAMD® AM4 / AM3+ / AM3 / AM2+ / FM2+ / FM2 / FM1 socket\r\nDimensions (L x W x H)	120 x 108 x 163 mm (4.7 x 4.3 x 6.4\")\r\nHeat Sink	Dimensions (L x W x H)	120 x 60 x 160 mm (4.7 x 2.4 x 6.3\")\r\nMaterial	Aluminum Fins (4 Heat Pipes / Direct Contact)\r\nWeight	468g\r\nHeat Pipes Dimensions	Ø6mm\r\nFan	Dimensions (L x W x H)	120 x 120 x 25 mm (4.7 x 4.7 x 1\")\r\nSpeed	600-1,600 RPM ± 10%\r\nAirflow	66.3 CFM ± 10%\r\nAir Pressure	1.7 mmH2O ± 10%\r\nMTTF	40,000 hours\r\nNoise Level	9-31 dBA\r\nConnector	4-Pin\r\nRated Voltage	12 VDC\r\nRated Current	0.19 A\r\nPower Consumption	2.28 W\r\nWarranty	2 years\r\nEAN Code	4719512054130	4719512054147\r\nUPC Code	884102030239	884102030246', 8, 6),
(19, 'Ổ cứng SSD Samsung 860 Evo 250GB M.2 2280 SATA 3 - MZ-N6E250BW', 1686000, 'samsung_860Evo250GB_m2280.png', '2024-11-08', 50, 'Tên sản phẩm: Ổ cứng SSD Samsung 860 EVO 250GB M.2 Sata (Mz-N6E250BW)\r\n\r\n- Dung lượng: 250GB\r\n- Kích thước: M.2 2280\r\n- Kết nối: M.2 SATA\r\n- Tốc độ đọc / ghi (tối đa): 550MB/s / 520MB/s', 'Tối ưu hóa tốc độ lên mức tối đa\r\nĐạt hiệu suất đọc/ghi đáng kinh ngạc, giúp bạn hoàn thành công việc hàng ngày của bạn nhanh chóng với công nghệ Intelligent TurboWrite của Samsung. Với công nghệ mới này, hiệu suất Samsung 860 EVO được tăng lên 1.9 lần so với 840 Evo. Ổ cứng SSD Samsung 860 EVO mang đẳng cấp hàng đầu về tốc độ đọc (550MB/s) và ghi (520Mb/s). Ngoài ra, tối ưu hóa hiệu suất ngẫu nhiên IOPs lên đến 98k.\r\nChế độ RAPID Mode\r\nPhần mềm Magician của Samsung được trang bị chế độ RAPID Mode. Khi được kích hoạt sẽ làm tăng hiệu năng của SSD Samsung 860 Evo rất nhiều lần bằng cách sử dụng bộ nhớ RAM PC còn trống như một bộ nhớ cache tốc độ cao. Phiên bản mới nhất của Samsung Magician hỗ trợ lên đến 4 GB bộ nhớ Cache trên một hệ thống 16GB DRAM.', 9, 1),
(20, 'Ổ cứng SSD Samsung 860 Evo 250GB 2.5 SATA 3 - MZ-76E250BW', 1386000, 'samsung_860Evo250GB_25.png', '2024-11-08', 13, 'Tên sản phẩm: Ổ cứng SSD Samsung 860 EVO 250GB 2.5\" (Mz-76E250BW)\r\n\r\n- Dung lượng: 250GB\r\n- Kích thước: 2.5\"\r\n- Kết nối: SATA 3\r\n- Tốc độ đọc / ghi (tối đa): 550MB/s / 520MB/s', ' TỔNG QUAN                \r\n\r\nNhãn hiệu: Samsung ( Tập đoàn điện tử có doanh thu luôn ở mức hàng đầu thế giới, luôn đảm bảo về chất lượng sản phẩm của mình)                \r\n\r\nSeries (Loạt sản xuất): 860 EVO                \r\n\r\nModel (Mẫu sản xuất): MZ-76E250BW                \r\n\r\n            \r\n\r\nLoại ổ cứng SSD nhờ việc sử dụng RAM để lưu dữ liệu, nên các hoạt động đọc và ghi dữ liệu của SSD không ảnh hưởng tới bất kì hoạt động của bộ phận nào trên ổ đĩa do đó làm ổ đĩa hoạt động yên tĩnh hơn so với HDD, gần như không gây ra tiếng ồn, không có độ trễ cơ học nên mang lại tốc độ truy cập cao hơn. Cùng với những yêu điểm về âm thanh vận hành ổ cứng SSD còn có khả năng không mất thời gian khởi động như ổ HDD.     \r\n\r\nMẫu thiết kế: MZ-76E250BW\r\n\r\nDung lượng lưu trữ: 250 GB', 9, 1),
(21, 'ổ đĩa DVD WR Asus 24D5MT-Tray', 387000, 'asus_24D5MTTray.png', '2024-11-08', 23, '', 'Giới thiệu Ổ đĩa DVD WR Asus 24D5MT-Tray\r\nDù cho hiện nay lưu trữ bằng DVD, CD-ROM không còn phổ biến như trước, nhưng vẫn có rất nhiều người vẫn tin dùng cách lưu trữ này thay vì lưu trữ đám mây hay USB. Ổ đĩa DVD WR Asus 24D5MT-Tray là một sản phẩm tiết kiệm điện năng cung cấp giải pháp lưu trữ dữ liệu đa phương tiện một cách linh hoạt và hiệu quả. Sản phẩm đồng thời là giải pháp sao lưu dữ liệu tối ưu với sự hỗ trợ của M-DISC.', 10, 2),
(22, 'ổ đĩa DVD WR Fujitsu External', 900000, 'asus_fujitsu.png', '2024-11-08', 41, 'Tên sản phẩm: ổ đĩa DVD WR Fujitsu External\r\n\r\n- Giao tiếp USB 2.0 - Hỗ trợ đọc / ghi DVD - Hỗ trợ đọc / ghi CD', 'Mô tả sản phẩm:\r\nkích thước: 152 x 158 x 22,5 mm Trọng lượng: 610 g Fujitsu cung cấp các ổ đĩa DVD gắn ngoài nhỏ, trong một hình thức mỏng hấp dẫn. Sản phẩm này được sử dụng cho các máy tính xách tay hoặc máy PC của bạn với ổ cứng này và sử dụng nó bất cứ lúc nào thông qua cổng giao tiếp USB2.0. Với thiết kế để làm việc độc lập đối với các hoạt động công việc trong doanh nghiệp của bạn hoặc các chuyến đi riêng một cách tiện lợi.\r\n\r\n2 dây cáp USB của thiết bị được thiết kế tích hợp trong cùng một ống cáp giúp cho việc lưu trữ dữ liệu dễ dàng và thuận tiện hơn.', 10, 2),
(23, 'Mainboard MSI MPG Z390 Gaming Plus', 4090000, 'msi_mpg_z390.jpg', '2024-11-08', 10, 'Tên sản phẩm: Bo mạch chính/ Mainboard MSI MPG Z390 Gaming Plus\r\n\r\n- Chuẩn mainboard: ATX\r\n- Socket: LGA 1151-v2 , Chipset: Z390\r\n- Hỗ trợ RAM: DDR4 , tối đa 64GB\r\n- Cổng cắm lưu trữ: 2 x M.2 SATA/NVMe; 6 x SATA 3 6Gb/s; Hỗ trợ Intel Optane\r\n- Cổng xuất hình: 1 x DVI-D; 1 x HDMI', 'Giới thiệu MPG Z390 Gaming Plus\r\nMPG Z390 Gaming Plus là mẫu mainboard sử dụng socket 1151-v2 mới nhất của MSI, hỗ trợ các dòng CPU cao cấp thế hệ 9 của Intel, cùng với nhiều tính năng cao cấp của bộ chipset Z390 và thiết kế theo tông màu đỏ đen cực kì phù hợp với game thủ.\r\nThiết kế bền bỉ\r\nMSI MPG Z390 Gaming Plus được gia công bằng các linh kiện cao cấp, đảm bảo đem lại hiệu năng và tuổi thọ hoạt động cao.', 5, 8),
(24, 'Mainboard MSI B450M-A PRO MAX', 1690000, 'msi_b450m_promax.jpg', '2024-11-08', 14, 'Tên sản phẩm: Bo mạch chính/ Mainboard MSI B450M-A PRO Max\r\n\r\n- Chuẩn mainboard: Micro-ATX\r\n- Socket: AM4 , Chipset: B450\r\n- Hỗ trợ RAM: 2 khe DDR4, tối đa 32GB\r\n- Lưu trữ: 4 x SATA 3 6Gb/s, 1 x M.2 SATA/NVMe\r\n- Cổng xuất hình: 1 x HDMI, 1 x DVI-D', 'Thiết kế thân thiện\r\nCác bo mạch chủ MSI có hàng tấn thiết kế thông mình và cực kỳ tiện lợi, chẳng hạn như khu vực ngăn chặn và nhận biết chân cắm pin cực kỳ thuận tiện, vị trí SATA & USB thân thiện, v.v., vì vậy người dùng có thể tự tay lựa chọn và build bất kỳ thiết bị chơi game nào họ muốn.\r\nTản nhiệt hiệu quả\r\nTản nhiệt cho PC của bạn là điều hết sức cần thiết để đem lại hiệu suất đáng ổn định. Mainboard MSI B450M-A PRO Max có thiết kế đem lại sức mạnh tuyệt vời với tản nhiệt chắc chắn và bền bỉ. Ngoài ra, các chân quạt với toàn quyền kiểm soát cho phép bạn làm mát hệ thống của mình theo bất kỳ cách nào bạn muốn.', 5, 8),
(25, 'Mainboard ASUS EX-H310M-V3 R2.0', 1620000, 'asus_ex_h310m_v3.jpg', '2024-11-08', 45, 'Tên sản phẩm: Bo mạch chính/ Mainboard Asus EX-H310M-V3 R2.0\r\n\r\n- Chuẩn mainboard: Micro-ATX\r\n- Socket: LGA 1151-v2 , Chipset: H310\r\n- Hỗ trợ RAM: DDR4 , tối đa 32GB\r\n- Cổng cắm lưu trữ: 3 x SATA 3 6Gb/s\r\n- Cổng xuất hình: 1 x VGA/D-sub', 'Giới thiệu bo mạch chủ ASUS EX-H310M-V3\r\nEX-H310M-V3 là mẫu bo mạch chủ socket 1151-v2 phổ thông của ASUS, với giá thành hợp lý và chất lượng gia công tốt, đây là mẫu bo mạch chủ rất phù hợp với các cửa hàng internet cafe hay thậm chí là các game thủ đang cần một chiếc bo mạch chủ chất lượng tốt.\r\nChống ẩm\r\nTrên bề mặt của ASUS EX-H310M-V3 được phủ một lớp dạ quang chống ẩm trên khắp các khu vực kết nối nhạy cảm, nhằm tăng khả năng hoạt động ổn định ở những quốc gia có độ ẩm cao như Việt Nam, đặc biệt là với môi trường của các cửa hàng internet cafe.', 5, 2),
(26, 'Mainboard GIGABYTE Z370M-D3H', 3390000, 'gigabyte_z370m_d3h.jpg', '2024-11-08', 15, 'Tên sản phẩm: Bo mạch chính/ Mainboard Gigabyte Z370M-D3H\r\n\r\n- Chuẩn mainboard: Micro-ATX\r\n- Socket: LGA 1151-v2 , Chipset: Z370\r\n- Hỗ trợ RAM: DDR4 , tối đa 64GB\r\n- Cổng cắm lưu trữ: 1 x M.2 NVMe; 1 x M.2 SATA/NVMe; 6 x SATA 3 6Gb/s; Hỗ trợ Intel Optane\r\n- Cổng xuất hình: 1 x DVI-D; 1 x HDMI', 'Smart Fan 5\r\nVới Smart Fan 5 người dùng có thể đảm bảo rằng hệ thống chơi game của họ có thể duy trì hiệu suất cao nhất với nhiệt độ ở mức mát mẻ. Tính năng Smart Fan 5 cho phép người dùng trao đổi các vị trí cắm quạt tản nhiệt của họ để phản ánh các cảm biến nhiệt khác nhau tại các vị trí khác nhau trên bo mạch chủ. Không chỉ vậy, với Smart Fan còn có thêm 5 đầu cắm hỗ trợ cả quạt chế độ PWM tự động và chế độ Điện áp để làm cho bo mạch chủ mát mẻ hơn.', 5, 9),
(27, 'Mainboard GIGABYTE Z370 AORUS Gaming 3', 4290000, 'gigabyte_z370_aorus.jpg', '2024-11-08', 15, 'Tên sản phẩm: Bo mạch chính/ Mainboard Gigabyte Z370 Aorus Gaming 3\r\n\r\n- Chuẩn mainboard: ATX\r\n- Socket: LGA 1151-v2 , Chipset: Z370\r\n- Hỗ trợ RAM: DDR4 , tối đa 64GB\r\n- Cổng cắm lưu trữ: 1 x M.2 NVMe; 1 x M.2 SATA/NVMe; 6 x SATA 3 6Gb/s; Hỗ trợ Intel Optane\r\n- Cổng xuất hình: 1 x HDMI', 'Giới thiệu chi tiết tính năng Bo mạch chủ Gigabyte Z370 Aorus Gaming 3\r\nDòng series Aorus của Gigabyte đã không còn quá xa lạ với người dùng với thiết kế mạnh mẽ, cuốn hút cùng hiệu năng ấn tượng. Tới với sản phẩm lần này, Mainboard Gigabyte Z370 Aorus Gaming 3 hứa hẹn tiếp tục mang tới những trải nghiệm tuyệt vời cho người sử dụng.', 5, 9),
(28, 'RAM GIGABYTE 8GB DDR4-2666 (GP-GR26C16S8K1HU408 G_DDR2666)', 1065000, 'gigabyte_8gb_ddr4_2666.jpg', '2024-11-08', 25, 'Tên sản phẩm: Bộ nhớ/ Ram Gigabyte 8GB DDR4-2666 (GP-GR26C16S8K1HU408 G_DDR2666)\r\n\r\n- Dung lượng: 1 x 8GB\r\n- Thế hệ: DDR4\r\n- Bus: 2666MHz\r\n- Cas: 16', 'Chất lượng đáng tin cậy\r\nRAM GIGABYTE 8GB DDR4-2666 với các IC được lựa chọn khắt khe và kỹ thuật chế tạo thủ công để có độ tin cậy, khả năng tương thích và hiệu suất tốt nhất.\r\nBộ nhớ hiệu suất cao\r\nBộ nhớ RAM GIGABYTE 8GB DDR4-2666 được xây dựng trên 10 lớp PCB được thiết kế tinh vi, đảm bảo sự ổn định và hiệu suất cao của các Ics đã chọn. Tản nhiệt của bộ nhớ GIGABYTE được thiết kế để mang lại hiệu năng tốt nhất. Các vật liệu chất lượng cao cung cấp tản nhiệt tốt hơn, đảm bảo sự ổn định của bộ nhớ.', 1, 9),
(29, 'RAM desktop GIGABYTE AORUS (2x8GB) DDR4 3200MHz', 3990000, 'gigabyte_aorus_2x8gb_ddr4_3200.jpg', '2024-11-08', 40, 'Tên sản phẩm: Bộ nhớ/ Ram Gigabyte AORUS RGB 16GB (2x8) DDR4 3200 (GP-AR32C16S8K2HU416R)\r\n\r\n- Dung lượng: 2 x 8GB\r\n- Thế hệ: DDR4\r\n- Bus: 3200MHz\r\n- Cas: 16', 'GIỚI THIỆU SẢN PHẨM\r\nRAM là một trong những linh kiện quan trọng nhất nếu người dùng đang có nhu cầu nâng cấp chiếc máy tính của mình. Bộ nhớ/ Ram Gigabyte AORUS RGB 16GB (2×8) DDR4 3200 (GP-AR32C16S8K2HU416R)đến từ nhà sản xuất Gigabyte là sự lựa chọn hoàn hảo với hiệu năng mạnh mẽ để nâng cấp tốc độ máy tính.', 1, 9),
(30, 'RAM Kingston Hyper X Predator 2x8GB DDR4 3200MHz', 2890000, 'kingston_hyper_2x8gb_ddr4_3200.jpg', '2024-11-08', 25, 'Tên sản phẩm: Bộ nhớ/ RAM Kingston HyperX Predator RGB 16GB (2x8GB) DDR4 3200 (HX432C16PB3AK2/16)\r\n\r\n- Dung lượng: 2 x 8GB\r\n- Thế hệ: DDR4\r\n- Bus: 3200MHz\r\n- Cas: 17', 'Đánh giá / giới thiệu RAM Kingston Hyper X Predator 2x8GB DDR4 3200MHz\r\nRAM Kingston Hyper X Predator 2x8GB DDR4 3200MHz là bộ gồm hai RAM 1G x 64-bit (8GB) DDR4-3200 CL16 SDRAM (DRAM đồng bộ) 1Rx8 dựa trên tám thành phần FBGA 1G x 8 bit mỗi RAM. Mỗi bộ mô-đun hỗ trợ cấu hình bộ nhớ Intel Extreme (XMP) 2.0. Tổng dung lượng của 2 thanh là 16GB. Mỗi mô-đun đã được thử nghiệm để chạy ở DDR4-3200 tại độ trễ thấp 16-18-18 ở 1.35V. Các SPD được lập trình theo độ trễ chuẩn DDR4-2400 của JEDEC là 17-17-17 ở 1.2V.', 1, 4),
(31, 'RAM desktop Kingston HyperX Fury HX316C10FR/8 (1x8GB) DDR3 1600MHz', 1190000, 'kingston_hyperx_ddr3_1600.jpg', '2024-11-08', 31, 'Tên sản phẩm: Bộ nhớ DDR3 Kingston 8GB (1600) Hyper X Fury (HX316C10FR/8) (Đỏ)\r\n\r\n- Dung lượng: 1 x 8GB\r\n- Thế hệ: DDR3\r\n- Bus: 1600MHz\r\n- Cas: 10', 'HyperX FURY sẽ thay thế cho dòng sản phẩm HyperX blu trước đây. Bộ nhớ hiệu suất cao thế hệ mới này sở hữu tính năng ép xung tự động, thiết kế kẹp tản nhiệt bất đối xứng mạnh mẽ cùng mức giá cực kỳ hợp lý cho người đam mê công nghệ máy tính. Giá thành tốt nhưng tính năng không hề thua kém các đàn anh cao cấp hơn như Savage , Beast , Predator\r\n\r\nBộ nhớ HyperX FURY hoàn toàn là định dạng Plug & Play (PnP) vì vậy có thể tự động ép xung lên đến tốc độ hệ thống cho phép mà không cần phải điều chỉnh BIOS thủ công. Thiết kế kẹp tản nhiệt mới gồm 4 màu (xanh dương, đen, đỏ và trắng) phối cùng bo mạch đen (PCB) giúp game thủ, chuyên gia thiết kế case hay xây dựng hệ thống có thể chọn được màu sắc phù hợp cho hệ thống của mình. HyperX FURY hiện có các mức tốc độ 1333MHz, 1600MHz và 1866MHz. Hiện có các mức dung lượng 4GB, 8GB và 8GB, 16GB ở dạng kit.', 1, 4),
(32, 'Card màn hình GIGABYTE GeForce RTX 2070 Super 8GB GDDR6 GAMING OC', 16190000, 'gigabyte_rtx_2070_8gb_gddr6.jpg', '2024-11-08', 12, 'Tên sản phẩm: Card màn hình Gigabyte RTX 2070 Super Gaming OC 8GB GDDR6 (N207SGAMINGOC-8GC)\r\n\r\n- Chip đồ họa: NVIDIA GeForce RTX 2070 Super\r\n- Bộ nhớ: 8GB GDDR6 ( 256-bit )\r\n- GPU clock 1815 MHz\r\n- Nguồn phụ: 1 x 6-pin + 1 x 8-pin', 'Giới thiệu card màn hình GIGABYTE RTX 2070 Super GAMING OC\r\nRTX Super là đòn đáp trả của NVIDIA trước thế hệ GPU mới của AMD dựa trên kiến trúc Navi. RTX 2070 Super là 1 trong 2 đại diện đầu tiên của dòng GPU mới này, với hiệu năng chơi game cao hơn ~12% so với RTX 2070. Kết hợp với thiết kế 3 quạt độc quyền của GIGABYTE, RTX 2070 Super GAMING OC là một chiếc card màn hình cao cấp mới, hứa hẹn thay thế vị trí của huyền thoại GTX 1080Ti.', 2, 9),
(33, 'Card màn hình GIGABYTE GeForce RTX 2080Ti 11GB GDDR6 AORUS Xtreme WaterForce', 40490000, 'gigabyte_rtx_2080_11gb_gddr6.jpg', '2024-11-08', 5, 'Tên sản phẩm: Card màn hình/ VGA Gigabyte Aorus RTX 2080 Ti Xtreme Waterforce WB 11G (GV-N208TAORUSX WB-11GC)\r\n\r\n- Chip đồ họa: NVIDIA GeForce RTX 2080Ti\r\n- Bộ nhớ: 11GB GDDR6 ( 352-bit )\r\n- GPU clock 1770 MHz\r\n- Nguồn phụ: 2 x 8-pin', 'Giới thiệu card đồ họa GIGABYTE GeForce RTX 2080Ti 11GB GDDR6 AORUS Xtreme WaterForce\r\nGeForce RTX 2080Ti 11GB GDDR6 AORUS Xtreme WaterForce là mẫu card đồ họa cao cấp mới nhất của Gigabyte, sử dụng bộ xử lý đồ họa đơn nhân mạnh nhất hiện nay là RTX 2080Ti đem lại hiệu năng chơi game tuyệt vời trên, đặc biệt trên độ phân giải lớn như 4K đồng thời hỗ trợ hàng loạt những công nghệ mới nhất của NVIDIA như DLSS, A.I, VRS, Ray tracing, cùng với việc được thiết kế để sử dụng trong các hệ thống tản nhiệt nước đem lại khả năng hoạt động cực kì ổn định với mức nhiệt độ thấp.\r\n\r\nThiết kế\r\nMặt trước của Gigabyte GeForce RTX 2080Ti 11GB GDDR6 AORUS Xtreme WaterForce sử dụng một khoang chứa nước lớn tiếp xúc với bộ xử lý đồ họa và toàn bộ linh kiện trên bo mạch thông qua lớp đế bằng đồng nguyên chất nhằm tăng cường khả năng dẫn nhiệt.', 2, 9),
(34, 'Card màn hình GIGABYTE GeForce RTX 2070 8GB GDDR6 AORUS Xtreme ', 18690000, 'gigabyte_rtx_2070_8gb_gddr6_aorus.jpg', '2024-11-08', 15, 'Tên sản phẩm: Card màn hình Gigabyte Aorus RTX 2070 XTREME 8GB GDDR6 (N2070AORUS X-8GC)\r\n\r\n- Chip đồ họa: NVIDIA GeForce RTX 2070\r\n- Bộ nhớ: 8GB GDDR6 ( 256-bit )\r\n- GPU clock GPU clock: 1815 MHz\r\n- Nguồn phụ: 1 x 6-pin + 1 x 8-pin', 'Giới thiệu Card đồ họa GIGABYTE GeForce RTX 2070 8GB GDDR6 AORUS Xtreme\r\nGeForce RTX 2070 8GB GDDR6 AORUS Xtreme là mẫu card là mẫu card đồ họa cận cao cấp mới nhất của GIGABYTE, sử dụng bộ xử lý đồ họa GeForce RTX 2070 mạnh mẽ với hiệu năng nhỉnh hơn so với GTX 1080 cùng với nhiều công nghệ mới như DLSS, Ray tracing, VRS đem lại trải nghiệm chơi game mượt mà và chân thực nhất.', 2, 9),
(35, 'Card màn hình GIGABYTE Radeon RX Vega 56 8GB HBM2 Gaming OC', 12950000, 'gigabyte_radeon_rx56_8gb_hbm2.jpg', '2024-11-08', 14, 'Tên sản phẩm: Card màn hình Gigabyte 8GB RX VEGA 56 GAMING OC\r\n\r\n- Chip đồ họa: AMD Radeon RX Vega 56\r\n- Bộ nhớ: 8GB HBM2 ( 2048-bit )\r\n- GPU clock Boost: 1501 MHz / Base: 1170 MHz (Reference Card Boost: 1471 MHz / Base: 1156 MHz)\r\n- Nguồn phụ: 2 x 8-pin', 'Giới thiệu card màn hình Gigabyte 8GB RX VEGA 56 GAMING OC\r\nGigabyte Technology là một nhà sản xuất và phân phối các thiết bị phần cứng máy tính lớn có trụ sở tại Đài Loan. Thương hiệu Gigabyte đã đồng hành cùng game thủ với rất nhiều những sản phẩm và mẫu mã đa dạng. Gigabyte 8GB RX VEGA 56 GAMING OC được trang bị GPU AMD Radeon™ RX VEGA 56, bộ nhớ băng thông cao 8GB 2048-bit cùng với hệ thống làm mát WINDFORCE 2X.', 2, 8),
(36, 'Card màn hình MSI GeForce RTX 2080Ti 11GB GDDR6 LIGHTNING', 39990000, 'msi_rtx_2080_11gb_gddr6.jpg', '2024-11-08', 20, 'Tên sản phẩm: Card màn hình MSI GeForce RTX 2080 Ti Lightning Z 11GB GDDR6\r\n\r\n- Chip đồ họa: NVIDIA GeForce RTX 2080Ti\r\n- Bộ nhớ: 11GB GDDR6 ( 352-bit )\r\n- GPU clock 1770 MHz\r\n- Nguồn phụ: 3 x 8-pin', 'Giới thiệu card màn hình MSI GeForce RTX 2080Ti 11GB GDDR6 LIGHTNING\r\nLIGHTNING vốn được xem là dòng sản phẩm cao cấp nhất của MSI, với đầy đủ các tính năng mà bất kì game thủ hay người yêu công nghệ nào đều mơ tới cộng thêm thiết kế cứng cáp và hầm hố của mình, luôn làm biết bao người sử dụng thèm muốn. Tiếp nối thành công của dòng sản phẩm này, MSI vừa cho ra mắt phiên bản LIGHTNING của GeForce RTX 2080Ti, chiếc card màn hình mạnh mẽ nhất hiện nay trên thị trường với nhiều cải thiện đáng kể về cả thiết kế lẫn hiệu năng so với các phiên bản trước đây.', 2, 8),
(37, 'Card màn hình MSI GeForce RTX 2080 Super 8GB GDDR6 Gaming X TRIO', 23490000, 'msi_rtx_2080_super_8gb_gddr6.jpg', '2024-11-08', 14, 'Tên sản phẩm: Card màn hình/ VGA MSI RTX 2080 Super Gaming X Trio 8GB\r\n\r\n- Chip đồ họa: GeForce RTX 2080 Super\r\n- Bộ nhớ: 8GB GDDR6 (256-bit)\r\n- Boost: 1845 MHz\r\n- Nguồn phụ: 2 x 8-pin', 'Giới thiệu card màn hình MSI RTX 2080 Super GAMING X TRIO\r\nThiết kế\r\nRTX 2080 Super GAMING X TRIO được thiết kế với các đường nét cứng cáp, góc cạnh đi kèm với tông màu đen xám đem lại cái nhìn tổng thể hầm hố và chắc chắn.\r\nTản nhiệt\r\nBên dưới hệ thống quạt làm mát của RTX 2080 Super GAMING X TRIO là một lớp tản nhiệt có kích thước rất lớn, với hàng loạt các lá nhôm xen kẽ với nhau giúp tận dụng tối đa diện tích tiếp xúc với không khí.', 2, 8),
(38, 'Card màn hình MSI Radeon RX 5700 XT GAMING X 8GB GDDR6', 13700000, 'msi_radeon_rx5700_8gb_gddr6.jpg', '2024-11-08', 25, 'Tên sản phẩm: Card màn hình MSI Radeon RX 5700 XT Gaming X 8G GDDR6\r\n\r\n- Chip đồ họa: Radeon RX 5700 XT\r\n- Bộ nhớ: 8GB GDDR6 (256-bit)\r\n- Boost: Up to 1980 MHz / Game: 1870 MHz / Base: 1730 MHz\r\n- Nguồn phụ: 2 x 8-pin', 'Thiết kế cao cấp\r\nSự trở lại rất được mong đợi đến từ card đồ họa MSI Radeon RX 5700 XT Gaming X 8G GDDR6 với thiết kế quạt tản nhiệt kép mang tính biểu tượng của MSI. Kết hợp hoàn hão giữa màu đen và màu xám gunmetal với tấm ốp kim loại được thiết kế phay xước, sự hoàn hảo này mang đến cho bạn thiết kế cao cấp với hiệu ứng ánh sáng RGB tuyệt đẹp và mượt mà ở lớp vỏ, đảm bảo đem lại sự ấn tượng mạnh mẽ cho bạn và mọi người xung quanh.', 2, 8),
(39, 'Card màn hình MSI GeForce GTX 1050Ti 4GB GDDR5 Gaming X', 3390000, 'msi_gtx_1050_4gb_gddr5.jpg', '2024-11-08', 49, 'Tên sản phẩm: Card màn hình Msi 4GB GTX1050Ti Gaming X 4G\r\n\r\n- Chip đồ họa: NVIDIA GeForce GTX 1050Ti\r\n- Bộ nhớ: 4GB GDDR5 ( 128-bit )\r\n- GPU clock 1493 MHz / 1379 MHz (OC Mode) 1468 MHz / 1354 MHz (Gaming Mode) 1392 MHz / 1290 MHz (Silent Mode)\r\n- Nguồn phụ: 1 x 6-pin', 'Quạt tản nhiệt kép TORX 2.0 - kết hợp cho sức mạnh tuyệt vời.\r\nCông nghệ Twin Frozr VI độc quyền đã đạt được cấp độ mới tuyệt vời khi có thể tạo áp suất không khí cao hơn 22% cho hiệu suất cao mà vẫn yên tĩnh.\r\nZero Frozr\r\nĐược giới thiệu lần đầu tiên vào năm 2008 bởi MSI, công nghệ Zero Frozr đã tạo ra tiêu chuẩn cho các card đồ hoạ. Công nghệ giúp loại bỏ tiếng ồn bằng cách dừng quạt trong khi nhiệt độ thấp (< 60°C), điều đó có nghĩa là bạn sẽ chơi game trong môi trường hoàn toàn yên tĩnh.', 2, 8),
(40, 'Card màn hình ASUS Radeon RX Vega 64 8GB HBM2 ROG Strix OC', 23220000, 'asus_radeon_rx64_8gb_hbm2_rog.jpg', '2024-11-08', 25, 'Tên sản phẩm: Card màn hình ASUS 8GB ROG Strix RX VEGA 64 O8G Gaming\r\n\r\n- Chip đồ họa: AMD Radeon RX Vega 64\r\n- Bộ nhớ: 8GB HBM2 ( 2048-bit )\r\n- GPU clock 1590 Mhz\r\n- Nguồn phụ: 2 x 8-pin', 'GIỚI THIỆU SẢN PHẨM\r\nCard màn hình ASUS 8GB ROG Strix RX VEGA 64 O8G Gaming là thiết bị có nhiệm vụ xử lý  thông tin về hình ảnh trong máy tính, thông qua kết nối với màn hình CRT hay LCD… giúp hiển thị hình ảnh cho người sử dụng có thể giao tiếp được một cách rõ ràng và sắc nét hơn nhất là đối với các cá nhân, tổ chức làm việc liên quan đến đồ họa hoặc chơi game.\r\nTẢN NHIỆT HIỆU QUẢ\r\nSản phẩm được thiết kế với độ rộng khe cắm 2.5 tăng thêm 40% diện tích tản nhiệt, mát hơn lên đến 30% so với thiết kế khe cắm 2.0 trước đó, tạo khả năng làm mát và hiệu quả tản nhiệt mát hơn tới 30%.', 2, 2),
(41, 'Card màn hình ASUS GeForce GTX 1050Ti 4GB GDDR5 Cerberus OC', 3390000, 'asus_gtx_1050_4gb_gddr5_cerberus.png', '2024-11-08', 60, 'Tên sản phẩm: Card màn hình Asus 4GB CERBERUS-GTX1050TI-O4G\r\n\r\n- Chip đồ họa: NVIDIA GeForce GTX 1050Ti\r\n- Bộ nhớ: 4GB GDDR5 ( 128-bit )\r\n- GPU clock Chế độ OC - Xung Tăng cường GPU : 1480 MHz , Xung Nền GPU : 1366 MHz Chế độ Chơi Game - Xung Tăng cường GPU : 1455 MHz , Xung Nền GPU : 1341 MHz\r\n- Nguồn phụ: Không nguồn phụ', 'Được thiết kế để có những trải nghiệm gaming không ngừng nghỉ\r\nASUS Cerberus GeForce® GTX 1050 Ti là card đồ họa hiệu suất cao được thiết kế với độ tin cậy và hiệu suất gaming cao cho trải nghiệm không ngừng nghỉ. Chúng tôi kiểm tra card đến mức tối đa với các trò chơi mới nhất và tiến hành các thử nghiệm độ tin cậy rộng rãi và đo điểm hệ thống tải nặng cho thời gian gấp 15 lần so với tiêu chuẩn của ngành.', 2, 2),
(42, 'Nguồn máy tính AcBel 750 - 750W - 80 Plus White', 1559000, 'acbel_750_750w_white.jpg', '2024-11-08', 60, 'Tên sản phẩm: Nguồn/ Power Acbel 80Plus White 750\r\n\r\n- Công suất: 750W\r\n- Chuẩn hiệu suất: 80 Plus White\r\n- Quạt: 1 x 120 mm', 'Hiệu suất 80% - 230V ac - đạt chứng nhận tiêu chuẩn 80 Plus* White\r\nSố lượng chân cắm 24 pin - 500 mm cáp nguồn dành cho Mainboard (gồm có 8 pin cho CPU, 8 pin cho 2 VGA, 8 pin cho SATA và ATA). Sử dụng công nghệ bảo vệ cho người dùng và máy tính của bạn với chế độ chống quá tải, quá áp, ngắn mạch và 1 vài chức năng bảo vệ an toàn khác. Hỗ trợ theo từng dòng card màn hình, NVIDIA SLI, AMD Crossfire,... Hỗ trợ chip Intel các dòng Core i5 và Core i7, chip AMD Phenom CPU Athlon. Đường dây độc lập 12V giúp các thiết bị yêu cầu chịu tải cao hoạt động ổn định hơn. Hỗ trợ Intelligent fan – quạt thông minh giúp giảm tiếng ồn về mức gần như bằng 0, cũng như tăng hiệu suất làm việc giúp hạn chế việc bị giảm tốc độ xử lý của máy thường gặp do nhiệt độ cao.', 3, 5),
(43, 'Nguồn máy tính Acbel iPower G550', 1060000, 'acbel_ipower_g550.jpg', '2024-11-08', 75, 'Tên sản phẩm: Nguồn/ Power Acbel iPower G550\r\n\r\n- Công suất: 550W\r\n- Chuẩn hiệu suất: 80 Plus White\r\n- Quạt: 1 x 120 mm', 'Hiện chưa có', 3, 5),
(44, 'Nguồn máy tính Cooler Master Elite - 460W', 750000, 'coolermaster_elete_460w.jpg', '2024-11-08', 78, 'Tên sản phẩm: Nguồn/ Power Cooler Master 460W Elite\r\n\r\n- Công suất: 460W\r\n- Quạt: 1 x 120 mm', '- Tuân thủ các tiêu chuẩn Intel ATX 12V V2.3 mới nhất- Hơn 70 % hiệu quả tại điển hình hoạt động tải / li >Cao- Các thành phần hiệu suất thiết kế cho độ tin cậy tốt hơn- Thiết kế năng lượng xanh để đáp ứng yêu cầu của Energy Star và Blue Angel- Nhiều bảo vệ thiết kế ( OVP / OCP / OPP / SCP )- Hỗ trợ dual + 12V1 và + 12V2 đầu ra cho việc sử dụng năng lượng cao hơn- Cáp 4 + 4 pin + nối CPU 12V cho CPU cao cấp- EMI và tiếng ồn lọc được xây dựng trong thiết kế', 3, 6),
(45, 'Nguồn máy tính Cooler Master MWE Bronze 650 V2 - 650W - 80 Plus Bronze', 1560000, 'coolermaster_mwe_650v2_650w.jpg', '2024-11-08', 65, 'Tên sản phẩm: Nguồn/ Power CM MWE Bronze 650W V2\r\n\r\n- Công suất: 650W\r\n- Chuẩn hiệu suất: 80 Plus Bronze\r\n- Quạt: 1 x 120 mm', 'Giới thiệu nguồn máy tính Cooler Master MWE Bronze V2\r\nMWE Bronze V2 là dòng nguồn tầm trung MWE thế hệ thứ 2 của Cooler Master với nhiều cải thiện về thiết kế, hiệu suất cùng với nhiều lựa chọn công suất hoạt động hơn lên tới 750W. Đảm bảo đáp ứng mọi nhu cầu sử dụng với mức giá hợp lý.', 3, 6),
(46, 'Nguồn máy tính Cooler Master Masterwatt Lite - 500W - 80 Plus White', 1170000, 'coolermaster_masterwatt_500w.jpg', '2024-11-08', 75, '', 'Đánh giá chi tiết Nguồn CM Masterwatt Lite 500W\r\nNguồn CM Masterwatt Lite 500W là sản phẩm phổ thông của Cooler Master có một sự ổn định, chất lượng cao, nguồn cung cấp năng lượng 80 Plus Certified.\r\n\r\nChi tiết sản phẩm:\r\nNguồn CM Masterwatt Lite 500W cung cấp dòng điện ổn định, liên tục cho các bộ phận, linh kiện của máy tính để các bộ phận này có thể hoạt động ổn định.\r\nNguồn CM Masterwatt Lite 500W được làm chất liệu vỏ nhôm chắc chắn, bảo vệ tốt cho các bộ phận bên trong. Bên ngoài phủ 1 lớp sơn cách điện tạo cảm giác an toàn cho người dùng.', 3, 6),
(47, 'ASUS ROG Strix Helios RGB Mid Tower (Đen)', 6990000, 'asus_rog_strixhelios_rgb.jpg', '2024-11-08', 45, 'Tên sản phẩm: Thùng máy/ Case ASUS ROG Strix Helios GX601\r\n\r\n- Hỗ trợ mainboard: Mini-ITX, Micro-ATX, ATX, Extended-ATX\r\n- Khay mở rộng tối đa: 2 x 3.5\"4 x 2.5\"\r\n- USB: 1 x USB Type C,4 x USB 3.1\r\n- Quạt tặng kèm: 4 x 140 mm', 'Giới thiệu Thùng máy/ Case ASUS ROG Strix Helios GX601\r\nCase Asus ROG Strix Helios GX601 sở hữu một thiết kế cá tính và mang tính thẩm mỹ cao cấp với ba tấm kính cường lực, khung nhôm mạ và có tích hợp đèn Aura Sync mặt trước. Dễ dàng di chuyển bằng các tay cầm bọc vải được thiết kế công thái học và kiểu cách.\r\n\r\nThiết kế thẩm mỹ cao cấp\r\nĐược thiết kế dành cho những giàn máy trưng bày, sở hữu 3 tấm kính cường lực màu xám khói, dày tới 4mm được lắp vào một khung nhôm mạ tinh tế. Màn hình sống động được trang bị LED RGB tích hợp vào phía mặt trước để tạo lên nét nổi bật.', 6, 2),
(48, 'Case máy tính Asus TUF Gaming GT501', 4350000, 'asus_tuf_gt501.jpg', '2024-11-08', 54, 'Tên sản phẩm: Thùng máy/ Case Asus TUF Gaming GT501\r\n\r\n- Loại case: Mid Tower\r\n- Hỗ trợ mainboard: ATX; Extended-ATX; Micro-ATX; Mini-ITX\r\n- Khay mở rộng tối đa: 4 x 3.5\" , 3 x 2.5\"\r\n- Cổng USB: 2 x USB 3.1 Gen 1\r\n- Số quạt tặng kèm: 1 x 140 mm; 3 x 120mm LED', 'Vỏ ASUS TUF Gaming GT501 hỗ trợ tới EATX với tấm trước bằng kim loại, tấm bên bằng kính cường lực, quạt RGB 120mm, quạt PWM 140mm, khoảng trống lắp quạt tản nhiệt dự phòng và USB 3.1 Gen 1\r\n\r\nĐược thiết kế nổi bật: Tấm kim loại mặt trước với các họa tiết sần TUF Gaming, tấm cạnh bên bằng kính cường lực màu khói dày 4mm để phô ra những linh kiện bên trong cỗ máy.\r\nLô cốt di động: Các tay cầm bằng sợi dệt được thiết kế công thái học hỗ trợ vận chuyển dễ dàng và an toàn tới 30kg.', 6, 2),
(49, 'MSI MPG SEKIRA 500X RGB Mid Tower (Đen)', 6400000, 'msi_mpg_sekira_500x_rgb.jpg', '2024-11-08', 54, 'Tên sản phẩm: Thùng máy/ Case MSI MPG SEKIRA 500X\r\n\r\n- Hỗ trợ mainboard: Mini-ITX, Micro-ATX, ATX, Extended-ATX\r\n- Khay mở rộng tối đa: 4 x 3.5\"3 x 2.5\"\r\n- USB: 1 x USB Type C,4 x USB 3.2\r\n- Quạt tặng kèm: 1 x 200 mm, 1 x 120 mm RGB, 3 x 200 mm RGB', 'Giới thiệu case máy tính MSI MPG SEKIRA 500X\r\nMPG SEKIRA 500X được thiết đặc biệt cho các cấu hình chơi game cao cấp. Sở hữu thiết kế cứng cáp, tông màu đen và vàng sang trọng, toát lên vẻ đẹp đẳng cấp.\r\n\r\nNhờ vào việc sử dụng tông màu trung tính và đơn giản, việc phối màu trở nên cực kì đơn giản khi sử dụng MPG SEKIRA 500X.', 6, 8),
(50, 'Case máy tính Sama Shadow', 880000, 'sama_shadow.jpg', '2024-11-08', 90, 'Tên sản phẩm: Thùng máy/ Case Sama Dark Shadow\r\n\r\n- Loại case: Mid Tower\r\n- Hỗ trợ mainboard: ATX; Micro-ATX\r\n- Khay mở rộng tối đa: 4 x 3.5\" , 2 x 2.5\"\r\n- Cổng USB: 1 x USB 3.0 , 2 x USB 2.0\r\n- Số quạt tặng kèm: 4 x 120 mm LED', 'Không có chi tiết', 6, 10);

-- --------------------------------------------------------

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
CREATE TABLE IF NOT EXISTS `provider` (
  `provider_id` int NOT NULL AUTO_INCREMENT,
  `provider_name` varchar(50) NOT NULL,
  `provider_email` varchar(50) NOT NULL,
  `provider_phone` varchar(15) NOT NULL,
  PRIMARY KEY (`provider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `provider`
--

INSERT INTO `provider` (`provider_id`, `provider_name`, `provider_email`, `provider_phone`) VALUES
(1, 'SamSung', 'samsung@lookout.com', '0938922310'),
(2, 'Asus', 'asus@gmail.com', '0938922311'),
(3, 'Intel', 'intel@vlookup.com', '0909561847'),
(4, 'Kingston', 'kingston@vlookup.com', '0938922313'),
(5, 'AcBel', 'acbel@vlookup.com', '0938922314'),
(6, 'Cooler Master', 'coolermaster@vlookup.com', '0938922315'),
(7, 'Logitec', 'hongphat702@gmail.com', '0938922316'),
(8, 'MSI', 'msi@gmail.com', '0938944487'),
(9, 'Gigabyte', 'gigabyte@yahoo.com', '0938922123'),
(10, 'Sama', 'sama@stu.edu.vn', '0933154876'),
(14, 'Corsair', 'corsair@asd124.com', '654987321');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` varchar(30) NOT NULL,
  `user_name` varchar(30) DEFAULT NULL,
  `user_pwd` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `user_address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_pwd`, `user_email`, `user_phone`, `user_address`) VALUES
('', 'khang', 'khang', 'khang@mail.com', '0123456789', 'HCM'),
('test1', NULL, '584a44e3e17bb3552819a9ce9cddbdd0', 'test12@gmail.com', '0124635789', NULL),
('test2', NULL, '333ccf17e537e1ff39477903b821683d', 'test2@gmail.com', '0123456787', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_COMMENT_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_COMMENT_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_ORDER_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `FK_ORDERDETAIL_ORDER` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ORDERDETAIL_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_PRODUCT_CAT` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PRODUCT_PROVIDER` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
