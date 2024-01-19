import { NextFunction, Request, Response } from "express";

export function verifyUserBasicInfoFields(req: Request, res: Response, next: NextFunction) {

  const validationRules = [
    { field: 'age', required: true, message: "The field 'age' is required" },
    { field: 'gender', required: true, message: "The field 'gender' is required", options: ['feminino', 'masculino', 'não-binário'] },
    { field: 'height', required: true, message: "The field 'height' is required" },
    { field: 'weight', required: true, message: "The field 'weight' is required" },
  ];

  const errors = [];

  for (const rule of validationRules) {
    if (rule.options && !rule.options.includes(req.body[rule.field])) {
      errors.push({ field: rule.field, message: `${rule.field} was incorrectly informed` });
    }
    if (rule.required && !req.body[rule.field]) {
      errors.push({ field: rule.field, message: rule.message });
    }
  }

  if (errors.length > 0) {
    return res.status(400).json({ errors });
  }

  next();
}