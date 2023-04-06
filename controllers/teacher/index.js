const db = require("../../config/db.config")
const Flash = require("../../utils/Flash");
const fs = require('fs');
const bcrypt = require("bcrypt");



exports.renderTeacherDashboard = async (req, res, next) => {
    try {
        res.render('teacher/exam/create', { flashMessage: Flash.getMessage(req), title: 'Create Exam', })
    } catch (error) {
        next(error)
    }
};

exports.reanderCreateTeacher = async (req, res, next) => {
    let { edit, id } = req.query
    try {
        if (edit && id) {
            db.query("select * from teachers where id = ? limit 1;", [id], (e, data) => {
                if (e) return next(e)
                return res.render('teacher/register-teacher', { flashMessage: Flash.getMessage(req), title: 'Teacher', data: data[0] })
            })
        } else {
            return res.render('teacher/register-teacher', { flashMessage: Flash.getMessage(req), title: 'Teacher',data: '' })
        }
    }catch (error) {
        next(error)
    }
};
exports.registerTeacherPost = async (req, res, next) => {
    try {
        let { name,
            phone,
            email,
            username,
            password,
            address,
            teacher_avater,
        } = req.body
        let { edit, id } = req.query

        let full_name = name
        let sql
        if (req.file) {
            teacher_avater = `/uploads/${req.file.filename}`
            if(password.length <= 30){
                password = await bcrypt.hash(password, 11);
                sql = `update teachers set name='${full_name}',username='${username}',phone='${phone}',email='${email}',password='${password}',address='${address}',avater='${teacher_avater}' where id=${id}`
            }else{
                sql = `update teachers set name='${full_name}',username='${username}',phone='${phone}',email='${email}',address='${address}',avater='${teacher_avater}' where id=${id}`
            }
           
        }else{
            if(password.length <= 30){
                password = await bcrypt.hash(password, 11);
                sql = sql = `update teachers set name='${full_name}',username='${username}',phone='${phone}',email='${email}',password='${password}',address='${address}' where id=${id}`
            }else{
                sql = sql = `update teachers set name='${full_name}',username='${username}',phone='${phone}',email='${email}',address='${address}' where id=${id}`
            }
           
        }
        if (edit && id) {
            db.query("select avater from teachers where id = ? limit 1",[id],(e,data)=>{
                if(e) return next(e)
                if(req.file && data[0].avater){
                    fs.unlink(`public${data[0].avater}`, function(err) {
                        if(err && err.code == 'ENOENT') {
                            return res.send("error something")
                        }
                    });
                }
                db.query(sql,(e,data)=>{
                    if(e) return next(e)
                    if(data.affectedRows > 0){
                        req.flash('success',"update success!")
                    }else{
                        req.flash('fail',"update failed!")
                    }
                    return res.redirect(`/teacher/register-teacher?edit=true&id=${id}`)
                })
            })
        } else {
            db.query("SELECT count(*) as totalTeacher from teachers where school_id = ?;SELECT schools.package,packages.teacher_limit from schools  join packages on schools.package = packages.id where schools.id = ? ",[req.user.id,req.user.id],(e,data)=>{
                if(e) return next(e)
                let totalTeacher = data[0]
                let teacherLimit = data[1]
                if( totalTeacher[0].totalTeacher <= teacherLimit[0].teacher_limit ){
                    db.query("select * from teachers where username = ? and school_id = ?",[username,req.user.id], (e, data) => {
                        if (e) {
                            return next(e)
                        } else {
                            console.log(data);
                            if (data.length > 0) {
                                req.flash('fail', 'User Name already exists')
                                return res.redirect(`/teacher/register-teacher`)
                            } else {
                                db.query("insert into teachers values(?,?,?,?,?,?,?,?,?,?)", [null, 'teacher', name, username,email, address,phone, password, req.user.id,teacher_avater], (e, data) => {
                                    if (e) {
                                        return next(e)
                                    } else {
                                        if (data.affectedRows > 0) {
                                            req.flash('success', 'Register success')
                                        } else {
                                            req.flash('fail', 'Register failed')
                                        }
                                        return res.redirect(`/teacher/register-teacher?edit=true&id=${data.insertId}`)
                                    }
                                })
                            }
                        }
                    })
                     
                }else{
                    req.flash('fail',"Teacher limit exceeded ! Update Package")
                    return res.redirect(`/teacher/register-teacher`)
                }
            })
        }

    } catch (error) {
        next(error)
    }
};

exports.renderRegisterdTeacher = async (req, res, next) => {
    try {
        let currentPage = parseInt(req.query.page) || 1;
        let itemPerPage = 25;
        let table_name = 'teachers'
        db.query(`select count(*) as count  from ${table_name};select * from ${table_name} where school_id=${req.user.id} order by id desc limit ?,?`, [((itemPerPage * currentPage) - itemPerPage), itemPerPage], (e, data) => {
            if (e) {
                return next(e)
            } else {
                let totalUsers = data[0];
                let totalPage = totalUsers[0].count / itemPerPage;
                res.render('teacher/registerd-teacher', {
                    data: data[1], flashMessage: Flash.getMessage(req),
                    currentPage,
                    itemPerPage,
                    totalPage,
                    title: "Registerd Teacher"
                })
            }
        })

    } catch (error) {
        next(error)
    }
};


