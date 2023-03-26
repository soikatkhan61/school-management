const db = require("../../config/db.config")
const Flash = require("../../utils/Flash");
const fs = require('fs');


exports.renderAdminstrationDashboard = async (req, res, next) => {
    try {
        res.render('administration', { flashMessage: Flash.getMessage(req), title: 'Administration Dashboard', })
    } catch (error) {
        next(error)
    }

};
