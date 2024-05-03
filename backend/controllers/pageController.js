const getHomePage = (req, res) => {
    try{
        res.status(200).json({
            status : true,
            message : "Get Home Page"
        })
    }
    catch(err){
        res.status(400).json({
            status : false,
            message : "Can't get Home Page",
            err
        })
    }
}

const getLoginPage = (req, res) => {
    try{
        res.status(200).json({
            status : true,
            message : "Get Login Page"
        })
    }
    catch(err){
        res.status(400).json({
            status : false,
            message : "Can't get Login Page",
            err
        })
    }
}

const getRegisterPage = (req, res) => {
    try{
        res.status(200).json({
            status : true,
            message : "Get Register Page"
        })
    }
    catch(err){
        res.status(400).json({
            status : false,
            message : "Can't get Register Page",
            err
        })
    }
}

module.exports = {
    getHomePage,
    getLoginPage,
    getRegisterPage
};