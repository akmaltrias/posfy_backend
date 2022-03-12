import { Sequelize } from "sequelize";
import db from "../config/database.js";

const { DataTypes } = Sequelize;

const Angkatan = db.define('angkatan', 
{
    //field
    id_angkatan:{
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
        primaryKey: true
    },
    tahun_angkatan:{
        type: DataTypes.STRING,
    }
}, 
{
    //properti sequelize
    freezeTableName: true,
    timestamps: false
});

Angkatan.removeAttribute('id');
export default Angkatan;