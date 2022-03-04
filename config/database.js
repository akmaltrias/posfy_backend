import { Sequelize } from "sequelize";

const db = new Sequelize('database_posfy', 'root', '', {
    host: "localhost",
    dialect: "mysql"
});
 
export default db;