const router = require("express").Router()
const upload = require('../middleware/uploadMiddleware')

const {
    isAuthenticated,
    requireRole
} = require('../middleware/authMiddleware')


const {renderCreateExam,createExamPost,renderExamResults,renderAllExamList,renderMyExam,renderJoinExam,joinExamPost,submitResponse,renderSubmitStatus,renderStudentResult,renderStudentAllResult,examStatusChange} = require("../controllers/exam/createExamController")
const {viewGeneratedQuestion} = require("../controllers/exam/questionGeneratorController")

router.get("/create",isAuthenticated,requireRole('admin,teacher'),renderCreateExam)
router.post("/create",isAuthenticated,requireRole('admin,teacher'),createExamPost)
router.get("/results",isAuthenticated,requireRole('admin,teacher'),renderExamResults)
router.get("/status-change",isAuthenticated,requireRole('admin,teacher'),examStatusChange)
router.get("/view",isAuthenticated,requireRole('admin,teacher'),renderAllExamList)
router.get("/my-exam",isAuthenticated,requireRole('student'),renderMyExam)
router.get("/join",isAuthenticated,requireRole('student'),renderJoinExam)
router.post("/render-questions",isAuthenticated,requireRole('student'),joinExamPost)
router.get("/submit",isAuthenticated,requireRole('student'),renderSubmitStatus)
router.post("/submit",isAuthenticated,requireRole('student'),submitResponse)
router.get("/view-result",isAuthenticated,requireRole('student'),renderStudentResult)
router.get("/all-results",isAuthenticated,requireRole('student'),renderStudentAllResult)
router.get("/view-question",isAuthenticated,requireRole('admin,teacher'),viewGeneratedQuestion)

module.exports = router