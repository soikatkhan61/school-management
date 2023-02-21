const authRoute = require("./authRoute")
const userRoute = require("./userRoute")
const messageRoute = require("./messageRoute")
const packageRoute = require("./packageRoute")
const profileRoute = require("./profileRoute")
const HomeRoute = require("./HomeRoute")
const super_admin_route = require("./super_admin_route")
const studentRoute = require("./studentRoute")
const teacherRoute = require("./teacherRoute")
const examRoute = require("./examRoute")




const routes = [

    {
        path: "/auth",
        handler: authRoute
    },
    {
        path: "/contact",
        handler: messageRoute
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
        path: "/user",
        handler: userRoute
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