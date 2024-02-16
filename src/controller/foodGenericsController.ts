import FoodGenericsModel from '../models/foodGenericsModel';
import { FoodGroupEnum } from '../enums/foodGroups';
import type { Request, Response } from 'express';

const foodGenericsModel = new FoodGenericsModel()

class FoodGenericsController {
  public async getAll(req: Request, res: Response) {
    try {
      const [info] = await foodGenericsModel.findAll()

      return res.status(200).json(info)
    } catch (e: any) {
      return res.status(500).json({ 'Status': "Internal server Error!" })
    }
  }

  public async getByGroup(req: Request, res: Response) {
    try {
      const sentGroup = req.query.group as keyof typeof FoodGroupEnum

      const groupCompleteName = FoodGroupEnum[sentGroup];

      const foodInfo = await foodGenericsModel.findByGroup(groupCompleteName)

      return res.status(200).json(foodInfo)
    } catch (e: any) {
      return res.status(500).json({ 'Status': "Internal server Error!" })
    }
  }

  public async getById(req: Request, res: Response) {
    try {
      const id = req.params.id

      const foodInfo = await foodGenericsModel.findbyId(id)

      return res.status(200).json(foodInfo)
    } catch (e: any) {
      return res.status(500).json({ 'Status': "Internal server Error!" })
    }
  }

}

export const foodGenericsController = new FoodGenericsController()