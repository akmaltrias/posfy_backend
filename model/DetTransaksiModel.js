import { Sequelize } from "sequelize";
import db from "../config/database.js";
import Transaksi from "./TransaksiModel.js";

const { DataTypes } = Sequelize;

const DetTransaksi = db.define('detail_transaksi', 
{
    //field
    id_transaksi:{
        type: DataTypes.STRING,
    },
    kode_barang:{
        type: DataTypes.STRING,
    },
    qty:{
        type: DataTypes.INTEGER,
    },
    harga_jual:{
        type: DataTypes.BIGINT,
    },
    total_beli:{
        type: DataTypes.BIGINT,
    },

}, 
{
    //properti sequelize
    freezeTableName: true,
    timestamps: false
});

DetTransaksi.hasOne(Transaksi, { foreignKey: 'id_transaksi'});
DetTransaksi.belongsTo(Transaksi, { foreignKey: 'id_transaksi'});

DetTransaksi.removeAttribute('id');
export default DetTransaksi;