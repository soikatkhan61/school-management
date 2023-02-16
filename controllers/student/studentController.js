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
    try {
        res.render('student/create-student', { flashMessage: Flash.getMessage(req), title: 'Student', })
    } catch (error) {
        next(error)
    }

};

exports.createStudentPost = async (req, res, next) => {
    try {
        let { f_name,
            l_name,
            student_id,
            password,
            gender,
            dob,
            address,
            student_avater
        } = req.body
        let full_name = f_name+ " " + l_name
        if(req.file){
            student_avater =  `/uploads/${req.file.filename}`
        }
        db.query("insert into students values(?,?,?,?,?,?,?,?,?,?,?)",[null,full_name,student_id,password,1,gender,dob,address,student_avater,null,null],(e,data)=>{
            if(e){
                return next(e)
            }else{
                if (data.affectedRows > 0) {
                    req.flash('success','Register success')
                  } else {
                    req.flash('fail','Register failed')
                  }
                  res.render('student/create-student', { flashMessage: Flash.getMessage(req), title: 'Student', })
            }
        })
        
    } catch (error) {
        next(error)
    }

};

exports.renderRegisteredStudent = async (req, res, next) => {
    try {
        let currentPage = parseInt(req.query.page) || 1;
        let itemPerPage = 10;
        let table_name= 'students'
        db.query(`select count(*) as count  from ${table_name};select * from ${table_name} where school_id=1 limit ?,?`,[((itemPerPage * currentPage) - itemPerPage),itemPerPage],(e,data)=>{
            if(e){
                return next(e)
            }else{
                let totalUsers = data[0];
                let totalPage = totalUsers[0].count / itemPerPage;
                res.render('student/registerd-student', { 
                    data: data[1], flashMessage: Flash.getMessage(req),
                    currentPage,
                    itemPerPage,
                    totalPage,
                    title:"Registerd Students"
                 })
            }
        })
       
    } catch (error) {
        next(error)
    }

};

