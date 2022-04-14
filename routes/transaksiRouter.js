import express from 'express';
import multer from 'multer';
import controller from '../controller/index.js';

const route = express.Router();
const upload = multer();

route.post('/transaksi/detail', upload.none(), controller.transaksi.getDetailTransaksi);
route.post('/create/transaksi/detail', upload.none(), controller.transaksi.createBulkDetTransaksi);

route.post('/transaksi', upload.none(), controller.transaksi.getTransaksi);
route.post('/create/transaksi', upload.none(), controller.transaksi.createTransaksi);

route.post("/transaksi/report", upload.none(), controller.transaksi.getLaporanTransaksi);

export default route;
