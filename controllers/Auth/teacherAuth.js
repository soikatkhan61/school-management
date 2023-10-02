const db = require("../../config/db.config");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const { validationResult } = require("express-validator");
const errorFormatter = require("../../utils/validationErrorFormatter");
const Flash = require("../../utils/Flash");

exports.renderTeacherLoginController = (req, res, next) => {
    console.log(req.sessionID);
    res.render("auth/teacher/login", {
        title: "Login here",
        error: {},
        value: {},
        flashMessage: Flash.getMessage(req),
    });
};

exports.teacherLoginPost = async (req, res, next) => {
    let { username, password } = req.body;
    console.log(req.body);
    console.log(req.sessionID);

    let errors = validationResult(req).formatWith(errorFormatter);

    if (!errors.isEmpty()) {
        req.flash("fail", "Please check your form");
        return res.render("auth/teacher/login", {
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
            "select * from teachers where username=? LIMIT 1",
            [username],
            async (e, data) => {
                if (e) {
                    next(e);
                }
                if (data.length == 0) {
                    req.flash("fail", "User Not Found");
                    return res.render("auth/teacher/login", {
                        title: "Login here!",
                        error: errors.mapped(),
                        value: {
                            username,
                        },
                        flashMessage: Flash.getMessage(req),
                    });
                } else if (data.length > 0) {
                    bcrypt.compare(password, data[0].password, function (err, match) {
                        if (err) throw new Error(err);
                        else if (match == false) {
                            console.log("not");
                            req.flash("fail", "Wrong Credential");
                            return res.render("auth/teacher/login", {
                                title: "Login here!",
                                error: errors.mapped(),
                                value: {
                                    username,
                                },
                                flashMessage: Flash.getMessage(req),
                            });
                        } else {
                            db.query("select validity from schools where id = ?", [data[0].school_id], (e, result) => {
                                if (e) {
                                    return next(e);
                                } else {
                                    if (new Date() <= result[0].validity) {
                                        let token = jwt.sign(
                                            {
                                                id: data[0].id,
                                                username: data[0].username,
                                                table: 'teachers',
                                                userType: data[0].userType,
                                            },
                                            process.env.JWT_SECRET_KEY,
                                            { expiresIn: "24h" }
                                        );
                                        req.session.isLoggedIn = true;
                                        req.session.token = token;
                                        req.session.user = data[0];


                                        req.session.save((err) => {
                                            if (err) {
                                                return next(err);
                                            }
                                            req.flash("success", "Successfully Logged In");
                                            res.redirect('/teacher')

                                        });
                                    } else {
                                        return res.render("utils/expired", { flashMessage: '' })
                                    }

                                }
                            })

                        }
                    });
                }
            }
        );
    } catch (e) {
        next(e);
    }
};