import model from "../model/index.js";

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

export default controller;