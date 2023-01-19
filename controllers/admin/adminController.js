const db = require("../../config/db.config")
const Flash = require("../../utils/Flash");
exports.adminDashboardGetController =async (req,res,next) =>{

    try {
        db.query("select username,email,createdAt,isVerified from users ORDER by id DESC limit 5;select * from packages;select count(id) as totalUser from users;select count(approval_status) as totalPkgSell from pkg_subscriber where approval_status=1;select pkg_subscriber.pkg_id,pkg_subscriber.approval_status,packages.price FROM pkg_subscriber JOIN packages on pkg_subscriber.pkg_id = packages.id ",(e,data)=>{
            if(e){
                return next(e)
            }else{
                let payment = {
                     paid : 0,
                     due : 0
                }

                let approval_package_price = data[4].filter(v=>{
                    if(v.approval_status == 0){
                        payment.due += v.price
                        return payment.due
                    }else{
                        payment.paid += v.price
                        return payment.paid
                    }
                })

                //reduce((partialSum, a) => partialSum + a, 0);

                console.log(payment);

                res.render("admin/dashboard",{flashMessage:Flash.getMessage(req),recentUser:data[0],pkg:data[1],totalUser:data[2],totalPkgSell:data[3],payment:data[4],payment})
            }
        })
        
    } catch (error) {
        next(error)
    }
   
}

exports.packageAnalysticGetController =async (req,res,next) =>{
    try {
        db.query("select * from packages",(e,data)=>{
            if(e){
                next(e)
            }
            console.log(data)
            if(data){
                res.render("admin/pages/package/analystic",{flashMessage:'',pkg:data})
            }else{
                res.status(200).send("no data found")
            }
        })
    } catch (error) {
        next(error)
    }
   
}