import express from "express";
import controller from "../controller/index.js";

const route = express.Router();

route.get("/angkatan", controller.angkatan.getAllAngkatan);
route.get("/angkatan/:id_angkatan", controller.angkatan.getAngkatanDetail);
route.post("/angkatan", controller.angkatan.createAngkatan);
route.delete("/angkatan/:id_angkatan", controller.angkatan.deleteAngkatan);



export default route;