const router = require("express").Router()
const upload = require('../middleware/uploadMiddleware')

const {
    isAuthenticated,
    requireRole
} = require('../middleware/authMiddleware')


const {renderModeratorDashboard} = require("../controllers/moderator/moderatorController")

router.get("/",isAuthenticated,requireRole('moderator'),renderModeratorDashboard)

module.exports = router