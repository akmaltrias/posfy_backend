import Level from "../model/LevelModel.js";
import {uuid} from "uuidv4";

// const controller = {};

export const getAllLevel = async function (req, res){
    try {
        let level = await Level.findAll();
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

export const getDetailLevel = async function (req, res){
    try {
        let level = await Level.findOne({
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

export const createLevel = async function (req, res){
    try {
        const data = {
            id_level : uuid(),
            peran : req.body.peran
        }
    
        let level = await Level.create(data)
        res.status(201).json({
            message: "Berhasil Membuat Data Level",
            data : level
        })
        
    } catch (error) {
        res.status(404).json({
            message: error.message
        })
        
    }
    

}

export const updateLevel = async function (req, res){
    try {
        const data = {
            peran : req.body.peran
        }
    
        let level = await Level.update(data, {
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

export const deleteLevel = async function (req, res){
    try {
        let level = await Level.destroy({
            where: {
                id_level : req.params.id_level
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