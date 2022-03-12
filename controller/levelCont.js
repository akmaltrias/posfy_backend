import model from "../model/index.js";
import { v4 as uuidv4 } from 'uuid';

const controller = {};

controller.getAllLevel = async function (req, res){
    try {
        let level = await model.level.findAll();
            if(level.length > 0){
                res.status(200).json({
                    message: 'Data List Level Ditemukan',
                    data: level
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

controller.getDetailLevel = async function (req, res){
    try {
        let level = await model.level.findOne({
            where: {
                id_level : req.params.id_level
            }
        });

        if(level){
            res.status(200).json({
                message: 'Data Level Ditemukan',
                data: level
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

controller.createLevel = async function (req, res){
    try {
        const data = {
            id_level: uuidv4(),
            peran: req.body.peran
        }
    
        let level = await model.level.create(data)
        res.status(201).json({
            message: "Berhasil Membuat Data Level",
            data: level
        })
        
    } catch (error) {
        res.status(404).json({
            message: error.message
        })
        
    }
}

controller.updateLevel = async function (req, res){
    try {
        const data = {
            peran: req.body.peran
        }
    
        let level = await model.level.update(data, {
            where: {
                id_level: req.params.id_level
            }
        })
        res.status(200).json({
            message: "Berhasil Mengubah Data Level",
        })
        
    } catch (error) {
        res.status(404).json({
            message: error.message
        })
        
    }
}

controller.deleteLevel = async function (req, res){
    try {
        let level = await model.level.destroy({
            where: {
                id_level: req.params.id_level
            }
        })

        res.status(200).json({
            message: "Berhasil Menghapus Data Level"
        })
    } catch (error) {
        res.status(404).json({
            message: error.message
        })
        
    }
}

export default controller;