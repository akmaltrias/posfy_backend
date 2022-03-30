import express from "express";
import multer from "multer";
import controller from "../controller/index.js";

const route = express.Router();
const upload = multer()

route.get("/owner", controller.owner.getAllOwner);
route.get("/owner/:id_owner", controller.owner.getOwnerDetail);
route.post("/owner", upload.none(), controller.owner.createOwner);
route.put("/owner/:id_owner", upload.none(), controller.owner.updateOwner);
route.delete("/owner/:id_owner", controller.owner.deleteOwner);

export default route;