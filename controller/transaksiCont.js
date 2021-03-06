import sequelize from 'sequelize';
import db from '../config/database.js';
import model from '../model/index.js';
import moment from 'moment';

const controller = {};

controller.getTransaksi = async function (req, res) {
  try {
    const [transaksi] = await db.query('SELECT * FROM riwayat_transaksi WHERE tgl_trans = (:tgl_transaksi)', {
      replacements: { tgl_transaksi: req.body.tgl_transaksi },
    });

    if (transaksi.length > 0) {
      res.status(200).json({
        message: 'Data List Transaksi Ditemukan',
        data: transaksi,
      });
    } else {
      res.status(200).json({
        message: 'Data Tidak Ada',
        data: [],
      });
    }
  } catch (error) {
    res.status(404).json({
      message: error.message,
    });
  }
};

controller.getDetailTransaksi = async function (req, res) {
  try {
    const [detTransaksi] = await db.query('SELECT * FROM view_detail_transaksi WHERE id_transaksi=(:id)', {
      replacements: { id: req.body.id_transaksi },
    });

    if (detTransaksi.length > 0) {
      res.status(200).json({
        message: 'Data List Detail Transaksi Ditemukan',
        data: detTransaksi,
      });
    } else {
      res.status(200).json({
        message: 'Data Tidak Ada',
        data: [],
      });
    }
  } catch (error) {
    res.status(404).json({
      message: error.message,
    });
  }
};

controller.createTransaksi = async function (req, res) {
  try {
    const [result] = await db.query('SELECT id_transaksi() as id');

    const tanggal = moment().format();

    const data = {
      id_transaksi: result[0].id,
      id_user: req.body.id_user,
      tgl_transaksi: moment().format('YYYY-MM-DD HH:mm:ss'),
    };

    console.log(data);

    let transaksi = await model.transaksi.create(data);

    res.status(201).json({
      message: 'Berhasil menambahkan data transaksi',
      id_transaksi: data.id_transaksi,
    });
  } catch (error) {
    res.status(404).json({
      message: error.message,
    });
  }
};

controller.createBulkDetTransaksi = async function (req, res) {
  try {
    let transaksi = await model.detTransaksi.bulkCreate(req.body);
    res.status(201).json({
      message: 'Berhasil menambahkan seluruh transaksi',
      data: transaksi,
    });
  } catch (error) {
    res.status(404).json({
      message: error.message,
    });
  }
};

controller.getLaporanTransaksi = async function (req, res) {
  try {
    const [transaksi] = await db.query(
      "SELECT a.nama_barang, SUM( c.qty ) AS qty, SUM( c.total_beli ) AS laba_kotor, ( SUM( c.total_beli )- SUM( e.harga_beli * c.qty )) AS laba_bersih FROM barang a JOIN detail_barang b ON a.id_barang = b.id_barang RIGHT JOIN ( SELECT kode_barang, harga_beli FROM `detail_barang_masuk` GROUP BY kode_barang ) AS e ON e.kode_barang = b.kode_barang RIGHT JOIN detail_transaksi c ON b.kode_barang = c.kode_barang JOIN transaksi d ON c.id_transaksi = d.id_transaksi WHERE DATE_FORMAT( DATE( d.tgl_transaksi ), '%d/%m/%Y' ) = (:tgl_transaksi) GROUP BY a.id_barang",
      {
        replacements: { tgl_transaksi: req.body.tgl_transaksi },
      }
    );

    if (transaksi.length > 0) {
      res.status(200).json({
        message: 'Data Laporan Ditemukan',
        data: transaksi,
      });
    } else {
      res.status(200).json({
        message: 'Data Tidak Ada',
        data: [],
      });
    }
  } catch (error) {
    res.status(404).json({
      message: error.message,
    });
  }
};

export default controller;
