import express from "express";
import morgan from "morgan";
import bodyParser from "body-parser";
import db from "./config/database.js";

import levelRouter from "./routes/levelRouter.js";
import userRouter from "./routes/userRouter.js";
import authRouter from "./routes/authRouter.js";
import angkatanRouter from "./routes/angkatanRouter.js";
import jurusanRouter from "./routes/jurusanRouter.js";
import kelasRouter from "./routes/kelasRouter.js";


const app = express();
const port = 5000;

try {
    await db.authenticate();
    console.log('Database connected...');
} catch (error) {
    console.error('Connection error:', error);
}

// app.use(cors());
app.use(express.json());
app.use(morgan('dev'));
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

//deklarasi route
app.use('/', levelRouter);
app.use('/', userRouter);
app.use('/', authRouter);
app.use('/', angkatanRouter);
app.use('/', jurusanRouter);
app.use('/', kelasRouter);


app.listen(port, () => console.log(`Server Running at ${port}`));