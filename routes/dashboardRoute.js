const router = require("express").Router()
const upload = require('../middleware/uploadMiddleware')

const {
    isAuthenticated,
    requireRole
} = require('../middleware/authMiddleware')


const {renderStudentProfile} = require("../controllers/student/studentController")

router.get("/profile",isAuthenticated,requireRole('admin'),renderStudentProfile)

module.exports = router