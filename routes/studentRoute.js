const router = require("express").Router()
const upload = require('../middleware/uploadMiddleware')

const {
    isAuthenticated,
    requireRole
} = require('../middleware/authMiddleware')


const {renderStudentProfile,studentDashboard} = require("../controllers/student/studentController")

router.get("/profile",isAuthenticated,requireRole('admin,teacher,student'),renderStudentProfile)
router.get("/",isAuthenticated,requireRole('admin,teacher,student'),studentDashboard)

module.exports = router