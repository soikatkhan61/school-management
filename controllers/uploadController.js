exports.uploadThumbnail = async(req,res,next) => {
    console.log(" i am from upload controller")
    if(req.file){
        
        return res.status(200).json({
            imgUrl : `/uploads/${req.file.filename}`
        })
    }

    return res.status(500).json({
        message: 'Server Error'
    })
}