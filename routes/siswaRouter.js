import express from "express";
import controller from "../controller/index.js";

const route = express.Router();

route.get("/siswa", controller.siswa.getAllSiswa);

export default route;