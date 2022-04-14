import sequelize from "sequelize";
import db from "../config/database.js";
import model from "../model/index.js";
import moment from "moment-timezone"
import { v4 as uuidv4 } from 'uuid';


const controller = {};

controller.getBarangMasuk = async function(req, res){
    try {
        const barang_masuk = await model.barang_masuk.findAll({
            where: sequelize.where(sequelize.fn('date', sequelize.col('tgl_masuk')), req.body.tgl_masuk)
        });

        if(barang_masuk.length > 0 ){
            res.status(200).json({
                message: "Data List Barang Masuk Ditemukan",
                data : barang_masuk
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

controller.getDetailBarangMasuk = async function(req, res){
    try {
        const [detBarang_masuk] = await db.query("SELECT * FROM detail_barang_masuk WHERE id_barang_masuk=(:id)", {
            replacements: {id: req.body.id_barang_masuk}
        });

        if(detBarang_masuk.length > 0 ){
            res.status(200).json({
                message: "Data List Detail Barang Masuk Ditemukan",
                data : detBarang_masuk
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

controller.createBarangMasuk = async function(req, res){
    try{
        // const [result] = await db.query("SELECT id_transaksi() as id");

        const tanggal = moment().format()

        const data = {
            id_barang_masuk: uuidv4(),
            id_supplier: req.body.id_supplier,
            tgl_masuk: tanggal
        }
        
        // console.log(tanggal);

        let barang_masuk = await model.barang_masuk.create(data);

        res.status(201).json({
            message: "Berhasil menambahkan data barang masuk"
        });
    }catch (error) {
        res.status(404).json({
            message: error.message
        });
    }
}

controller.createBulkDetBarangMasuk = async function(req, res){
    try{
        const x = req.body
        // console.log(data);

        // console.log(x);

        const data = x.map(v => {
        db.query("CALL ins_barang_masuk (:kode_barang, :id_barang, :id_barang_masuk, :kadaluwarsa, :harga_beli, :jumlah_masuk)", {
                replacements: {
            // console.log(v.kode_barang);
                    kode_barang: v.kode_barang,
                    id_barang: v.id_barang,
                    id_barang_masuk: v.id_barang_masuk,
                    kadaluwarsa: v.kadaluwarsa,
                    harga_beli: v.harga_beli,
                    jumlah_masuk: v.jumlah_masuk
                }
            });
        });


        if(data.length > 0 ){
            res.status(200).json({
                message: "Berhasil menambahkan seluruh barang masuk",
                data : x
            })
        }else{
            res.status(200).json({
                message: "Data Tidak Ada",
                data : []
            })
        }
    }catch (error) {
        res.status(404).json({
            message: error.message
        });
    }
}

export default controller;