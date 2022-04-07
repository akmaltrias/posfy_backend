-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2022 at 06:53 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_posfy`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ins_barang_masuk` (IN `inkode_barang` CHAR(13), IN `inid_barang` CHAR(36), IN `inid_barang_masuk` CHAR(36), IN `inkadaluwarsa` DATE, IN `inharga_beli` BIGINT(10), IN `injumlah_masuk` INT(10))  NO SQL
BEGIN
DECLARE c_kode_barang CHARACTER (13);
SELECT kode_barang INTO c_kode_barang FROM detail_barang WHERE kode_barang = inkode_barang;
IF inkode_barang = c_kode_barang THEN
INSERT INTO detail_barang_masuk (kode_barang, id_barang_masuk, jumlah_masuk, harga_beli) VALUES (inkode_barang, inid_barang_masuk, injumlah_masuk, inharga_beli);
ELSE
	INSERT INTO detail_barang (kode_barang, id_barang, kadaluwarsa, stok) VALUES (inkode_barang, inid_barang, inkadaluwarsa, 0);
    INSERT INTO detail_barang_masuk (kode_barang, id_barang_masuk, jumlah_masuk, harga_beli) VALUES (inkode_barang, inid_barang_masuk, injumlah_masuk, inharga_beli);
    END IF;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `id_transaksi` () RETURNS CHAR(15) CHARSET utf8mb4 NO SQL
BEGIN
DECLARE id_max CHARACTER (15);
DECLARE id_angka INT (5);
DECLARE id_nomor INT (5);
DECLARE id_baru CHARACTER (15);
DECLARE tgl CHARACTER (10);

SELECT MAX(id_transaksi) INTO id_max FROM transaksi WHERE  DATE(tgl_transaksi) = CURRENT_DATE();

SELECT DATE_FORMAT(CURRENT_DATE(), '%d/%m/%Y') INTO tgl;
SET id_nomor = SUBSTR(id_max,12,4);

IF id_max THEN
SET id_angka = id_nomor + 1;
ELSE SET id_angka = 1;
END IF;

SET id_baru = CONCAT(tgl,'/', LPAD(id_angka, 4, 0));
    RETURN id_baru;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` char(36) NOT NULL,
  `id_user` char(36) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_telp` varchar(14) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `id_user`, `nama`, `no_telp`, `alamat`) VALUES
('a318bc7d-a1ae-11ec-9f11-84a93eb597a8', '47c7bea5-9886-11ec-af56-14cb1973e3b2', 'Posfy Admin', '01234567890', 'JL. Bintara 8 No. 2');

-- --------------------------------------------------------

--
-- Table structure for table `angkatan`
--

CREATE TABLE `angkatan` (
  `id_angkatan` char(36) NOT NULL,
  `tahun_angkatan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `angkatan`
--

INSERT INTO `angkatan` (`id_angkatan`, `tahun_angkatan`) VALUES
('9ff9e4fc-9884-11ec-af56-14cb1973e3b2', '2019/2020'),
('9ff9fd30-9884-11ec-af56-14cb1973e3b2', '2020/2021');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` char(36) NOT NULL,
  `id_user` char(36) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `harga_jual` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `id_user`, `nama_barang`, `harga_jual`) VALUES
('1926c005-989b-11ec-af56-14cb1973e3b2', '0470eb28-9886-11ec-af56-14cb1973e3b2', 'Fanta', 5000),
('4da54480-5753-456e-9191-27c9ed2cc028', '0470eb28-9886-11ec-af56-14cb1973e3b2', 'Sari Gandum', 2000),
('7e3ccabc-9894-11ec-af56-14cb1973e3b2', '0470eb28-9886-11ec-af56-14cb1973e3b2', 'Frestea', 6000);

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id_barang_masuk` char(36) NOT NULL,
  `id_supplier` char(36) NOT NULL,
  `tgl_masuk` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang_masuk`
--

INSERT INTO `barang_masuk` (`id_barang_masuk`, `id_supplier`, `tgl_masuk`) VALUES
('0f88c21c-9896-11ec-af56-14cb1973e3b2', 'b81f2b64-9886-11ec-af56-14cb1973e3b2', '2022-02-28 19:57:25'),
('8b1438d0-98f7-11ec-89f5-ace2d3504277', 'b81f2b64-9886-11ec-af56-14cb1973e3b2', '2022-03-03 07:35:19');

-- --------------------------------------------------------

--
-- Table structure for table `detail_barang`
--

