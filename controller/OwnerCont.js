import model from "../model/index.js";
import { v4 as uuidv4 } from 'uuid';

const controller = {};

controller.getAllOwner = async function(req, res){
    try {
        let owner = await model.owner.findAll({})

        if(owner.length > 0 ){
            res.status(200).json({
                message: "Data List Owner Ditemukan",
                data : owner
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

controller.getOwnerDetail = async function(req, res){
    try {
        let owner = await model.owner.findOne({
            where: {id_owner: req.params.id_owner}
        });

        if(owner){
            res.status(200).json({
                message: "Data Owner Ditemukan",
                data: owner
            });
        }else{
            res.status(200).json({
                message: "Data Tidak Ada",
                data: []
            });
        }
    } catch (error) {
        res.status(404).json({
            message: error.message
        });
    }
}

controller.createOwner = async function(req, res){
    try{
        const data = {
            id_owner: uuidv4(),
            id_user: req.body.id_user,
            nama: req.body.nama,
            no_telp: req.body.no_telp,
            alamat: req.body.alamat
        }

        let owner = await model.owner.create(data);

        res.status(201).json({
            message: "Berhasil menambahkan data owner"
        });
    }catch (error) {
        res.status(404).json({
            message: error.message
        });
    }
}

controller.updateOwner = async function(req, res){
    try {
        const data = {
            nama: req.body.nama,
            no_telp: req.body.no_telp,
            alamat: req.body.alamat
        }

        let owner = await model.owner.update(data, {
            where: {id_owner: req.params.id_owner}
        });
        res.status(201).json({
            message: "Berhasil Mengubah Data Owner",
        });

    } catch (error) {
        res.status(404).json({
            message: error.message
        })
    }
}

controller.deleteOwner = async function(req, res){
    try {
        let owner = await model.owner.destroy({
            where: {id_owner: req.params.id_owner}
        });

        res.status(200).json({
            message: "Berhasil menghapus data owner"
        });
    } catch (error) {
        res.status(400).json({
            message: error.message
        });
    }
}

export default controller;