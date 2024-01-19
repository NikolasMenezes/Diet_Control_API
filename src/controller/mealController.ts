import MealModel from '../models/mealModel';
import { Request, Response } from "express";
import { Meal } from "../interfaces/iMeals";
import FoodGenericsModel from '../models/foodGenerics';
import { calcuteMealCalories } from '../utils/calcuteMealCalories';
import { FoodGenerics } from '../interfaces/iFoodGenerics';

const mealModel = new MealModel();
const foodGenericsModel = new FoodGenericsModel();

type MealWithFood = Meal & { foods_id: number[] } & { user_id: number };

class MealController {

  async postMeal(req: Request, res: Response) {
    try {
      const { description, name, foods_id, user_id }: MealWithFood = req.body;

      const foodsInfo = [];

      for (const id of foods_id) {
        const [food] = await foodGenericsModel.getbyId(id);
        foodsInfo.push(food)
      }

      const calories = calcuteMealCalories(foodsInfo);

      const newMeal = await mealModel.createMealAndAddFood(user_id, { name, description, calories }, foods_id);

      return res.status(201).json({ 'Status': 'Meal created successfully!', 'meal_id': newMeal });
    } catch (e: any) {
      return res.status(500).json({ 'Status': "Internal server Error!" });
    }
  }


}

export const mealController = new MealController();
