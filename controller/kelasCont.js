import model from "../model/index.js";

const controller = {};

controller.getAllKelas = async function(req, res){
    try {
        let kelas = await model.kelas.findAll({})

        if(kelas.length > 0 ){
            res.status(200).json({
                message: "Data List Kelas Ditemukan",
                data : kelas
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