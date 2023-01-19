const router = require("express").Router()

const {renderHome} = require('../controllers/renderHomePage')

router.get("/",renderHome)

module.exports = router