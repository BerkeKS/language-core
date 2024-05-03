const UserModel = require('../models/userSchema');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const WordModel = require('../models/wordSchema');
require('dotenv').config();

const createUser = async(req, res) => {
    try{
        const {username, email, password} = req.body;
        const existingUser = await UserModel.findOne({username});
        if(existingUser){
            return res.status(400).json({
                status : false,
                message : "This username has already been taken!"
            });
        }
        const existingMail = await UserModel.findOne({email});
        if(existingMail){
            return res.status(400).json({
                status : false,
                message : "You entered an existing email!"
            });
        }
        bcrypt.hash(password, 10, async (err, hash) => {
            req.body = {...req.body, password : hash}
            await UserModel.create(req.body);
            res.status(200).json(req.body)
        })
    }catch(err){
        res.status(500).json({
            status : false,
            message : "Error: " + err
        });
    }
}

const getUserWithUsername = async (req, res) => {
    try {
        const {username , password} = req.body;
        const user = await UserModel.findOne({username})
        if(!user){
            return res.status(400).json({
                status : false,
                message : "User with this username is not found!"
            });
        }
        const userID = user._id
        bcrypt.compare(password, user.password, async (err, data) => {
            if(err) {
                throw err;
            }
            if(data) {
                //const token = await generateToken({id: user._id, username: user.username}, 'passwordKey', '2h');
                const accessToken = jwt.sign({userID}, process.env.ACCESS_TOKEN_SECRET, {expiresIn: "30s"})
                const refreshToken = jwt.sign({userID}, process.env.REFRESH_TOKEN_SECRET)
                return res.status(200).json({
                    status : true,
                    message : "Welcome " + user.username,
                    user,
                    accessToken,
                    refreshToken
                });
            }
            else {
                return res.status(400).json({
                    status : false,
                    message : "You entered wrong password!"
                });
            }
        });
    } catch (err) {
        res.status(500).json({
            status : false,
            message : "Something went wrong: " + err.message
        });
    }
}

const getUserWithEmail = async (req, res) => {
    try {
        const {email , password} = req.body;
        const user = await UserModel.findOne({email})
        if(!user){
            return res.status(400).json({
                status : false,
                message : "User with this email is not found!"
            });
        }
        bcrypt.compare(password, user.password, async (err, data) => {
            if(err) {
                throw err;
            }
            if(data) {
                //const token = await generateToken({id: user._id, username: user.username}, 'passwordKey', '1h');
                return res.status(200).json({
                    status : true,
                    message : "Welcome " + user.username,
                    token
                });
            }
            else {
                return res.status(400).json({
                    status : false,
                    message : "You entered wrong password!"
                });
            }
        });
    } catch (err) {
        res.status(500).json({
            status : false,
            message : "Something went wrong: " + err.message
        });
    }
}

const updateUsername = async (req, res) => {
    try {
        const anotherUser = await UserModel.findOne(req.body.username);
        if(anotherUser){
            return res.status(400).json({
                status : false,
                message : "This username has already been taken by another account!"
            })
        }
        await UserModel.findOneAndUpdate(
            {username : req.params.username},
            {$set : {username : req.body.username}}
        )
        return res.status(200).json({
            status : true,
            message : "The username has been successfully changed."
        })

    } catch(err){
        res.status(500).json({
            status : false,
            message : "Something went wrong: " + err.message
        });
    }
}

const updateEmail = async (req, res) => {
    try {
        const anotherUser = await UserModel.findOne(req.body.email);
        if(anotherUser){
            return res.status(400).json({
                status : false,
                message : "This email has already been taken by another account!"
            })
        }
        await UserModel.findOneAndUpdate(
            {username : req.params.username},
            {$set : {email : req.body.email}}
        )
        return res.status(200).json({
            status : true,
            message : "The email has been successfully changed."
        })

    } catch(err){
        res.status(500).json({
            status : false,
            message : "Something went wrong: " + err.message
        });
    }
}

const updatePassword = async(req, res) => {
    try {
        bcrypt.hash(req.body.password, 10, async (err, hash) => {
            req.body = {...req.body, password : hash}
            await UserModel.findOneAndUpdate(
                {username : req.params.username},
                {$set : {password : password}},
            )
            res.status(200).json(req.body)
        })
    } catch (err) {
        res.status(500).json({
            status : false,
            message : "Something went wrong: " + err.message
        });
    }
}

const deleteUser = async (req, res) => {
    try {
        const deletedUser = await UserModel.remove({id : req.body._id});
        if(deletedUser){
            res.status(200).json({
                status : true,
                message : "User is deleted."
            });
        } else{
            res.status(400).json({
                status : false,
                message : "User can not be found."
            })
        }
    } catch (err) {
        res.status(500).json({
            status : false,
            message : "Something went wrong: " + err.message
        });
    }
}

const getWords = async (req, res) => {
    try {
        //find() method returns all documents, {...} inside paranthesis are queries
        words = await WordModel.find()
        res.status(200).json({
            status : true,
            words : words
        });
    } catch (err) {
        res.status(400).json({
            status : false,
            message : "Something went wrong: " + err.message
        });
    }
}

const getFavorites = async (req, res) => {
    try {
        const {username} = req.params;
        const user = await UserModel.findOne({username});
        if(!user){
            return res.status(400).json({
                status : false,
                message : "There is not any account registered with this username."
            });
        }
        const userFavorites = user.favorites;
        const favoriteWords = [];
        for (const wordName of userFavorites) {
            const word = await WordModel.findOne({name : wordName})
            favoriteWords.push(word)
        }
        return res.status(200).json({
            status : true,
            favorites : favoriteWords
        });
    } catch (err) {
        res.status(400).json({
            status : false,
            message : "Something went wrong: " + err.message
        });
    }
}

const addFavorite = async (req, res) => {
    try{
        const{word} = req.body;
        await UserModel.findOneAndUpdate(
            {username : req.params.username},
            {$addToSet: {favorites : word}})
        return res.status(200).json({
            status : true,
        })
    }
    catch(err){
        res.status(400).json({
            status : false,
            message : "Something went wrong: " + err.message
        });
    }
}

const removeFavorite = async (req, res) => {
    try{
        const{word} = req.body;
        await UserModel.findOneAndUpdate(
            {username : req.params.username},
            {$pull: {favorites : word}})
        return res.status(200).json({
            status : true,
        })
    }
    catch(err){
        res.status(500).json({
            status : false,
            message : "Something went wrong: " + err.message
        });
    }
}

module.exports = {createUser, getUserWithUsername, getUserWithEmail, updateUsername, updateEmail, updatePassword, deleteUser, getWords, getFavorites, addFavorite, removeFavorite};