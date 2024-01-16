import dotenv from 'dotenv'
import { Secret } from "jsonwebtoken";

dotenv.config()

export const SECRET_KEY: Secret = process.env.SECRET_KEY ? process.env.SECRET_KEY : ""