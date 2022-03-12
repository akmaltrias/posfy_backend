import model from "../model/index.js";
import { v4 as uuidv4 } from 'uuid';

const controller = {};

controller.getAllAngkatan = async function(req, res){
    try {
        let angkatan = await model.angkatan.findAll();

        if(angkatan.length > 0){
            res.status(200).json({
                message: 'Data List Angkatan Ditemukan',
                data: angkatan
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

controller.getAngkatanDetail = async function(req, res){
    try {
        let angkatan = await model.angkatan.findOne({
            where: {
                id_angkatan: req.params.id_angkatan
            }
        });

        if(angkatan){
            res.status(200).json({
                message: "Data Angkatan Ditemukan",
                data : angkatan
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

controller.createAngkatan = async function(req, res){
    try {
        const data = {
            id_angkatan: uuidv4(),
            tahun_angkatan: req.body.tahun_angkatan,
        }

        let angkatan = await model.angkatan.create(data);
        res.status(201).json({
            message: "Berhasil Menambahkan Data Angkatan",
        });

    } catch (error) {
        res.status(404).json({
            message: error.message
        })
    }
}

controller.deleteAngkatan = async function(req, res){
    try {
        let angkatan = await model.angkatan.destroy({
            where: {id_angkatan: req.params.id_angkatan}
        })

        res.status(200).json({
            message: "Berhasil Menghapus Data Angkatan"
        })
    } catch (error) {
        res.status(400).json({
            message: error.message
        })
    }
}
export default controller;