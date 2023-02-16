const db = require("../../config/db.config")
const Flash = require('../../utils/Flash')
exports.dashboardGetController = async (req, res, next) => {
    try {
        db.query("select * from users where id = ?", [req.user.id], (e, data) => {
            if (e) {
                next(e)
            } else {
                if (data) {
                    res.render("user/dashboard", { title: "Dashboard",flashMessage:Flash.getMessage(req), userProfile: "", recentUser: data });
                } else {
                    res.render("user/dashboard", { title: "Dashboard", userProfile: "",flashMessage:Flash.getMessage(req),  recentUser: '' });
                }
            }
        })
    } catch (error) {
        next(e)
    }

};

exports.renderUserSearch = async (req, res, next) => {
    res.render("user/pages/search-user", { title: 'Search User',flashMessage:Flash.getMessage(req) })
}

exports.adminDashboardRender = async (req, res, next) => {
    res.render("user/admin", { title: 'Admin Dashboard',flashMessage:Flash.getMessage(req),  })
}
