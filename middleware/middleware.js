const express = require("express")
const morgan = require("morgan")
const session = require('express-session')
const MySQLStore = require('express-mysql-session')(session);
const flash = require('connect-flash');
const setLocals = require('./setLocals')

const options = {
    host: 'localhost',
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
    createDatabaseTable: true,
    clearExpired: true,
    checkExpirationInterval: 900000, // How frequently expired sessions will be cleared (in milliseconds)
    expiration: 86400000, // The maximum age of a valid session (in milliseconds)
  };
const sessionStore = new MySQLStore(options);

const {bindUserWithRequest} = require('./authMiddleware');



const middleware = [
    express.static('public'),
    morgan('dev'),
    express.urlencoded({ extended: true }),
    express.json(),
    session({
        secret: 'your secret key',
        resave: false,
        saveUninitialized: false,
        store: sessionStore,
    }),
    flash(),
    bindUserWithRequest(),
    setLocals()
]


module.exports = app => {
    middleware.forEach(m => {
        app.use(m)
    })
}