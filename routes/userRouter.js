import express from "express";
import multer from "multer";
import controller from "../controller/index.js";
import { VerifyToken } from "../middleware/VerifyToken.js";

const route = express.Router();
const upload = multer()

route.get("/user" , controller.user.getAllUser);
route.get("/user/:id_user", controller.user.getUserDetail);
route.post("/user", upload.none() ,controller.user.createUser);
route.put("/user/:id_user", controller.user.updateUser);
route.delete("/user/:id_user", controller.user.deleteUser);

export default route;