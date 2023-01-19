const router = require('express').Router()

const {isAuthenticated} = require('../middleware/authMidleware')
const upload = require('../middleware/uploadMiddleware')

const {
    uploadThumbnail
} = require('../controllers/uploadController')

router.post('/thumbnail',isAuthenticated,upload.single('thumbnail'),uploadThumbnail)


module.exports = router