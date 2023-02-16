const router = require("express").Router()
const upload = require('../middleware/uploadMiddleware')

const {
    isAuthenticated,
    requireRole
} = require('../middleware/authMiddleware')


const {renderTeacherDashboard} = require("../controllers/teacher")

router.get("/",isAuthenticated,requireRole('teacher'),renderTeacherDashboard)

module.exports = router