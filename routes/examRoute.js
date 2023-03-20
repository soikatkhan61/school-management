const router = require("express").Router()
const upload = require('../middleware/uploadMiddleware')

const {
    isAuthenticated,
    requireRole
} = require('../middleware/authMiddleware')


const {renderCreateExam,createExamPost,renderExamResults} = require("../controllers/exam/createExamController")
const {viewGeneratedQuestion} = require("../controllers/exam/questionGeneratorController")

router.get("/create",isAuthenticated,requireRole('admin,teacher'),renderCreateExam)
router.post("/create",isAuthenticated,requireRole('admin,teacher'),createExamPost)
router.get("/results",isAuthenticated,requireRole('admin,teacher'),renderExamResults)
router.get("/view-question",isAuthenticated,requireRole('admin,teacher'),viewGeneratedQuestion)

module.exports = router