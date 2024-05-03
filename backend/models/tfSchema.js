const mongoose = require('mongoose');

const Schema = mongoose.Schema

const trueFalseQuestionSchema = new Schema({
    unit : {
        type : Number,
        required : true
    },
    question : {
        type : String,
        required : true
    },
    answer : {
        type : Boolean,
        required : true
    }
})

const trueFalseQuestion = mongoose.model('TrueFalseQuestion', trueFalseQuestionSchema)
module.exports = trueFalseQuestion