-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- 主機: 127.0.0.1
-- 產生時間： 
-- 伺服器版本: 10.1.10-MariaDB
-- PHP 版本： 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `class`
--
CREATE DATABASE IF NOT EXISTS `class` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `class`;

-- --------------------------------------------------------

--
-- 資料表結構 `score`
--

CREATE TABLE `score` (
  `no1` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `name1` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `exam` int(11) NOT NULL,
  `homework` int(11) NOT NULL,
  `project` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `score`
--

INSERT INTO `score` (`no1`, `name1`, `exam`, `homework`, `project`) VALUES
('9223001', '王一', 70, 70, 80),
('9223002', '李二鄰', 70, 80, 90),
('9223003', '柳三', 80, 80, 40),
('9223004', '章玟銀', 80, 90, 80),
('9223005', '黃凱一', 90, 60, 70);

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`no1`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
