const router = require("express").Router()
const upload = require('../middleware/uploadMiddleware')

const {
    isAuthenticated,
    requireRole
} = require('../middleware/authMiddleware')


const {dashboardGetController,adminDashboardRender} = require("../controllers/user/dashboardController")
const {renderAllQuestions,renderCreateQuestion,renderAllClass,createClassPost,renderAllSubject,getSubjectByClass,getSubject,createSubjectPost,createChaptePost,getChapterBySubjectAndClass,getChapter,createQuestionPost,renderSeeQuestion,makeQuestionRender,renderCreative,creativePost} = require("../controllers/user/question")

const {renderCreateStudnet,createStudentPost,renderRegisteredStudent} = require("../controllers/student/studentController")



router.get("/admin/questions/class",isAuthenticated,requireRole('superadmin,moderator'),renderAllClass)
router.post("/admin/questions/create-class",isAuthenticated,requireRole('superadmin,moderator'),createClassPost)
router.get("/admin/questions/subject",isAuthenticated,requireRole('superadmin,moderator'),renderAllSubject)
router.get("/admin/questions/get-subject-by-class",isAuthenticated,requireRole('superadmin,moderator'),getSubjectByClass)
router.post("/admin/questions/create-subject",isAuthenticated,requireRole('superadmin,moderator'),createSubjectPost)
router.post("/admin/questions/create-chapter",isAuthenticated,requireRole('superadmin,moderator'),createChaptePost)
router.get("/admin/questions/get-chapter-by-subject-and-class",isAuthenticated,requireRole('superadmin,moderator'),getChapterBySubjectAndClass)
router.get("/admin/questions/see-question",isAuthenticated,requireRole('superadmin,moderator'),renderSeeQuestion)

router.get("/admin/questions/creative",requireRole('superadmin,moderator'),isAuthenticated,renderCreative)
router.post("/admin/questions/creative",isAuthenticated,requireRole('superadmin,moderator'),creativePost)

router.get("/admin/create-question",isAuthenticated,requireRole('superadmin,moderator'),renderCreateQuestion)
router.post("/admin/questions/create-question",isAuthenticated,requireRole('superadmin,moderator'),createQuestionPost)
router.get("/admin/questions",isAuthenticated,renderAllQuestions)
router.get("/get-subject",getSubject)
router.get("/get-chapter",getChapter)


router.get("/create-student",isAuthenticated,requireRole('admin'),renderCreateStudnet)
router.post("/create-student",isAuthenticated,requireRole('admin'),upload.single('student_avater'),createStudentPost)
router.get("/registerd-student",isAuthenticated,requireRole('admin'),renderRegisteredStudent)


module.exports = router