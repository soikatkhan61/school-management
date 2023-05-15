const db = require("../../config/db.config")
const Flash = require("../../utils/Flash");
const fs = require('fs');


exports.renderStudentProfile = async (req, res, next) => {
    try {
        res.render('student/profile', { flashMessage: Flash.getMessage(req), title: 'Movies', })
    } catch (error) {
        next(error)
    }
};

exports.renderCreateStudnet = async (req, res, next) => {
    let { edit, id } = req.query
    try {
        db.query("select id,class_name from classes order by id asc", (e, classes) => {
            if (e) return next(e)
            console.log(classes);
            if (edit && id) {
                db.query("select * from students where id = ? limit 1;", [id], (e, data) => {
                    if (e) return next(e)
                    return res.render('student/create-student', { flashMessage: Flash.getMessage(req), title: 'Student', data: data[0], classes: classes })
                })
            } else {
                return res.render('student/create-student', { flashMessage: Flash.getMessage(req), title: 'Student', classes: classes, data: '' })
            }
        })
    } catch (error) {
        next(error)
    }

};
exports.createStudentPost = async (req, res, next) => {
    try {
        let { f_name,
            student_id,
            password,
            gender,
            dob,
            address,
            student_avater,
            class_id
        } = req.body
        let { edit, id } = req.query

        let full_name = f_name
        let sql
        if (req.file) {
            student_avater = `/uploads/${req.file.filename}`
            sql = `update students set name='${full_name}',class_id='${class_id}',student_id='${student_id}',password='${password}', gender='${gender}',dob='${dob}',address='${address}',avater='${student_avater}' where id=${id}`
        } else {
            sql = sql = `update students set name='${full_name}',class_id='${class_id}',student_id='${student_id}',password='${password}', gender='${gender}',dob='${dob}',address='${address}' where id=${id}`
        }
        if (edit && id) {
            db.query("select avater from students where id = ? limit 1", [id], (e, data) => {
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
                    return res.redirect(`/user/create-student?edit=true&id=${id}`)
                })
            })
        } else {
            db.query("SELECT count(*) as totalStudent from students where school_id = ?;SELECT packages.student_limit from schools  join packages on schools.package = packages.id where schools.id = ? ",[req.user.id,req.user.id],(e,data)=>{
                if(e) return next(e)
                let totalStudent = data[0]
                let studentLimit = data[1]
                if( totalStudent[0].totalStudent <= studentLimit[0].student_limit ){
                    db.query("select * from students where student_id=?",[student_id],(e,studentExistence) => {
                        if(e) return next(e)
                        if(studentExistence.length > 0){
                            return res.send("Already registered an account with this student_id")
                        }else{
                            db.query("insert into students values(?,?,?,?,?,?,?,?,?,?,?,?,?)", [null, 'student', full_name, class_id, student_id, password, req.user.id, gender, dob, address, student_avater, null, null], (e, data) => {
                                if (e) {
                                    return next(e)
                                } else {
                                    if (data.affectedRows > 0) {
                                        req.flash('success', 'Register success')
                                    } else {
                                        req.flash('fail', 'Register failed')
                                    }
                                    return res.redirect(`/user/create-student?edit=true&id=${data.insertId}`)
                                }
                            })
                        }
                    })
                }else{
                    req.flash('fail', 'You have reached the limit of student!')
                    return res.redirect(`/user/create-student`)
                }
            })  
        }
    } catch (error) {
        next(error)
    }

};

exports.renderRegisteredStudent = async (req, res, next) => {
    try {
        let currentPage = parseInt(req.query.page) || 1;
        let itemPerPage = 25;
        let table_name = 'students'
        db.query(`select count(*) as count  from ${table_name};select students.*,classes.class_name from ${table_name}  join classes on classes.id = students.class_id where students.school_id=${req.user.id} order by students.id desc limit ?,?`, [((itemPerPage * currentPage) - itemPerPage), itemPerPage], (e, data) => {
            if (e) {
                return next(e)
            } else {
                let totalUsers = data[0];
                let totalPage = totalUsers[0].count / itemPerPage;
                res.render('student/registerd-student', {
                    data: data[1], flashMessage: Flash.getMessage(req),
                    currentPage,
                    itemPerPage,
                    totalPage,
                    title: "Registerd Students"
                })
            }
        })

    } catch (error) {
        next(error)
    }
};

exports.studentDashboard = async (req, res, next) => {
    try {
        res.render('student', {
            flashMessage: Flash.getMessage(req),
            title: "Students"
        })
    } catch (error) {
        next(error)
    }

};

