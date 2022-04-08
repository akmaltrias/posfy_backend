import Level from "./LevelModel.js";
import User from "./UserModel.js";
import Angkatan from "./AngkatanModel.js";
import Jurusan from "./JurusanModel.js";
import Kelas from "./KelasModel.js";
import Siswa from "./SiswaModel.js";
import Admin from "./AdminModel.js";
import Owner from "./OwnerModel.js";
import Supplier from "./SupplierModel.js";
import Transaksi from "./TransaksiModel.js";
import DetTransaksi from "./DetTransaksiModel.js";
import Barang from "./BarangModel.js";
import Barang_masuk from "./BarangMasukModel.js";
import DetBarang_masuk from "./DetBarangMasukModel.js";

const model = {};

model.level = Level;
model.user = User;
model.angkatan = Angkatan;
model.jurusan = Jurusan;
model.kelas = Kelas;
model.siswa = Siswa;
model.admin = Admin;
model.owner = Owner;
model.supplier = Supplier;
model.transaksi = Transaksi;
model.detTransaksi = DetTransaksi;
model.barang = Barang;
model.barang_masuk = Barang_masuk;
model.detBarang_masuk = DetBarang_masuk;

export default model;