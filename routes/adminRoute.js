const router = require("express").Router()

const upload = require('../middleware/uploadMiddleware')

const {
    isUnAuthenticated,
    isAuthenticated,
    checkAdmin
} = require('../middleware/authMiddleware')

const {adminDashboardGetController,packageAnalysticGetController} = require('../controllers/admin/adminController')
const {adminPackageGetController,packageEditGetController,packageEditPostController,pkgApproveGet,pkgApproved,pkgApprovePost,pkgPaymentReject} = require("../controllers/admin/adminPackageController")

const {msgGetContrller,singleMsgGetContrller,deleteMsgGetContrller,respondMessage} = require("../controllers/contactUsController")


const {renderTvController,renderAllChannels,createChannelPostController,editChannelGetController,editChannelPostController,deleteChannel} = require('../controllers/admin/tv/tvController')

const {getAllUsers,bannedAnUser,renderAddNewUser,registerUser,renderEditUser,updateUserPost,deleteUser} = require('../controllers/admin/users/usersController')

const {renderAddMoviePage,addMoviePostController,renderUpdatePage,renderEdit,editMoviePostController,deleteMovie} = require('../controllers/admin/movie/movieController')

const {renderAddTVPage,addTvPostController,renderAllTV,renderEditTV,updateTVPost,renderAddEpisodes,addEpisodePost,fetchEpisodesNumber,renderSeeEpisodes,editEpisode,editEpisodePost} = require('../controllers/admin/tv/tvController')




router.get("/add-movie",isAuthenticated, renderAddMoviePage)
router.post("/add-movie",isAuthenticated, addMoviePostController)

router.get("/update-movie",isAuthenticated, renderUpdatePage)

router.get("/edit-movie",isAuthenticated, renderEdit)
router.post("/edit-movie",isAuthenticated, editMoviePostController)

router.get("/delete-movie",isAuthenticated, deleteMovie)

router.get("/add-tv",isAuthenticated, renderAddTVPage)
router.post("/add-tv",isAuthenticated, addTvPostController)
router.get("/edit-tv",isAuthenticated, renderEditTV)
router.post("/edit-tv",isAuthenticated, updateTVPost)

router.get("/all-tv",isAuthenticated, renderAllTV)

router.get("/add-episodes",isAuthenticated, renderAddEpisodes)
router.post("/add-episodes",isAuthenticated, addEpisodePost)
router.get("/edit-episodes",isAuthenticated, editEpisode)
router.post("/edit-episodes",isAuthenticated, editEpisodePost)
router.get("/see-episodes",isAuthenticated, renderSeeEpisodes)

router.get("/episode_count", fetchEpisodesNumber)


router.get("/new-user",isAuthenticated, renderAddNewUser)
router.post("/new-user",isAuthenticated, registerUser)

router.get("/update-user",isAuthenticated, renderEditUser)
router.post("/update-user",isAuthenticated, updateUserPost)

router.get("/delete-user",isAuthenticated, deleteUser)


router.get("/messages/respond",isAuthenticated, respondMessage)
router.get("/messages/:msg_id",isAuthenticated, singleMsgGetContrller)
router.get("/messages/delete/:msg_id",isAuthenticated, deleteMsgGetContrller)
router.get("/messages",isAuthenticated, msgGetContrller)


router.get("/packages",isAuthenticated,checkAdmin,adminPackageGetController)
router.get("/packages/analystic",isAuthenticated,checkAdmin,packageAnalysticGetController)
router.get("/packages/edit-package",isAuthenticated,checkAdmin,packageEditGetController)
router.post("/packages/edit-package",isAuthenticated,checkAdmin,packageEditPostController)


//router.get("/packages/approve/:payment_id",isAuthenticated,checkAdmin,pkgApprovPostConrtoller)
router.get("/approve-pkg",isAuthenticated,checkAdmin,pkgApproved)
router.get("/packages/approve",isAuthenticated,checkAdmin,pkgApproveGet)
router.get("/packages/approvethis",isAuthenticated,checkAdmin,pkgApprovePost)
router.post("/packages/reject",isAuthenticated,checkAdmin,pkgPaymentReject)



router.get("/users",isAuthenticated,checkAdmin,getAllUsers)
router.get("/users/banned",isAuthenticated,checkAdmin,bannedAnUser)


router.get("/",isAuthenticated,checkAdmin,adminDashboardGetController)

module.exports = router