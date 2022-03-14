import express from "express";
import controller from "../controller/index.js";

const route = express.Router();

route.get("/owner", controller.owner.getAllOwner);

export default route;