CREATE TABLE `detail_barang` (
  `kode_barang` char(13) NOT NULL,
  `id_barang` char(36) NOT NULL,
  `kadaluwarsa` date NOT NULL,
  `stok` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_barang`
--

INSERT INTO `detail_barang` (`kode_barang`, `id_barang`, `kadaluwarsa`, `stok`) VALUES
('8992761122234', '1926c005-989b-11ec-af56-14cb1973e3b2', '2023-08-28', 0),
('8992761122347', '7e3ccabc-9894-11ec-af56-14cb1973e3b2', '2023-01-30', 0),
('8992761122348', '7e3ccabc-9894-11ec-af56-14cb1973e3b2', '2023-02-28', 8),
('8992761122349', '7e3ccabc-9894-11ec-af56-14cb1973e3b2', '2023-02-28', 20),
('8992761122350', '7e3ccabc-9894-11ec-af56-14cb1973e3b2', '2023-03-30', 20);

-- --------------------------------------------------------

--
-- Table structure for table `detail_barang_masuk`
--

CREATE TABLE `detail_barang_masuk` (
  `kode_barang` char(13) NOT NULL,
  `id_barang_masuk` char(36) NOT NULL,
  `jumlah_masuk` int(10) NOT NULL,
  `harga_beli` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_barang_masuk`
--

INSERT INTO `detail_barang_masuk` (`kode_barang`, `id_barang_masuk`, `jumlah_masuk`, `harga_beli`) VALUES
('8992761122348', '0f88c21c-9896-11ec-af56-14cb1973e3b2', 5, 5500),
('8992761122234', '0f88c21c-9896-11ec-af56-14cb1973e3b2', 5, 4500),
('8992761122348', '8b1438d0-98f7-11ec-89f5-ace2d3504277', 10, 5500),
('8992761122347', '8b1438d0-98f7-11ec-89f5-ace2d3504277', 7, 5500),
('8992761122349', '8b1438d0-98f7-11ec-89f5-ace2d3504277', 3, 8800),
('8992761122349', '8b1438d0-98f7-11ec-89f5-ace2d3504277', 10, 8800),
('8992761122349', '8b1438d0-98f7-11ec-89f5-ace2d3504277', 7, 8800),
('8992761122350', '8b1438d0-98f7-11ec-89f5-ace2d3504277', 20, 2100);

--
-- Triggers `detail_barang_masuk`
--
DELIMITER $$
CREATE TRIGGER `barang_after_barang_masuk` AFTER INSERT ON `detail_barang_masuk` FOR EACH ROW UPDATE detail_barang
SET
stok = stok + NEW.jumlah_masuk
WHERE
kode_barang = new.kode_barang
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_transaksi` char(15) NOT NULL,
  `kode_barang` char(13) NOT NULL,
  `qty` int(5) NOT NULL,
  `harga_jual` bigint(10) NOT NULL,
  `total_beli` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_transaksi`, `kode_barang`, `qty`, `harga_jual`, `total_beli`) VALUES
('04/03/2022/0001', '8992761122348', 5, 6000, 30000),
('25/03/2022/0001', '8992761122348', 1, 6000, 6000),
('25/03/2022/0001', '8992761122234', 2, 5000, 10000),
('25/03/2022/0002', '8992761122348', 1, 6000, 6000),
('25/03/2022/0002', '8992761122234', 3, 5000, 15000);

--
-- Triggers `detail_transaksi`
--
DELIMITER $$
CREATE TRIGGER `after_insert_det_trans` AFTER INSERT ON `detail_transaksi` FOR EACH ROW UPDATE detail_barang
SET
stok = stok - NEW.qty
WHERE
kode_barang = new.kode_barang
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` char(36) NOT NULL,
  `akronim` varchar(5) NOT NULL,
  `nama_jurusan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `akronim`, `nama_jurusan`) VALUES
('ae82af69-9884-11ec-af56-14cb1973e3b2', 'AK', 'Akuntansi');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` char(36) NOT NULL,
  `id_angkatan` char(36) NOT NULL,
  `id_jurusan` char(36) NOT NULL,
  `tingkatan` enum('10','11','12','') NOT NULL,
  `rombel` enum('A','B','C','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `id_angkatan`, `id_jurusan`, `tingkatan`, `rombel`) VALUES
('e6f60ab3-9884-11ec-af56-14cb1973e3b2', '9ff9e4fc-9884-11ec-af56-14cb1973e3b2', 'ae82af69-9884-11ec-af56-14cb1973e3b2', '12', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `level_user`
--

CREATE TABLE `level_user` (
  `id_level` char(36) NOT NULL,
  `peran` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `level_user`
--

INSERT INTO `level_user` (`id_level`, `peran`) VALUES
('5a2ca976-9885-11ec-af56-14cb1973e3b2', 'kasir'),
('5a2cb85e-9885-11ec-af56-14cb1973e3b2', 'admin'),
('62956bdb-9885-11ec-af56-14cb1973e3b2', 'owner');

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `id_owner` char(36) NOT NULL,
  `id_user` char(36) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_telp` varchar(14) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`id_owner`, `id_user`, `nama`, `no_telp`, `alamat`) VALUES
