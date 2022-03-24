import { Sequelize } from "sequelize";
import db from "../config/database.js";
import User from "./UserModel.js";

const { DataTypes } = Sequelize;

const Barang = db.define('barang', 
{
    //field
    id_barang:{
        type: DataTypes.UUID,
        primaryKey: true
    },
    id_user:{
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4
    },
    nama_barang:{
        type: DataTypes.STRING
    },
    harga_jual:{
        type: DataTypes.BIGINT                  
    }
}, 
{
    //properti sequelize
    freezeTableName: true,
    timestamps: false
});

Barang.hasOne(User, { foreignKey: 'id_user'});
Barang.belongsTo(User, { foreignKey: 'id_user'});

User.removeAttribute('id');
export default Barang;