import express from "express";
import controller from "../controller/index.js";

const route = express.Router();

route.get("/user", controller.user.getAllUser);
route.get("/user/:id_user", controller.user.getUserDetail);
route.post("/user", controller.user.createUser);
route.put("/user/:id_user", controller.user.updateUser);
route.delete("/user/:id_user", controller.user.deleteUser);

export default route;