('2a3ebdef-9886-11ec-af56-14cb1973e3b2', '0470eb28-9886-11ec-af56-14cb1973e3b2', 'SMK Negeri 1 Kota Bekasi', '0212121314211', 'JL. Bintara 8 No. 2');

-- --------------------------------------------------------

--
-- Stand-in structure for view `riwayat_transaksi`
-- (See below for the actual view)
--
CREATE TABLE `riwayat_transaksi` (
`id_transaksi` char(15)
,`kasir` varchar(100)
,`total_belanja` decimal(41,0)
,`tgl_trans` varchar(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` char(36) NOT NULL,
  `id_user` char(36) NOT NULL,
  `id_kelas` char(36) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_telp` varchar(14) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `id_user`, `id_kelas`, `nama`, `no_telp`, `alamat`) VALUES
('e3a8e64c-9885-11ec-af56-14cb1973e3b2', '98d25baf-9885-11ec-af56-14cb1973e3b2', 'e6f60ab3-9884-11ec-af56-14cb1973e3b2', 'Fatimatul Ayunda', '081382414131', 'JL. Depkes 10 RT01/03 No. 42 ');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` char(36) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_telp` varchar(14) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama`, `no_telp`, `alamat`) VALUES
('27bdc28f-6fc6-41df-8561-d7ab289232b7', 'Indogrosir Bekasi', '021-88863228', 'Jalan Baru Terusan I Gusti Ngurahrai\nRT 11/ RW 12\n(500 m Timur Stasiun Cakung)\nBintara, Bekasi Barat,\nBekasi 17134'),
('b81f2b64-9886-11ec-af56-14cb1973e3b2', 'Toko Budi Sejahtera', '085612345678', 'JL. Letnan Arsyad No. 52 RT04/24'),
('bd914eeb-df23-4513-9ac8-d06ba4623d21', 'Toko Amriya Bintara', '0812345678910', 'Jalan Griya Bintara Blok A No. 89 RT03/23');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` char(15) NOT NULL,
  `id_user` char(36) NOT NULL,
  `tgl_transaksi` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_user`, `tgl_transaksi`) VALUES
('04/03/2022/0001', '98d25baf-9885-11ec-af56-14cb1973e3b2', '2022-03-04 11:16:56'),
('25/03/2022/0001', '47c7bea5-9886-11ec-af56-14cb1973e3b2', '2022-03-25 00:45:45'),
('25/03/2022/0002', '47c7bea5-9886-11ec-af56-14cb1973e3b2', '2022-03-25 03:56:32');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` char(36) NOT NULL,
  `id_level` char(36) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `id_level`, `username`, `password`, `status`) VALUES
