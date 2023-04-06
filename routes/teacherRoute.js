const router = require("express").Router()
const upload = require('../middleware/uploadMiddleware')

const {
    isAuthenticated,
    requireRole
} = require('../middleware/authMiddleware')


const {renderTeacherDashboard,reanderCreateTeacher,registerTeacherPost,renderRegisterdTeacher} = require("../controllers/teacher")

router.get("/register-teacher",isAuthenticated,requireRole('admin'),reanderCreateTeacher)
router.post("/register-teacher",isAuthenticated,requireRole('admin'),upload.single('teacher_avater'),registerTeacherPost)

router.get("/registerd-teacher",isAuthenticated,requireRole('admin'),renderRegisterdTeacher)
router.get("/",isAuthenticated,requireRole('teacher'),renderTeacherDashboard)

module.exports = router