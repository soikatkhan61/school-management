const db = require("../../config/db.config");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const { validationResult } = require("express-validator");
const errorFormatter = require("../../utils/validationErrorFormatter");
const Flash = require("../../utils/Flash");

exports.renderAdmininstrationLogin = (req, res, next) => {
    res.render("auth/administration/login", {
        title: "Login here",
        error: {},
        value: {},
        flashMessage: Flash.getMessage(req),
    });
};

exports.admininstrationLoginPost = async (req, res, next) => {
    let { username, password } = req.body;
    console.log(req.body);

    let errors = validationResult(req).formatWith(errorFormatter);

    if (!errors.isEmpty()) {
        req.flash("fail", "Please check your form");
        return res.render("auth/administration/login", {
            title: "Login here!",
            error: errors.mapped(),
            value: {
                username,
            },
            flashMessage: Flash.getMessage(req),
        });
    }

    try {
        db.query(
            "select * from schools where admin_email=? LIMIT 1",
            [username],
            async (e, data) => {
                if (e) {
                    next(e);
                }
                console.log(data);
                if (data.length == 0) {
                    req.flash("fail", "User Not Found");
                    return res.render("auth/administration/login", {
                        title: "Login here!",
                        error: errors.mapped(),
                        value: {
                            username,
                        },
                        flashMessage: Flash.getMessage(req),
                    });
                } else if (data.length > 0) {
                   
                    bcrypt.compare(password, data[0].admin_password, function (err, match) {
                        if (err) return next(e)
                        if (match == false) {
                            req.flash("fail", "Wrong Credential");
                            return res.render("auth/administration/login", {
                                title: "Login here!",
                                error: errors.mapped(),
                                value: {
                                    username,
                                },
                                flashMessage: Flash.getMessage(req),
                            });
                        } else {
                            
                            let token = jwt.sign(
                                {
                                    id: data[0].id,
                                    username: data[0].admin_email,
                                    table: 'schools',
                                    userType: data[0].userType,
                                },
                                process.env.JWT_SECRET_KEY,
                                { expiresIn: "2h" }
                            );
                            req.session.isLoggedIn = true;
                            req.session.token = token;
                            req.session.user = data[0];


                            req.session.save((err) => {
                                if (err) {
                                    return next(err);
                                }
                                req.flash("success", "Successfully Logged In");
                                res.redirect('/administration')

                            });
                        }
                    });
                }
            }
        );
    } catch (e) {
        next(e);
    }
};