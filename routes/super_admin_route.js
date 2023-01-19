const router = require("express").Router()
const {
    isUnAuthenticated,
    isAuthenticated
} = require('../middleware/authMiddleware')

const {renderSchools,renderRegisterSchool,handleRegistration} = require("../controllers/super_admin/schoolController")

router.get("/register-school",isAuthenticated,renderRegisterSchool)
router.post("/register-school",isAuthenticated,handleRegistration)
router.get("/school",isAuthenticated,renderSchools)

module.exports = router