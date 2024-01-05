-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2024 at 02:31 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poli`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar_poli`
--

CREATE TABLE `daftar_poli` (
  `id` int(11) NOT NULL,
  `id_pasien` int(11) DEFAULT NULL,
  `id_jadwal` int(11) NOT NULL,
  `keluhan` text NOT NULL,
  `no_antrian` int(11) NOT NULL,
  `status_periksa` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daftar_poli`
--

INSERT INTO `daftar_poli` (`id`, `id_pasien`, `id_jadwal`, `keluhan`, `no_antrian`, `status_periksa`) VALUES
(28, 30, 5, 'ngelu karena gak nduwe duet.', 1, ''),
(29, 31, 5, 'Aku mumet walaupun duit, soale mung duit dolanan', 2, ''),
(30, 32, 5, 'Aku ngelu nduwe duit, tapi disilih koncoku.', 3, ''),
(31, 32, 5, 'hoek hoek', 4, ''),
(32, 30, 5, 'lelah sekali duakali', 5, '');

-- --------------------------------------------------------

--
-- Table structure for table `detail_periksa`
--

CREATE TABLE `detail_periksa` (
  `id` int(11) NOT NULL,
  `id_periksa` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_periksa`
--

INSERT INTO `detail_periksa` (`id`, `id_periksa`, `id_obat`) VALUES
(1, 3, 1),
(2, 3, 2),
(3, 4, 3),
(4, 5, 2),
(5, 6, 2),
(6, 7, 3),
(7, 8, 1),
(8, 9, 1),
(9, 10, 1),
(10, 11, 1),
(11, 11, 2),
(12, 12, 1),
(13, 13, 1),
(14, 13, 2),
(15, 13, 3);

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id` int(11) NOT NULL,
  `nama_dokter` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `id_poli` int(11) NOT NULL,
  `nip` varchar(50) NOT NULL,
  `sandi_dokter` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id`, `nama_dokter`, `alamat`, `no_hp`, `id_poli`, `nip`, `sandi_dokter`) VALUES
(12, 'dokter1', 'dokter1', '1111111111111', 6, '1', '$2y$10$49nBrKsf0x8kg9WS8mwiK.Y.Lv9oNBHnIiJYErlhYv62OCjjeBqFS'),
(13, 'dokter2', 'dokter2', '2222222222', 7, '2', '$2y$10$qgqAlpbovP8E6890qui1fOn2WKXkyEIB8sNFalmds3DNDqvpCZQcu'),
(14, 'dokter3', 'dokter3', '3333333333', 8, '3', '$2y$10$tbxksAQjUX7tHPqZTaeAz.YvNYo9amxzqHw6LGgy5XPDDg/0w9Oq2'),
(15, 'dokter4', 'dokter4', '444444444', 9, '4', '$2y$10$ZLiemb6CigjQJt2D3RO/T.NhOG/huaStljfDtlwVmaBn7/oPw0bE.'),
(16, 'dokter5', 'dokter5', '555555555', 10, '5', '$2y$10$h3Q06tF3I9C5CdjKF1DYlexpOOz9ZbIRHenoeoUxP00l5nOLNEk9O'),
(17, 'dokter6', 'dokter6', '6666666', 11, '6', '$2y$10$cOUm4k/eu7VX2hu7eQx2xuXePphlUSef9CTljzbIu46/d1ur1L0Ce'),
(18, 'dokter 11', 'dokter 11', '111111111', 6, '11', '$2y$10$WbIJI0usc.rarKylq37A.OmQxa1Zh5dPhUofmQxvRLIOkJoMs/OgC');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_periksa`
--

CREATE TABLE `jadwal_periksa` (
  `id` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu') NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_periksa`
--

INSERT INTO `jadwal_periksa` (`id`, `id_dokter`, `hari`, `jam_mulai`, `jam_selesai`) VALUES
(5, 12, 'Senin', '07:00:00', '17:47:00'),
(6, 13, 'Selasa', '15:46:00', '16:47:00'),
(7, 14, 'Rabu', '15:46:00', '21:53:00'),
(8, 15, 'Kamis', '13:13:00', '13:23:00'),
(9, 16, 'Jumat', '14:14:00', '14:24:00'),
(10, 17, 'Sabtu', '16:16:00', '16:26:00'),
(61, 18, 'Selasa', '14:15:00', '15:16:00');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` int(11) NOT NULL,
  `nama_obat` varchar(100) NOT NULL,
  `kemasan` varchar(50) NOT NULL,
  `harga` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `nama_obat`, `kemasan`, `harga`) VALUES
(1, 'promag', 'strip', 121212),
(2, 'oskadon', 'karung', 10000),
(3, 'paramek', 'plastik', 12000);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id` int(11) NOT NULL,
  `nama_pasien` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_ktp` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `no_rm` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id`, `nama_pasien`, `alamat`, `no_ktp`, `no_hp`, `no_rm`) VALUES
