const router = require("express").Router()

router.get("/",(req,res)=>{
    res.render('index',{flasMessage:''})
})

module.exports = router