const db = require('../config/db1')

exports.contactUsPostController = async(req,res,next) =>{

    try {
        let {name,email,phone,message} = req.body
        if(name == '' || phone == '' || message == ''){
           return res.redirect("/")
        }
        console.log(req.body);
        const [rows, fields] = await db.query('insert into contact values(?,?,?,?,?,?,?)',[null,name,email,phone,message,'no',null]);

        if(rows.insertId){
            res.render("pages/utils/thankyou",{title:`Thank you ${name}!` , name,flashMessage:''})
        }else{
            res.send('falied')
        }
        
    } catch (error) {
        next(error)
    }
}


exports.msgGetContrller = async(req,res,next) =>{
    try {
        let respond = req.query.responded
        let sql = 'select * from contact order by id desc limit 100'
        if(respond){
            sql = `select * from contact where respond = '${respond}' order by id desc limit 100`
        }
        const [rows,fields] =await db.query(sql)

      res.render("admin/pages/messages",{msgs:rows,flashMessage:''})
    } catch (error) {
        next(error)
    }
}

exports.respondMessage = async(req,res,next) =>{
    try {
        let id = req.query.id
        const [rows,fields] =await db.query("update contact set respond='yes' where id = ?",[id])
        res.redirect('/admin/messages')
    } catch (error) {
        next(error)
    }
}


exports.singleMsgGetContrller = async(req,res,next) =>{
    let msg_id = req.params.msg_id
    try {
        let [rows] = await db.query("select * from contact where id=? limit 1",[msg_id])
        res.render("admin/pages/msgPage",{rows,flashMessage:''})
    } catch (error) {
        next(error)
    }
}
exports.deleteMsgGetContrller = async(req,res,next) =>{
    let msg_id = req.params.msg_id
    try {
        await db.query("delete FROM contact where id=?",[msg_id])
        res.redirect("/admin/messages")
    } catch (error) {
        next(error)
    }
}