const router = require("express").Router()

const {contactUsPostController} = require("../controllers/contactUsController")

router.get("/",(req,res,next)=>{
    res.render("pages/contact",{flashMessage:'',title:'Contact Us'})
})
router.post("/",contactUsPostController)

module.exports = router