import { Sequelize } from "sequelize";
import db from "../config/database.js";
import User from "./UserModel.js";

const { DataTypes } = Sequelize;

const Admin = db.define('admin', 
{
    //field
    id_admin:{
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
        primaryKey: true
    },
    id_user:{
        type: DataTypes.UUID,
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

Admin.hasOne(User, { foreignKey: 'id_user'});
Admin.belongsTo(User, { foreignKey: 'id_user'});

Admin.removeAttribute('id');
export default Admin;