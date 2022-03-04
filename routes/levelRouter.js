import express from "express";
import { getAllLevel, getDetailLevel, createLevel, updateLevel, deleteLevel } from "../controller/levelCont.js";

const level = express.Router();

level.get('/level', getAllLevel);
level.get('/:id_level', getDetailLevel);
level.post('/level', createLevel);
level.put('/:id_level', updateLevel);
level.delete('/:id_level', deleteLevel);


export default level;