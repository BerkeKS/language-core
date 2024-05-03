const router = require('express').Router();
const pageController = require('../controllers/pageController');
const userController = require('../controllers/userController');

router.get('/', pageController.getHomePage);
router.get('/login', pageController.getLoginPage);
router.get('/register', pageController.getRegisterPage);
router.get('/words', userController.getWords);

module.exports = router;