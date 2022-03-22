import model from "../model/index.js";

const controller = {};

controller.getAllSupplier = async function(req, res){
    try {
        let supplier = await model.supplier.findAll({})

        if(supplier.length > 0 ){
            res.status(200).json({
                message: "Data List Supplier Ditemukan",
                data : supplier
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