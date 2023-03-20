const db = require("../../config/db.config");
const Flash = require("../../utils/Flash");

exports.renderCreateExam = (req, res, next) => {
    let {class_id,subject,q_set} = req.query
    let sqlForClassAndSubject
    if(class_id && subject){
        sqlForClassAndSubject = `select classes.id as class_id,classes.class_name,subject_list.id,subject_list.subject_name from classes JOIN subject_list on classes.id = subject_list.class_id WHERE classes.id=${class_id} and subject_list.id=${subject}`
    }else{
        sqlForClassAndSubject = `select id,class_name from classes`
    }
    try {
        db.query(`select school_name from schools where id=?;${sqlForClassAndSubject}`, [req.user.school_id],(e, data) => {
            if (e) {
                next(e)
            } else {
                let data1 = data[0]
                function extractFirstLetters(str) {
                    var words = str.split(" ");
                    var result = "";
                    for (var i = 0; i < words.length; i++) {
                      result += words[i].charAt(0);
                    }
                    return result;
                  }
                    const dateObj = new Date( Date.now());

                    const month = dateObj.getMonth() + 1;
                    const date = dateObj.getDate();
                let exam_code = extractFirstLetters(data1[0].school_name) + "_" + date + month
                res.render("exam/createExam", {
                    title: "Create Exam",
                    flashMessage: Flash.getMessage(req),
                    exam_code: exam_code + "_" + (Math.floor(Math.random() * 9000) + 1000),
                    classes: data[1],
                    class_id,
                    subject,
                    q_set
                });
            }
        })
    } catch (error) {
        next(error)
    }
};
exports.createExamPost = (req, res, next) => {
    let {exam_name,exam_code,class_id,subject,start_time,end_time,teacher,school_id,q_set} = req.body
    try {
        db.query("INSERT INTO exams VALUES(?,?,?,?,?,?,?,?,?,?,?,?)",[null,exam_name,exam_code,q_set,class_id, subject,start_time,end_time,school_id,teacher,null,null], (e, data) => {
            if (e) {
                next(e)
            } else {
                if(data.affectedRows >0){
                    req.flash('success',"success")
                }else{
                    req.flash('fail',"Failed to create")
                }
                res.redirect('/combined-question/saved')
            }
        })
    } catch (error) {
        next(error)
    }
};

exports.renderExamResults = (req, res, next) => {
    
    try {
        res.render("exam/results", {
            title: "Results of Exam JKHGS",
            flashMessage: Flash.getMessage(req),
        });
    } catch (error) {
        next(error)
    }
};
