import express from "express";
import multer from "multer";
import controller from "../controller/index.js";

const route = express.Router();
const upload = multer()

route.get("/barang", controller.barang.getAllBarang);
route.get("/barang/detail/:id_barang", controller.barang.getDetailBarang);
route.get("/barang/detail", controller.barang.getAllDetailBarang);
route.get("/barang/:id_barang", controller.barang.getOneBarang);
route.delete("/barang/:id_barang", controller.barang.deleteBarang);
route.post("/barang", upload.none(), controller.barang.createBarang);

export default route;