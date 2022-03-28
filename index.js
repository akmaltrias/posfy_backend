import express from "express";
import morgan from "morgan";
import bodyParser from "body-parser";
import db from "./config/database.js";
import dotenv from "dotenv";
import cors from "cors";
import cookieParser from "cookie-parser";

import levelRouter from "./routes/levelRouter.js";
import userRouter from "./routes/userRouter.js";
import authRouter from "./routes/authRouter.js";
import angkatanRouter from "./routes/angkatanRouter.js";
import jurusanRouter from "./routes/jurusanRouter.js";
import kelasRouter from "./routes/kelasRouter.js";
import siswaRouter from "./routes/siswaRouter.js";
import adminRouter from "./routes/adminRouter.js";
import ownerRouter from "./routes/ownerRouter.js";
import supplierRouter from "./routes/supplierRouter.js";
import transaksiRouter from "./routes/transaksiRouter.js";
import barangRouter from "./routes/barangRouter.js"
import barangMasukRouter from "./routes/barangMasukRouter.js"

dotenv.config();

const app = express();
const port = 5000;

try {
    db.authenticate();
    console.log('Database connected...');
} catch (error) {
    console.error('Connection error:', error);
}

app.use(cors({ credentials:true, origin:'http://localhost:3000' }));
app.use(cookieParser());
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
app.use('/', siswaRouter);
app.use('/', adminRouter);
app.use('/', ownerRouter);
app.use('/', supplierRouter);
app.use('/', transaksiRouter);
app.use('/', barangRouter);
app.use('/', barangMasukRouter);

app.listen(port, () => console.log(`Server Running at ${port}`));