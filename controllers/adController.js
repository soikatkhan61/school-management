const db = require("../config/db.config");
const Flash = require("../utils/Flash");
const fs = require('fs');


exports.renderCreateAd = (req, res, next) => {
  res.render("admin/ad/createAd", {
    title: "Create Ad",
    flashMessage: Flash.getMessage(req),
  });
};

exports.getAllAds = (req, res, next) => {
  let currentPage = parseInt(req.query.page) || 1
  let itemPerPage = 10
  try {
    db.query("select count(*) as count from ad;select * from ad limit ?,?",[((itemPerPage * currentPage) - itemPerPage),itemPerPage], (e, data) => {
      if (e) {
        next(e);
      } else {
        let totalAd = data[0]
        let totalPage = totalAd[0].count / itemPerPage
        res.render("admin/ad/all-ad", {
          ads: data[1],
          title: "Our Ad",
          currentPage,itemPerPage,totalPage,totalAd,
          flashMessage: Flash.getMessage(req),
        });
      }
    });
  } catch (error) {
    next(error);
  }
};

exports.createAdPostController = (req, res, next) => {
  let { ad_name, ad_link, ad_price, validity, providor_num, payment_status } =
    req.body;
  let ad_image;
  if (req.file) {
    ad_image = `/uploads/${req.file.filename}`;
  }
  if (!ad_price) {
    ad_price = 0;
  }
  try {
    db.query(
      "insert into ad values(?,?,?,?,?,?,?,?,?,?)",
      [
        null,
        ad_name,
        ad_link,
        ad_price,
        payment_status,
        validity,
        providor_num,
        ad_image,
        null,
        null,
      ],
      (e, data) => {
        if (e) {
          next(e);
        } else {
          console.log(data);
          if (data.insertId) {
            req.flash("success", "Ad Created Successfully Done!");
            res.redirect("/admin-ad");
          }
        }
      }
    );
  } catch (error) {
    next(error);
  }
  console.log(req.body);
};

exports.editdGetController = (req, res, next) => {
  let ad_id = req.query.ad_id
  try {
    db.query("select * from ad where id=?",[ad_id],(e,data)=>{
        if(e){
            next(e)
        }else{
            if(data.length>0){
                res.render("admin/ad/edit-ad",{flashMessage:Flash.getMessage(req),title:'Edit ad',ad:data[0]})
            }else{
                res.send("no data found")
            }
           
        }
    })
  } catch (error) {
    next(error);
  }
  console.log(req.body);
};

exports.editadPostController = (req, res, next) => {
  let {ad_id,ad_link,ad_name,ad_price,providor_num,payment_status,validity} = req.body
  let ad_image
  try {
    db.query("select ad_image from ad where id=?",[ad_id],(e,data)=>{
        if(e){
            next(e)
        }else{
            if(data.length>0){
                ad_image = data[0].ad_image
                if(req.file){
                    let path = "public" + data[0].ad_image;
                    fs.unlink(path, function (err) {
                    if (err && err.code == "ENOENT") {
                        // file doens't exist
                        console.info("File doesn't exist, won't remove it.");
                    } else if (err) {
                        // other errors, e.g. maybe we don't have enough permission
                        console.error("Error occurred while trying to remove file");
                    } else {
                        console.info(`removed`);
                    }
                    });
                    ad_image = `/uploads/${req.file.filename}`;
                }

                db.query("update ad set ad_name= ?, ad_link=?,ad_price=?,providor_num=?,payment_status=?,validity=?,ad_image=?",[ad_name,ad_link,ad_price,providor_num,payment_status,validity,ad_image],(e,data)=>{
                    if(e){
                        next(e)
                    }else{
                        req.flash('success','update successfull')
                        res.redirect(`/admin-ad/edit?ad_id=${ad_id}`)
                    }
                })
            }else{
                next(e)
            }
        }
    })
  } catch (error) {
    next(error);
  }
  console.log(req.body);
};

exports.deleteAd = (req, res, next) => {
  let ad_id = req.query.ad_id;
  try {
    db.query("select ad_image from ad where id = ?", [ad_id], (e, data) => {
      if (e) {
        next(e);
      } else {
        let path = "public" + data[0].ad_image;
        fs.unlink(path, function (err) {
          if (err && err.code == "ENOENT") {
            // file doens't exist
            console.info("File doesn't exist, won't remove it.");
          } else if (err) {
            // other errors, e.g. maybe we don't have enough permission
            console.error("Error occurred while trying to remove file");
          } else {
            console.info(`removed`);
          }
        });

        db.query("delete from ad where id =?", [ad_id], (e, data) => {
          if (e) {
            next(e);
          } else {
            req.flash("success", "Delete Successfull");
            res.redirect("/admin-ad/get-all-ads");
          }
        });
      }
    });
  } catch (error) {
    next(error);
  }
};
