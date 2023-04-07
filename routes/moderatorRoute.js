const router = require("express").Router()
const upload = require('../middleware/uploadMiddleware')

const {
    isAuthenticated,
    requireRole
} = require('../middleware/authMiddleware')


const {renderModeratorDashboard,renderRegisterModerator,registerModeratorPost,renderModeratorList} = require("../controllers/moderator/moderatorController")

router.get("/register-moderator",isAuthenticated,requireRole('superadmin'),renderRegisterModerator)
router.post("/register-moderator",isAuthenticated,requireRole('superadmin'),upload.single('moderator_avater'),registerModeratorPost)
router.get("/registerd-moderator",isAuthenticated,requireRole('superadmin'),renderModeratorList)
router.get("/",isAuthenticated,requireRole('moderator'),renderModeratorDashboard)

module.exports = router