const router = require("express").Router()


const {
    isAuthenticated
} = require('../middleware/authMiddleware')


const {renderMyPackage,renderPkgPayment,pkgPaymentPostContrller,editPkgPayment,editPkgPaymentPostController} = require("../controllers/user/packageController")
const {dashboardGetController,renderUserSearch} = require("../controllers/user/dashboardController")




router.get("/my_package",isAuthenticated,renderMyPackage)
router.get("/pay/:pkg_id",isAuthenticated,renderPkgPayment)

router.get("/edit_payment",isAuthenticated,editPkgPayment)
router.post("/edit_payment",isAuthenticated,editPkgPaymentPostController)

router.post("/pay",isAuthenticated,pkgPaymentPostContrller)




router.get("/dashboard",isAuthenticated,dashboardGetController)




module.exports = router