const router = require('express').Router();
const userController = require('../controllers/userController');

router.post('/login', userController.getUserWithUsername);
router.post('/logine', userController.getUserWithEmail);
router.post('/register', userController.createUser);
router.post('/:username/update/username', userController.updateUsername);
router.post('/:username/update/email', userController.updateEmail);
router.post('/:username/update/password', userController.updatePassword);
router.delete('/:username/delete', userController.deleteUser);
router.get('/:username/favorites', userController.getFavorites);
router.post('/:username/addfavorite', userController.addFavorite);
router.post('/:username/notfavorite', userController.removeFavorite);

module.exports = router;