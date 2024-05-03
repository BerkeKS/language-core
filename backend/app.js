const express = require('express');
const app = express();
const dotenv = require('dotenv').config();
const PORT = process.env.PORT || 3000;
const pageRouter = require('./routers/pageRouter');
const userRouter = require('./routers/userRouter');
const questionRouter = require('./routers/questionRouter')
const conn = require('./db')();
const cors = require('cors');

//app.use(express.urlencoded());
app.use(express.json());
app.use(cors()); //Cors for middleware - To avoid blocks
app.use('/', pageRouter);
app.use('/user', userRouter);
app.use('/question', questionRouter);

app.listen(PORT, () => {
    console.log('API is active on, ', PORT);
})