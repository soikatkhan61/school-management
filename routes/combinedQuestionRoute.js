const router = require("express").Router()
const upload = require('../middleware/uploadMiddleware')

const {
    isAuthenticated,
    requireRole
} = require('../middleware/authMiddleware')


const {renderCombined,viewSubject,viewSubjectGet,viewChapterGet,viewQuestionGet,addQuestion,renderSavedQuesSet,renderviewSet,renderAnswer} = require("../controllers/Combined/combindedController")

router.get("/view-subject",isAuthenticated,requireRole('admin,teacher'),viewSubjectGet)
router.get("/view-questions",isAuthenticated,requireRole('admin,teacher'),viewQuestionGet)
router.get("/view-chapter",isAuthenticated,requireRole('admin,teacher'),viewChapterGet)

router.get("/add-question",addQuestion)

router.get("/saved",isAuthenticated,requireRole('admin,teacher'),renderSavedQuesSet)
router.get("/view-set",isAuthenticated,requireRole('admin,teacher'),renderviewSet)
router.get("/answer",isAuthenticated,requireRole('admin,teacher'),renderAnswer)

router.get("/",isAuthenticated,requireRole('admin,teacher'),renderCombined)
router.post("/",isAuthenticated,requireRole('admin,teacher'),viewSubject)




module.exports = router