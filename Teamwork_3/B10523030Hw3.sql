-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- 主機: localhost
-- 產生時間： 2018-11-28 17:55:46
-- 伺服器版本: 5.7.17-log
-- PHP 版本： 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `teamwork2`
--

-- --------------------------------------------------------

--
-- 資料表結構 `book`
--

CREATE TABLE `book` (
  `B_ID` int(11) NOT NULL,
  `B_name` varchar(100) NOT NULL,
  `P_ID` int(11) NOT NULL,
  `Price` int(3) NOT NULL,
  `ISBN` varchar(13) NOT NULL,
  `Author` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `book`
--

INSERT INTO `book` (`B_ID`, `B_name`, `P_ID`, `Price`, `ISBN`, `Author`) VALUES
(1, 'Designing with Data', 1, 458, '9789864769247', 'Rochelle King'),
(2, 'Programming iOS 13', 1, 2533, '9781492044635', 'Matt Neuburg'),
(3, 'Azure Analytics ', 1, 537, '9789864769209', 'Zoiner Tejada'),
(4, 'Mastering Python for Networking and Security ', 2, 1366, '9781788992510', 'Jose Manuel Ortega'),
(5, 'Python Deep Learning Projects', 2, 1507, '9781788997096', 'Rahul Kumar, Matthew Lamons'),
(6, 'Mastering PostgreSQL 11 ', 2, 1366, '9781789537819', 'Hans-Jurgen Schonig'),
(7, 'Applied Natural Language Processing with Python', 3, 1201, '9781484237328', 'Taweh Beysolow II'),
(8, 'Python Descriptors', 3, 1482, '9781484237267', 'Jacob Zimmerman'),
(9, 'Building Scalable Cisco Networks', 4, 199, '9781578702282', 'Catherine Paquet, Diane Teare'),
(10, 'Managing Cisco Network Security', 4, 1050, '9781578701032', 'Mike Wenstrom');

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
  `M_tel` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `member`
--

INSERT INTO `member` (`M_ID`, `account`, `password`, `M_name`, `M_address`, `birthday`, `M_tel`) VALUES
(1, 'yun0001', 'pwd001', 'Cairns', 'No.1, Sec. 3, University Road, Douliu City, Yunlin County', '1994-01-08', '02-2222-2222'),
(2, 'yun0002', 'pwd002', 'Tim', 'No.2, Sec. 3, University Road, Douliu City, Yunlin County', '1955-10-15', '03-3333-3333'),
(3, 'yun0003', 'pwd003', 'Genie', 'No.3, Sec. 3, University Road, Douliu City, Yunlin County', '1993-06-09', '04-4444-4444'),
(4, 'yun0004', 'pwd004', 'Kevin', 'No.4, Sec. 3, University Road, Douliu City, Yunlin County', '1992-04-15', '05-5555-5555'),
(5, 'yun0005', 'pwd005', 'Angela', 'No.5, Sec. 3, University Road, Douliu City, Yunlin County', '1965-04-20', '06-6666-6666'),
(6, 'yun0006', 'pwd006', 'Edwin ', 'No.6, Sec. 3, University Road, Douliu City, Yunlin County', '1990-10-25', '07-7777-7777'),
(7, 'yun0007', 'pwd007', 'Jam', 'No.7, Sec. 3, University Road, Douliu City, Yunlin County', '1978-05-08', '08-8888-8888'),
(8, 'yun0008', 'pwd008', 'Jacob', 'No.8, Sec. 3, University Road, Douliu City, Yunlin County', '1990-08-08', '02-2222-2233'),
(9, 'yun0009', 'pwd009', 'Jay', 'No.9, Sec. 3, University Road, Douliu City, Yunlin County', '1991-11-11', '03-3333-3344'),
(10, 'yun0010', 'pwd0010', 'Jane', 'No.10, Sec. 3, University Road, Douliu City, Yunlin County', '1988-10-10', '05-5533-5555');

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
(1, 1, 1, 1, 458),
(2, 2, 2, 1, 2533),
(3, 3, 3, 1, 537),
(4, 4, 4, 1, 1366),
(5, 5, 5, 1, 1507),
(6, 6, 6, 1, 1366),
(7, 7, 7, 1, 1201),
(8, 8, 8, 1, 1482),
(9, 9, 9, 1, 199),
(10, 10, 10, 1, 1050),
(11, 11, 2, 1, 2533),
(12, 12, 1, 1, 458),
(13, 13, 1, 1, 458),
(14, 14, 1, 1, 458),
(15, 15, 9, 1, 199),
(16, 16, 9, 1, 199),
(17, 17, 9, 1, 199),
(18, 18, 9, 1, 199);

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
(1, 1, 1, 458, '2018-10-01'),
(2, 2, 1, 2533, '2018-10-01'),
(3, 3, 1, 537, '2018-10-01'),
(4, 4, 1, 1366, '2018-10-01'),
(5, 5, 1, 1507, '2018-10-01'),
(6, 6, 1, 1366, '2018-10-01'),
(7, 7, 1, 1201, '2018-10-01'),
(8, 8, 1, 1482, '2018-10-01'),
(9, 9, 1, 199, '2018-10-01'),
(10, 10, 1, 1050, '2018-10-01'),
(11, 1, 1, 2533, '2018-10-01'),
(12, 2, 1, 458, '2018-10-01'),
(13, 3, 1, 458, '2018-10-01'),
(14, 4, 1, 458, '2018-10-01'),
(15, 1, 1, 199, '2018-10-01'),
(16, 2, 1, 199, '2018-10-01'),
(17, 3, 1, 199, '2018-10-01'),
(18, 4, 1, 199, '2018-10-01');

-- --------------------------------------------------------

--
-- 資料表結構 `supplier`
--

CREATE TABLE `supplier` (
  `P_ID` int(11) NOT NULL,
  `P_name` varchar(100) NOT NULL,
  `P_tel` varchar(15) NOT NULL,
  `P_address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `supplier`
--

INSERT INTO `supplier` (`P_ID`, `P_name`, `P_tel`, `P_address`) VALUES
(1, 'OREILLY', '05-5555-5555', 'No.515, Sec. 2, Yunlin Rd., Douliu City, Yunlin County'),
(2, 'Packt Publ', '03-3333-3333', 'No.17, Fuqian Rd., Hualien City, Hualien County'),
(3, 'Apress', '04-4444-4444', 'No. 99, Sec. 3, Taiwan Boulevard, Xitun Dist., Taichung City'),
(4, 'Cisco Systems', '02-2222-2222', 'No.1, City Hall Rd., Xinyi District, Taipei City');

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `view_order_count`
-- (請參考以下實際畫面)
--
CREATE TABLE `view_order_count` (
`P_name` varchar(100)
,`B_name` varchar(100)
,`被購買數量` decimal(32,0)
,`OD_Amount` int(11)
);

-- --------------------------------------------------------

--
-- 檢視表結構 `view_order_count`
--
DROP TABLE IF EXISTS `view_order_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_order_count`  AS  select `supplier`.`P_name` AS `P_name`,`book`.`B_name` AS `B_name`,sum(`odetail`.`OD_Count`) AS `被購買數量`,`odetail`.`OD_Amount` AS `OD_Amount` from ((`supplier` join `odetail`) join `book`) where ((`supplier`.`P_ID` = `book`.`P_ID`) and (`book`.`B_ID` = `odetail`.`B_ID`)) group by `book`.`B_name` ;

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`B_ID`),
  ADD KEY `B_ID` (`B_ID`),
  ADD KEY `P_ID` (`P_ID`),
  ADD KEY `B_name` (`B_name`);

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
  ADD KEY `odetail_ibfk_1` (`O_ID`),
  ADD KEY `B_ID_4` (`B_ID`);

--
-- 資料表索引 `orderhistory`
--
ALTER TABLE `orderhistory`
  ADD PRIMARY KEY (`O_ID`),
  ADD KEY `orderhistory_ibfk_1` (`M_ID`);

--
-- 資料表索引 `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`P_ID`),
  ADD KEY `P_ID` (`P_ID`),
  ADD KEY `P_name` (`P_name`);

--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `odetail`
--
ALTER TABLE `odetail`
  ADD CONSTRAINT `odetail_ibfk_1` FOREIGN KEY (`O_ID`) REFERENCES `orderhistory` (`O_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `odetail_ibfk_2` FOREIGN KEY (`B_ID`) REFERENCES `book` (`B_ID`);

--
-- 資料表的 Constraints `orderhistory`
--
ALTER TABLE `orderhistory`
  ADD CONSTRAINT `orderhistory_ibfk_1` FOREIGN KEY (`M_ID`) REFERENCES `member` (`M_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
