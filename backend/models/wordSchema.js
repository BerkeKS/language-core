const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const createWord = new Schema({
    unit:{
        type: Number,
        required: true
    },
    part:{
        type: Number,
        required: true
    },
    name: {
        type: String,
        required : true
    },
    chineseTranslation: {
        type: String,
        required : true
    },
    chineseTranslationPinyin: {
        type: String,
        required : true
    },
    germanTranslation: {
        type: String,
        required : true
    },
    koreanTranslation: {
        type: String,
        required : true
    },
    koreanTranslationRomanized: {
        type: String,
        required : true
    },
    spanishTranslation: {
        type: String,
        required : true
    },
    image: {
        type: String
    }
});

//Word is collection name and it is translated to words
const WordModel = mongoose.model('Word', createWord);
module.exports = WordModel;