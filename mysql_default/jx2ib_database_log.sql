-- phpMyAdmin SQL Dump
-- version 5.0.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th3 03, 2022 lúc 08:32 AM
-- Phiên bản máy phục vụ: 5.5.64-MariaDB
-- Phiên bản PHP: 7.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `jx2ib_database_log`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `common_log`
--

CREATE TABLE `common_log` (
  `ID` int(11) NOT NULL,
  `LogTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `GroupName` varchar(32) DEFAULT NULL,
  `LogType` int(10) UNSIGNED DEFAULT NULL,
  `LogContent` blob,
  `ObjName` varchar(255) DEFAULT NULL,
  `Flag` tinyint(3) UNSIGNED DEFAULT NULL,
  `Editable` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `common_log`
--
ALTER TABLE `common_log`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `LogTime` (`LogTime`),
  ADD KEY `GroupName` (`GroupName`),
  ADD KEY `LogType` (`LogType`),
  ADD KEY `ObjName` (`ObjName`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `common_log`
--
ALTER TABLE `common_log`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=480;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

