const mysql = require('mysql2');

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
  database: process.env.DB_NAME,
  waitForConnections: true,
  multipleStatements:true,
  connectTimeout: 20000
});

module.exports = pool.promise();