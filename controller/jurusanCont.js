import model from "../model/index.js";
import { v4 as uuidv4 } from 'uuid';

const controller = {};

controller.getAllJurusan = async function(req, res){
    try {
        let jurusan = await model.jurusan.findAll();

        if(jurusan.length > 0){
            res.status(200).json({
                message: 'Data List Jurusan Ditemukan',
                data: jurusan
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

controller.getJurusanDetail = async function(req, res){
    try {
        let jurusan = await model.jurusan.findOne({
            where: {
                id_jurusan: req.params.id_jurusan
            }
        });

        if(jurusan){
            res.status(200).json({
                message: "Data Jurusan Ditemukan",
                data : jurusan
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

controller.createJurusan = async function(req, res){
    try {
        const data = {
            id_jurusan: uuidv4(),
            akronim: req.body.akronim,
            nama_jurusan: req.body.nama_jurusan,
        }

        let jurusan = await model.jurusan.create(data);
        res.status(201).json({
            message: "Berhasil Menambahkan Data Jurusan",
        });

    } catch (error) {
        res.status(404).json({
            message: error.message
        })
    }
}

controller.updateJurusan = async function(req, res){
    try {
        const data = {
            akronim: req.body.akronim,
            nama_jurusan: req.body.nama_jurusan,
        }

        let jurusan = await model.jurusan.update(data, {
            where: {id_jurusan: req.params.id_jurusan}
        });
        res.status(201).json({
            message: "Berhasil Mengubah Data Jurusan",
        });

    } catch (error) {
        res.status(404).json({
            message: error.message
        })
    }
}

controller.deleteJurusan = async function(req, res){
    try {
        let jurusan = await model.jurusan.destroy({
            where: {id_jurusan: req.params.id_jurusan}
        })

        res.status(200).json({
            message: "Berhasil Menghapus Data Jurusan"
        })
    } catch (error) {
        res.status(400).json({
            message: error.message
        })
    }
}
export default controller;