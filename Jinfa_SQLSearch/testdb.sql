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
-- 資料庫： `testdb`
--

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `編號` int(100) NOT NULL,
  `姓名` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `地址` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `電話` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `生日` date NOT NULL,
  `Email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `等級` varchar(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`編號`, `姓名`, `地址`, `電話`, `生日`, `Email`, `等級`) VALUES
(1, '陳會安', '台北縣五股成泰路一段100號', '02-11111111', '1967-09-03', 'hueyan@ms2.hinet.net', 'H'),
(2, '江小魚', '中和景平路1000號', '02-22222222', '1978-02-02', 'jane@ms1.hinet.net', 'M'),
(3, '劉得華', '桃園市三民路1000號', '02-33333333', '1982-03-03', 'lu@tpts2.seed.net.tw', 'L');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`編號`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
