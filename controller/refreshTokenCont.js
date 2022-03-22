import jwt from "jsonwebtoken";
const controller = {};

controller.getRefreshToken = async function(req, res){
    try {
        const refreshToken = req.cookies.refreshToken;
        if(!refreshToken) return res.sendStatus(401);

        jwt.verify(refreshToken, process.env.REFRESH_TOKEN_SECRET, (err, decoded) =>{
            if(err) return res.sendStatus(403);
            const data = {
                userId: decoded.data.userId,
                peran: decoded.data.peran,
                username: decoded.data.username,
                status: decoded.data.status
            }

            const accessToken = jwt.sign(data, process.env.ACCESS_TOKEN_SECRET, {
                expiresIn: '15s'
            })

            res.status(200).json({ accessToken });
        })
    } catch (error) {
        console.log(error)
    }
}

export default controller;