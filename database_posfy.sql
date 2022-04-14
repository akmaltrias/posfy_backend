/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100422
 Source Host           : localhost:3306
 Source Schema         : database_posfy

 Target Server Type    : MySQL
 Target Server Version : 100422
 File Encoding         : 65001

 Date: 14/04/2022 09:48:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id_admin` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_user` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_telp` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_admin`) USING BTREE,
  INDEX `id_user`(`id_user`) USING BTREE,
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a318bc7d-a1ae-11ec-9f11-84a93eb597a8', '47c7bea5-9886-11ec-af56-14cb1973e3b2', 'Posfy Admin', '01234567890', 'JL. Bintara 8 No. 2');

-- ----------------------------
-- Table structure for angkatan
-- ----------------------------
DROP TABLE IF EXISTS `angkatan`;
CREATE TABLE `angkatan`  (
  `id_angkatan` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tahun_angkatan` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_angkatan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of angkatan
-- ----------------------------
INSERT INTO `angkatan` VALUES ('9ff9e4fc-9884-11ec-af56-14cb1973e3b2', '2019/2020');
INSERT INTO `angkatan` VALUES ('9ff9fd30-9884-11ec-af56-14cb1973e3b2', '2020/2021');

-- ----------------------------
-- Table structure for barang
-- ----------------------------
DROP TABLE IF EXISTS `barang`;
CREATE TABLE `barang`  (
  `id_barang` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_user` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_barang` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `harga_jual` bigint NOT NULL,
  PRIMARY KEY (`id_barang`) USING BTREE,
  INDEX `id_user`(`id_user`) USING BTREE,
  CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of barang
-- ----------------------------
INSERT INTO `barang` VALUES ('1926c005-989b-11ec-af56-14cb1973e3b2', '0470eb28-9886-11ec-af56-14cb1973e3b2', 'Fanta', 5000);
INSERT INTO `barang` VALUES ('4da54480-5753-456e-9191-27c9ed2cc028', '0470eb28-9886-11ec-af56-14cb1973e3b2', 'Sari Gandum', 2000);
INSERT INTO `barang` VALUES ('7e3ccabc-9894-11ec-af56-14cb1973e3b2', '0470eb28-9886-11ec-af56-14cb1973e3b2', 'Frestea', 6000);
INSERT INTO `barang` VALUES ('a5c18729-a3f4-4cf2-99e2-baee78ffc5d0', '0470eb28-9886-11ec-af56-14cb1973e3b2', 'Susu Ultra Coklat 250ml', 5000);

-- ----------------------------
-- Table structure for barang_masuk
-- ----------------------------
DROP TABLE IF EXISTS `barang_masuk`;
CREATE TABLE `barang_masuk`  (
  `id_barang_masuk` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_supplier` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tgl_masuk` datetime NOT NULL,
  PRIMARY KEY (`id_barang_masuk`) USING BTREE,
  INDEX `id_supplier`(`id_supplier`) USING BTREE,
  CONSTRAINT `barang_masuk_ibfk_1` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of barang_masuk
-- ----------------------------
INSERT INTO `barang_masuk` VALUES ('0f88c21c-9896-11ec-af56-14cb1973e3b2', 'b81f2b64-9886-11ec-af56-14cb1973e3b2', '2022-02-28 19:57:25');
INSERT INTO `barang_masuk` VALUES ('8b1438d0-98f7-11ec-89f5-ace2d3504277', 'b81f2b64-9886-11ec-af56-14cb1973e3b2', '2022-03-03 07:35:19');
INSERT INTO `barang_masuk` VALUES ('9704480a-aeaa-4274-9300-347d9e565382', 'b81f2b64-9886-11ec-af56-14cb1973e3b2', '2022-04-07 08:39:53');

-- ----------------------------
-- Table structure for detail_barang
-- ----------------------------
DROP TABLE IF EXISTS `detail_barang`;
CREATE TABLE `detail_barang`  (
  `kode_barang` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_barang` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kadaluwarsa` date NOT NULL,
  `stok` int NOT NULL,
  PRIMARY KEY (`kode_barang`) USING BTREE,
  INDEX `id_barang`(`id_barang`) USING BTREE,
  CONSTRAINT `detail_barang_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detail_barang
-- ----------------------------
INSERT INTO `detail_barang` VALUES ('8029472936985', '4da54480-5753-456e-9191-27c9ed2cc028', '2023-01-28', 5);
INSERT INTO `detail_barang` VALUES ('8029472938123', '1926c005-989b-11ec-af56-14cb1973e3b2', '2025-03-28', 5);
INSERT INTO `detail_barang` VALUES ('8029472938663', 'a5c18729-a3f4-4cf2-99e2-baee78ffc5d0', '2024-02-28', 5);
INSERT INTO `detail_barang` VALUES ('8992761122234', '1926c005-989b-11ec-af56-14cb1973e3b2', '2023-08-28', 0);
INSERT INTO `detail_barang` VALUES ('8992761122347', '7e3ccabc-9894-11ec-af56-14cb1973e3b2', '2023-01-30', 0);
INSERT INTO `detail_barang` VALUES ('8992761122348', '7e3ccabc-9894-11ec-af56-14cb1973e3b2', '2023-02-28', 8);
INSERT INTO `detail_barang` VALUES ('8992761122349', '7e3ccabc-9894-11ec-af56-14cb1973e3b2', '2023-02-28', 20);
INSERT INTO `detail_barang` VALUES ('8992761122350', '7e3ccabc-9894-11ec-af56-14cb1973e3b2', '2023-03-30', 20);

-- ----------------------------
-- Table structure for detail_barang_masuk
-- ----------------------------
DROP TABLE IF EXISTS `detail_barang_masuk`;
CREATE TABLE `detail_barang_masuk`  (
  `kode_barang` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_barang_masuk` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jumlah_masuk` int NOT NULL,
  `harga_beli` bigint NOT NULL,
  INDEX `id_barang_masuk`(`id_barang_masuk`) USING BTREE,
  INDEX `kode_barang`(`kode_barang`) USING BTREE,
  CONSTRAINT `detail_barang_masuk_ibfk_1` FOREIGN KEY (`id_barang_masuk`) REFERENCES `barang_masuk` (`id_barang_masuk`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `detail_barang_masuk_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `detail_barang` (`kode_barang`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detail_barang_masuk
-- ----------------------------
INSERT INTO `detail_barang_masuk` VALUES ('8992761122348', '0f88c21c-9896-11ec-af56-14cb1973e3b2', 5, 5500);
INSERT INTO `detail_barang_masuk` VALUES ('8992761122234', '0f88c21c-9896-11ec-af56-14cb1973e3b2', 5, 4500);
INSERT INTO `detail_barang_masuk` VALUES ('8992761122348', '8b1438d0-98f7-11ec-89f5-ace2d3504277', 10, 5500);
INSERT INTO `detail_barang_masuk` VALUES ('8992761122347', '8b1438d0-98f7-11ec-89f5-ace2d3504277', 7, 5500);
INSERT INTO `detail_barang_masuk` VALUES ('8992761122349', '8b1438d0-98f7-11ec-89f5-ace2d3504277', 3, 8800);
INSERT INTO `detail_barang_masuk` VALUES ('8992761122349', '8b1438d0-98f7-11ec-89f5-ace2d3504277', 10, 8800);
INSERT INTO `detail_barang_masuk` VALUES ('8992761122349', '8b1438d0-98f7-11ec-89f5-ace2d3504277', 7, 8800);
INSERT INTO `detail_barang_masuk` VALUES ('8992761122350', '8b1438d0-98f7-11ec-89f5-ace2d3504277', 20, 2100);
INSERT INTO `detail_barang_masuk` VALUES ('8029472938663', '9704480a-aeaa-4274-9300-347d9e565382', 5, 4500);
INSERT INTO `detail_barang_masuk` VALUES ('8029472938123', '9704480a-aeaa-4274-9300-347d9e565382', 5, 3800);
INSERT INTO `detail_barang_masuk` VALUES ('8029472936985', '9704480a-aeaa-4274-9300-347d9e565382', 5, 3600);

-- ----------------------------
-- Table structure for detail_transaksi
-- ----------------------------
DROP TABLE IF EXISTS `detail_transaksi`;
CREATE TABLE `detail_transaksi`  (
  `id_transaksi` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kode_barang` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `qty` int NOT NULL,
  `harga_jual` bigint NOT NULL,
  `total_beli` bigint NOT NULL,
  INDEX `id_transaksi`(`id_transaksi`) USING BTREE,
  INDEX `kode_barang`(`kode_barang`) USING BTREE,
  CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `detail_barang` (`kode_barang`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `detail_transaksi_ibfk_3` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detail_transaksi
-- ----------------------------
INSERT INTO `detail_transaksi` VALUES ('04/03/2022/0001', '8992761122348', 5, 6000, 30000);
INSERT INTO `detail_transaksi` VALUES ('25/03/2022/0001', '8992761122348', 1, 6000, 6000);
INSERT INTO `detail_transaksi` VALUES ('25/03/2022/0001', '8992761122234', 2, 5000, 10000);
INSERT INTO `detail_transaksi` VALUES ('25/03/2022/0002', '8992761122348', 1, 6000, 6000);
INSERT INTO `detail_transaksi` VALUES ('25/03/2022/0002', '8992761122234', 3, 5000, 15000);

-- ----------------------------
-- Table structure for jurusan
-- ----------------------------
DROP TABLE IF EXISTS `jurusan`;
CREATE TABLE `jurusan`  (
  `id_jurusan` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `akronim` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_jurusan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_jurusan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jurusan
-- ----------------------------
INSERT INTO `jurusan` VALUES ('ae82af69-9884-11ec-af56-14cb1973e3b2', 'AK', 'Akuntansi');

-- ----------------------------
-- Table structure for kelas
-- ----------------------------
DROP TABLE IF EXISTS `kelas`;
CREATE TABLE `kelas`  (
  `id_kelas` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_angkatan` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_jurusan` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tingkatan` enum('10','11','12','') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rombel` enum('A','B','C','') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_kelas`) USING BTREE,
  INDEX `id_angkatan`(`id_angkatan`) USING BTREE,
  INDEX `id_jurusan`(`id_jurusan`) USING BTREE,
  CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`id_angkatan`) REFERENCES `angkatan` (`id_angkatan`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `kelas_ibfk_2` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kelas
-- ----------------------------
INSERT INTO `kelas` VALUES ('e6f60ab3-9884-11ec-af56-14cb1973e3b2', '9ff9e4fc-9884-11ec-af56-14cb1973e3b2', 'ae82af69-9884-11ec-af56-14cb1973e3b2', '12', 'A');

-- ----------------------------
-- Table structure for level_user
-- ----------------------------
DROP TABLE IF EXISTS `level_user`;
CREATE TABLE `level_user`  (
  `id_level` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `peran` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_level`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of level_user
-- ----------------------------
INSERT INTO `level_user` VALUES ('5a2ca976-9885-11ec-af56-14cb1973e3b2', 'kasir');
INSERT INTO `level_user` VALUES ('5a2cb85e-9885-11ec-af56-14cb1973e3b2', 'admin');
INSERT INTO `level_user` VALUES ('62956bdb-9885-11ec-af56-14cb1973e3b2', 'owner');

-- ----------------------------
-- Table structure for owner
-- ----------------------------
DROP TABLE IF EXISTS `owner`;
CREATE TABLE `owner`  (
  `id_owner` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_user` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_telp` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_owner`) USING BTREE,
  INDEX `id_user`(`id_user`) USING BTREE,
  CONSTRAINT `owner_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of owner
-- ----------------------------
INSERT INTO `owner` VALUES ('2a3ebdef-9886-11ec-af56-14cb1973e3b2', '0470eb28-9886-11ec-af56-14cb1973e3b2', 'SMK Negeri 1 Kota Bekasi', '0212121314211', 'JL. Bintara 8 No. 2');

-- ----------------------------
-- Table structure for siswa
-- ----------------------------
DROP TABLE IF EXISTS `siswa`;
CREATE TABLE `siswa`  (
  `id_siswa` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_user` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_kelas` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_telp` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_siswa`) USING BTREE,
  INDEX `id_kelas`(`id_kelas`) USING BTREE,
  INDEX `id_user`(`id_user`) USING BTREE,
  CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `siswa_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of siswa
-- ----------------------------
INSERT INTO `siswa` VALUES ('e3a8e64c-9885-11ec-af56-14cb1973e3b2', '98d25baf-9885-11ec-af56-14cb1973e3b2', 'e6f60ab3-9884-11ec-af56-14cb1973e3b2', 'Fatimatul Ayunda', '081382414131', 'JL. Depkes 10 RT01/03 No. 42 ');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `id_supplier` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_telp` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_supplier`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('27bdc28f-6fc6-41df-8561-d7ab289232b7', 'Indogrosir Bekasi', '021-88863228', 'Jalan Baru Terusan I Gusti Ngurahrai\nRT 11/ RW 12\n(500 m Timur Stasiun Cakung)\nBintara, Bekasi Barat,\nBekasi 17134');
INSERT INTO `supplier` VALUES ('b81f2b64-9886-11ec-af56-14cb1973e3b2', 'Toko Budi Sejahtera', '085612345678', 'JL. Letnan Arsyad No. 52 RT04/24');
INSERT INTO `supplier` VALUES ('bd914eeb-df23-4513-9ac8-d06ba4623d21', 'Toko Amriya Bintara', '0812345678910', 'Jalan Griya Bintara Blok A No. 89 RT03/23');

-- ----------------------------
-- Table structure for transaksi
-- ----------------------------
DROP TABLE IF EXISTS `transaksi`;
CREATE TABLE `transaksi`  (
  `id_transaksi` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_user` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tgl_transaksi` datetime NOT NULL,
  PRIMARY KEY (`id_transaksi`) USING BTREE,
  INDEX `id_user`(`id_user`) USING BTREE,
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transaksi
-- ----------------------------
INSERT INTO `transaksi` VALUES ('04/03/2022/0001', '98d25baf-9885-11ec-af56-14cb1973e3b2', '2022-03-04 11:16:56');
INSERT INTO `transaksi` VALUES ('25/03/2022/0001', '47c7bea5-9886-11ec-af56-14cb1973e3b2', '2022-03-25 00:45:45');
INSERT INTO `transaksi` VALUES ('25/03/2022/0002', '47c7bea5-9886-11ec-af56-14cb1973e3b2', '2022-03-25 03:56:32');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id_user` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_level` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_user`) USING BTREE,
  INDEX `id_level`(`id_level`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level_user` (`id_level`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0470eb28-9886-11ec-af56-14cb1973e3b2', '62956bdb-9885-11ec-af56-14cb1973e3b2', 'smkn1kotabekasi', '$2y$10$GvbD30YPQoQEEKtCx5zPt.RFY6UQi9UCPuUh2Vhes5XThnEPNp1Gm', 1);
INSERT INTO `user` VALUES ('47c7bea5-9886-11ec-af56-14cb1973e3b2', '5a2cb85e-9885-11ec-af56-14cb1973e3b2', 'admin', '$2b$10$P3zaL7e2Qgbt/axXv2kpmuvRh54tCZRu8fc0vN3PSXspEZ1.YRV4O', 1);
INSERT INTO `user` VALUES ('98d25baf-9885-11ec-af56-14cb1973e3b2', '5a2ca976-9885-11ec-af56-14cb1973e3b2', 'fatimatulayundamantul', '$2y$10$0zZzVUP80lRnMrRSASoSvOmfHbeGTW6qDe/nxL.REht56sZaiVzO6', 1);
INSERT INTO `user` VALUES ('b80ae469-de88-4a92-9642-557e375e5086', '5a2ca976-9885-11ec-af56-14cb1973e3b2', 'haloakmal', '$2b$10$2h6V4AKA/hQDrrbrzeSV7uufbat8b42n9Ip4v6vZPCoeZv/UcCfZ6', 1);

-- ----------------------------
-- View structure for riwayat_transaksi
-- ----------------------------
DROP VIEW IF EXISTS `riwayat_transaksi`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `riwayat_transaksi` AS SELECT `t`.`id_transaksi` AS `id_transaksi`, `u`.`username` AS `kasir`, sum(`dtrans`.`total_beli`) AS `total_belanja`, date_format(`t`.`tgl_transaksi`,'%d/%m/%Y') AS `tgl_trans` FROM ((`transaksi` `t` join `user` `u` on(`u`.`id_user` = `t`.`id_user`)) join `detail_transaksi` `dtrans` on(`dtrans`.`id_transaksi` = `t`.`id_transaksi`)) GROUP BY `t`.`id_transaksi` ; ;

-- ----------------------------
-- View structure for view_barang_detail
-- ----------------------------
DROP VIEW IF EXISTS `view_barang_detail`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_barang_detail` AS SELECT `bar`.`id_barang` AS `id_barang`, `bar`.`nama_barang` AS `nama_barang`, `detbarang`.`kadaluwarsa` AS `kadaluwarsa`, `detbarang`.`stok` AS `stok`, `detbarang`.`kode_barang` AS `kode_barang`, `bar`.`harga_jual` AS `harga_jual`, `bar`.`id_user` AS `id_user`, `ow`.`nama` AS `nama_owner` FROM ((`detail_barang` `detbarang` join `barang` `bar` on(`detbarang`.`id_barang` = `bar`.`id_barang`)) join `owner` `ow` on(`bar`.`id_user` = `ow`.`id_user`)) ; ;

-- ----------------------------
-- View structure for view_detail_transaksi
-- ----------------------------
DROP VIEW IF EXISTS `view_detail_transaksi`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_detail_transaksi` AS SELECT `dt`.`id_transaksi` AS `id_transaksi`, `dt`.`kode_barang` AS `kode_barang`, `dt`.`qty` AS `qty`, `dt`.`harga_jual` AS `harga_jual`, `b`.`nama_barang` AS `nama_barang` FROM ((`detail_transaksi` `dt` join `detail_barang` `db` on(`db`.`kode_barang` = `dt`.`kode_barang`)) join `barang` `b` on(`b`.`id_barang` = `db`.`id_barang`)) ; ;

-- ----------------------------
-- Function structure for id_transaksi
-- ----------------------------
DROP FUNCTION IF EXISTS `id_transaksi`;
delimiter ;;
CREATE FUNCTION `id_transaksi`()
 RETURNS char(15) CHARSET utf8mb4
  NO SQL 
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
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for ins_barang_masuk
-- ----------------------------
DROP PROCEDURE IF EXISTS `ins_barang_masuk`;
delimiter ;;
CREATE PROCEDURE `ins_barang_masuk`(IN `inkode_barang` CHAR(13), IN `inid_barang` CHAR(36), IN `inid_barang_masuk` CHAR(36), IN `inkadaluwarsa` DATE, IN `inharga_beli` BIGINT(10), IN `injumlah_masuk` INT(10))
  NO SQL 
BEGIN
DECLARE c_kode_barang CHARACTER (13);
SELECT kode_barang INTO c_kode_barang FROM detail_barang WHERE kode_barang = inkode_barang;
IF inkode_barang = c_kode_barang THEN
INSERT INTO detail_barang_masuk (kode_barang, id_barang_masuk, jumlah_masuk, harga_beli) VALUES (inkode_barang, inid_barang_masuk, injumlah_masuk, inharga_beli);
ELSE
	INSERT INTO detail_barang (kode_barang, id_barang, kadaluwarsa, stok) VALUES (inkode_barang, inid_barang, inkadaluwarsa, 0);
    INSERT INTO detail_barang_masuk (kode_barang, id_barang_masuk, jumlah_masuk, harga_beli) VALUES (inkode_barang, inid_barang_masuk, injumlah_masuk, inharga_beli);
    END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table detail_barang_masuk
-- ----------------------------
DROP TRIGGER IF EXISTS `barang_after_barang_masuk`;
delimiter ;;
CREATE TRIGGER `barang_after_barang_masuk` AFTER INSERT ON `detail_barang_masuk` FOR EACH ROW UPDATE detail_barang
SET
stok = stok + NEW.jumlah_masuk
WHERE
kode_barang = new.kode_barang
;
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table detail_transaksi
-- ----------------------------
DROP TRIGGER IF EXISTS `after_insert_det_trans`;
delimiter ;;
CREATE TRIGGER `after_insert_det_trans` AFTER INSERT ON `detail_transaksi` FOR EACH ROW UPDATE detail_barang
SET
stok = stok - NEW.qty
WHERE
kode_barang = new.kode_barang
;
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
