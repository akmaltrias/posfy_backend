import { Sequelize } from "sequelize";
import db from "../config/database.js";
import User from "./UserModel.js";

const { DataTypes } = Sequelize;

const Transaksi = db.define('transaksi', 
{
    //field
    id_transaksi:{
        type: DataTypes.STRING,
    },
    id_user:{
        type: DataTypes.UUID,
    },
    tgl_transaksi:{
        type: DataTypes.DATE(),
    }
}, 
{
    //properti sequelize
    freezeTableName: true,
    timestamps: false
});

Transaksi.hasOne(User, { foreignKey: 'id_user'});
Transaksi.belongsTo(User, { foreignKey: 'id_user'});

Transaksi.removeAttribute('id');
export default Transaksi;