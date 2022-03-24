import express from "express";
import controller from "../controller/index.js";
import multer from "multer";

const route = express.Router();
const upload = multer();

route.post("/login", upload.none(),controller.auth.authLogin);
route.delete("/logout", controller.auth.logout)
route.get("/token", controller.refreshToken.getRefreshToken);

export default route;