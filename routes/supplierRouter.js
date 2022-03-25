import express from "express";
import controller from "../controller/index.js";
import multer from "multer";

const route = express.Router();
const upload = multer()

route.get("/supplier", controller.supplier.getAllSupplier);
route.post("/supplier", upload.none(), controller.supplier.createSupplier);
route.delete("/supplier/:id_supplier", controller.supplier.deleteSupplier);


export default route;