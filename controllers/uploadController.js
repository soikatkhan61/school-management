const db = require('../config/db1')
const fs = require('fs');
const path = require('path');



exports.ckUpload = async(req,res,next) =>{
  try {
    fs.readFile(req.files.upload.path, function (err, data) {

        var newPath = path.join(__dirname, '..', 'public/', 'uploads/' +'questions/' + req.files.upload.name)
       
        fs.writeFile(newPath, data, function (err) {
            if (err) return next(err);
            else {
                console.log(req.files.upload.originalFilename);
            //     imgl = '/images/req.files.upload.originalFilename';
            //     let img = "<script>window.parent.CKEDITOR.tools.callFunction('','"+imgl+"','ok');</script>";
            //    res.status(201).send(img);
             
                let fileName = req.files.upload.name;
                let url = '/uploads/questions/'+fileName;                    
                let msg = 'Upload successfully';
                let funcNum = req.query.CKEditorFuncNum;
                console.log({url,msg,funcNum});
               
                res.status(201).send("<script>window.parent.CKEDITOR.tools.callFunction('"+funcNum+"','"+url+"','"+msg+"');</script>");
            }
        });
    });
   } catch (error) {
       console.log(error.message);
   }
}
exports.getFileList = async(req,res,next) =>{
  var browseDir = path.join(__dirname, '..', 'public', 'uploads/questions')
  try {
    const html = `
    <!DOCTYPE html>
    <html>
      <head>
        <title>File Browser</title>
      </head>
      <body>
        <h1>File Browser</h1>
        <ul>
          ${getFileList(req,browseDir)}
        </ul>
      </body>
    </html>
  `;
  res.send(html);
   } catch (error) {
       console.log(error.message);
   }
}

function getFileList(req,dir) {
  const files = fs.readdirSync(dir);
  let fileList = '';
  for (const file of files) {
    const fileUrl = `${req.protocol}://${req.get('host')}/uploads/questions/${file}`;
    fileList += `<li>
    <img src="/uploads/questions/${file}" height="100" width="auto" />
    <p>${fileUrl}</p>
    </li>`;
  }
  return fileList;
}

