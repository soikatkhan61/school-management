const router = require("express").Router()
const {
    isUnAuthenticated,
    requireRole,
    isAuthenticated
} = require('../middleware/authMiddleware')

const {renderAdminstrationDashboard} = require("../controllers/Administration")


router.get("/",isAuthenticated,requireRole('admin'),renderAdminstrationDashboard)

module.exports = router