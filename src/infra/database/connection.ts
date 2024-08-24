import mysql from 'mysql2/promise';
import { env } from '@common/config/env';

const db = mysql.createPool({
  uri: env.DATABASE_URL,
});

export { db };
