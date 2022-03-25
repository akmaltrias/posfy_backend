import sequelize from "sequelize";
import db from "../config/database.js";
import model from "../model/index.js";
<<<<<<< HEAD
import moment from "moment-timezone"
=======
import moment from "moment";
>>>>>>> 28cd313676be80df13ba9f623c4199bdf7f7a114

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

controller.getDetailTransaksi = async function(req, res){
    try {
        const [detTransaksi] = await db.query("SELECT * FROM detail_transaksi WHERE id_transaksi=(:id)", {
            replacements: {id: req.body.id_transaksi}
        });

        if(detTransaksi.length > 0 ){
            res.status(200).json({
                message: "Data List Detail Transaksi Ditemukan",
                data : detTransaksi
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

        const tanggal = moment().format()

        const data = {
            id_transaksi: result[0].id,
            id_user: req.body.id_user,
            tgl_transaksi: tanggal
        }
        
        // console.log(tanggal);

        let transaksi = await model.transaksi.create(data);

        res.status(201).json({
            message: "Berhasil menambahkan data transaksi"
        });
    }catch (error) {
        res.status(404).json({
            message: error.message
        });
    }
}

controller.createBulkDetTransaksi = async function(req, res){
    try{
        let transaksi = await model.detTransaksi.bulkCreate(req.body);
        res.status(201).json({
            message: "Berhasil menambahkan seluruh transaksi",
            data: transaksi
        });
    }catch (error) {
        res.status(404).json({
            message: error.message
        });
    }
}

export default controller;