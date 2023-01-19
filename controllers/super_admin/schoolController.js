const db = require("../../config/db.config")
const Flash = require("../../utils/Flash");

exports.renderSchools = async (req, res, next) => {
    try {
        let currentPage = parseInt(req.query.page) || 1;
        let itemPerPage = 10;
        db.query("select count(*) as count  from schools;select id,school_name,school_phone,school_info,admin_name,status from schools limit 10", (e, data) => {
            if (e) {
                next(e)
            } else {
                let totalUsers = data[0];
                let totalPage = totalUsers[0].count / itemPerPage;
                res.render("admin/school", {
                    data: data[1], flashMessage: Flash.getMessage(req),
                    currentPage,
                    itemPerPage,
                    totalPage
                })
            }
        })

    } catch (error) {
        next(error)
    }
}

exports.renderRegisterSchool = async (req, res, next) => {
    try {
        let id = req.query.id
        let edit = req.query.edit
        if (id && edit) {
            db.query("select * from schools where id = ?", [id], (e, data) => {
                if (e) {
                    next(e)
                } else {
                    res.render("admin/school/register-school", { flashMessage: Flash.getMessage(req), data: data[0] })
                }
            })
        } else {
            res.render("admin/school/register-school", { flashMessage: Flash.getMessage(req), data: '' })
        }

    } catch (error) {
        next(error)
    }
}

exports.handleRegistration = async (req, res, next) => {
    let headerSent = false
    try {
        let id = req.query.id
        let del = req.query.del
        let edit = req.query.edit
        let save = req.query.save
        let {
            school_name,
            school_address,
            school_email,
            school_phone,
            school_info,
            admin_name,
            admin_blood_group,
            admin_address,
            admin_phone,
            admin_email,
            admin_password,
            admin_avater,
        } = req.body

        if (id && edit) {
            headerSent = true
            return res.redirect(`/super-admin/register-school?id=${id}&edit=true`)
        }
        if (id && save) {
            db.query("update schools set school_name=?,school_address=?,school_email=?,school_phone=?,school_info=?,admin_name=?,admin_blood_group=?,admin_address=?,admin_phone=?,admin_email=?,admin_password=?,admin_avater=? where id =?",
                [
                    school_name,
                    school_address,
                    school_email,
                    school_phone,
                    school_info,
                    admin_name,
                    admin_blood_group,
                    admin_address,
                    admin_phone,
                    admin_email,
                    admin_password,
                    admin_avater,
                    id
                ], (e, result) => {
                    if (e) {
                        next(e)
                    } else {
                        if (!headerSent) {
                            headerSent = true;
                            req.flash('success','Update Successfull')
                            return res.redirect(`/super-admin/register-school?id=${id}&edit=true`)
                        }

                    }
                })

        }
        if (req.query.register == 'true') {
            db.query("insert into schools values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
                [
                    null,
                    school_name,
                    school_address,
                    school_email,
                    school_phone,
                    school_info,
                    admin_name,
                    admin_blood_group,
                    admin_address,
                    admin_phone,
                    admin_email,
                    admin_password,
                    admin_avater,
                    1,
                    null
                ], (e, result) => {
                    if (e) {
                        next(e)
                    } else {
                        if (!headerSent) {
                            headerSent = true;
                            req.flash('success','Registration Successfull')
                            res.redirect('/super-admin/school')
                        }
                    }
                })
        }


    } catch (error) {
        next(error)
    }
}

