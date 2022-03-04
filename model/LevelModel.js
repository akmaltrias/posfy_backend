import { Sequelize } from "sequelize";
import db from "../config/database.js";

const { DataTypes } = Sequelize;

//tabel tanpa foreign key
const Level = db.define('level_user',{
    id_level:{
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
        primaryKey: true
    },
    peran:{
        type: DataTypes.STRING
    }
},{
    freezeTableName: true,
    timestamps: false
});

// (async () => {
//     await db.sync();
// })();

Level.removeAttribute('id');
export default Level;