const mongoose = require('mongoose');

async function conn(){
    try{
        mongoose.set("strictQuery", false);
        await mongoose.connect(process.env.DB_CONN);
        console.log("Database is connected");
    }catch(err){
        console.log("Error: ", err);
    }
}

module.exports = conn;