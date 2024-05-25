import mysql from "mysql2/promise";
import { env } from "../config/env";

const connection = mysql.createPool({
  uri: env.DATABASE_URL,
});

export default connection;
