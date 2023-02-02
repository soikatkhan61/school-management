const router = require("express").Router()


const {
    isAuthenticated,
    requireRole
} = require('../middleware/authMiddleware')


const {dashboardGetController,adminDashboardRender} = require("../controllers/user/dashboardController")
const {renderAllQuestions,renderCreateQuestion,renderAllClass,createClassPost,renderAllSubject,getSubjectByClass,getSubject,createSubjectPost,renderCreateChapter,createChaptePost,getChapterBySubjectAndClass,getChapter,createQuestionPost,renderSeeQuestion} = require("../controllers/user/question")





router.get("/admin/questions/class",isAuthenticated,requireRole('admin'),renderAllClass)
router.post("/admin/questions/create-class",isAuthenticated,requireRole('admin'),createClassPost)
router.get("/admin/questions/subject",isAuthenticated,requireRole('admin'),renderAllSubject)
router.get("/admin/questions/get-subject-by-class",isAuthenticated,requireRole('admin'),getSubjectByClass)
router.get("/get-subject",getSubject)
router.get("/get-chapter",getChapter)
router.post("/admin/questions/create-subject",isAuthenticated,requireRole('admin'),createSubjectPost)
router.get("/admin/questions/create-chapter",isAuthenticated,requireRole('admin'),renderCreateChapter)
router.post("/admin/questions/create-chapter",isAuthenticated,requireRole('admin'),createChaptePost)
router.get("/admin/questions/get-chapter-by-subject-and-class",isAuthenticated,requireRole('admin'),getChapterBySubjectAndClass)
router.get("/admin/questions/see-question",isAuthenticated,requireRole('admin'),renderSeeQuestion)
router.get("/admin/questions",isAuthenticated,renderAllQuestions)
router.get("/admin/create-question",isAuthenticated,renderCreateQuestion)
router.post("/admin/questions/create-question",isAuthenticated,createQuestionPost)
router.get("/admin",isAuthenticated,adminDashboardRender)




router.get("/dashboard",isAuthenticated,dashboardGetController)




module.exports = router