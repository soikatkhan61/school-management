const authRoute = require("./authRoute")
const userRoute = require("./userRoute")
const adminRoute = require("./adminRoute")
const messageRoute = require("./messageRoute")
const packageRoute = require("./packageRoute")
const profileRoute = require("./profileRoute")
const HomeRoute = require("./HomeRoute")
const super_admin_route = require("./super_admin_route")




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
        path: "/user",
        handler: userRoute
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
        path: "/contact",
        handler: messageRoute
    },
    {
        path: "/super-admin",
        handler: super_admin_route
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