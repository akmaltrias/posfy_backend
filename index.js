import express from "express";
import morgan from "morgan";
import bodyParser from "body-parser";
import db from "./config/database.js";
import levelRouter from "./routes/levelRouter.js";

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

app.listen(port, () => console.log(`Server Running at ${port}`));