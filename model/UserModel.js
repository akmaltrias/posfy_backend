import { Sequelize } from "sequelize";
import db from "../config/database.js";
import Level from "./LevelModel.js";

const { DataTypes } = Sequelize;

const User = db.define('user', 
{
    //field
    id_user:{
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
        primaryKey: true
    },
    id_level:{
        type: DataTypes.UUID,
    },
    username:{
        type: DataTypes.STRING
    },
    password:{
        type: DataTypes.STRING
    },
    status: {
        type: DataTypes.BOOLEAN,
        defaultValue: false
    }
}, 
{
    //properti sequelize
    freezeTableName: true,
    timestamps: false
});

User.hasOne(Level, { foreignKey: 'id_level'});
User.belongsTo(Level, { foreignKey: 'id_level'});

User.removeAttribute('id');
export default User;