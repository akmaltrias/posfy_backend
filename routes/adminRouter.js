import express from "express";
import multer from "multer";
import controller from "../controller/index.js";

const route = express.Router();
const upload = multer()

route.get("/admin", controller.admin.getAllAdmin);
route.post("/admin", upload.none() , controller.admin.createAdmin);

export default route;