require('dotenv').config()

import mysql from 'mysql2/promise'

const connection = mysql.createPool({
  host: process.env.HOST,
  user:  process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DATABASE,
})

export default connection