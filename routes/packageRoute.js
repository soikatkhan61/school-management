const router = require("express").Router()


const {
    isAuthenticated,requireRole
} = require('../middleware/authMiddleware')
const {adminPackageGetController,packageEditGetController,packageEditPostController,packageAnalysticGetController} = require("../controllers/super_admin/packageController")

const {packageGetController,packageBuyPostController} = require('../controllers/user/packageController')



router.get("/packages/analystic",isAuthenticated,requireRole('superadmin'),packageAnalysticGetController)
router.get("/packages/edit-package",isAuthenticated,requireRole('superadmin'),packageEditGetController)
router.post("/packages/edit-package",isAuthenticated,requireRole('superadmin'),packageEditPostController)
router.get("/packages",isAuthenticated,requireRole('superadmin'),adminPackageGetController)

router.get("/buy",isAuthenticated,packageBuyPostController)
router.get("/",packageGetController)




module.exports = router