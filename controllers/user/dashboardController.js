const db = require("../../config/db.config")
exports.dashboardGetController = async (req, res, next) => {
    try {
        db.query("select * from users where id = ?",[req.user.id],(e,data)=>{
            if(e){
                next(e)
            }else{
                if(data){
                    res.render("user/dashboard", { title: "Dashboard", userProfile: "",recentUser:data });
                }else{
                    res.render("user/dashboard", { title: "Dashboard", userProfile: "",recentUser:'' });
                }
            }
        })
    } catch (error) {
        next(e)
    }
   
  };

  exports.renderUserSearch = async(req,res,next) =>{
    res.render("user/pages/search-user",{title:'Search User'})
  }
  