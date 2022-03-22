import express from "express";
import controller from "../controller/index.js";

const route = express.Router();

route.post("/login", controller.auth.authLogin);
route.delete("/logout", controller.auth.logout)
route.get("/token", controller.refreshToken.getRefreshToken);
export default route;