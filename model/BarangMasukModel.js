import { Sequelize } from "sequelize";
import db from "../config/database.js";
import Supplier from "./SupplierModel.js";

const { DataTypes } = Sequelize;

const Barang_masuk = db.define('barang_masuk', 
{
    //field
    id_barang_masuk:{
        type: DataTypes.UUID,
    },
    id_supplier:{
        type: DataTypes.UUID,
    },
    tgl_masuk:{
        type: DataTypes.DATE(),
    }
}, 
{
    //properti sequelize
    freezeTableName: true,
    timestamps: false
});

Barang_masuk.hasOne(Supplier, { foreignKey: 'id_supplier'});
Barang_masuk.belongsTo(Supplier, { foreignKey: 'id_supplier'});

Barang_masuk.removeAttribute('id');
export default Barang_masuk;