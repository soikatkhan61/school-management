const multer = require('multer')
const path = require('path')
const sharp = require('sharp');
const fs = require('fs')



const storage = multer.diskStorage({
    destination: (req,file,cb)=>{
        cb(null,'public/uploads')
    },
    filename: (req,file,cb)=>{
        cb(null,file.fieldname + '_' + Date.now() + '_' + file.originalname)
    }
})

const upload =  multer({
    storage,
    limits:{
        fileSize: 1024 * 1024 * 5
    },
    fileFilter: async (req,file,cb) =>{
        const types = /jpeg|jpg|png|gif|webp/
        const extName = types.test(path.extname(file.originalname).toLowerCase())
        const mimeType = types.test(file.mimetype)

        if(extName && mimeType){
            console.log(file);
            
    
            cb(null,true)
        }else{
           cb( new Error('Only supported images'))
        }
    }
})

module.exports = upload