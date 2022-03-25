import model from "../model/index.js";
import { v4 as uuidv4 } from 'uuid';

const controller = {};

controller.getAllSupplier = async function(req, res){
    try {
        let supplier = await model.supplier.findAll({})

        if(supplier.length > 0 ){
            res.status(200).json({
                message: "Data List Supplier Ditemukan",
                data : supplier
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

controller.createSupplier = async function(req, res){
    try {
        const data = {
            id_supplier: uuidv4(),
            nama: req.body.nama_supplier,
            no_telp: req.body.no_telp,
            alamat: req.body.alamat,
        }

        let supplier = await model.supplier.create(data);
        if(supplier){
            res.status(201).json({
                message: "Berhasil Menambahkan Data Supplier",
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

controller.deleteSupplier = async function(req, res){
    try {
        let supplier = await model.supplier.destroy({
            where: {id_supplier: req.params.id_supplier}
        })

        res.status(200).json({
            message: "Berhasil Menghapus Data Supplier"
        })
    } catch (error) {
        res.status(404).json({
            message: error.message
        })
    }
}

export default controller;