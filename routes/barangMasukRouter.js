import express from "express";
import multer from "multer";
import controller from "../controller/index.js";

const route = express.Router();
const upload = multer()

route.get("/barangmasuk/detail", upload.none(),controller.barangMasuk.getDetailBarangMasuk);
route.post("/barangmasuk/detail", upload.none(), controller.barangMasuk.createBulkDetBarangMasuk);

route.get("/barangmasuk", upload.none(), controller.barangMasuk.getBarangMasuk);
route.post("/barangmasuk", upload.none(), controller.barangMasuk.createBarangMasuk);

export default route;