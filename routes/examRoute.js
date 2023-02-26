const router = require("express").Router()
const upload = require('../middleware/uploadMiddleware')

const {
    isAuthenticated,
    requireRole
} = require('../middleware/authMiddleware')


const {renderCreateExam,loadQuestion} = require("../controllers/exam/createExamController")
const {renderQuestionGenerator,viewGeneratedQuestion} = require("../controllers/exam/questionGeneratorController")

router.get("/create",isAuthenticated,requireRole('admin,teacher'),renderCreateExam)
router.get("/load-question",isAuthenticated,requireRole('admin,teacher'),loadQuestion)
router.post("/load-question",isAuthenticated,requireRole('admin,teacher'),loadQuestion)
router.get("/question-generator",isAuthenticated,requireRole('admin,teacher'),renderQuestionGenerator)
router.get("/view-question",isAuthenticated,requireRole('admin,teacher'),viewGeneratedQuestion)

module.exports = router