const router = require('express').Router();
const questionController = require('../controllers/questionController')

router.get('/truefalse', questionController.getTFQuestions)
router.post('/addtfquestion', questionController.addTFQuestions)

module.exports = router