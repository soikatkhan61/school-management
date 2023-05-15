const db = require("../../config/db.config")
const Flash = require("../../utils/Flash");
const bcrypt = require("bcrypt");

exports.renderSchools = async (req, res, next) => {
    try {
        let currentPage = parseInt(req.query.page) || 1;
        let itemPerPage = 10;
        db.query("select count(*) as count  from schools;select id,school_name,school_phone,school_info,admin_name,status from schools order by id desc limit ?,?",[((itemPerPage * currentPage) - itemPerPage), itemPerPage], (e, data) => {
            if (e) {
                next(e)
            } else {
                let totalUsers = data[0];
                let totalPage = totalUsers[0].count / itemPerPage;
                res.render("admin/school", {
                    data: data[1], flashMessage: Flash.getMessage(req),
                    currentPage,
                    itemPerPage,
                    totalPage,
                    title:"School Details"
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
        db.query("select * from packages",(e,pkg) => {
            if (id && edit && req.user.userType == 'superadmin') {
                db.query("select * from schools where id = ?", [id], (e, data) => {
                    if (e) {
                        next(e)
                    } else {
                        console.log(data[0]);
                        return res.render("admin/school/register-school", {title:"Register School", flashMessage: Flash.getMessage(req), data: data[0],pkg })
                    }
                })
            } else {
                return res.render("admin/school/register-school", { title:"Register School",flashMessage: Flash.getMessage(req), data: '',pkg })
            }
        })
    } catch (error) {
        next(error)
    } 
}
exports.schoolRegistrationByUser = async (req, res, next) => {
    try {
        db.query("select * from packages",(e,pkg) => {
            res.render("admin/school/userSchoolRegistration", { title:"Register School", flashMessage: Flash.getMessage(req), data: '',pkg })
        })
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
            status,
            package,
            validity
        } = req.body
        console.log(req.body);
        if(admin_password.length <= 15){
            admin_password = await bcrypt.hash(admin_password, 11);
        }
        if(req.user == null ||  req.user == undefined || req.user.userType !== 'superadmin'){
            status = 0
        }
        if (id && edit) {
            headerSent = true
            return res.redirect(`/super-admin/register-school?id=${id}&edit=true`)
        }
        if ((id && save) && req.user.userType === 'superadmin' ) {
            db.query("update schools set school_name=?,school_address=?,school_email=?,school_phone=?,school_info=?,admin_name=?,admin_blood_group=?,admin_address=?,admin_phone=?,admin_email=?,admin_password=?,admin_avater=?,status=?,package=?,validity=? where id =?",
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
                    status,
                    package,
                    validity,
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
            db.query("select * from schools where admin_email=?",[admin_email],(e,adminExistence) => {
                if(e) return next(e)
                if(adminExistence.length > 0){
                    return res.send("Already registered with this admin email address")
                }else{
                    db.query("insert into schools values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
                    [
                        null,
                        'admin',
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
                        status,
                        package,
                        new Date(),
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
            })
            
        }


    } catch (error) {
        next(error)
    }
}

