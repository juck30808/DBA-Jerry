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
-- 資料庫： `test1`
--
CREATE DATABASE IF NOT EXISTS `test1` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `test1`;

-- --------------------------------------------------------

--
-- 資料表結構 `test11`
--

CREATE TABLE `test11` (
  `no` int(11) NOT NULL,
  `name` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Tel` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Birthday` date NOT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Priority` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `test11`
--

INSERT INTO `test11` (`no`, `name`, `Address`, `Tel`, `Birthday`, `Email`, `Priority`) VALUES
(1, '陳會安', '台北縣五股成泰路一段1000號', '02-11111111', '1967-09-03', 'hueyan@ms2.hinet.net', 'H'),
(2, '江小魚', '中和景平路1000號', '02-22222222', '1978-02-02', 'jane@ms1.hinet.net', 'M'),
(3, '劉德華', '桃園市三民路1000號', '02-33333333', '1982-03-03', 'lu@tpts2.seed.net.tw', 'L'),
(4, '郭富城', '台中市中港路三段500號', '03-44444444', '1981-04-04', 'ko@gcn.net.net', 'H');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `test11`
--
ALTER TABLE `test11`
  ADD PRIMARY KEY (`no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
