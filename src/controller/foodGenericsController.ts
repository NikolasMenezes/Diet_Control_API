import { Request, Response } from 'express';
import { SECRET_KEY } from '../constants';
import FoodGenericsModel from '../models/foodGenerics';
import TokenService from '../service/tokenService';
import { FoodGroupEnum } from '../enums/foodGroups';

const tokenService = new TokenService()
const foodGenericsModel = new FoodGenericsModel()

class FoodGenericsController {
  async getAll(req: Request, res: Response) {
    try {
      const [info] = await foodGenericsModel.getAll()

      return res.status(200).json(info)
    } catch (e: any) {
      return res.status(500).json({ 'Status': "Internal server Error!" })
    }
  }
  async getByGroup(req: Request, res: Response) {
    try {
      const sentGroup = req.query.group as string

      const groupCompleteName = FoodGroupEnum[sentGroup as keyof typeof FoodGroupEnum];

      const foodInfo = await foodGenericsModel.getByGroup(groupCompleteName)

      return res.status(200).json(foodInfo)
    } catch (e: any) {
      return res.status(500).json({ 'Status': "Internal server Error!" })
    }
  }
  async getById(req: Request, res: Response) {
    try {
      const id = req.params.id

      const foodInfo = await foodGenericsModel.getbyId(id)

      return res.status(200).json(foodInfo)
    } catch (e: any) {
      return res.status(500).json({ 'Status': "Internal server Error!" })
    }
  }

}

export const foodGenericsController = new FoodGenericsController()