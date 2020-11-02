-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- 主機: localhost
-- 產生時間： 2018-10-26 07:16:59
-- 伺服器版本: 5.7.17-log
-- PHP 版本： 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `book`
--

-- --------------------------------------------------------

--
-- 資料表結構 `book`
--

CREATE TABLE `book` (
  `B_ID` int(11) NOT NULL,
  `B_name` varchar(10) NOT NULL,
  `P_ID` int(11) NOT NULL,
  `Price` int(3) NOT NULL,
  `ISBN` varchar(13) NOT NULL,
  `Author` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `book`
--

INSERT INTO `book` (`B_ID`, `B_name`, `P_ID`, `Price`, `ISBN`, `Author`) VALUES
(1, 'book1', 1, 1000, '9789867042781', 'ken'),
(2, 'book2', 2, 1000, '9789867042782', 'ken'),
(3, 'book3', 3, 1000, '9789867042783', 'ken'),
(4, 'book4', 4, 1000, '9789867042784', 'ken'),
(5, 'book5', 5, 1000, '9789867042785', 'can'),
(6, 'book6', 6, 1000, '9789867042786', 'can'),
(7, 'book7', 7, 1000, '9789867042787', 'can'),
(8, 'book8', 8, 1000, '9789867042788', 'can'),
(9, 'book9', 9, 1000, '9789867042789', 'can');

-- --------------------------------------------------------

--
-- 資料表結構 `member`
--

CREATE TABLE `member` (
  `M_ID` int(11) NOT NULL,
  `account` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `M_name` varchar(10) NOT NULL,
  `M_address` varchar(100) NOT NULL,
  `birthday` date NOT NULL,
  `M_tel` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `member`
--

INSERT INTO `member` (`M_ID`, `account`, `password`, `M_name`, `M_address`, `birthday`, `M_tel`) VALUES
(1, 'hick1991', 'hick1991', '001', '001', '2018-10-01', '0966525221'),
(2, 'hick1992', 'hick1992', '002', '002', '2018-10-02', '0966525222'),
(3, 'hick1993', 'hick1993', '003', '003', '2018-10-03', '0966525223'),
(4, 'hick1994', 'hick1994', '004', '004', '2018-10-04', '0966525224'),
(5, 'hick1995', 'hick1995', '005', '005', '2018-10-05', '0966525225');

-- --------------------------------------------------------

--
-- 資料表結構 `odetail`
--

CREATE TABLE `odetail` (
  `OD_ID` int(11) NOT NULL,
  `O_ID` int(11) NOT NULL,
  `B_ID` int(11) NOT NULL,
  `OD_Count` int(3) NOT NULL,
  `OD_Amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `odetail`
--

INSERT INTO `odetail` (`OD_ID`, `O_ID`, `B_ID`, `OD_Count`, `OD_Amount`) VALUES
(1, 1, 1, 1, 1000),
(2, 2, 2, 1, 1000),
(3, 3, 3, 1, 1000),
(4, 4, 4, 1, 1000),
(5, 5, 5, 1, 1000),
(6, 6, 6, 1, 1000),
(7, 7, 7, 1, 1000),
(8, 8, 8, 1, 1000),
(9, 9, 9, 1, 1000);

-- --------------------------------------------------------

--
-- 資料表結構 `orderhistory`
--

CREATE TABLE `orderhistory` (
  `O_ID` int(11) NOT NULL,
  `M_ID` int(11) NOT NULL,
  `M_Count` int(11) NOT NULL,
  `M_Amount` int(11) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `orderhistory`
--

INSERT INTO `orderhistory` (`O_ID`, `M_ID`, `M_Count`, `M_Amount`, `Date`) VALUES
(1, 1, 1, 1000, '2018-10-01'),
(2, 2, 1, 1000, '2018-10-02'),
(3, 3, 1, 1000, '2018-10-03'),
(4, 4, 1, 1000, '2018-10-04'),
(5, 5, 1, 1000, '2018-10-05'),
(6, 1, 1, 1000, '2018-10-01'),
(7, 2, 1, 1000, '2018-10-02'),
(8, 3, 1, 1000, '2018-10-03'),
(9, 4, 1, 1000, '2018-10-04');

-- --------------------------------------------------------

--
-- 資料表結構 `publisher`
--

CREATE TABLE `publisher` (
  `P_ID` int(11) NOT NULL,
  `P_name` varchar(10) NOT NULL,
  `P_tel` varchar(10) NOT NULL,
  `P_address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `publisher`
--

INSERT INTO `publisher` (`P_ID`, `P_name`, `P_tel`, `P_address`) VALUES
(1, 'KKK', '0938323890', 'NYUST'),
(2, 'KKK', '0938323890', 'NYUST'),
(3, 'KKK', '0938323890', 'NYUST'),
(4, 'CCC', '0938323892', 'NYUS'),
(5, 'CCC', '0938323892', 'NYUS'),
(6, 'CCC', '0938323892', 'NYUS'),
(7, 'QQQ', '0938323894', 'NFU'),
(8, 'QQQ', '0938323894', 'NFU'),
(9, 'QQQ', '0938323894', 'NFU');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`B_ID`),
  ADD KEY `B_ID` (`B_ID`),
  ADD KEY `P_ID` (`P_ID`);

--
-- 資料表索引 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`M_ID`);

--
-- 資料表索引 `odetail`
--
ALTER TABLE `odetail`
  ADD PRIMARY KEY (`OD_ID`),
  ADD KEY `B_ID` (`B_ID`),
  ADD KEY `B_ID_2` (`B_ID`),
  ADD KEY `B_ID_3` (`B_ID`),
  ADD KEY `odetail_ibfk_1` (`O_ID`);

--
-- 資料表索引 `orderhistory`
--
ALTER TABLE `orderhistory`
  ADD PRIMARY KEY (`O_ID`),
  ADD KEY `orderhistory_ibfk_1` (`M_ID`);

--
-- 資料表索引 `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`P_ID`),
  ADD KEY `P_ID` (`P_ID`);

--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`B_ID`) REFERENCES `odetail` (`B_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的 Constraints `odetail`
--
ALTER TABLE `odetail`
  ADD CONSTRAINT `odetail_ibfk_1` FOREIGN KEY (`O_ID`) REFERENCES `orderhistory` (`O_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的 Constraints `orderhistory`
--
ALTER TABLE `orderhistory`
  ADD CONSTRAINT `orderhistory_ibfk_1` FOREIGN KEY (`M_ID`) REFERENCES `member` (`M_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的 Constraints `publisher`
--
ALTER TABLE `publisher`
  ADD CONSTRAINT `publisher_ibfk_1` FOREIGN KEY (`P_ID`) REFERENCES `book` (`P_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