(30, 'pasien1', 'Karangjati', '3322130805020001', '089636749911', '2023121'),
(31, 'pasien2', 'Bergas', '3322113322113322', '089636636911', '20240131'),
(32, 'pasien3', 'Semarang', '3322113322113321', '089765432123', '20240132'),
(33, 'Pasien Baru', 'Karangjati Bergas', '1234123412341234', '123132123123', '20240133');

-- --------------------------------------------------------

--
-- Table structure for table `periksa`
--

CREATE TABLE `periksa` (
  `id` int(11) NOT NULL,
  `id_daftar_poli` int(11) NOT NULL,
  `tgl_periksa` datetime NOT NULL,
  `catatan` text NOT NULL,
  `biaya_periksa` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `periksa`
--

INSERT INTO `periksa` (`id`, `id_daftar_poli`, `tgl_periksa`, `catatan`, `biaya_periksa`) VALUES
(3, 28, '2024-01-05 00:00:00', 'catatatata', 281212),
(4, 28, '2024-01-05 00:00:00', 'catatatata', 162000),
(5, 29, '2024-01-05 00:00:00', 'qweqe', 160000),
(6, 29, '2024-01-05 00:00:00', 'qweqe', 160000),
(7, 29, '2024-01-05 00:00:00', 'werwer', 162000),
(8, 29, '2024-01-05 00:00:00', 'terter', 271212),
(9, 31, '2024-01-05 00:00:00', 'cek1', 0),
(10, 31, '2024-01-05 00:00:00', 'cek123', 271212),
(11, 31, '2024-01-05 00:00:00', 'cek13232', 281212),
(12, 31, '2024-01-05 00:00:00', 'cek1', 271212),
(13, 30, '2024-01-05 00:00:00', 'teretere', 293212);

-- --------------------------------------------------------

--
-- Table structure for table `poli`
--

CREATE TABLE `poli` (
  `id` int(11) NOT NULL,
  `nama_poli` varchar(25) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `poli`
--

INSERT INTO `poli` (`id`, `nama_poli`, `keterangan`) VALUES
(6, 'poli1', 'poli1'),
(7, 'poli2', 'poli2'),
(8, 'poli3', 'poli3'),
(9, 'poli4', 'poli4'),
(10, 'poli5', 'poli5'),
(11, 'poli6', 'poli6');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `sandi_adm` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `sandi_adm`) VALUES
(2, '', 'admin', '$2y$10$4OtDb/8H9JuEvxPcLqnWt.g.uUSpupJGJkU7WUGoiTQbKinxtUkmS'),
(3, '', 'adminbaru', '$2y$10$qckEk6AOrt8XoDLq8FOFM.89VRPTrp/srhtPmPvgF.7MCyZNiN4i2'),
(4, '', 'admin1', '$2y$10$sf7g5t50iyzUColXzbPjQOFc.xsXqP0WFxKa5cJhyHoTUj2MKj5XW');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_jadwal` (`id_jadwal`),
  ADD KEY `daftar_poli_ibfk_1` (`id_pasien`);

--
-- Indexes for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detail_periksa_obat` (`id_obat`),
  ADD KEY `id_periksa` (`id_periksa`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dokter_ibfk_1` (`id_poli`);

--
-- Indexes for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `periksa`
--
ALTER TABLE `periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_daftar_poli` (`id_daftar_poli`);

--
-- Indexes for table `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `periksa`
--
ALTER TABLE `periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `poli`
--
ALTER TABLE `poli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD CONSTRAINT `daftar_poli_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id`),
  ADD CONSTRAINT `daftar_poli_ibfk_2` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal_periksa` (`id`);

--
-- Constraints for table `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD CONSTRAINT `detail_periksa_ibfk_1` FOREIGN KEY (`id_periksa`) REFERENCES `periksa` (`id`),
  ADD CONSTRAINT `fk_detail_periksa_obat` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`);

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `dokter_ibfk_1` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id`);

--
-- Constraints for table `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD CONSTRAINT `jadwal_periksa_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`);

--
-- Constraints for table `periksa`
--
ALTER TABLE `periksa`
  ADD CONSTRAINT `periksa_ibfk_1` FOREIGN KEY (`id_daftar_poli`) REFERENCES `daftar_poli` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
