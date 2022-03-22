import express from "express";
import multer from "multer";
import controller from "../controller/index.js";

const route = express.Router();
const upload = multer()

// route.get("/transaksi", upload.none() ,controller.transaksi.getTransaksi);
route.get("/transaksi", upload.none(), controller.transaksi.getTransaksi);
route.post("/transaksi", upload.none(), controller.transaksi.createTransaksi);

export default route;