import winston from 'winston';
import { env } from './env';

const levels = {
  error: 0,
  warn: 1,
  info: 2,
  http: 3,
  verbose: 4,
  debug: 5,
  silly: 6,
};

export const logger = winston.createLogger({});

const productionEnv = env.NODE_ENV === 'production';

if (!productionEnv) {
  logger.add(
    new winston.transports.Console({
      format: winston.format.simple(),
    }),
  );
}
