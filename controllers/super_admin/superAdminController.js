const db = require("../../config/db.config")
const Flash = require("../../utils/Flash");

exports.renderSuperAdmin = async (req, res, next) => {
    try {
        db.query("select school_name,admin_name,admin_phone,status,createdAt from schools ORDER by id DESC limit 5;select * from packages;select count(id) as totalUser from users;select count(approval_status) as totalPkgSell from pkg_subscriber where approval_status=1;select pkg_subscriber.pkg_id,pkg_subscriber.approval_status,packages.price FROM pkg_subscriber JOIN packages on pkg_subscriber.pkg_id = packages.id",(e,data)=>{
            if(e){
                return next(e)
            }else{
                let payment = {
                    paid : 0,
                    due : 0
               }
               data[4].filter(v=>{
                if(v.approval_status == 0){
                    payment.due += v.price
                    return payment.due
                }else{
                    payment.paid += v.price
                    return payment.paid
                }
            })
            console.log(payment);
            res.render("admin/dashboard",{ title:"Super Admin",recentUser:data[0],pkg:data[1],totalPkgSell:data[3],payment,flashMessage:Flash.getMessage(req)})
            }
        })
    } catch (error) {
        next(error)
    }
}