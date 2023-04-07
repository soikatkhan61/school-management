const db = require('../config/db1')
const Flash = require("../utils/Flash");

exports.contactUsPostController = async(req,res,next) =>{

    try {
        let {name,email,phone,message} = req.body
        if(name == '' || phone == '' || message == ''){
           return res.redirect("/")
        }
        const [rows, fields] = await db.query('insert into contact values(?,?,?,?,?,?,?)',[null,name,email,phone,message,'no',null]);

        if(rows.insertId){
            res.render("pages/utils/thankyou",{title:`Thank you ${name}!` , name ,flashMessage:Flash.getMessage(req)})
        }else{
            res.send('falied')
        }
        
    } catch (error) {
        next(error)
    }
}


exports.msgGetContrller = async(req,res,next) =>{
    let currentPage = parseInt(req.query.page) || 1
    let itemPerPage = 15
    try {
        let respond = req.query.responded
        let sql = `select count(*) as count from contact;select * from contact order by id desc limit ${((itemPerPage * currentPage) - itemPerPage)}, ${itemPerPage}`
        if(respond){
            sql = `select count(*) as count from contact;select * from contact where respond = '${respond}' order by id desc limit ${((itemPerPage * currentPage) - itemPerPage)}, ${itemPerPage}`
        }

        const [rows,fields] =await db.query(sql)
       
        let totalMessage = rows[0]
        let totalPage = Math.ceil(totalMessage[0].count / itemPerPage)
        
        res.render("admin/pages/messages",{ title:"Messages",msgs:rows[1],currentPage,itemPerPage,totalPage,flashMessage:Flash.getMessage(req)})
    } catch (error) {
        next(error)
    }
}

exports.respondMessage = async(req,res,next) =>{
    try {
        let id = req.query.id
        const [rows,fields] =await db.query("update contact set respond='yes' where id = ?",[id])
        res.redirect('/contact/messages')
    } catch (error) {
        next(error)
    }
}


exports.singleMsgGetContrller = async(req,res,next) =>{
    let msg_id = req.params.msg_id
    try {
        let [rows] = await db.query("select * from contact where id=? limit 1",[msg_id])
        res.render("admin/pages/msgPage",{ title:`Message of ${rows[0].name}`,rows,flashMessage:Flash.getMessage(req)})
    } catch (error) {
        next(error)
    }
}
exports.deleteMsgGetContrller = async(req,res,next) =>{
    let msg_id = req.params.msg_id
    try {
        await db.query("delete FROM contact where id=?",[msg_id])
        res.redirect("/contact/messages")
    } catch (error) {
        next(error)
    }
}