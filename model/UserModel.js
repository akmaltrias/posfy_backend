import { Sequelize } from "sequelize";
import db from "../config/database";
import Level from "./LevelModel";

const { DataTypes } = Sequelize;

//tabel tanpa foreign key
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

Level.hasOne(User, { foreignKey: 'id_level'});
Level.belongsTo(User, { foreignKey: 'id_level'});

User.removeAttribute('id');
export default User;