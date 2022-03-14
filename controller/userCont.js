import { v4 as uuidv4 } from 'uuid';
import model from "../model/index.js";
import bcrypt from "bcrypt";

const controller = {};

controller.getAllUser = async function(req, res){
    try {
        let user = await model.user.findAll({
            include: {
                model: model.level,
                required: true
            }
        });
        if(user.length > 0){
            res.status(200).json({
                message: 'Data List User Ditemukan',
                data: user
            })
            
        }else{
            res.status(200).json({
                message: 'Tidak Ada Data',
                data: []
            })
        }
        // console.log(data);
    } catch (error) {
        res.status(404).json({
            message: error.message
        })
    }
}

controller.getUserDetail = async function(req, res){
    try {
        let user = await model.user.findOne({
            include : {
                model: model.level,
                required: true
            },
            where: {
                id_user: req.params.id_user
            }
        });
        
        // console.log(user.level_user.peran);

        if(user){
            res.status(200).json({
                message: "Data User Ditemukan",
                data : user
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

controller.createUser = async function(req, res){
    const salt = await bcrypt.genSaltSync(10);
    const password = req.body.password;

    const hashPassword = await bcrypt.hash(password, salt);

    try {
        const data = {
            id_user: uuidv4(),
            id_level: req.body.id_level,
            username: req.body.username,
            password: hashPassword,
            status: req.body.status,
        }

        // console.log(req.body);

        let user = await model.user.create(data);
        if(user){
            res.status(201).json({
                message: "Berhasil Menambahkan Data User",
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

controller.updateUser = async function(req, res){
    let password = req.body.password;

    if(password){
        const salt = await bcrypt.genSalt();
        password = await bcrypt.hash(password, salt);
    }else{
        let user = await model.user.findOne({ where: {id_user: req.params.id_user}})
        password = user.password
    }

    try {
        const data = {
            username: req.body.username,
            password: password,
            status: req.body.status
        }

        let user = await model.user.update(data, {
            where: {id_user: req.params.id_user}
        });
        res.status(200).json({
            message: "Berhasil Mengubah Data User"
        })
    } catch (error) {
        res.status(404).json({
            message: error.message
        })
    }
}

controller.deleteUser = async function(req, res){
    try {
        let user = await model.user.destroy({
            where: {id_user: req.params.id_user}
        })

        res.status(200).json({
            message: "Berhasil Menghapus Data User"
        })
    } catch (error) {
        res.status(400).json({
            message: error.message
        })
    }
}
export default controller;