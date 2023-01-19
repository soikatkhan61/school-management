const router = require("express").Router()

const {allMovieGetController,fetchMovieByCategory,movieByCategory,filterMovie,renderSingleMovie} = require('../controllers/movie/clientMovieController')


router.get("/get-movie",fetchMovieByCategory)
router.get("/filter",filterMovie)
router.get("/movie-info",renderSingleMovie)
router.get("/",allMovieGetController)

module.exports = router