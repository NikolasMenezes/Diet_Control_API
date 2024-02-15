import { Secret } from "jsonwebtoken";

export const SECRET_KEY: Secret = process.env.SECRET_KEY ? process.env.SECRET_KEY : ""