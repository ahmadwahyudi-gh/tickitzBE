const mysql = require('mysql')
const db = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'tickitz_2022'
})

db.connect((err)=> {
  if(err) {
    console.log(err)
  }
  console.log('DB CONNECTED')
})


module.exports = db