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
  let { package_name, price, validity,teacher_limit } = req.body;
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
              flashMessage: "",
            });
          } else {
            console.log(data);
            db.query(
              "update packages set price=? , validity =?, teacher_limit = ? where package_name=?",
              [price, validity,teacher_limit, package_name],
              (e, data) => {
                if (e) {
                  console.log(e);
                  next(e);
                } else {
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
