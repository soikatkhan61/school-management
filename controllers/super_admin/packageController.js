const db = require("../../config/db.config")
const Flash = require("../../utils/Flash");
//package CRUD
exports.adminPackageGetController = async (req, res, next) => {
  db.query("select * from packages", (e, data) => {
    if (e) {
      next(e);
    }
    if (data) {
      res.render("admin/pages/package/package", {
        title:"Package",
        flashMessage:'',
        pkg: data,
      });
    } else {
      res.status(404).send("no data found");
    }
  });
};

exports.packageEditGetController = async (req, res, next) => {
  try {
    let package_name = req.query.package;
    console.log(package_name);
    db.query(
      "select * from packages where package_name=?;select * from packages",
      [package_name],
      (e, data) => {
        if (e) {
          next(e);
        }
        if (!data[0] && !data[1]) {
          return res.render("pages/error/500", {
            flashMessage: "",
          });
        } else {
          res.render("admin/pages/package/edit-package", {
            title:"Edit Package",
            flashMessage:'',
            pkg: data[0],
            pkgs: data[1],
          });
        }
      }
    );
  } catch (error) {
    next(error);
  }
};

exports.packageEditPostController = async (req, res, next) => {
  let { package_name, price, validity,teacher_limit,student_limit } = req.body;
  console.log(req.body);
  try {
    db.query(
      "select * from packages where package_name=?;",
      [package_name],
      (e, data) => {
        if (e) {
          console.log(e);
          next(e);
        } else {
          if (!data) {
            return res.render("pages/error/404", {
              title:"Page not found",
              flashMessage: "",
            });
          } else {
            console.log(data);
            db.query(
              "update packages set price=? , validity =?, teacher_limit = ?,student_limit=? where package_name=?",
              [price, validity,teacher_limit,student_limit, package_name],
              (e, data) => {
                if (e) {
                  return next(e);
                } else {
                  console.log(data);
                  if(data.affectedRows > 0){
                    req.flash('success','Successfully updated packages')
                  }else{
                    req.flash('fail','Failed to update packages')
                  }
                  res.redirect("/packages/packages/analystic");
                }
              }
            );
          }
        }
      }
    );
  } catch (error) {
    next(error);
  }
};

exports.packageAnalysticGetController =async (req,res,next) =>{
    try {
        db.query("select * from packages",(e,data)=>{
            if(e){
                next(e)
            }
            if(data){
                res.render("admin/pages/package/analystic",{ title:"Package Analysis",flashMessage:Flash.getMessage(req),pkg:data})
            }else{
                res.status(200).send("no data found")
            }
        })
    } catch (error) {
        next(error)
    }
   
}