('0470eb28-9886-11ec-af56-14cb1973e3b2', '62956bdb-9885-11ec-af56-14cb1973e3b2', 'smkn1kotabekasi', '$2y$10$GvbD30YPQoQEEKtCx5zPt.RFY6UQi9UCPuUh2Vhes5XThnEPNp1Gm', 1),
('47c7bea5-9886-11ec-af56-14cb1973e3b2', '5a2cb85e-9885-11ec-af56-14cb1973e3b2', 'admin', '$2b$10$P3zaL7e2Qgbt/axXv2kpmuvRh54tCZRu8fc0vN3PSXspEZ1.YRV4O', 1),
('98d25baf-9885-11ec-af56-14cb1973e3b2', '5a2ca976-9885-11ec-af56-14cb1973e3b2', 'fatimatulayundamantul', '$2y$10$0zZzVUP80lRnMrRSASoSvOmfHbeGTW6qDe/nxL.REht56sZaiVzO6', 1),
('b80ae469-de88-4a92-9642-557e375e5086', '5a2ca976-9885-11ec-af56-14cb1973e3b2', 'haloakmal', '$2b$10$2h6V4AKA/hQDrrbrzeSV7uufbat8b42n9Ip4v6vZPCoeZv/UcCfZ6', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_barang_detail`
-- (See below for the actual view)
--
CREATE TABLE `view_barang_detail` (
`id_barang` char(36)
,`nama_barang` varchar(100)
,`kadaluwarsa` date
,`stok` int(10)
,`kode_barang` char(13)
,`harga_jual` bigint(10)
,`id_user` char(36)
,`nama_owner` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_detail_transaksi`
-- (See below for the actual view)
--
CREATE TABLE `view_detail_transaksi` (
`id_transaksi` char(15)
,`kode_barang` char(13)
,`qty` int(5)
,`harga_jual` bigint(10)
,`nama_barang` varchar(100)
);

-- --------------------------------------------------------

--
-- Structure for view `riwayat_transaksi`
--
DROP TABLE IF EXISTS `riwayat_transaksi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `riwayat_transaksi`  AS SELECT `t`.`id_transaksi` AS `id_transaksi`, `u`.`username` AS `kasir`, sum(`dtrans`.`total_beli`) AS `total_belanja`, date_format(`t`.`tgl_transaksi`,'%d/%m/%Y') AS `tgl_trans` FROM ((`transaksi` `t` join `user` `u` on(`u`.`id_user` = `t`.`id_user`)) join `detail_transaksi` `dtrans` on(`dtrans`.`id_transaksi` = `t`.`id_transaksi`)) GROUP BY `t`.`id_transaksi` ;

-- --------------------------------------------------------

--
-- Structure for view `view_barang_detail`
--
DROP TABLE IF EXISTS `view_barang_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_barang_detail`  AS SELECT `bar`.`id_barang` AS `id_barang`, `bar`.`nama_barang` AS `nama_barang`, `detbarang`.`kadaluwarsa` AS `kadaluwarsa`, `detbarang`.`stok` AS `stok`, `detbarang`.`kode_barang` AS `kode_barang`, `bar`.`harga_jual` AS `harga_jual`, `bar`.`id_user` AS `id_user`, `ow`.`nama` AS `nama_owner` FROM ((`detail_barang` `detbarang` join `barang` `bar` on(`detbarang`.`id_barang` = `bar`.`id_barang`)) join `owner` `ow` on(`bar`.`id_user` = `ow`.`id_user`)) ;

-- --------------------------------------------------------

--
-- Structure for view `view_detail_transaksi`
--
DROP TABLE IF EXISTS `view_detail_transaksi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_detail_transaksi`  AS SELECT `dt`.`id_transaksi` AS `id_transaksi`, `dt`.`kode_barang` AS `kode_barang`, `dt`.`qty` AS `qty`, `dt`.`harga_jual` AS `harga_jual`, `b`.`nama_barang` AS `nama_barang` FROM ((`detail_transaksi` `dt` join `detail_barang` `db` on(`db`.`kode_barang` = `dt`.`kode_barang`)) join `barang` `b` on(`b`.`id_barang` = `db`.`id_barang`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `angkatan`
--
ALTER TABLE `angkatan`
  ADD PRIMARY KEY (`id_angkatan`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id_barang_masuk`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indexes for table `detail_barang`
--
ALTER TABLE `detail_barang`
  ADD PRIMARY KEY (`kode_barang`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `detail_barang_masuk`
--
ALTER TABLE `detail_barang_masuk`
  ADD KEY `id_barang_masuk` (`id_barang_masuk`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `id_angkatan` (`id_angkatan`),
  ADD KEY `id_jurusan` (`id_jurusan`);

--
-- Indexes for table `level_user`
--
ALTER TABLE `level_user`
  ADD PRIMARY KEY (`id_level`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`id_owner`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_level` (`id_level`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD CONSTRAINT `barang_masuk_ibfk_1` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`);

--
-- Constraints for table `detail_barang`
--
ALTER TABLE `detail_barang`
  ADD CONSTRAINT `detail_barang_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Constraints for table `detail_barang_masuk`
--
ALTER TABLE `detail_barang_masuk`
  ADD CONSTRAINT `detail_barang_masuk_ibfk_1` FOREIGN KEY (`id_barang_masuk`) REFERENCES `barang_masuk` (`id_barang_masuk`),
  ADD CONSTRAINT `detail_barang_masuk_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `detail_barang` (`kode_barang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `detail_barang` (`kode_barang`),
  ADD CONSTRAINT `detail_transaksi_ibfk_3` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`);

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`id_angkatan`) REFERENCES `angkatan` (`id_angkatan`),
  ADD CONSTRAINT `kelas_ibfk_2` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`);

--
-- Constraints for table `owner`
--
ALTER TABLE `owner`
  ADD CONSTRAINT `owner_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`),
  ADD CONSTRAINT `siswa_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level_user` (`id_level`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
