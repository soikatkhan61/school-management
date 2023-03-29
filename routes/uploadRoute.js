const router = require('express').Router()
const multipart = require('connect-multiparty');
const multipartMiddleware = multipart();

const {
    ckUpload,
    getFileList
} = require('../controllers/uploadController.js')

router.post('/',multipartMiddleware,ckUpload)
router.get('/browse',getFileList)


module.exports = router