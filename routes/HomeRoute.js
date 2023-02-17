const router = require("express").Router()



router.get("/",(req,res)=>{
    res.render('/',{flasMessage:''})
})

module.exports = router