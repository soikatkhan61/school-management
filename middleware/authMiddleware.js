const jwt = require('jsonwebtoken')
const config = require('config')
const db = require("../config/db.config")
const validator = require('validator');


exports.bindUserWithRequest = () => {

    return async (req, res, next) => {

        if (!req.session.isLoggedIn) {
            return next()
        }
        try {
            let user
            jwt.verify(req.session.token, process.env.JWT_SECRET_KEY, function (err, decoded) {
                if (err) {
                    req.session.destroy((err) => {
                        if (err) {
                            return next(err);
                        }
                        res.clearCookie("token");
                        res.redirect("/auth/login");
                        res.end();
                    });

                } else {
                    if (!/^[a-z_]+$/i.test(decoded.table)) {
                        return res.status(403).send("Forbidden");
                    }
                    let sql = `select * from ${decoded.table} where id=${decoded.id}`
                    db.query(sql, (e, data) => {
                        if (e) {
                            next(e)
                        }
                        else if (data.length > 0) {
                            user = data[0]
                            req.user = user
                            next()
                        }
                    })
                }

            });

        } catch (e) {
            console.log(e)
            next(e)
        }
    }
}

exports.isAuthenticated = (req, res, next) => {
    if (!req.session.isLoggedIn) {
        return res.redirect('/auth/login')
    }
    next()
}

exports.isVerified = (req, res, next) => {
    if (req.session.user.verfication_id == 0) {
        return res.redirect('/auth/verify')
    }
    next()
}

exports.isUnAuthenticated = (req, res, next) => {
    if (req.session.isLoggedIn) {
        return res.redirect('/')
    }
    next()
}

exports.checkAdmin = async (req, res, next) => {
    if (req.user != undefined) {
        try {
            db.query("select * from users where id=? LIMIT 1", [req.user.id], (e, user) => {
                if (user.length > 0) {
                    if (user[0].userType === "superadmin") {
                        return next()
                    } else {
                        res.send("you are not super admin")
                    }
                }
            })
        } catch (e) {
            console.log(e)
            next(e)
        }
    }
}

exports.requireRole = (acceptRole) => {
    return async (req, res, next) => {
        const session = req.session;
        if (!session || !session.user) {
            return res.status(401).send("Unauthorized access");
        }

        if (typeof acceptRole !== "string" || !/^[a-zA-Z0-9, ]*$/.test(acceptRole)) {
            return res.status(400).send("Bad request");
        }

        try {
            const allowedRoles = acceptRole.split(",");
            if (!allowedRoles.includes(session.user.userType)) {
                return res.status(403).send("Forbidden");
            }
            next()
        } catch (e) {
            console.log(e)
            next(e)
        }

    }
}

exports.isSubscriber = async (req, res, next) => {

    if (req.user != undefined) {
        try {
            db.query("select user_id from pkg_subscriber where user_id = ?", [req.user.id], (e, user) => {
                if (user.length > 0) {
                    return next()
                } else {
                    res.send("you need to buy package")
                }
            })


        } catch (e) {
            console.log(e)
            next(e)
        }
    }
}