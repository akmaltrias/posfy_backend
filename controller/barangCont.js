import { v4 as uuidv4 } from 'uuid';
import model from "../model/index.js";
import bcrypt from "bcrypt";

const controller = {};

controller.getAllBarang = async function(req, res){
    try {
        let barang = await model.barang.findAll({
            include: {
                model: model.user,
                required: true
            }
        });
        if(barang.length > 0){
            res.status(200).json({
                message: 'Data List Barang Ditemukan',
                data: barang
            })
            
        }else{
            res.status(200).json({
                message: 'Tidak Ada Data',
                data: []
            })
        }
    } catch (error) {
        res.status(404).json({
            message: error.message
        })
    }
}

controller.getOneBarang = async function(req, res){
    try {
        let barang = await model.barang.findOne({
            where: {
                id_barang: req.params.id_barang
            }
        });
        if(barang){
            res.status(200).json({
                message: 'Data Barang Ditemukan',
                data: barang
            })
            
        }else{
            res.status(200).json({
                message: 'Tidak Ada Data',
                data: []
            })
        }
    } catch (error) {
        res.status(404).json({
            message: error.message
        })
    }
}

controller.createBarang = async function(req, res){
    try {
        const data = {
            id_barang : uuidv4(),
            id_user: req.body.id_user,
            nama_barang: req.body.nama_barang, 
            harga_jual: req.body.harga_jual 
        }

        // console.log(data);

        let barang = await model.barang.create(data);
        if(barang){
            res.status(201).json({
                message: "Berhasil Menambahkan Data Barang",
            })
        } else {
            res.status(201).json({
                message: "Gagal",
            })
        }
    } catch (error) {
        res.status(404).json({
            message: error.message
        })
    }
}

controller.deleteBarang = async function(req, res){
    try {
        let barang = await model.barang.destroy({
            where: {id_barang: req.params.id_barang}
        })

        res.status(200).json({
            message: "Berhasil Menghapus Data Barang"
        })
    } catch (error) {
        res.status(400).json({
            message: error.message
        })
    }
}
export default controller;