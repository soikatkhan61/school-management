const router = require("express").Router()
const {
    isUnAuthenticated,
    requireRole,
    isAuthenticated
} = require('../middleware/authMiddleware')

const {renderSchools,renderRegisterSchool,handleRegistration} = require("../controllers/super_admin/schoolController")

const {renderSuperAdmin} = require("../controllers/super_admin/superAdminController")

router.get("/register-school",isAuthenticated,requireRole("superadmin"),renderRegisterSchool)
router.post("/register-school",isAuthenticated,handleRegistration)
router.get("/school",isAuthenticated,requireRole("superadmin"),renderSchools)
router.get("/",isAuthenticated,requireRole("superadmin"),renderSuperAdmin)

module.exports = router