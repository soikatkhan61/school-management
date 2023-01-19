const moment = require("moment");
const db = require("../../config/db.config");
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
  let { package_name, price, package_comission } = req.body;
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
              "update packages set price=? , package_comission =? where package_name=?",
              [price, package_comission, package_name],
              (e, data) => {
                if (e) {
                  console.log(e);
                  next(e);
                } else {
                  res.redirect("/admin/packages/analystic");
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

//package request get and accept
exports.pkgApproveGet = async (req, res, next) => {
  try {

    let sql = `
    SELECT
      users.id as userID, users.username, users.email, packages.package_name, packages.price, packages.package_comission,pkg_payment.id as  pkg_payment_id,pkg_payment.payment_method,pkg_payment.createdAt,pkg_payment.message,pkg_subscriber.approval_status,pkg_subscriber.id as pkg_subb_id ,pkg_payment.transaction_number
    FROM packages
    
    JOIN pkg_payment
      ON packages.id = pkg_payment.pkg_id 
  
    JOIN users
      ON pkg_payment.user_id = users.id
      
     JOIN pkg_subscriber
      ON pkg_subscriber.user_id = pkg_payment.user_id
      where pkg_subscriber.approval_status = 0 order by pkg_subscriber.id  desc
       LIMIT 40`
    let rejected = req.query.rejected

    if(rejected == 'true'){
      sql = `
      SELECT
      users.id as userID, users.username, users.email, packages.package_name, packages.price, packages.package_comission,pkg_payment.id as  pkg_payment_id,pkg_payment.payment_method,pkg_payment.createdAt,pkg_payment.message,pkg_subscriber.approval_status,pkg_subscriber.id as pkg_subb_id ,pkg_payment.transaction_number
    FROM packages
    
    JOIN pkg_payment
      ON packages.id = pkg_payment.pkg_id 
  
    JOIN users
      ON pkg_payment.user_id = users.id
      
     JOIN pkg_subscriber
      ON pkg_subscriber.user_id = pkg_payment.user_id
      where pkg_subscriber.approval_status = 0 and pkg_payment.message IS NOT NULL order by pkg_subscriber.id  desc
       LIMIT 40`
    }

    db.query(sql,(e, data) => {
        if (e) {
          next(e);
        } else {
          if (data) {
            res.render("admin/pages/package/pkg_buy_req", {
              flashMessage:Flash.getMessage(req),
              title: "Pakcage Request",
              pkg: data,
            });
          }
        }
      }
    );
  } catch (error) {
    next(e);
  }
};


exports.pkgApproved = (req,res,next) =>{
  let pkg_sub_id = req.query.pkg_sub_id
  try {
    db.query("select pkg_id,approval_status from pkg_subscriber where id =? limit 1",[pkg_sub_id],(e,data)=>{
      if(e){
        return next(e)
      }else{
        db.query(
          "update pkg_subscriber set approval_status = 1 where id=? LIMIT 1;update packages set total_subscriber = total_subscriber + 1 where id = ? ",
          [pkg_sub_id,data[0].pkg_id],
          (e, data) => {
            if (e) {
              return next(e);
            } else {
              return res.redirect("/admin/packages/approve");
            }
          }
        );
      }
    })
    
  } catch (error) {
    next(error)
  }
}

exports.pkgApprovePost = (req,res,next)=>{
  let pkg_payment_id = req.query.payment_id
  try {
    db.query("SELECT pkg_payment.pkg_sub_id,pkg_payment.pkg_id from pkg_payment join pkg_subscriber on pkg_payment.pkg_sub_id = pkg_subscriber.id WHERE pkg_payment.id = ?",[pkg_payment_id],(e,data)=>{
      if(e){
        next(e)
      }else{
        if(data.length>0){
          db.query("update pkg_subscriber set approval_status=1 where id = ?;update packages set total_subscriber = total_subscriber + 1 where id = ?",[data[0].pkg_sub_id,data[0].pkg_id],(e,data2)=>{
            if(e){
              next(e)
            }else{
              req.flash("success",'Approved!')
              res.redirect("/admin/packages/approve")
            }
          })
        }else{
          res.send("Not found any payment info")
        }
      }
    })
  } catch (error) {
    next(error)
  }
}

exports.pkgPaymentReject = (req,res,next)=>{
  let {id,message} = req.body
  try {
        db.query("update pkg_payment set message=?  where id = ?;",[message,id],(e,data2)=>{
          if(e){
            next(e)
          }else{
            console.log(data2);
            req.flash("success",'Rejected Request Complete')
            res.redirect("/admin/packages/approve")
          }
        })
  } catch (error) {
    next(error)
  }
}

