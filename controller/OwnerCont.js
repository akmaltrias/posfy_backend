import model from "../model/index.js";

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

export default controller;