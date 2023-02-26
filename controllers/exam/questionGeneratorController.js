const db = require("../../config/db.config");
const Flash = require("../../utils/Flash");

exports.renderQuestionGenerator = (req, res, next) => {
    try {
        db.query("select id,class_name from classes WHERE school_id=1 ", (e, data) => {
            if (e) {
                next(e)
            } else {
                res.render("exam/question_generator", {
                    title: "Question Generator",
                    flashMessage: Flash.getMessage(req),
                    classes:data
                });
            }
        })
       
    } catch (error) {
        next(error)
    }
};
exports.viewGeneratedQuestion = (req, res, next) => {
    try {
        
    res.render("exam/view_question", {
        title: "View Question",
        flashMessage: Flash.getMessage(req),
    });
    } catch (error) {
        next(error)
    }
};