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
CREATE DATABASE IF NOT EXISTS `testdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `testdb`;

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `No` int(1) NOT NULL,
  `Name` varchar(10) NOT NULL,
  `Address` varchar(20) NOT NULL,
  `Tel` varchar(10) NOT NULL,
  `Birthday` date NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Priority` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`No`, `Name`, `Address`, `Tel`, `Birthday`, `Email`, `Priority`) VALUES
(1, '吳勿年', '彰化縣和美鎮鐵山里14號', '09-1235478', '1999-07-23', 'coplwear@gmail.com', 'H'),
(2, '張宇豪', '雲林縣斗六市七八路111號', '09-2222222', '2019-11-18', 'adsasdasd@gmail.com', 'M'),
(3, '中駿豪', '台中市西屯區444號', '09-8888888', '2019-11-05', '87cheat@gmail.com', 'M');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`No`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
