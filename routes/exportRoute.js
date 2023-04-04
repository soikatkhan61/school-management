const router = require("express").Router()
const mysqldump = require('mysqldump');
const fs = require('fs');
const path = require('path');
const dbtest = require('../config/db.config')


router.get("/import",async(req,res)=>{
    try {
        const sql = fs.readFileSync(path(__dirname  + 'backup.sql')).toString();
        console.log(sql);
        await dbtest.query(sql);

      } catch (err) {
        console.error(err);
        res.status(500).send('Error generating SQL dump');
      }
})
router.get("/",async(req,res)=>{
    try {
        const dump = await mysqldump({
          connection: {
            host: 'localhost',
            user: 'root',
            password: '',
            database: 'school'
          }
        });
    
        res.set({
          'Content-Disposition': 'attachment;filename=backup.sql',
          'Content-Type': 'application/octet-stream'
        });
    
        res.send(dump);
      } catch (err) {
        console.error(err);
        res.status(500).send('Error generating SQL dump');
      }
})

module.exports = router