const router = require("express").Router()
const {
    isUnAuthenticated,
    requireRole,
    isAuthenticated
} = require('../middleware/authMiddleware')

const {renderSchools,renderRegisterSchool,handleRegistration,schoolRegistrationByUser} = require("../controllers/super_admin/schoolController")

const {renderSuperAdmin} = require("../controllers/super_admin/superAdminController")

router.get("/register-school",isAuthenticated,requireRole("superadmin"),renderRegisterSchool)
router.post("/register-school",handleRegistration)
router.get("/school-registration",schoolRegistrationByUser)
router.get("/school",isAuthenticated,requireRole("superadmin"),renderSchools)
router.get("/",isAuthenticated,requireRole("superadmin"),renderSuperAdmin)

module.exports = router