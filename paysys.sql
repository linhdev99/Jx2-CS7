-- phpMyAdmin SQL Dump
-- version 5.0.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th2 28, 2022 lúc 08:00 AM
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
-- Cơ sở dữ liệu: `paysys`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL DEFAULT 'test03',
  `secpassword` varchar(64) NOT NULL DEFAULT 'e8c54b11d35825097bdbfccea0d16079',
  `password` varchar(64) NOT NULL DEFAULT 'a',
  `rowpass` varchar(32) DEFAULT 'a',
  `trytocard` int(1) NOT NULL DEFAULT '0',
  `changepwdret` int(1) NOT NULL DEFAULT '0',
  `active` int(1) NOT NULL DEFAULT '1',
  `LockPassword` int(11) NOT NULL DEFAULT '0',
  `trytohack` int(1) NOT NULL DEFAULT '0',
  `newlocked` int(1) NOT NULL DEFAULT '0',
  `locked` int(1) NOT NULL DEFAULT '0',
  `LastLoginIP` int(11) NOT NULL DEFAULT '0',
  `PasspodMode` int(11) NOT NULL DEFAULT '0',
  `email` varchar(64) NOT NULL DEFAULT 'adhppl99@gmail.com',
  `cmnd` int(9) NOT NULL DEFAULT '123456780',
  `dob` date DEFAULT NULL,
  `coin` int(20) NOT NULL DEFAULT '0',
  `dateCreate` int(20) DEFAULT NULL,
  `lockedTime` datetime DEFAULT NULL,
  `testcoin` int(11) NOT NULL DEFAULT '9999999',
  `lockedCoin` int(10) NOT NULL DEFAULT '0',
  `bklactivenew` int(5) NOT NULL DEFAULT '0',
  `bklactive` int(5) NOT NULL DEFAULT '0',
  `nExtpoin1` int(5) NOT NULL DEFAULT '0',
  `nExtpoin2` int(5) NOT NULL DEFAULT '0',
  `nExtpoin4` int(5) NOT NULL DEFAULT '0',
  `nExtpoin5` int(5) NOT NULL DEFAULT '0',
  `nExtpoin6` int(5) NOT NULL DEFAULT '0',
  `nExtpoin7` int(5) NOT NULL DEFAULT '0',
  `scredit` int(10) NOT NULL DEFAULT '0',
  `nTimeActiveBKL` int(10) NOT NULL DEFAULT '0',
  `nLockTimeCard` int(15) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- ĝang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`id`, `username`, `secpassword`, `password`, `rowpass`, `trytocard`, `changepwdret`, `active`, `LockPassword`, `trytohack`, `newlocked`, `locked`, `LastLoginIP`, `PasspodMode`, `email`, `cmnd`, `dob`, `coin`, `dateCreate`, `lockedTime`, `testcoin`, `lockedCoin`, `bklactivenew`, `bklactive`, `nExtpoin1`, `nExtpoin2`, `nExtpoin4`, `nExtpoin5`, `nExtpoin6`, `nExtpoin7`, `scredit`, `nTimeActiveBKL`, `nLockTimeCard`) VALUES
(20, 'luffy0x', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '123456', 0, 0, 1, 1, 0, 0, 0, 218212544, 0, 'adhppl99@gmail.com', 123456780, NULL, 9990403, NULL, NULL, 9999999, 0, 0, 0, 0, 0, 0, 0, 0, 740, 0, 0, 0),
(21, 'luffy1x', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '123456', 0, 0, 1, 1, 0, 0, 0, 218212544, 0, 'adhppl99@gmail.com', 123456780, NULL, 9930527, NULL, NULL, 9999999, 0, 0, 0, 0, 0, 0, 0, 0, 3689, 0, 0, 0),
(22, 'luffy2x', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '123456', 0, 0, 1, 0, 0, 0, 0, 33663168, 0, 'adhppl99@gmail.com', 123456780, NULL, 9954819, NULL, NULL, 9999999, 0, 0, 0, 0, 0, 0, 0, 0, 3933, 0, 0, 0),
(23, 'a', '0cc175b9c0f1b6a831c399e269772661', '0cc175b9c0f1b6a831c399e269772661', 'a', 0, 0, 1, 0, 0, 0, 0, 33663168, 0, 'adhppl99@gmail.com', 123456780, NULL, 9992899, NULL, NULL, 9999999, 0, 0, 0, 0, 0, 0, 0, 0, 1110, 0, 0, 0),
(24, 'b', '92eb5ffee6ae2fec3ad71c777531578f', '92eb5ffee6ae2fec3ad71c777531578f', 'b', 0, 0, 1, 0, 0, 0, 0, 0, 0, 'adhppl99@gmail.com', 123456780, NULL, 9999999, NULL, NULL, 9999999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(25, 'c', '4a8a08f09d37b73795649038408b5f33', '4a8a08f09d37b73795649038408b5f33', 'c', 0, 0, 1, 0, 0, 0, 0, 0, 0, 'petermeow@gmail.com', 123456780, NULL, 9999999, NULL, NULL, 9999999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u` (`username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

