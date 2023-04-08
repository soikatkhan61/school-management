const router = require("express").Router()
const upload = require('../middleware/uploadMiddleware')

const {
    isAuthenticated,
    requireRole
} = require('../middleware/authMiddleware')


const {renderRandom,randomGenerator} = require("../controllers/Random/randomController")

router.get("/view",isAuthenticated,requireRole('admin,teacher'),randomGenerator)
router.get("/",isAuthenticated,requireRole('admin,teacher'),renderRandom)



module.exports = router