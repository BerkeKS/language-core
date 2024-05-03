const jwt = require('jsonwebtoken');
require('dotenv').config();

const auth = async (req, res, next) => {
    try {
        const token = req.headers["authorization"]?.split(" ")[1]
        if(!token){
            return res.status(400).json({
                status: false,
                message: "Token is empty, please login to get one!"
            })
        }
        jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (error, payload) => {
            if(error){
                console.log(error)
                return res.status(400).json({
                    status: false,
                    message: "Error" + error
                })
            }
            req.tokenPayload = payload;
            next();
        })
    } catch (error) {
        console.log(error)
    }
}

module.exports = auth;