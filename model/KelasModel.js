import { Sequelize } from "sequelize";
import db from "../config/database.js";
import Angkatan from "./AngkatanModel.js";
import Jurusan from "./JurusanModel.js";

const { DataTypes } = Sequelize;

const Kelas = db.define('kelas', 
{
    //field
    id_kelas:{
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
        primaryKey: true
    },
    id_angkatan:{
        type: DataTypes.UUID,
    },
    id_jurusan:{
        type: DataTypes.UUID
    },
    tingkatan:{
        type: DataTypes.STRING
    },
    rombel: {
        type: DataTypes.STRING
    }
}, 
{
    //properti sequelize
    freezeTableName: true,
    timestamps: false
});

Kelas.hasOne(Angkatan, { foreignKey: 'id_angkatan'});
Kelas.belongsTo(Angkatan, { foreignKey: 'id_angkatan'});

Kelas.hasOne(Jurusan, { foreignKey: 'id_jurusan'});
Kelas.belongsTo(Jurusan, { foreignKey: 'id_jurusan'});

Kelas.removeAttribute('id');
export default Kelas;