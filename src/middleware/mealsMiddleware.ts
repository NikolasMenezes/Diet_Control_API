import { NextFunction, Request, Response } from "express";

export function verifyMealFields(req: Request, res: Response, next: NextFunction) {
  const validationRules = [
    { field: 'name', required: true, message: 'Name is required' },
    { field: 'description', required: true, message: 'Description is required' },
    { field: 'foods_id', required: true, message: 'Foods is required' },
    { field: 'user_id', required: true, message: 'User is required' },
  ];

  const errors = [];

  for (const rule of validationRules) {
    if (rule.required && !req.body[rule.field]) {
      errors.push({ field: rule.field, message: rule.message });
    }
  }

  if (errors.length > 0) {
    return res.status(400).json({ errors });
  }

  next();
}