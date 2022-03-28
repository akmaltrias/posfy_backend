import { Sequelize } from "sequelize";
import db from "../config/database.js";
import Barang_masuk from "./BarangMasukModel.js";

const { DataTypes } = Sequelize;

const DetBarang_masuk = db.define('detail_barang_masuk', 
{
    //field
    kode_barang:{
        type: DataTypes.STRING,
    },
    id_barang_masuk:{
        type: DataTypes.STRING,
    },
    jumlah_masuk:{
        type: DataTypes.INTEGER,
    },
    harga_beli:{
        type: DataTypes.BIGINT,
    },

}, 
{
    //properti sequelize
    freezeTableName: true,
    timestamps: false
});

DetBarang_masuk.hasOne(Barang_masuk, { foreignKey: 'id_barang_masuk'});
DetBarang_masuk.belongsTo(Barang_masuk, { foreignKey: 'id_barang_masuk'});

DetBarang_masuk.removeAttribute('id');
export default DetBarang_masuk;