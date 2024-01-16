import { NextFunction, Request, Response } from "express"
import { FoodGroupEnum } from "../enums/foodGroups"

function isValidGroup(group: string) {
  return Object.keys(FoodGroupEnum).map(group => group.toLowerCase()).includes(group)
}

export function validateSentGroup(req: Request, res: Response, next: NextFunction) {
  const sentGroup = req.query.group as string

  if (!sentGroup) {
    return res.status(400).json({ error: "Group parameter is required" })
  }
  const lowerCaseSentGroup = sentGroup.toLowerCase();

  if (!isValidGroup(lowerCaseSentGroup)) {
    return res.status(400).json({ error: "Group not Valid" })
  }

  next()
}
