import model from "../model/index.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
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
        
        if(!user){ res.status(400).json({ message: "Username Salah"}) }
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

            const accessToken = jwt.sign({data}, process.env.ACCESS_TOKEN_SECRET, {
                expiresIn : "20s"
            })

            const refreshToken = jwt.sign({data}, process.env.REFRESH_TOKEN_SECRET, {
                expiresIn : "20s"
            })

            res.cookie('refreshToken', refreshToken, {
                httpOnly: true,
                maxAge: 24 * 60 * 60 * 1000
            });

            if(result){
                res.status(200).json({
                    message: "User Berhasil Login",
                    accessToken: accessToken
                })
            }else{
                res.status(400).json({
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

controller.logout = async function (req, res){
    const refreshToken = req.cookies.refreshToken;
    if(!refreshToken) return res.sendStatus(204);
    res.clearCookie('refreshToken');
    return res.status(200).json({
        message: "Berhasil Logout"
    });
}

export default controller;