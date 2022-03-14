import { Sequelize } from "sequelize";
import db from "../config/database.js";
import User from "./UserModel.js";
import Kelas from "./KelasModel.js";

const { DataTypes } = Sequelize;

const Siswa = db.define('siswa', 
{
    //field
    id_siswa:{
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
        primaryKey: true
    },
    id_user:{
        type: DataTypes.UUID,
    },
    id_kelas:{
        type: DataTypes.UUID
    },
    nama:{
        type: DataTypes.STRING
    },
    no_telp: {
        type: DataTypes.STRING
    },
    alamat:{
        type: DataTypes.TEXT,
    }
}, 
{
    //properti sequelize
    freezeTableName: true,
    timestamps: false
});

Siswa.hasOne(User, { foreignKey: 'id_user'});
Siswa.belongsTo(User, { foreignKey: 'id_user'});

Siswa.hasOne(Kelas, { foreignKey: 'id_kelas'});
Siswa.belongsTo(Kelas, { foreignKey: 'id_kelas'});

Siswa.removeAttribute('id');
export default Siswa;