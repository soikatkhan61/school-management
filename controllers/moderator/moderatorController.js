const db = require("../../config/db.config")
const Flash = require("../../utils/Flash");
const fs = require('fs');


exports.renderModeratorDashboard = async (req, res, next) => {
    try {
        res.render('moderator/moderator-dashboard.ejs', { flashMessage: Flash.getMessage(req), title: 'Create Exam', })
    } catch (error) {
        next(error)
    }

};
