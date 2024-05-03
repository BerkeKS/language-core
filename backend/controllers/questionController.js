const TFQuestion = require('../models/tfSchema');

const getTFQuestions = async(req, res) => {
    try {
        var questions = await TFQuestion.find()
        res.status(200).json({
            questions : questions
        })
    } catch (error) {
        res.status(500).json({
            message : "There is a problem with the server, please try again later." + error
        })
    }
}

const addTFQuestions = async(req, res) => {
    try {
        await TFQuestion.create(req.body)
        res.status(200).json({
            message : "Question is added."
        })
    } catch (error) {
        res.status(400).json({
            message : errors
        })
    }
}

module.exports = {getTFQuestions, addTFQuestions}