import express from "express";
import controller from "../controller/index.js";

const route = express.Router();

route.get("/supplier", controller.supplier.getAllSupplier);

export default route;