import model from "../model/index.js";

const controller = {};

controller.getAllSiswa = async function(req, res){
    try {
        let siswa = await model.siswa.findAll({})

        if(siswa.length > 0 ){
            res.status(200).json({
                message: "Data List Siswa Ditemukan",
                data : siswa
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