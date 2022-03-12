import levelCont from "./levelCont.js";
import userCont from "./userCont.js";
import authCont from "./authCont.js";
import angkatanCont from "./angkatanCont.js";
import jurusanCont from "./jurusanCont.js";
import kelasCont from "./kelasCont.js"

const controller = {};

controller.level = levelCont;
controller.user = userCont;
controller.auth = authCont;
controller.angkatan = angkatanCont;
controller.jurusan = jurusanCont;
controller.kelas = kelasCont;

export default controller;