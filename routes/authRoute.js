const router = require("express").Router()

const signupValidator = require('../validator/auth/signupValidator')
const changePasswordValidator = require('../validator/auth/changePasswordValidator')

const {renderTeacherLoginController,teacherLoginPost} = require('../controllers/Auth/teacherAuth')
const {renderModeratorLoginController,moderatorLoginPost} = require('../controllers/Auth/moderatorAuth')

const {
    isUnAuthenticated,
    isAuthenticated
} = require('../middleware/authMiddleware')


const {
    loginGetController,
    loginPostController,
    logoutController,
    changePasswordGetController,
    changePasswordPostController,
    setNewPassword
} = require("../controllers/auth")



router.get("/login/teacher",isUnAuthenticated,renderTeacherLoginController)
router.post("/login/teacher",isUnAuthenticated,teacherLoginPost)

router.get("/login/moderator",isUnAuthenticated,renderModeratorLoginController)
router.post("/login/moderator",isUnAuthenticated,moderatorLoginPost)

router.get("/login",isUnAuthenticated,loginGetController)
router.post("/login",isUnAuthenticated,loginPostController)

router.get("/change-password",isAuthenticated,changePasswordGetController)
router.post("/change-password",isAuthenticated,changePasswordValidator,changePasswordPostController)

router.post("/new-password",isUnAuthenticated,setNewPassword)


router.get("/logout",logoutController)


module.exports = router