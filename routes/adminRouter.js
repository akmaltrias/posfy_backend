import express from "express";
import controller from "../controller/index.js";

const route = express.Router();

route.get("/admin", controller.admin.getAllAdmin);

export default route;