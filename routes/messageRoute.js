const router = require("express").Router()
const {
    isAuthenticated,
    requireRole
} = require('../middleware/authMiddleware')


const {contactUsPostController,msgGetContrller,singleMsgGetContrller,deleteMsgGetContrller,respondMessage} = require("../controllers/contactUsController")


router.get("/messages/respond",isAuthenticated,requireRole('superadmin'), respondMessage)
router.get("/messages/:msg_id",isAuthenticated,requireRole('superadmin'),  singleMsgGetContrller)
router.get("/messages/delete/:msg_id",isAuthenticated,requireRole('superadmin'),  deleteMsgGetContrller)
router.get("/messages",isAuthenticated,requireRole('superadmin'),  msgGetContrller)

router.get("/",(req,res,next)=>{
    res.render("pages/contact",{flashMessage:'',title:'Contact Us'})
})
router.post("/",contactUsPostController)

module.exports = router