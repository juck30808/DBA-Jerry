-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 
-- 伺服器版本： 10.4.6-MariaDB
-- PHP 版本： 7.3.9

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
-- 傾印資料表的資料 `basic`
--

INSERT INTO `basic` (`cust_no`, `name`, `id`, `address`, `tel_no`) VALUES
(0, '', '', '', ''),
(11, '3333', '3333', '3335', '3334'),
(221111, '1122', '1113', '114', '114'),
(10723001, '李依', 'R208123548', '雲林縣斗六市大學路3段123號', '(05)534-2601');

--
-- 已傾印資料表的索引
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
