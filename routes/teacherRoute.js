const router = require("express").Router()
const upload = require('../middleware/uploadMiddleware')

const {
    isAuthenticated,
    requireRole
} = require('../middleware/authMiddleware')


const {renderTeacherDashboard,reanderCreateTeacher} = require("../controllers/teacher")

router.get("/register-teacher",isAuthenticated,requireRole('admin'),reanderCreateTeacher)
router.get("/",isAuthenticated,requireRole('teacher'),renderTeacherDashboard)

module.exports = router