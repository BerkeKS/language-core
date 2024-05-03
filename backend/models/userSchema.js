const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const createUser = new Schema({
    username : {
        type : String,
        required : true,
        trim : true
    },
    email : {
        type : String,
        required : true,
        trim : true
    },
    password : {
        type : String,
        required : true,
        trim : true
    },
    favorites : {
        type : Array,
        default : []
    }
});

const UserModel = mongoose.model('User', createUser);
module.exports = UserModel;