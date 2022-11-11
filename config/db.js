const mysql      = require('mysql');
const HOST = process.env.HOST
const USER_DB= process.env.USER_DB
const PASSWORD_DB = process.env.PASSWORD_DB
const DATA_BASE = process.env.DATA_BASE
const db = mysql.createConnection({
  host     : HOST,
  user     : USER_DB,
  password : PASSWORD_DB,
  database : DATA_BASE,
  multipleStatements: true
});

module.exports = db;