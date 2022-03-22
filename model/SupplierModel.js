import { Sequelize } from "sequelize";
import db from "../config/database.js";

const { DataTypes } = Sequelize;

const Supplier = db.define('supplier', 
{
    //field
    id_supplier:{
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
        primaryKey: true
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

Supplier.removeAttribute('id');
export default Supplier;