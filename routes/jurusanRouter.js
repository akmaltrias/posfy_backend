import express from "express";
import controller from "../controller/index.js";

const route = express.Router();

route.get("/jurusan", controller.jurusan.getAllJurusan);
route.get("/jurusan/:id_jurusan", controller.jurusan.getJurusanDetail);
route.post("/jurusan", controller.jurusan.createJurusan);
route.put("/jurusan/:id_jurusan", controller.jurusan.updateJurusan);
route.delete("/jurusan/:id_jurusan", controller.jurusan.deleteJurusan);

export default route;