import { Request, Response, NextFunction } from 'express';

export async function userMiddleware(
  req: Request,
  res: Response,
  next: NextFunction,
) {
  const validationRules = [
    {
      field: 'email',
      required: true,
      message: 'The field "email" is required',
    },
    { field: 'name', required: true, message: 'The field "name" is required' },
    {
      field: 'password',
      required: true,
      message: 'The field "password" is required',
    },
  ];

  for (const rule of validationRules) {
    if (rule['required'] && !req.body[rule.field]) {
      return res.status(400).json({ message: rule.message });
    }
  }

  next();
}
