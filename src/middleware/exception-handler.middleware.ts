/* eslint-disable @typescript-eslint/no-unused-vars */
import { HttpException } from '@common/exception/http.exception';
import { NextFunction, Request, Response } from 'express';

export function exceptionHandler(
  err: Error,
  req: Request,
  res: Response,
  next: NextFunction,
) {
  const code = err instanceof HttpException ? Number(err.code) : 500;
  const message =
    err instanceof HttpException ? err.message : 'Internal Server Error';

  return res.status(code).json({ status: 'error', message, statusCode: code });
}
