import { Sequelize } from "sequelize";
import db from "../config/database.js"

const {DataTypes} = Sequelize;

const Jurusan = db.define('jurusan', {
    //field
    id_jurusan: {
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
        primaryKey: true
    },
    akronim: {
        type: DataTypes.STRING
    },
    nama_jurusan: {
        type: DataTypes.STRING
    }
},
{
    //properti sequelize
    freezeTableName: true,
    timestamps: false
});

Jurusan.removeAttribute('id');
export default Jurusan;