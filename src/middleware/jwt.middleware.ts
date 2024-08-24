import { Request, Response, NextFunction } from 'express';
import { verify } from 'jsonwebtoken';
import { env } from '../common/config/env';

export async function jwtValidationMiddleware(
  req: Request,
  res: Response,
  next: NextFunction,
) {
  if (!req.headers.authorization) {
    return res.status(401).json({ status: 'Unauthorized' });
  }

  const token = req.headers.authorization.split(' ')[1];

  verify(token, env.SECRET_KEY, (err: any, decoded: any) => {
    if (err) {
      return res.status(401).json({ status: 'Unauthorized' });
    }

    // TODO: add user to request object
  });

  next();
}
