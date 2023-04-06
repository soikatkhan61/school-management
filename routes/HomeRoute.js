const router = require("express").Router()
const Flash = require("../utils/Flash")

router.get("/",(req,res)=>{
    res.render('index',{flashMessage:Flash.getMessage(req)})
})

module.exports = router