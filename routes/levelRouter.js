import express from "express";
import controller from "../controller/index.js";

const route = express.Router();

route.get("/level", controller.level.getAllLevel);
route.get("/level/:id_level", controller.level.getDetailLevel);
route.post("/level", controller.level.createLevel);
route.put("/level/:id_level", controller.level.updateLevel);
route.delete("/level/:id_level", controller.level.deleteLevel);

export default route;