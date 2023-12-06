-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2023 at 12:21 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecomercedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`) VALUES
(1, 'Wail Bouhadda', 'wailbouhadda31@gmail.com', '150dbdd4415adaf695cea1abdff72bc7bf6d424c40c79b854ad89eaba4a802fd');

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categorie`
--

INSERT INTO `categorie` (`id`, `name`) VALUES
(1, 'Samsung'),
(2, 'Apple'),
(11, 'Infinix'),
(12, 'Xiaomi'),
(19, 'Nokia'),
(20, 'Realme'),
(23, '.net'),
(25, 'test'),
(26, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `password` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `firstName`, `lastName`, `email`, `phone`, `password`) VALUES
(3, 'wail', 'bouhadda', 'wailbouhadda31@gmail.com', '0638515229', '150dbdd4415adaf695cea1abdff72bc7bf6d424c40c79b854ad89eaba4a802fd'),
(4, 'walo', 'walo', 'wailbouhadda1@gmail.com', '0638515229', '150dbdd4415adaf695cea1abdff72bc7bf6d424c40c79b854ad89eaba4a802fd');

-- --------------------------------------------------------

--
-- Table structure for table `command`
--

CREATE TABLE `command` (
  `id` int(11) NOT NULL,
  `country` varchar(25) NOT NULL,
  `adress` varchar(100) NOT NULL,
  `zipcode` varchar(25) NOT NULL,
  `products` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `total` double NOT NULL,
  `note` text NOT NULL,
  `client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `command`
--

INSERT INTO `command` (`id`, `country`, `adress`, `zipcode`, `products`, `date`, `total`, `note`, `client`) VALUES
(2, 'Morocco', 'adress test example', '20630', '5,1:10,3', '2022-12-18 23:31:54', 1062, 'null', 3),
(3, 'Morocco', 'adress test example', '20630', '8,2', '2022-12-18 23:37:20', 898, 'null', 3),
(4, 'Morocco', 'adress test example', '20630', '5,3', '2022-12-19 22:22:41', 1755, 'null', 3),
(5, 'Morocco', 'adress test example', '20630', '8,2:36,1', '2022-12-21 21:03:03', 1010, 'null', 3),
(6, 'Morocco', 'adress test example', '20630', '8,3:34,1', '2022-12-21 21:19:32', 1493, 'null', 3);

-- --------------------------------------------------------

--
-- Table structure for table `phone`
--

CREATE TABLE `phone` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `details` text NOT NULL,
  `image` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `categorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `phone`
--

INSERT INTO `phone` (`id`, `name`, `details`, `image`, `quantity`, `price`, `date`, `categorie`) VALUES
(1, 'Galaxy Z Fold 4', 'Processor: Snapdragon 8+ Gen 1\r\nOperating System: Android\r\nRam: 12 GB\r\nMaximum Expandable Memory: 0 GB\r\nWireless Network Technology Generations: 4G LTE, 5G', 'galaxyzflod4.jpg', 100, 15000, '2022-12-10 23:41:31', 1),
(5, 'Galaxy S21 FE', 'G Cell Phone, Factory Unlocked Android Smartphone, 128GB, 120Hz Display Screen, Pro Grade Camera, All Day Intelligent Battery, US Version', 'GalaxyS21FE.jpg', 250, 585, '2022-12-16 20:24:40', 1),
(8, 'Galaxy S21 Ultra G998U', '5G | Fully Unlocked Android Smartphone | US Version 5G Smartphone | Pro-Grade Camera, 8K Video, 108MP High Resolution | 128GB', 'GalaxyS21UltraG998U.jpg', 300, 449.99, '2022-12-17 09:36:11', 1),
(9, 'Galaxy S20 FE', '5G Cell Phone, Factory Unlocked Android Smartphone, 128GB, Pro Grade Camera, 30X Space Zoom, Night Mode, US Version, Cloud White', 'GalaxyS20FE.jpg', 500, 599.99, '2022-12-17 09:40:37', 1),
(10, 'Redmi 9A 4G', 'Unlocked Cellphone, Octa-core 4GB + 128GB Smartphone, 6.53 HD Display, 13M Rear Camera,5000mAh 10W Charging', 'Redmi9A4G.jpg', 250, 159, '2022-12-17 09:59:46', 12),
(20, 'iPhone 11', 'Apple iPhone 11, 256GB, White - Unlocked (Renewed Premium)', 'iPhone11.jpg', 150, 457.88, '2022-12-21 16:41:47', 2),
(22, 'iPhone 11 Pro', 'Apple iPhone 11 Pro, 64GB, Midnight Green - Unlocked (Renewed)', 'iPhone11Pro.jpg', 250, 328.23, '2022-12-21 16:48:05', 2),
(24, 'iPhone 12 Pro Max', 'Apple iPhone 12 Pro Max, 256GB, Pacific Blue - Fully Unlocked (Renewed)', 'iPhone12ProMax.jpg', 150, 599.99, '2022-12-21 16:54:11', 2),
(26, 'iPhone 12 Pro', 'Apple iPhone 12 Pro, 128GB, Graphite - Fully Unlocked (Renewed)', 'iPhone12Pro.jpg', 100, 549.99, '2022-12-21 16:58:00', 2),
(27, 'iPhone 12', 'Apple iPhone 12, 64GB, Black - Fully Unlocked (Renewed)', 'iPhone12.jpg', 250, 421.85, '2022-12-21 16:59:25', 2),
(28, 'iPhone 13 Pro Max', 'Apple iPhone 13 Pro Max, 128GB, Sierra Blue - Unlocked (Renewed)', 'iPhone13ProMax.jpg', 50, 786.99, '2022-12-21 17:00:34', 2),
(29, 'iPhone 13', 'Apple iPhone 13, 128GB, Midnight - Unlocked (Renewed)', 'iPhone13.jpg', 100, 600.81, '2022-12-21 17:01:21', 2),
(30, 'iPhone 11 Pro Max', 'Apple iPhone 11 Pro Max, 256GB, Space Gray - Unlocked (Renewed)', 'iPhone11ProMax.jpg', 150, 497.9, '2022-12-21 17:02:44', 2),
(31, 'iPhone 12 Mini', 'Apple iPhone 12 Mini, 128GB, Red - Unlocked (Renewed Premium)', 'iPhone12Mini.jpg', 100, 504, '2022-12-21 17:04:03', 2),
(32, 'iPhone 13 Mini', 'Apple iPhone 13 Mini, 256GB, Blue - Unlocked (Renewed)', 'iPhone13Mini.jpg', 150, 630, '2022-12-21 17:05:03', 2),
(33, 'Galaxy S22', 'SAMSUNG Galaxy S22 Cell Phone, Factory Unlocked Android Smartphone, 256GB, 8K Camera & Video, Brightest Display Screen, Long Battery Life, Fast 4nm Processor, US Version, Phantom Black', 'GalaxyS22.jpg', 250, 799.99, '2022-12-21 17:09:17', 1),
(34, 'Galaxy A13', 'Samsung Galaxy A13 (SM-A135M/DS) Dual SIM,32 GB 3GB RAM, Factory Unlocked GSM, International Version - No Warranty - (White)', 'GalaxyA13.jpg', 500, 146.99, '2022-12-21 17:11:40', 1),
(35, 'Galaxy S21 5G', 'Samsung Galaxy S21 5G, US Version, 128GB, Phantom Pink - Unlocked (Renewed)', 'GalaxyS215G.jpg', 500, 309.9, '2022-12-21 17:12:53', 1),
(36, 'Galaxy A12', 'Samsung Galaxy A12 (32GB, 3GB) 6.5\" HD+, Quad Camera, 5000mAh Battery, Global 4G Volte (AT&T Unlocked for T-Mobile, Verizon, Metro) A125U (Black) (Renewed)', 'GalaxyA12.jpg', 1500, 112.99, '2022-12-21 17:13:54', 1),
(37, 'Redmi Note 11 4G Volte', 'Xiaomi Redmi Note 11 4G Volte 128GB + 4GB Factory Unlocked 6.43\" Quad Camera 50MP Night Mode (NOT Verizon Sprint Boost Cricket At&t) (w/Fast Car Charger Bundle) (Graphite Gray)', 'RedmiNote114GVolte.jpg', 500, 182.65, '2022-12-21 17:15:50', 12),
(38, 'Redmi 10C 4G Volte', 'Xiaomi Redmi 10C 4G Volte 128GB + 4GB Factory Unlocked 6.71\" 50MP Camera (Not Verizon Sprint Boost Cricket Metro At&T) + (w/Fast Car Charger Bundle) (Mint Green)', 'Redmi10C4GVolte.jpg', 300, 145.5, '2022-12-21 17:17:31', 12),
(39, '11T PRO 5G', 'Xiaomi 11T PRO 5G + 4G Volte (256GB, 8GB) 6.67” 108MP Triple Camera, NFC Dual SIM (Not Compatible Verizon Sprint Boost Metro Cricket) GSM Unlocked Global (w/Fast Car Charger Bundle) (Meteorite Gray)', '11TPRO5G.jpg', 400, 423.5, '2022-12-21 17:19:13', 12),
(40, 'Realme 7 4G', 'Realme 7 4G LTE Volte Factory Unlocked 48Mp Quad Camera RMX2155 (At&t Tmobile Metro Latin Europe) International (NO Verizon/Boost) (Mist Blue, 64GB + 6GB)', 'Realme74G.jpg', 400, 169.99, '2022-12-21 17:20:39', 20),
(41, 'Realme Narzo 50A', 'Realme Narzo 50A Prime 4G LTE 128GB + 4GB 50MP Triple Camera 6.6\" Android (NOT for Verizon Boost Cricket At&t Straight Talk) Global Unlocked + (w/Fast Car Charger Bundle) (Flash Blue)', 'RealmeNarzo50A.jpg', 500, 177.99, '2022-12-21 17:21:56', 20),
(42, 'Realme 8', 'Realme 8 5G + 4G Volte GSM Unlocked Global USA Latin Europe Octa Core 48MP Triple Camera (NOT Verizon/Boost/CDMA) (Black Supersonic, 128GB+8GB)', 'Realme8.jpg', 200, 269.99, '2022-12-21 17:22:52', 20),
(43, 'Nokia C30', 'Nokia C30 2021 4G Volte LTE 6000 mAh Big LCD 6.82\" Factory Unlocked 64GB (LTE USA Latin Europe Asia Africa) Android 11 (NOT Verizon/Boost) (w/Fast Car Charger Bundle) (Dark Grey)', 'NokiaC30.jpg', 250, 123.8, '2022-12-21 17:31:04', 19),
(44, 'Nokia G10', 'Nokia G10 | Android 11 | Unlocked Smartphone | 3-Day Battery | Dual SIM | US Version | 3/32GB | 6.52-Inch Screen | 13MP Triple Camera | Polar Night (Renewed)', 'NokiaG10.jpg', 150, 120, '2022-12-21 17:32:08', 19),
(45, 'Nokia X30 5G', 'Nokia X30 5G Dual-Sim 256GB ROM + 8GB RAM (GSM only | No CDMA) Factory Unlocked 5G Smartphone (Cloudy Blue) - International Version', 'NokiaX305G.jpg', 250, 199.99, '2022-12-21 17:40:52', 19),
(48, 'Infinix Hot 12 Play', 'desc', 'InfinixHot12Play.jpg', 150, 159.99, '2022-12-21 21:20:31', 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `command`
--
ALTER TABLE `command`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `command`
--
ALTER TABLE `command`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `phone`
--
ALTER TABLE `phone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
