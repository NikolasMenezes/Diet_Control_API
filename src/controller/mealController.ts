import MealModel from '../models/mealModel';
import { Request, Response } from "express";
import { Meal } from "../interfaces/iMeals";
import FoodGenericsModel from '../models/foodGenerics';
import { calcuteMealCalories } from '../utils/calcuteMealCalories';

const mealModel = new MealModel();
const foodGenericsModel = new FoodGenericsModel();

type MealWithFood = Meal & { foods_id: number[] };

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

      if (!user_id) {
        return res.status(400).json({ 'Status': 'User id is required!' })
      }

      const newMeal = await mealModel.createMeal({ user_id, name, description, calories }, foods_id);

      return res.status(201).json({ 'Status': 'Meal created successfully!', 'meal_id': newMeal });
    } catch (e: any) {
      return res.status(500).json({ 'Status': "Internal server Error!" });
    }
  }

  async getMealsUserId(req: Request, res: Response) {
    try {
      const { user_id } = req.body;

      const meals = await mealModel.getMealsByUserId(user_id);

      return res.status(200).json({ 'Status': 'Meals found!', 'meals': meals });
    } catch (e: any) {
      return res.status(500).json({ 'Status': "Internal server Error!" });
    }
  }

  async getMealById(req: Request, res: Response) {
    try {
      const id = req.params.id;

      const meal = await mealModel.getMealById(id);

      return res.status(200).json({ 'Status': 'Meal found!', 'meal': meal });
    } catch (e) {
      return res.status(500).json({ 'Status': "Internal server Error!" });
    }
  }

  async deleteMealById(req: Request, res: Response) {
    try {
      const id = req.params.id;

      await mealModel.deleteMeal(id);

      return res.status(200).json({ 'Status': 'Meal deleted successfully!' });
    } catch (e) {
      return res.status(500).json({ 'Status': "Internal server Error!" });
    }
  }

  async putMeal(req: Request, res: Response) {
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

  async deleteFoodFromMeal(req: Request, res: Response) {
    const foodId = req.params.food_id;
    const mealId = req.params.meal_id;

    try {
      await mealModel.deleteFoodFromMeal(mealId, foodId);

      const foodInfo = await foodGenericsModel.getbyId(foodId);

      const mealCurrentCalories = await mealModel.getMealCalories(mealId);

      console.log(mealCurrentCalories, foodInfo[0].kcal)

      await mealModel.upadteMealCalories(mealId, Number((mealCurrentCalories + (foodInfo[0].kcal * -1)).toFixed(2)));

      return res.status(200).json({ 'Status': 'Food deleted from meal successfully!' });
    } catch (e) {
      return res.status(500).json({ 'Status': "Internal server Error!" });
    }
  }

  async addFoodToMeal(req: Request, res: Response) {
    try {
      const meal_id = req.params.id;
      const { food_id } = req.body;

      await mealModel.addFoodToMeal(meal_id, food_id);

      const mealCurrentCalories = await mealModel.getMealCalories(meal_id);

      if (typeof food_id === 'number') {
        const foodInfo = await foodGenericsModel.getbyId(food_id);
        await mealModel.upadteMealCalories(meal_id, Number((mealCurrentCalories + foodInfo[0].kcal).toFixed(2)));
      }

      if (food_id instanceof Array) {
        for (const id of food_id) {
          const foodInfo = await foodGenericsModel.getbyId(id);
          await mealModel.upadteMealCalories(meal_id, Number((mealCurrentCalories + foodInfo[0].kcal).toFixed(2)));
        }
      }

      return res.status(200).json({ 'Status': 'Food added to meal successfully!' });
    } catch (e) {
      return res.status(500).json({ 'Status': "Internal server Error!" });
    }
  }

}

export const mealController = new MealController();
