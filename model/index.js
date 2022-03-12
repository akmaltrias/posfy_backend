import Level from "./LevelModel.js";
import User from "./UserModel.js";
import Angkatan from "./AngkatanModel.js";
import Jurusan from "./JurusanModel.js";
import Kelas from "./KelasModel.js";
import Siswa from "./SiswaModel.js";
import Admin from "./AdminModel.js";
import Owner from "./OwnerModel.js";

const model = {};

model.level = Level;
model.user = User;
model.angkatan = Angkatan;
model.jurusan = Jurusan;
model.kelas = Kelas;
model.siswa = Siswa;
model.admin = Admin;
model.owner = Owner;

export default model;