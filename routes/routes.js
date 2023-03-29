const authRoute = require("./authRoute")
const userRoute = require("./userRoute")
const messageRoute = require("./messageRoute")
const packageRoute = require("./packageRoute")
const profileRoute = require("./profileRoute")
const HomeRoute = require("./HomeRoute")
const super_admin_route = require("./super_admin_route")
const studentRoute = require("./studentRoute")
const teacherRoute = require("./teacherRoute")
const moderatorRoute = require("./moderatorRoute")
const combinedQuestionRoute = require("./combinedQuestionRoute")
const randomrRoute = require("./randomrRoute")
const examRoute = require("./examRoute")
const uploadRoute = require("./uploadRoute")
const administrationRoute = require("./administrationRoute")




const routes = [

    {
        path: "/administration",
        handler: administrationRoute
    },
    {
        path: "/auth",
        handler: authRoute
    },
    {
        path: "/contact",
        handler: messageRoute
    }, 
    {
        path: "/combined-question",
        handler: combinedQuestionRoute
    },
    {
        path: "/exam",
        handler: examRoute
    },
    {
        path: "/profile",
        handler: profileRoute
    },
    {
        path: "/packages",
        handler: packageRoute
    },
    {
        path: "/student",
        handler: studentRoute
    },
    {
        path: "/super-admin",
        handler: super_admin_route
    },
    {
        path: "/teacher",
        handler: teacherRoute
    },
    {
        path: "/moderator",
        handler: moderatorRoute
    },
    {
        path: "/random-questions",
        handler: randomrRoute
    },
    {
        path: "/user",
        handler: userRoute
    },
    {
        path: "/upload",
        handler: uploadRoute
    },
    {
        path: "/",
        handler: HomeRoute
    }
]


module.exports = app =>{
    routes.forEach(r =>{
        if(r.path === '/'){
            app.get('/',r.handler)
        }else{
            app.use(r.path, r.handler)
        }
    })
}