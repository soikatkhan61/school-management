const db = require("../../config/db.config")
const Flash = require("../../utils/Flash");
const fs = require('fs');


exports.renderAdminstrationDashboard = async (req, res, next) => {
    try {
        db.query("select count(*) as count from teachers where school_id =?;select count(*) as count  from students where school_id =?;select * from packages where id = ?", [req.user.id, req.user.id, req.user.package], (e, data) => {
            if (e) return next(e);
            res.render('administration', { flashMessage: Flash.getMessage(req), title: 'Administration Dashboard', teacherCount: data[0][0], studentCount: data[1][0], package: data[2][0] })
        })
    } catch (error) {
        next(error)
    }

};
