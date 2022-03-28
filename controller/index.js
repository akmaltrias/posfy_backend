import levelCont from "./levelCont.js";
import userCont from "./userCont.js";
import authCont from "./authCont.js";
import angkatanCont from "./angkatanCont.js";
import jurusanCont from "./jurusanCont.js";
import kelasCont from "./kelasCont.js"
import siswaCont from "./siswaCont.js";
import adminCont from "./adminCont.js";
import ownerCont from "./ownerCont.js";
import refreshToken from "./refreshTokenCont.js";
import supplierCont from "./supplierCont.js";
import transaksiCont from "./transaksiCont.js";
import barangCont from "./barangCont.js"
import barangMasukCont from "./barangMasukCont.js"

const controller = {};

controller.level = levelCont;
controller.user = userCont;
controller.auth = authCont;
controller.angkatan = angkatanCont;
controller.jurusan = jurusanCont;
controller.kelas = kelasCont;
controller.siswa = siswaCont;
controller.admin = adminCont;
controller.owner = ownerCont;
controller.refreshToken = refreshToken;
controller.supplier = supplierCont;
controller.transaksi = transaksiCont;
controller.barang = barangCont;
controller.barangMasuk = barangMasukCont;

export default controller;