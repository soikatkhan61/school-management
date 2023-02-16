const router = require("express").Router()
const upload = require('../middleware/uploadMiddleware')

const {
    isAuthenticated,
    requireRole
} = require('../middleware/authMiddleware')


const {dashboardGetController,adminDashboardRender} = require("../controllers/user/dashboardController")
const {renderAllQuestions,renderCreateQuestion,renderAllClass,createClassPost,renderAllSubject,getSubjectByClass,getSubject,createSubjectPost,renderCreateChapter,createChaptePost,getChapterBySubjectAndClass,getChapter,createQuestionPost,renderSeeQuestion,makeQuestionRender} = require("../controllers/user/question")

const {renderCreateStudnet,createStudentPost,renderRegisteredStudent} = require("../controllers/student/studentController")




router.get("/admin/questions/class",isAuthenticated,requireRole('admin'),renderAllClass)
router.post("/admin/questions/create-class",isAuthenticated,requireRole('admin'),createClassPost)
router.get("/admin/questions/subject",isAuthenticated,requireRole('admin'),renderAllSubject)
router.get("/admin/questions/get-subject-by-class",isAuthenticated,requireRole('admin'),getSubjectByClass)
router.post("/admin/questions/create-subject",isAuthenticated,requireRole('admin'),createSubjectPost)
router.get("/admin/questions/create-chapter",isAuthenticated,requireRole('admin'),renderCreateChapter)
router.post("/admin/questions/create-chapter",isAuthenticated,requireRole('admin'),createChaptePost)
router.get("/admin/questions/get-chapter-by-subject-and-class",isAuthenticated,requireRole('admin'),getChapterBySubjectAndClass)
router.get("/admin/questions/see-question",isAuthenticated,requireRole('admin'),renderSeeQuestion)
router.post("/admin/questions/create-question",isAuthenticated,createQuestionPost)
router.get("/admin/questions/make-question",isAuthenticated,makeQuestionRender)
router.get("/admin/create-question",isAuthenticated,renderCreateQuestion)
router.get("/admin/questions",isAuthenticated,renderAllQuestions)
router.get("/get-subject",getSubject)
router.get("/get-chapter",getChapter)
router.get("/admin",isAuthenticated,adminDashboardRender)

router.get("/create-student",isAuthenticated,requireRole('admin,teacher'),renderCreateStudnet)
router.post("/create-student",isAuthenticated,requireRole('admin,teacher'),upload.single('student_avater'),createStudentPost)
router.get("/registerd-student",isAuthenticated,requireRole('admin,teacher'),renderRegisteredStudent)




router.get("/dashboard",isAuthenticated,dashboardGetController)




module.exports = router