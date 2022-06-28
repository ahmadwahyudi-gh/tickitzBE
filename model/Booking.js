// model = tempat dimana kita meletakkan data yang berhubungan dengan database
const db = require("../helper/db_connection")
const table = "bookings"
module.exports = {
  get: (req, res) => {
    return new Promise((resolve, reject) => {
      const sql = `SELECT * FROM ${table}`
      db.query(sql, (err, results) => {
        if (err) {
          reject({ message: "ada error" })
        }
        resolve({
          message: "get all from booking success",
          status: 200,
          data: results,
        })
      })
    })
  },
  add: (req, res) => {
    return new Promise((resolve, reject) => {
      const { id_user, id_movie, id_schedule, seats } = req.body

      db.query(
        `INSERT INTO ${table} (id_user, id_movie, id_schedule, seats,) VALUES('${id_user}', '${id_movie}','${id_schedule}','${seats}')`,
        (err, results) => {
          if (err) {
            console.log(err)
            reject({ message: "ada error" })
          }
          resolve({
            message: "add new booking success",
            status: 200,
            data: {
              id_bookings: results.insertId,
              ...req.body,
            },
          })
        },
      )
    })
  },
  update: (req, res) => {
    return new Promise((resolve, reject) => {
      const { id } = req.params
      db.query(`SELECT * FROM ${table} where id=${id}`, (err, results) => {
        if (err) {
          res.send({ message: "ada error" })
        }

        const previousData = {
          ...results[0],
          ...req.body,
        }
        const { id_user, id_movie, id_schedule, seats } = previousData

        db.query(
          `UPDATE bookings SET id_user='${id_user}', id_movie='${id_movie}', id_schedule='${id_schedule}', seats='${seats}'`,
          (err, results) => {
            if (err) {
              console.log(err)
              reject({ message: "ada error" })
            }
            resolve({
              message: "update booking success",
              status: 200,
              data: results,
            })
          },
        )
      })
    })
  },
  remove: (req, res) => {
    return new Promise((resolve, reject) => {
      const { id } = req.params
      db.query(`DELETE FROM bookings where id=${id}`, (err, results) => {
        if (err) {
          reject({ message: "ada error" })
        }
        resolve.send({
          message: "delete booking success",
          status: 200,
          data: results,
        })
      })
    })
  },
}
