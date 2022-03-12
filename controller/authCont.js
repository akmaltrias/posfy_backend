import model from "../model/index.js"
import bcrypt from "bcrypt"

const controller = {};

controller.authLogin = async function(req, res){
    try {
        //mengambil data dari body
        const username = req.body.username;
        const password = req.body.password;
        //memeriksa username
        const user = await model.user.findOne({
            include: {
                model: model.level,
                required: true
            },
            where: { username: username }
        })
        
        if(!user){ res.status(200).json({ message: "Username Salah"}) }
        //memeriksa password 
        bcrypt.compare(password, user.password, (err, result) => {
            //kalau ada yang salah sama bcrypt
            if(err) throw err

            //status kalau sudah login
            const data = {
                userId: user.id_user,
                peran: user.level_user.peran,
                username: user.username,
                status: user.status,
            }

            if(result){
                res.status(200).json({
                    message: "Berhasil Login"
                })
            }else{
                res.status(200).json({
                    message: "Password Salah"
                })
            }
        })

    }catch (error) {
        res.status(404).json({
            message: error.message
        })  
    }
}

export default controller;