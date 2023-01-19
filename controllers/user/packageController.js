const moment = require("moment");
const db = require("../../config/db.config");

exports.packageGetController = async (req, res, next) => {
  db.query("select * from packages", (e, data) => {
    if (e) {
      next(e);
    }
    if (data) {
      res.render("pages/package", { pkg: data });
    } else {
      res.status(404).send("no data found");
    }
  });
};

exports.packageBuyPostController = async (req, res, next) => {
  let pkg_name = req.query.package;
  console.log(pkg_name);
  db.query(
    "select * from packages where package_name = ?",
    [pkg_name],
    (e, pkg) => {
      if (e) {
        next(e);
      } else {
        if (pkg.length >= 0) {
          db.query(
            "select * from pkg_subscriber where user_id = ?",
            [req.user.id],
            (e, pkg_sub) => {
              if (e) {
                next(e);
              } else {
                if (pkg_sub.length > 0) {
                  res
                    .status(404)
                    .send("you already buy packags, you can upgrade packages");
                } else {
                  db.query(
                    "insert into pkg_subscriber values(?,?,?,?,?,?);",
                    [null, pkg[0].id, req.user.id, 0, null, null],
                    (e, data) => {
                      if (e) {
                        return next(e);
                      } else {
                        res.redirect("/user/my_package");
                      }
                    }
                  );
                }
              }
            }
          );
        } else {
          res.status(404).send("no pkg data found");
        }
      }
    }
  );
};

exports.renderMyPackage = async (req, res, next) => {
  try {
    db.query(
      `SELECT
      users.id AS userID,
      packages.package_name,
      packages.price,
      packages.package_comission,
      pkg_subscriber.*,
      pkg_subscriber.id AS pkg_sub_id,
      pkg_payment.message,
      pkg_payment.id as pkg_payment_id
  FROM
      pkg_subscriber
  JOIN packages ON packages.id = pkg_subscriber.pkg_id
  JOIN users ON pkg_subscriber.user_id = users.id
  JOIN pkg_payment ON users.id = pkg_payment.user_id
  WHERE
      users.id = ?`,
      [req.user.id],
      (e, data) => {
        if (e) {
          next(e);
        } else {
          if (data.length > 0) {
            var d = data[0].createdAt;
            // console.log(d);
            // console.log(d.toDateString());
            // d.setMonth(d.getMonth() - data[0].package_comission);
            // console.log(d.toDateString());

            db.query(
              "select * from pkg_payment where user_id=? and pkg_id=?",
              [req.user.id, data[0].pkg_id],
              (e, checkPkgPayment) => {
                if (e) {
                  return next(e);
                } else {
                  if (checkPkgPayment.length > 0) {
                    res.render("user/pages/my_package", {
                      title: "My Package",
                      pkg: data,
                      pkg_payment: checkPkgPayment,
                    });
                  } else {
                    res.render("user/pages/my_package", {
                      title: "My Package",
                      pkg: data,
                      pkg_payment: "",
                    });
                  }
                }
              }
            );
          } else {
            res.render("user/pages/my_package", {
              title: "My Package",
              pkg: "",
              pkg_payment: "",
            });
          }
        }
      }
    );
  } catch (error) {
    next(error);
  }
};

exports.renderPkgPayment = async (req, res, next) => {
  try {
    let pkg_id = req.params.pkg_id;
    db.query(
      `select *,packages.id as PKG_ID, pkg_subscriber.id as pkg_sub_id from packages join pkg_subscriber
        on pkg_subscriber.pkg_id = packages.id
        where pkg_subscriber.id=?
        `,
      [pkg_id],
      (e, data) => {
        if (e) {
          return next(e);
        } else {
          if (data.length > 0) {
            res.render("user/pages/pkg_payment", {
              title: "Pay Now",
              pkg: data,
            });
          } else {
            return res.status(404).send("no packages found");
          }
        }
      }
    );
  } catch (error) {
    next(e);
  }
};

exports.pkgPaymentPostContrller = async (req, res, next) => {
  let { pkg_id, pkg_sub_id, payment_method, txid, phone_no } = req.body;
  try {
    db.query(
      "select * from pkg_subscriber where  id=? and user_id=? and pkg_id=? ",
      [pkg_sub_id, req.user.id, pkg_id],
      (e, data) => {
        if (e) {
          return next(e);
        } else {
          if (data.length > 0) {
            db.query(
              "insert into pkg_payment values(?,?,?,?,?,?,?,?,?,?)",
              [
                null,
                req.user.id,
                pkg_sub_id,
                pkg_id,
                payment_method,
                phone_no,
                txid,
                null,
                null,
                null,
              ],
              (e, insert) => {
                if (e) {
                  return next(e);
                } else {
                  if (insert) {
                    res.redirect("/user/my_package");
                  } else {
                    res
                      .status(500)
                      .send("somethings occured while make payment");
                  }
                }
              }
            );
          } else {
            res.status(501).send("you need to buy package first");
          }
        }
      }
    );
  } catch (error) {
    next(error);
  }
};

exports.editPkgPayment = async (req, res, next) => {
  try {
    let pkg_id = req.query.payment_id;
    db.query(
      `select id,payment_method,phone_no,transaction_number from pkg_payment where id =?`,
      [pkg_id],
      (e, data) => {
        if (e) {
          return next(e);
        } else {
          if (data.length > 0) {
            res.render("user/pages/edit_pkg_payment", {
              title: "Edit-Payment Info",
              pkg: data,
            });
          } else {
            return res.status(404).send("no packages found");
          }
        }
      }
    );
  } catch (error) {
    next(e);
  }
};

exports.editPkgPaymentPostController = async (req, res, next) => {
  try {
    let {payment_id,payment_method,phone_no,txid} = req.body

    db.query(
      `update pkg_payment set phone_no=?,payment_method=?,transaction_number=?,message=NULL where id=?`,
      [phone_no,payment_method,txid,payment_id],
      (e, data) => {
        if (e) {
          return next(e);
        } else {
         res.redirect("/user/my_package")
        }
      }
    );
  } catch (error) {
    next(e);
  }
};

