const mysql = require("mysql2");

const connection = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.BD_NAME,
  port: process.env.DB_PORT,
  connectionLimit: 10,
});

module.exports = connection;
