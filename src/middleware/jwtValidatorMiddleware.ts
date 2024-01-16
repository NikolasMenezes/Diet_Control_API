import { Request, Response, NextFunction } from 'express'
import { verify } from 'jsonwebtoken'
import { SECRET_KEY } from '../constants'

export async function jwtValidationMiddleware(req: Request, res: Response, next: NextFunction) {

  if (!req.headers.authorization) {
    return res.status(401).json({ status: "Unauthorized" })
  }

  const token = req.headers.authorization.split(' ')[1]

  verify(token, SECRET_KEY, (err, decoded) => {
    if (err) {
      return res.status(401).json({ status: "Unauthorized" })
    }
  })

  next()

}