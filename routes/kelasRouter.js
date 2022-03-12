import express from "express";
import controller from "../controller/index.js";

const route = express.Router();

route.get("/kelas", controller.kelas.getAllKelas);

export default route;