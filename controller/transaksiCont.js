import sequelize from "sequelize";
import db from "../config/database.js";
import model from "../model/index.js";
import moment from "moment"

const controller = {};

controller.getTransaksi = async function(req, res){
    try {
        const transaksi = await model.transaksi.findAll({
            where: sequelize.where(sequelize.fn('date', sequelize.col('tgl_transaksi')), req.body.tgl_transaksi)
        });

        if(transaksi.length > 0 ){
            res.status(200).json({
                message: "Data List Transaksi Ditemukan",
                data : transaksi
            })
        }else{
            res.status(200).json({
                message: "Data Tidak Ada",
                data : []
            })
        }
    } catch (error) {
        res.status(404).json({
            message: error.message
        })
    }
}

controller.createTransaksi = async function(req, res){
    try{
        const [result] = await db.query("SELECT id_transaksi() as id");

    //    console.log(result[0].id)

        const data = {
            id_transaksi: result[0].id,
            id_user: req.body.id_user,
            tgl_transaksi: moment().format("YYYY-MM-DD HH:mm:ss")
        }
        
        console.log(data);

        // let transaksi = await model.transaksi.create(data);

        // res.status(201).json({
        //     message: "Berhasil menambahkan data transaksi"
        // });
    }catch (error) {
        res.status(404).json({
            message: error.message
        });
    }
}

export default controller;