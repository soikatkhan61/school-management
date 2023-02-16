const db = require("../../config/db.config")
const Flash = require("../../utils/Flash");
const fs = require('fs');


exports.renderTeacherDashboard = async (req, res, next) => {
    try {
        res.render('teacher/exam/create', { flashMessage: Flash.getMessage(req), title: 'Create Exam', })
    } catch (error) {
        next(error)
    }

};
