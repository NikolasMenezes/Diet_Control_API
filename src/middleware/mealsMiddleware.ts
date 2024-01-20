import { NextFunction, Request, Response } from "express";

export function verifyMealFields(req: Request, res: Response, next: NextFunction) {
  const reqType = req.method;

  if (reqType == "put" && !req.params.id) {
    return res.status(400).json({ 'Status': "meal id is required!" });
  }

  const validationRules = [
    { field: 'name', required: true, message: 'Name is required' },
    { field: 'description', required: true, message: 'Description is required' },
    { field: 'foods_id', required: reqType == "post" ? true : false, message: 'Foods is required' },
    { field: 'user_id', required: reqType == "post" ? true : false, message: 'User is required' },
  ];

  const errors = [];

  for (const rule of validationRules) {
    if (rule.required && !req.body[rule.field]) {
      errors.push({ error: rule.message });
    }
  }

  if (errors.length > 0) {
    return res.status(400).json({ errors });
  }

  next();
}