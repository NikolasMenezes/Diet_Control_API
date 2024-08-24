import { FoodGroupEnum } from '../../enums/food-groups.enum';
import type { Request, Response } from 'express';
import FoodGenericsRepository from './food-generics.repository';

class FoodGenericsController {
  private readonly foodGenericsRepository: FoodGenericsRepository;

  constructor() {
    this.foodGenericsRepository = new FoodGenericsRepository();
  }

  public async getAll(req: Request, res: Response) {
    try {
      const [info] = await this.foodGenericsRepository.findAll();

      return res.status(200).json(info);
    } catch (e) {
      return res.status(500).json({ Status: 'Internal server Error!' });
    }
  }

  public async getByGroup(req: Request, res: Response) {
    try {
      const sentGroup = req.query.group as keyof typeof FoodGroupEnum;

      const groupCompleteName = FoodGroupEnum[sentGroup];

      const foodInfo =
        await this.foodGenericsRepository.findByGroup(groupCompleteName);

      return res.status(200).json(foodInfo);
    } catch (e) {
      return res.status(500).json({ Status: 'Internal server Error!' });
    }
  }

  public async getById(req: Request, res: Response) {
    try {
      const id = req.params.id;

      const foodInfo = await this.foodGenericsRepository.findbyId(id);

      return res.status(200).json(foodInfo);
    } catch (e) {
      return res.status(500).json({ Status: 'Internal server Error!' });
    }
  }
}

export const foodGenericsController = new FoodGenericsController();
