import FoodGenericsModel from '../models/foodGenericsModel';
import MealModel from '../models/mealModel';
import { calcuteMealCalories } from '../utils/calcuteMealCalories';
import type { Request, Response } from "express";
import type { Meal } from "../interfaces/iMeal";

const mealModel = new MealModel();
const foodGenericsModel = new FoodGenericsModel();

type MealWithFood = Meal & { foods_id: number[] };

class MealController {

  public async postMeal(req: Request, res: Response) {
    try {
      const { description, name, foods_id, user_id }: MealWithFood = req.body;

      const calories = await this.calcuteMealCalories(foods_id);

      const newMeal = await mealModel.createMeal({ user_id, name, description, calories }, foods_id);

      return res.status(201).json({ 'Status': 'Meal created successfully!', 'meal_id': newMeal });
    } catch (e: any) {
      return res.status(500).json({ 'Status': "Internal server Error!" });
    }
  }

  public async getMealsUserId(req: Request, res: Response) {
    try {
      const { user_id } = req.body;

      const meals = await mealModel.getMealsByUserId(user_id);

      return res.status(200).json({ 'Status': 'Meals found!', 'meals': meals });
    } catch (e: any) {
      return res.status(500).json({ 'Status': "Internal server Error!" });
    }
  }

  public async getMealById(req: Request, res: Response) {
    try {
      const id = req.params.id;

      const meal = await mealModel.getMealById(id);

      return res.status(200).json({ 'Status': 'Meal found!', 'meal': meal });
    } catch (e) {
      return res.status(500).json({ 'Status': "Internal server Error!" });
    }
  }

  public async deleteMealById(req: Request, res: Response) {
    try {
      const id = req.params.id;

      await mealModel.deleteMeal(id);

      return res.status(200).json({ 'Status': 'Meal deleted successfully!' });
    } catch (e) {
      return res.status(500).json({ 'Status': "Internal server Error!" });
    }
  }

  public async putMeal(req: Request, res: Response) {
    try {
      const { description, name }: Meal = req.body;
      const id = req.params.id;

      await mealModel.updateMealById(id, { description, name });

      return res.status(200).json({ 'Status': 'Meal updated successfully!' });
    }
    catch (e) {
      return res.status(500).json({ 'Status': "Internal server Error!" });
    }
  }

  public async deleteFoodFromMeal(req: Request, res: Response) {
    const foodId = req.params.food_id;
    const mealId = req.params.meal_id;

    try {
      await mealModel.deleteFoodFromMeal(mealId, foodId);

      const foodInfo = await foodGenericsModel.findbyId(foodId);

      const [mealCurrentCalories] = await mealModel.getMealCalories(mealId) as any[];

      await mealModel.upadteMealCalories(
        mealId,
        Number((mealCurrentCalories.calories + (foodInfo[0].kcal * -1)).toFixed(2))
      );

      return res.status(200).json({ 'Status': 'Food deleted from meal successfully!' });
    } catch (e: any) {
      console.log("erro", e.message)
      return res.status(500).json({ 'Status': "Internal server Error!" });
    }
  }

  public async addFoodToMeal(req: Request, res: Response) {
    try {
      const meal_id = req.params.id;
      const { food_id } = req.body;

      await mealModel.addFoodToMeal(meal_id, food_id);

      const mealCurrentCalories = await mealModel.getMealCalories(meal_id);

      for (const id of food_id) {
        const foodInfo = await foodGenericsModel.findbyId(id);
        await mealModel.upadteMealCalories(
          meal_id,
          Number((mealCurrentCalories + foodInfo[0].kcal).toFixed(2))
        );
      }
      return res.status(200).json({ 'Status': 'Food added to meal successfully!' });
    } catch (e) {
      return res.status(500).json({ 'Status': "Internal server Error!" });
    }
  }

  private async calcuteMealCalories(foods_id: number[]): Promise<number> {
    const foodsInfo = [];

    for (const id of foods_id) {
      const [food] = await foodGenericsModel.findbyId(id);
      foodsInfo.push(food)
    }

    return calcuteMealCalories(foodsInfo);
  }

}

export const mealController = new MealController();
