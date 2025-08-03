const mysql      = require('mysql2');

const HOST = process.env.HOST
const USER_DB= process.env.USER_DB
const PASSWORD_DB = process.env.PASSWORD_DB
const DATA_BASE = process.env.DATA_BASE
const DATA_BASE_PORT =process.env.DATA_BASE_PORT
//const db = mysql.createConnection(process.env.DATABASE_URL)
console.log("SAPIN",HOST)
const db = mysql.createConnection({
  host     : HOST,
  user     : USER_DB,
  password : PASSWORD_DB,
  database : DATA_BASE,
  multipleStatements: true,
  port : DATA_BASE_PORT,
  /*ssl:{
    rejectUnauthorized:false
  }*/
});
console.log(db)
module.exports = db;