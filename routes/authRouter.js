import express from "express";
import controller from "../controller/index.js";

const route = express.Router();

route.post("/login", controller.auth.authLogin);

export default route;