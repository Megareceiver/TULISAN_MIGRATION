-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 06 Jan 2018 pada 12.44
-- Versi server: 5.5.42
-- Versi PHP: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tulisan_migration_5`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `store`
--

CREATE TABLE `store` (
  `idData` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `zipCode` varchar(10) NOT NULL,
  `country` varchar(100) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `openHours` varchar(100) NOT NULL,
  `createdBy` varchar(100) NOT NULL,
  `createdDate` datetime NOT NULL,
  `changedBy` varchar(100) DEFAULT NULL,
  `changedDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `store`
--

INSERT INTO `store` (`idData`, `name`, `picture`, `address`, `city`, `zipCode`, `country`, `phone`, `openHours`, `createdBy`, `createdDate`, `changedBy`, `changedDate`) VALUES
(2, 'Flagship Store & Creative Headquarter', 'store_2_20180106115306am.jpg', 'Darmawangsa Square, The City Walk\r\nGround Floor, Unit #24', 'Jakarta', '12160', 'ID', '+ 62 21 727 8023', '9 a.m. to 9 p.m. (GMT +7)', 'admin@tulisan.com', '2018-01-06 17:53:06', NULL, NULL),
(3, 'Tulisan Plaza Senayan', 'store_3_20180106120147pm.jpg', 'Jalan Asia Afrika No. 8', 'South Jakarta', '', 'ID', '', 'on Wednesday, 28 October, 10.00am â€“ 10.00pm', 'admin@tulisan.com', '2018-01-06 18:01:47', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`idData`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `store`
--
ALTER TABLE `store`
  MODIFY `idData` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
