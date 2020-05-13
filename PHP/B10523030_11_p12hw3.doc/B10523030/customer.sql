-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 
-- 伺服器版本: 10.1.37-MariaDB
-- PHP 版本： 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `customer`
--

-- --------------------------------------------------------

--
-- 資料表結構 `basic`
--

CREATE TABLE `basic` (
  `cust_no` int(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `id` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `tel_no` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `basic`
--

INSERT INTO `basic` (`cust_no`, `name`, `id`, `address`, `tel_no`) VALUES
(10523030, '簡聿均', '24662681', '台北市大安區敦化南路二段77號10樓之1A ', '0909008123'),
(10523031, '簡聿均1', '24662681', '台北市大安區敦化南路二段77號10樓之1A ', '0909008123'),
(10523032, '簡聿均2', '24662681', '新北市大安區敦化南路二段77號10樓之1', '0909008123'),
(10523033, '簡聿均3', '24662681', '新北市大安區敦化南路二段77號10樓之1A ', '0909008123');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `basic`
--
ALTER TABLE `basic`
  ADD PRIMARY KEY (`cust_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
