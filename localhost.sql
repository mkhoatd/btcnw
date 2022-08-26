-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 24, 2022 at 09:26 AM
-- Server version: 5.7.34
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dulieu`
--
CREATE DATABASE IF NOT EXISTS `dulieu` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `dulieu`;

-- --------------------------------------------------------

--
-- Table structure for table `Admin`
--

CREATE TABLE `Admin` (
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Admin`
--

INSERT INTO `Admin` (`username`, `password`) VALUES
('admin', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE `nhanvien` (
  `Id` int(11) NOT NULL,
  `Ho ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Idpb` int(11) NOT NULL,
  `Dia chi` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`Id`, `Ho ten`, `Idpb`, `Dia chi`) VALUES
(1, 'NVA', 1, '136'),
(2, 'NVB', 2, '69 BBB'),
(3, 'NVC', 1, '99 BB');

-- --------------------------------------------------------

--
-- Table structure for table `phongban`
--

CREATE TABLE `phongban` (
  `Id` int(11) NOT NULL,
  `Ten` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Mo ta` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phongban`
--

INSERT INTO `phongban` (`Id`, `Ten`, `Mo ta`) VALUES
(1, 'Phong A', 'Phong rat dep'),
(2, 'Phong B', 'Phong rat rat dep');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_phongban_nhanvien` (`Idpb`);

--
-- Indexes for table `phongban`
--
ALTER TABLE `phongban`
  ADD PRIMARY KEY (`Id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD CONSTRAINT `FK_phongban_nhanvien` FOREIGN KEY (`Idpb`) REFERENCES `phongban` (`Id`) ON DELETE CASCADE;
--
-- Database: `Test888`
--
CREATE DATABASE IF NOT EXISTS `Test888` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `Test888`;

-- --------------------------------------------------------

--
-- Table structure for table `Admin`
--

CREATE TABLE `Admin` (
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Khoa`
--

CREATE TABLE `Khoa` (
  `Id` int(11) NOT NULL,
  `TenKhoa` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Khoa`
--

INSERT INTO `Khoa` (`Id`, `TenKhoa`) VALUES
(1, 'Khoa Toan'),
(2, 'Khoa Hoa');

-- --------------------------------------------------------

--
-- Table structure for table `Sinhvien`
--

CREATE TABLE `Sinhvien` (
  `MSV` varchar(10) NOT NULL,
  `HoTen` varchar(100) NOT NULL,
  `GioiTinh` tinyint(1) NOT NULL,
  `KhoaId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Sinhvien`
--

INSERT INTO `Sinhvien` (`MSV`, `HoTen`, `GioiTinh`, `KhoaId`) VALUES
('101', 'Ly Le Bang', 1, 1),
('102', 'Tran Anh Tuan', 2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`Username`);

--
-- Indexes for table `Khoa`
--
ALTER TABLE `Khoa`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Sinhvien`
--
ALTER TABLE `Sinhvien`
  ADD PRIMARY KEY (`MSV`),
  ADD KEY `FK_KhoaSinhvien` (`KhoaId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Sinhvien`
--
ALTER TABLE `Sinhvien`
  ADD CONSTRAINT `FK_KhoaSinhvien` FOREIGN KEY (`KhoaId`) REFERENCES `Khoa` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
