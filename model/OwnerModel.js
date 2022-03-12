import { Sequelize } from "sequelize";
import db from "../config/database.js";
import User from "./UserModel.js";

const { DataTypes } = Sequelize;

const Owner = db.define('owner', 
{
    //field
    id_owner:{
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

Owner.hasOne(User, { foreignKey: 'id_user'});
Owner.belongsTo(User, { foreignKey: 'id_user'});

Owner.removeAttribute('id');
export default Owner;