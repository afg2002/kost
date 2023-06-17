-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 29, 2023 at 06:39 AM
-- Server version: 8.0.30
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kost`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar_kost`
--

CREATE TABLE `daftar_kost` (
  `id_dk` int NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` varchar(200) NOT NULL,
  `jarak` varchar(200) NOT NULL,
  `fasilitas` varchar(200) NOT NULL,
  `luas_kamar` varchar(50) NOT NULL,
  `jumlah_kamar` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `daftar_kost`
--

INSERT INTO `daftar_kost` (`id_dk`, `nama`, `harga`, `jarak`, `fasilitas`, `luas_kamar`, `jumlah_kamar`) VALUES
(2, 'Kost putri suyatni', '500.000 - 700.000 ', 'Dekat kampus,masjid,warung,café ', 'Kasur, meja, lemari 2 pintu,kipas, jendela,kamar mandi luar, dapur  ', '2,5 x 3 meter ', 1),
(6, 'Kost putra pelita', '700.000 - 900.000  ', 'Dekat kampus, masjid  ', 'kasur,lemari 1 pintu,kamar mandi luar ', '2 x 3 meter', 2),
(7, 'Kost putra putri Erwin', '800.000 – 1.100.000   ', 'Dekat kampus,warung  ', 'kasur,wifi, kamar mandi dalam, rak sepatu ', '3 x 3 meter ', 3),
(8, 'Kost putri ayu', '600.000 – 1.000.000   ', 'Dekat kampus, masjid, warung ', 'kasur, AC, kamar mandi luar ', '2 x 3 meter ', 4),
(11, 'Kost putra jaya', '600.000 – 800.0000   ', 'Dekat kampus, warung ', 'kasur, kipas, kamar mandi luar, lemar 1 pintu ', '2 x 3 meter ', 5);

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` varchar(3) NOT NULL,
  `nama_kriteria` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `nama_kriteria`) VALUES
('C1', 'Harga'),
('C2', 'Jarak'),
('C3', 'Fasilitas'),
('C4', 'Luas Kamar'),
('C5', 'Jumlah Kamar');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('admin', '123');

-- --------------------------------------------------------

--
-- Table structure for table `pv_alternatif`
--

CREATE TABLE `pv_alternatif` (
  `id` int NOT NULL,
  `id_dk` int NOT NULL,
  `id_kriteria` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilai_prioritas` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pv_alternatif`
--

INSERT INTO `pv_alternatif` (`id`, `id_dk`, `id_kriteria`, `nilai_prioritas`) VALUES
(71, 2, 'C1', 0.2),
(72, 6, 'C1', 0.2),
(73, 7, 'C1', 0.2),
(74, 8, 'C1', 0.2),
(75, 11, 'C1', 0.2),
(76, 2, 'C2', 0.25),
(77, 6, 'C2', 0.125),
(78, 7, 'C2', 0.25),
(79, 8, 'C2', 0.25),
(80, 11, 'C2', 0.125),
(81, 2, 'C3', 0.303),
(82, 6, 'C3', 0.303),
(83, 7, 'C3', 0.165),
(84, 8, 'C3', 0.165),
(85, 11, 'C3', 0.065),
(86, 2, 'C4', 0.286),
(87, 6, 'C4', 0.286),
(88, 7, 'C4', 0.143),
(89, 8, 'C4', 0.143),
(90, 11, 'C4', 0.143),
(91, 2, 'C5', 0.081),
(92, 6, 'C5', 0.156),
(93, 7, 'C5', 0.156),
(94, 8, 'C5', 0.156),
(95, 11, 'C5', 0.452);

-- --------------------------------------------------------

--
-- Table structure for table `pv_kriteria`
--

CREATE TABLE `pv_kriteria` (
  `id_kriteria` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nilai_prioritas` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pv_kriteria`
--

INSERT INTO `pv_kriteria` (`id_kriteria`, `nilai_prioritas`) VALUES
('C1', 0.388),
('C2', 0.255),
('C3', 0.166),
('C4', 0.122),
('C5', 0.068);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `nama` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`) VALUES
(1, 'Afghan', 'admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar_kost`
--
ALTER TABLE `daftar_kost`
  ADD PRIMARY KEY (`id_dk`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pv_alternatif`
--
ALTER TABLE `pv_alternatif`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kriteria` (`id_kriteria`),
  ADD KEY `id_dk` (`id_dk`,`id_kriteria`) USING BTREE;

--
-- Indexes for table `pv_kriteria`
--
ALTER TABLE `pv_kriteria`
  ADD UNIQUE KEY `id_kriteria` (`id_kriteria`) USING BTREE;

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar_kost`
--
ALTER TABLE `daftar_kost`
  MODIFY `id_dk` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pv_alternatif`
--
ALTER TABLE `pv_alternatif`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pv_alternatif`
--
ALTER TABLE `pv_alternatif`
  ADD CONSTRAINT `pv_alternatif_ibfk_1` FOREIGN KEY (`id_dk`) REFERENCES `daftar_kost` (`id_dk`),
  ADD CONSTRAINT `pv_alternatif_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`);

--
-- Constraints for table `pv_kriteria`
--
ALTER TABLE `pv_kriteria`
  ADD CONSTRAINT `pv_kriteria_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
