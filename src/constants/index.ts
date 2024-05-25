import { Secret } from "jsonwebtoken";
import { env } from "../config/env";

export const SECRET_KEY: Secret = env.SECRET_KEY ?? "default_key";
