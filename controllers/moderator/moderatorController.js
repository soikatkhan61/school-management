const db = require("../../config/db.config")
const Flash = require("../../utils/Flash");
const fs = require('fs');
const bcrypt = require("bcrypt");


exports.renderModeratorDashboard = async (req, res, next) => {
    try {
        res.render('moderator/moderator-dashboard.ejs', { title: "Moderator Panel", flashMessage: Flash.getMessage(req), })
    } catch (error) {
        next(error)
    }

};
exports.renderRegisterModerator = async (req, res, next) => {
    let { edit, id } = req.query
    try {
        if (edit && id) {
            db.query("select * from moderator where id = ? limit 1;", [id], (e, data) => {
                if (e) return next(e)
                return res.render('moderator/register-moderator', { flashMessage: Flash.getMessage(req), title: 'Register Moderator', data: data[0] })
            })
        } else {
            res.render('moderator/register-moderator.ejs', { title: "Register Moderator", flashMessage: Flash.getMessage(req), data: '' })
        }
    } catch (error) {
        next(error)
    }
};



exports.registerModeratorPost = async (req, res, next) => {
    try {
        let { name,
            phone,
            email,
            username,
            password,
            moderator_avater,
        } = req.body
        let { edit, id } = req.query
        let full_name = name
        let sql
        if (req.file) {
            moderator_avater = `/uploads/${req.file.filename}`
            if (password.length <= 30) {
                password = await bcrypt.hash(password, 11);
                sql = `update moderator set name='${full_name}',username='${username}',phone='${phone}',email='${email}',password='${password}',avater='${moderator_avater}' where id=${id}`
            } else {
                sql = `update moderator set name='${full_name}',username='${username}',phone='${phone}',email='${email}',avater='${moderator_avater}' where id=${id}`
            }

        } else {
            if (password.length <= 30) {
                password = await bcrypt.hash(password, 11);
                sql = sql = `update moderator set name='${full_name}',username='${username}',phone='${phone}',email='${email}',password='${password}' where id=${id}`
            } else {
                sql = sql = `update moderator set name='${full_name}',username='${username}',phone='${phone}',email='${email}' where id=${id}`
            }

        }
        if (edit && id) {
            db.query("select avater from moderator where id = ? limit 1", [id], (e, data) => {
                if (e) return next(e)
                if (req.file && data[0].avater) {
                    fs.unlink(`public${data[0].avater}`, function (err) {
                        if (err && err.code == 'ENOENT') {
                            return res.send("error something")
                        }
                    });
                }
                db.query(sql, (e, data) => {
                    if (e) return next(e)
                    if (data.affectedRows > 0) {
                        req.flash('success', "update success!")
                    } else {
                        req.flash('fail', "update failed!")
                    }
                    return res.redirect(`/moderator/register-moderator?edit=true&id=${id}`)
                })
            })
        } else {
            db.query("select * from moderator where username = ?", [username], (e, data) => {
                if (e) {
                    return next(e)
                } else {
                    console.log(data);
                    if (data.length > 0) {
                        req.flash('fail', 'User Name already exists')
                        return res.redirect(`/moderator/register-moderator`)
                    } else {
                        db.query("insert into moderator values(?,?,?,?,?,?,?,?)", [null, 'moderator', name, username, email,phone, password, moderator_avater], (e, data) => {
                            if (e) {
                                return next(e)
                            } else {
                                if (data.affectedRows > 0) {
                                    req.flash('success', 'Register success')
                                } else {
                                    req.flash('fail', 'Register failed')
                                }
                                return res.redirect(`/moderator/register-moderator?edit=true&id=${data.insertId}`)
                            }
                        })
                    }
                }
            })
        }

    } catch (error) {
        next(error)
    }
};

exports.renderModeratorList = async (req, res, next) => {
    try {
        db.query(`SELECT c.id AS moderator_id, c.name,c.email,c.avater,c.username, COUNT(q.id) AS total_questions
        FROM moderator AS c
        LEFT JOIN (
          SELECT fk_author, id
          FROM questions
          UNION ALL
          SELECT fk_author, id
          FROM creative
          UNION ALL
          SELECT fk_author, id
          FROM q_others
        ) AS q ON c.id = q.fk_author
        GROUP BY c.id, c.name;`, (e, data) => {
            if (e) {
                return next(e)
            } else {
                res.render('moderator/registerd-moderator', {
                    data,
                    flashMessage: Flash.getMessage(req),
                    title: "Registerd Moderator"
                })
            }
        })

    } catch (error) {
        next(error)
    }
};

