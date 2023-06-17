-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 17, 2023 at 05:47 PM
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
  `nama_kost` varchar(100) NOT NULL,
  `harga` varchar(200) NOT NULL,
  `jarak` varchar(200) NOT NULL,
  `fasilitas` varchar(200) NOT NULL,
  `luas_kamar` varchar(50) NOT NULL,
  `jumlah_kamar` int NOT NULL,
  `nama_pemilik` varchar(50) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `daftar_kost`
--

INSERT INTO `daftar_kost` (`id_dk`, `nama_kost`, `harga`, `jarak`, `fasilitas`, `luas_kamar`, `jumlah_kamar`, `nama_pemilik`, `no_telp`, `alamat`) VALUES
(1, 'Kost putri suyatni', '500.000 - 700.000 ', 'Dekat kampus,masjid,warung,café ', 'Kasur, meja, lemari 2 pintu,kipas, jendela,kamar mandi luar, dapur  ', '2,5 x 3 meter ', 1, 'Suyatni2', '09', 'test'),
(2, 'Kost putra ayu', '700.000 - 900.000  ', 'Dekat kampus, masjid  ', 'kasur,lemari 1 pintu,kamar mandi luar ', '2 x 3 meter', 2, 'ayu', '0000', 'test'),
(3, 'Kost putra & putri erwin', '800.000 – 1.100.000   ', 'Dekat kampus,warung  ', 'kasur,wifi, kamar mandi dalam, rak sepatu ', '3 x 3 meter ', 3, 'erwin', '222', 'test'),
(4, 'Kost putri agoy', '600.000 – 1.000.000   ', 'Dekat kampus, masjid, warung ', 'kasur, AC, kamar mandi luar ', '2 x 3 meter ', 4, 'agoy', '222', 'test'),
(5, 'Kost putri fadil', '600.000 – 800.0000   ', 'Dekat kampus, masjid, warung ', 'kasur, AC, kamar mandi luar ', '2 x 3 meter ', 4, 'fadil', '222', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` varchar(3) NOT NULL,
  `nama_kriteria` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int NOT NULL,
  `nik` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(200) NOT NULL,
  `id_dk` int NOT NULL,
  `id_kriteria` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `alamat_asal` text NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `tgl_masuk` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nik`, `nama_pelanggan`, `id_dk`, `id_kriteria`, `alamat_asal`, `no_telp`, `tgl_masuk`) VALUES
(1, '202043501783', 'AFghan', 3, 'C1', 'Bogor', '0851', '2023-06-07');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int NOT NULL,
  `id_pelanggan` int NOT NULL,
  `jumlah_bayar` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pelanggan`, `jumlah_bayar`) VALUES
(1, 1, 90000000);

-- --------------------------------------------------------

--
-- Table structure for table `pv_alternatif`
--

CREATE TABLE `pv_alternatif` (
  `id` int NOT NULL,
  `id_dk` int NOT NULL,
  `id_kriteria` varchar(3) NOT NULL,
  `nilai_prioritas` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `pv_alternatif`
--

INSERT INTO `pv_alternatif` (`id`, `id_dk`, `id_kriteria`, `nilai_prioritas`) VALUES
(6, 1, 'C2', 0.345),
(7, 2, 'C2', 0.162),
(8, 3, 'C2', 0.206),
(9, 4, 'C2', 0.162),
(10, 5, 'C2', 0.125),
(11, 1, 'C3', 0.103),
(12, 2, 'C3', 0.216),
(13, 3, 'C3', 0.261),
(14, 4, 'C3', 0.134),
(15, 5, 'C3', 0.286),
(16, 1, 'C4', 0.32),
(17, 2, 'C4', 0.242),
(18, 3, 'C4', 0.187),
(19, 4, 'C4', 0.143),
(20, 5, 'C4', 0.108),
(21, 1, 'C5', 0.153),
(22, 2, 'C5', 0.226),
(23, 3, 'C5', 0.226),
(24, 4, 'C5', 0.197),
(25, 5, 'C5', 0.197),
(51, 1, 'C1', 0.2),
(52, 2, 'C1', 0.2),
(53, 3, 'C1', 0.2),
(54, 4, 'C1', 0.2),
(55, 5, 'C1', 0.2);

-- --------------------------------------------------------

--
-- Table structure for table `pv_kriteria`
--

CREATE TABLE `pv_kriteria` (
  `id_kriteria` varchar(3) NOT NULL,
  `nilai_prioritas` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `pv_kriteria`
--

INSERT INTO `pv_kriteria` (`id_kriteria`, `nilai_prioritas`) VALUES
('C1', 0.378),
('C2', 0.239),
('C3', 0.173),
('C4', 0.134),
('C5', 0.075);

-- --------------------------------------------------------

--
-- Table structure for table `ranking`
--

CREATE TABLE `ranking` (
  `id_dk` int NOT NULL,
  `nilai_bobot` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `ranking`
--

INSERT INTO `ranking` (`id_dk`, `nilai_bobot`) VALUES
(1, 0.232),
(2, 0.2),
(3, 0.213),
(4, 0.171),
(5, 0.184);

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
(1, 'afghann', 'admin', 'admin');

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
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD KEY `no_telp` (`no_telp`),
  ADD KEY `id_krtieria` (`id_kriteria`),
  ADD KEY `id_dk` (`id_dk`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD UNIQUE KEY `id_pelanggan` (`id_pelanggan`) USING BTREE;

--
-- Indexes for table `pv_alternatif`
--
ALTER TABLE `pv_alternatif`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kriteria` (`id_kriteria`) USING BTREE,
  ADD KEY `id_dk` (`id_dk`,`id_kriteria`) USING BTREE;

--
-- Indexes for table `pv_kriteria`
--
ALTER TABLE `pv_kriteria`
  ADD UNIQUE KEY `id_kriteria` (`id_kriteria`) USING BTREE;

--
-- Indexes for table `ranking`
--
ALTER TABLE `ranking`
  ADD UNIQUE KEY `id_dk_2` (`id_dk`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pv_alternatif`
--
ALTER TABLE `pv_alternatif`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD CONSTRAINT `pelanggan_ibfk_1` FOREIGN KEY (`id_dk`) REFERENCES `daftar_kost` (`id_dk`),
  ADD CONSTRAINT `pelanggan_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `id_pelanggan` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pv_alternatif`
--
ALTER TABLE `pv_alternatif`
  ADD CONSTRAINT `pv_alternatif_ibfk_3` FOREIGN KEY (`id_dk`) REFERENCES `daftar_kost` (`id_dk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pv_kriteria`
--
ALTER TABLE `pv_kriteria`
  ADD CONSTRAINT `pv_kriteria_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ranking`
--
ALTER TABLE `ranking`
  ADD CONSTRAINT `ranking_ibfk_1` FOREIGN KEY (`id_dk`) REFERENCES `daftar_kost` (`id_dk`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
