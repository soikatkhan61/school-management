const db = require("../../config/db.config");
const { validationResult } = require("express-validator");
const errorFormatter = require("../../utils/validationErrorFormatter");
const Flash = require("../../utils/Flash");

exports.renderCombined = (req, res, next) => {
    try {
        db.query("select id,class_name from classes", (e, data) => {
            if (e) {
                next(e)
            } else {
                res.render("combined", {
                    title: "Combined",
                    flashMessage: Flash.getMessage(req),
                    classes: data
                });
            }
        })
    } catch (error) {
        next(error)
    }

};
exports.viewSubject = (req, res, next) => {
    let {name, class_id, subject, q_formate, total_mark, total_qus } = req.body
    try {
        db.query("INSERT into q_set values(?,?,?,?,?,?,?,?,?,?,?)", [null,name, class_id, subject, q_formate, total_mark, total_qus, null, req.user.school_id, null, null], (e, data) => {
            if (e) {
                next(e)
            } else {
                console.log(data.insertId);
                return res.redirect(`/combined-question/view-subject?class_id=${class_id}&subject=${subject}&q_set=${data.insertId}&q_formate=${q_formate}`)
            }
        })
    } catch (error) {
        next(error)
    }

};
exports.viewSubjectGet = (req, res, next) => {
    let { class_id, q_set, q_formate } = req.query
    try {
        db.query("select * from subject_list where class_id=?", [class_id], (e, data) => {
            if (e) {
                next(e)
            } else {
                let filter = {
                    class_id,
                    q_set,
                    q_formate
                }
                res.render(`combined/view-subject`, {
                    title: "view subject", flashMessage: Flash.getMessage(req),
                    subject: data, filter
                })
            }
        })
    } catch (error) {
        next(error)
    }

};
exports.viewChapterGet = (req, res, next) => {
    let { class_id, subject, q_set, q_formate } = req.query
    try {
        db.query("select * from chapter where class_id=? and subject_id=?", [class_id,subject], (e, data) => {
            if (e) {
                next(e)
            } else {
                let filter = {
                    class_id,
                    subject,
                    q_set,
                    q_formate
                }
                res.render(`combined/view-chapter`, {
                    title: "view subject", flashMessage: Flash.getMessage(req),
                    chapter: data, filter
                })
            }
        })
    } catch (error) {
        next(error)
    }

};
exports.viewQuestionGet = (req, res, next) => {
    let { class_id, subject,chapter, q_set, q_formate } = req.query
    if(q_formate == 'mcq'){
        q_formate = 'questions'
    }else{
        q_formate = 'creative'
    }
    try {
        db.query(`select * from ${q_formate} where class_id=? and subject_id = ? and chapter_id=?`, [class_id, subject,chapter], (e, data) => {
            if (e) {
                next(e)
            } else {
                let filter = {
                    class_id,
                    subject,
                    q_set,
                    q_formate
                }
                res.render(`combined/view-questions`, {
                    title: "view subject", flashMessage: Flash.getMessage(req),
                    questions: data, filter
                })
            }
        })
    } catch (error) {
        next(error)
    }
};
exports.addQuestion = (req, res, next) => {
    let { q_id, q_set } = req.query;
    console.log(req.query);
    try {
        db.query(
            "UPDATE q_set SET questions = IF(FIND_IN_SET(?, questions), questions, CONCAT_WS(',', questions, ?)) WHERE id = ?;",
            [q_id, q_id, q_set],
            (e, data) => {
                if (e) {
                    next(e);
                } else {
                    if(data.changedRows == 1){
                        res.send({status:200})
                    }else if(data.changedRows == 0){
                        res.send({status:400})
                    }
                }
            }
        );
    } catch (error) {
        next(error);
    }

};

exports.renderSavedQuesSet = (req, res, next) => {
    try {
        db.query(
            "select q_set.*,exams.created_at as examCreateDate,exams.name as examName,exams.q_set_id,exams.class,exams.subject as exam_subject,exams.code from q_set left join exams on exams.q_set_id=q_set.id and exams.class = q_set.class_id and exams.subject = q_set.subject where q_set.school_id=?",[req.user.school_id],
            (e, data) => {
                if (e) {
                    next(e);
                } else {
                    console.log(data);
                    res.render(`combined/saved`, {
                        title: "Saved Question",
                        flashMessage: Flash.getMessage(req),
                        q_set: data,
                    }); 
                }
            }
        );
    } catch (error) {
        next(error);
    }

};
exports.renderviewSet = (req, res, next) => {
    let qset_id = req.query.q_set_id
    try {
        db.query('select q_set.*,schools.school_name from q_set join schools on q_set.school_id = schools.id WHERE q_set.id = ? limit 1',[qset_id],(e,data)=>{
            if(e){
                next(e)
            }else{
               if(data && data[0].questions != null){
                const questionIds = data[0].questions.split(',');
                const query = 'SELECT * FROM questions WHERE id IN (?)';
                db.query(query, [questionIds], (error, results) => {
                    if (error) {
                      console.error(error);
                    } else {
                        console.log(results);
                      let obj = {
                        total_qus:data[0].total_qus,
                        total_mark:data[0].total_mark,
                        school_name:data[0].school_name,
                        name:data[0].name,
                        q_formate:data[0].q_formate}
                      res.render(`combined/view_qset`, {
                        title: "Preview Question",
                        flashMessage: Flash.getMessage(req),
                        data:  results,
                        obj
                    });
                    }
                  });
               }else{
                    res.send("No data")
               }
            }
        })
    } catch (error) {
        next(error);
    }

};