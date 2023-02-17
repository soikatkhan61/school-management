const router = require("express").Router()
const upload = require('../middleware/uploadMiddleware')

const {
    isAuthenticated,
    requireRole
} = require('../middleware/authMiddleware')


const {renderCreateExam,loadQuestion} = require("../controllers/exam/createController")

router.get("/create",isAuthenticated,requireRole('admin,teacher'),renderCreateExam)
router.get("/load-question",isAuthenticated,requireRole('admin,teacher'),loadQuestion)
router.post("/load-question",isAuthenticated,requireRole('admin,teacher'),loadQuestion)

module.exports = router