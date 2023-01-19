const db = require("../../../config/db.config");
const Flash = require("../../../utils/Flash");
const { validationResult } = require("express-validator");
const errorFormatter = require("../../../utils/validationErrorFormatter");
const bcrypt = require("bcrypt");

exports.getAllUsers = (req, res, next) => {
  try {
    let currentPage = parseInt(req.query.page) || 1;
    let itemPerPage = 10;
    db.query(
      "select count(*) as count from users;select * from users",
      (e, data) => {
        if (e) {
          next(e);
        } else {
          if (data.length > 0) {
            let totalUsers = data[0];
            let totalPage = totalUsers[0].count / itemPerPage;

            res.render("admin/users/getUsers", {
              flashMessage: Flash.getMessage(req),
              title: "",
              currentPage,
              itemPerPage,
              totalPage,
              users: data[1],
            });
          } else {
            res.send("no users found");
          }
        }
      }
    );
  } catch (error) {
    next(error);
  }
};

exports.bannedAnUser = (req, res, next) => {
  try {
    let user_id = req.query.id;
    let unban = req.query.unban;
    let sql, flashMessage;
    if (unban == "true") {
      sql = `update users set isBanned='0' where id = ${user_id} `;
      flashMessage = "Unbanned Successlly done";
    } else {
      sql = `update users set isBanned='1' where id = ${user_id} `;
      flashMessage = "Banned Successlly done";
    }
    db.query("select * from users where id = ?", [user_id], (e, data) => {
      if (e) {
        next(e);
      } else {
        if (data.length > 0) {
          db.query(sql, (e, data) => {
            if (e) {
              next(e);
            } else {
              console.log(data);
              req.flash("success", flashMessage);
              res.redirect("/admin/users");
            }
          });
        } else {
          res.send("no users found");
        }
      }
    });
  } catch (error) {
    next(error);
  }
};

exports.renderAddNewUser = async (req, res, next) => {
  try {
    res.render("admin/users/add-new", {
      flashMessage: Flash.getMessage(req),
      title: "",
      value: "",
      error: "",
      customError: "",
      username: "",
    });
  } catch (error) {
    next(error);
  }
};

exports.registerUser = async (req, res, next) => {
  let { username, password, subscription, device } = req.body;

  let customError = {
    username: "",
    email: "",
  };
  let errors = validationResult(req).formatWith(errorFormatter);
  console.log(errors);

  if (!errors.isEmpty()) {
    req.flash("fail", "Please check your form");
    return res.render("admin/users/add-new", {
      title: "Create a new account",
      error: errors.mapped(),
      value: {
        username,
        password,
      },
      customError,
      useusernamer: "",
      flashMessage: Flash.getMessage(req),
    });
  }

  try {
    let hashPassword = await bcrypt.hash(password, 11);
    db.query(
      "select username from users where username = ?",
      [username],
      (e, userExists) => {
        if (e) {
          return next(e);
        } else {
          if (userExists.length > 0) {
            customError.username = "Username already used";
            req.flash("fail", "Username already exists");
            return res.render("admin/users/add-new", {
              title: "Create a new account",
              error: errors.mapped(),
              value: {
                username,
                password,
              },
              username: "",
              customError,
              flashMessage: Flash.getMessage(req),
            });
          } else {
            db.query(
              "insert into users values(?,?,?,?,?,?,?,?,?,?,?,?)",
              [
                null,
                "user",
                username,
                null,
                hashPassword,
                1,
                -1,
                "/uploads/avater.jpg",
                "0",
                device,
                subscription,
                null,
              ],
              (e, user) => {
                if (e) {
                  next(e);
                } else {
                  req.flash("success", "User created successfully");
                  if (user.insertId) {
                    console.log(user);
                    res.render("admin/users/add-new", {
                      username,
                      password,
                      title: "Create a new account",
                      error: errors.mapped(),
                      value: '',
                      customError:'',
                      flashMessage: Flash.getMessage(req),
                    });
                  } else {
                    res.status(404).send("Failed to create user!");
                  }
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

exports.renderEditUser = async (req, res, next) => {
  try {
    let id = req.query.id

    db.query("select * from users where id = ?",[id],(e,data)=>{
      if(e){
        next(e)
      }else{
        res.render("admin/users/update-user", {
          flashMessage: Flash.getMessage(req),
          user:data[0],
          username:''
        });
      }
    })

  } catch (error) {
    next(error);
  }
};

exports.updateUserPost =async (req,res,next) =>{

  let id = req.query.id
  let {password,subscription,device} = req.body

  
  db.query("select password from users where id= ?",[id],async(e,data)=>{
    if(e){
      next(e)
    }else{
      let hashPassword = data[0].password
      if(password){
         hashPassword = await bcrypt.hash(password, 11);
      }
      db.query("update users set password=?,subscription=?,device=? where id = ?",[hashPassword,subscription,device,id],(e,data)=>{
        if(e){
          next(e)
        }else{
          req.flash('success',"Successfully Updated")
          res.redirect(`/admin/update-user?id=${id}`)
        }
      })
    }
  })
}

exports.deleteUser =async (req,res,next) =>{

  let id = req.query.id

  db.query("delete from users where id= ?",[id],async(e,data)=>{
    if(e){
      next(e)
    }else{
     res.redirect('/admin/users')
    }
  })
}
