const db = require("../../../config/db.config")
const Flash = require("../../utils/Flash");
exports.profileSearchAndGetController = (req,res,next) =>{
    let username = req.query.username
    if(username){
        db.query("select username,email,balance,isVerified,createdAt,verfication_id from users where username like ? limit 20",[`${username + "%"}`],(e,results)=>{
            if(e){
                return next(e)
            }else{
                if(results){
                    res.render("admin/pages/user-profile/profile-search",{flashMessage:'',searchResult:results})
                }else{
                    res.render("admin/pages/user-profile/profile-search",{flashMessage:'',searchResult:''})
                }
            }
        })
    }else{
        res.render("admin/pages/user-profile/profile-search",{flashMessage:'',searchResult:''})
    }
    
    
}