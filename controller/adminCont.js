import model from "../model/index.js";
import { v4 as uuidv4 } from 'uuid';

const controller = {};

controller.getAllAdmin = async function(req, res){
    try {
        let admin = await model.admin.findAll({})

        if(admin.length > 0 ){
            res.status(200).json({
                message: "Data List Admin Ditemukan",
                data : admin
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

controller.createAdmin = async function(req, res){
    try{
        const data = {
            id_admin: uuidv4(),
            id_user: req.body.id_user,
            nama: req.body.nama,
            no_telp: req.body.no_telp,
            alamat: req.body.alamat
        }

        let admin = await model.admin.create(data);

        res.status(201).json({
            message: "Berhasil menambahkan data admin"
        });
    }catch (error) {
        res.status(404).json({
            message: error.message
        });
    }
}

export default controller;