const authRoute = require("./authRoute")
const userRoute = require("./userRoute")
const adminRoute = require("./adminRoute")
const messageRoute = require("./messageRoute")
const packageRoute = require("./packageRoute")
const profileRoute = require("./profileRoute")
const HomeRoute = require("./HomeRoute")
const super_admin_route = require("./super_admin_route")
const studentRoute = require("./studentRoute")
const dashboardRoute = require("./dashboardRoute")
const teacherRoute = require("./teacherRoute")




const routes = [

    {
        path: "/auth",
        handler: authRoute
    },
    {
        path: "/admin",
        handler: adminRoute
    },
    {
        path: "/contact",
        handler: messageRoute
    }, 
    {
        path: "/dashboard",
        handler: dashboardRoute
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