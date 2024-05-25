import { z } from "zod";

const envSchema = z.object({
  DATABASE_URL: z.string().url(),
  SECRET_KEY: z.string().min(12),
  APP_PORT: z.string().min(4).max(4),
});

export const env = envSchema.parse(process.env);
