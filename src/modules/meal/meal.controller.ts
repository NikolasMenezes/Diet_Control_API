import FoodGenericsRepository from '@modules/food-generics/food-generics.repository';
import type { Request, Response } from 'express';
import { Meal } from './entity/meal';
import MealRepository from './meal.repository';

const mealRepository = new MealRepository();
const foodGenericsRepository = new FoodGenericsRepository();

type MealWithFood = Meal & { foods_id: number[] };

class MealController {
  public async postMeal(req: Request, res: Response) {
    try {
      const { description, name, foods_id, user_id }: MealWithFood = req.body;

      const calories = await this.calcuteMealCalories(foods_id);

      const newMeal = await mealRepository.createMeal(
        { user_id, name, description, calories },
        foods_id,
      );

      return res
        .status(201)
        .json({ Status: 'Meal created successfully!', meal_id: newMeal });
    } catch (e) {
      return res.status(500).json({ Status: 'Internal server Error!' });
    }
  }

  public async getMealsUserId(req: Request, res: Response) {
    try {
      const { user_id } = req.body;

      const meals = await mealRepository.getMealsByUserId(user_id);

      return res.status(200).json({ Status: 'Meals found!', meals: meals });
    } catch (e) {
      return res.status(500).json({ Status: 'Internal server Error!' });
    }
  }

  public async getMealById(req: Request, res: Response) {
    try {
      const id = req.params.id;

      const meal = await mealRepository.getMealById(id);

      return res.status(200).json({ Status: 'Meal found!', meal: meal });
    } catch (e) {
      return res.status(500).json({ Status: 'Internal server Error!' });
    }
  }

  public async deleteMealById(req: Request, res: Response) {
    try {
      const id = req.params.id;

      await mealRepository.deleteMeal(id);

      return res.status(200).json({ Status: 'Meal deleted successfully!' });
    } catch (e) {
      return res.status(500).json({ Status: 'Internal server Error!' });
    }
  }

  public async putMeal(req: Request, res: Response) {
    try {
      const { description, name }: Meal = req.body;
      const id = req.params.id;

      await mealRepository.updateMealById(id, { description, name });

      return res.status(200).json({ Status: 'Meal updated successfully!' });
    } catch (e) {
      return res.status(500).json({ Status: 'Internal server Error!' });
    }
  }

  public async deleteFoodFromMeal(req: Request, res: Response) {
    const foodId = req.params.food_id;
    const mealId = req.params.meal_id;

    try {
      await mealRepository.deleteFoodFromMeal(mealId, foodId);

      const foodInfo = await foodGenericsRepository.findbyId(foodId);

      const [mealCurrentCalories] = (await mealRepository.getMealCalories(
        mealId,
      )) as any[];

      await mealRepository.upadteMealCalories(
        mealId,
        Number(
          (mealCurrentCalories.calories + foodInfo[0].kcal * -1).toFixed(2),
        ),
      );

      return res
        .status(200)
        .json({ Status: 'Food deleted from meal successfully!' });
    } catch (e) {
      console.log('erro', e.message);
      return res.status(500).json({ Status: 'Internal server Error!' });
    }
  }

  public async addFoodToMeal(req: Request, res: Response) {
    try {
      const meal_id = req.params.id;
      const { food_id } = req.body;

      await mealRepository.addFoodToMeal(meal_id, food_id);

      const mealCurrentCalories = await mealRepository.getMealCalories(meal_id);

      for (const id of food_id) {
        const foodInfo = await foodGenericsRepository.findbyId(id);
        await mealRepository.upadteMealCalories(
          meal_id,
          Number((mealCurrentCalories + foodInfo[0].kcal).toFixed(2)),
        );
      }
      return res
        .status(200)
        .json({ Status: 'Food added to meal successfully!' });
    } catch (e) {
      return res.status(500).json({ Status: 'Internal server Error!' });
    }
  }

  private async calcuteMealCalories(foods_id: number[]): Promise<number> {
    const foodsInfo = [];

    for (const id of foods_id) {
      const [food] = await foodGenericsRepository.findbyId(id);
      foodsInfo.push(food);
    }

    return calcuteMealCalories(foodsInfo);
  }
}

export const mealController = new MealController();
