const db = require("../../config/db.config");
const Flash = require("../../utils/Flash");

exports.renderCreateExam = (req, res, next) => {
    try {
        db.query("SELECT CONCAT(SUBSTR(REPLACE(schools.school_name, ' ', ''), -3), DATE_FORMAT(CURDATE(), '%m%d') ) AS exam_code FROM schools WHERE schools.id = 1;select id,class_name from classes WHERE school_id=1 ", (e, data) => {
            if (e) {
                next(e)
            } else {
                let data1 = data[0]

                res.render("exam/createExam", {
                    title: "Create Exam",
                    flashMessage: Flash.getMessage(req),
                    exam_code: data1[0].exam_code + "_" + (Math.floor(Math.random() * 9000) + 1000),
                    classes: data[1]
                });
            }
        })
    } catch (error) {
        next(error)
    }
};
exports.createExamPost = (req, res, next) => {
    let {} = req.body
    try {
        db.query("SELECT CONCAT(SUBSTR(REPLACE(schools.school_name, ' ', ''), -3), DATE_FORMAT(CURDATE(), '%m%d') ) AS exam_code FROM schools WHERE schools.id = 1;select id,class_name from classes WHERE school_id=1 ", (e, data) => {
            if (e) {
                next(e)
            } else {
                let data1 = data[0]

                res.render("exam/createExam", {
                    title: "Create Exam",
                    flashMessage: Flash.getMessage(req),
                    exam_code: data1[0].exam_code + "_" + (Math.floor(Math.random() * 9000) + 1000),
                    classes: data[1]
                });
            }
        })
    } catch (error) {
        next(error)
    }
};

exports.loadQuestion = (req, res, next) => {
    try {
        let {class_id,subject,chapter,school_id} = req.body
        console.log(req.body);
        db.query("select id,question_text,question_option from questions where class_id=? and subject_id=? and chapter_id=? and school_id=?",[class_id,subject,chapter,school_id],(e,data)=>{
            if(e){
                next(e)
            }else{
                console.log(data);
                res.send(data)
            }
        })
    } catch (error) {
        next(error)
    }
};
