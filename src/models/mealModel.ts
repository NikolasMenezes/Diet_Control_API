import connection from "../database/connection";

import { Meal } from "../interfaces/iMeals";
import { ResultSetHeader } from "mysql2/promise";

export default class MealModel {
  async createMeal(meal: Meal, foods_id: number[]): Promise<number> {
    try {
      const { name, description, calories, user_id } = meal;

      const createMealQuery = "INSERT INTO meals(name, description, calories, user_id) VALUES (?, ?, ?, ?)";

      const newMeal = await connection.execute(createMealQuery, [
        name,
        description,
        calories,
        user_id
      ]) as ResultSetHeader[];

      const meal_id = newMeal[0].insertId;

      for (const id of foods_id) {
        await this.addFoodToMeal(meal_id, id);
      }

      return meal_id;
    } catch (e: any) {
      console.error(e.message);
      throw e;
    }
  }

  async addFoodToMeal(meal_id: number | string, food_id: number | number[]): Promise<boolean> {
    try {
      const query = "INSERT INTO meals_foods (meal_id, food_id) VALUES (?, ?)";
      if (typeof food_id === 'number') {
        await connection.execute(query, [meal_id, food_id]);
      }
      else {
        for (const id of food_id) {
          await connection.execute(query, [meal_id, id]);
        }
      }
      return true;
    } catch (e: any) {
      console.error(e.message);
      throw e;
    }
  }

  async getMealsByUserId(user_id: number | string): Promise<ResultSetHeader[]> {
    try {
      const query = "SELECT id, name, description, calories FROM meals WHERE user_id = ?";
      const [meals] = await connection.execute(query, [user_id]) as any[];

      for (const meal of meals) {
        const foods = await this.getFoodsFromMeal(meal.id);
        meal.foods = foods;
      }

      return meals;

    } catch (e: any) {
      console.error(e.message);
      throw e;
    }
  }

  async getFoodsFromMeal(meal_id: number | string): Promise<ResultSetHeader[]> {
    try {
      const query = "SELECT food_id FROM meals_foods WHERE meal_id = ?";

      const [foods_ids] = await connection.execute(query, [meal_id]) as any[];

      const foodInfo = []

      for (const food of foods_ids) {
        const [food_info] = await connection.execute("SELECT * FROM food_generics WHERE id = ?", [food.food_id]) as any[];
        foodInfo.push(food_info[0]);
      }
      return foodInfo as ResultSetHeader[];
    } catch (e: any) {
      console.error(e.message);
      throw e;
    }
  }

  async getMealById(meal_id: number | string): Promise<ResultSetHeader> {
    const query = "SELECT name, description, calories FROM meals WHERE id = ?";

    const [meal] = await connection.execute(query, [meal_id]) as any[];

    const foods = await this.getFoodsFromMeal(meal_id);
    meal[0].foods = foods;

    return meal[0];
  }

  async deleteMeal(meal_id: number | string): Promise<boolean> {
    try {
      const query = "DELETE FROM meals WHERE id = ?";

      await connection.execute(query, [meal_id]);

      return true;
    } catch (e: any) {
      console.error(e.message);
      throw e;
    }
  }

  async deleteFoodFromMeal(meal_id: number | string, food_id: number | string): Promise<boolean> {
    try {
      const query = "DELETE FROM meals_foods WHERE meal_id = ? AND food_id = ?";

      await connection.execute(query, [meal_id, food_id]);

      return true;
    } catch (e: any) {
      console.error(e.message);
      throw e;
    }
  }

  async updateMealById(meal_id: number | string, meal: Partial<Meal>): Promise<boolean> {
    try {
      const query = "UPDATE meals SET name = ?, description = ? WHERE id = ?";

      const { name, description } = meal;

      await connection.execute(query, [name, description, meal_id]);

      return true;
    } catch (e: any) {
      console.error(e.message);
      throw e;
    }
  }

  async upadteMealCalories(meal_id: number | string, calories: number): Promise<boolean> {
    try {
      const query = "UPDATE meals SET calories = ? WHERE id = ?";

      await connection.execute(query, [calories, meal_id]);

      return true
    } catch (e: any) {
      console.error(e.message);
      throw e;
    }
  }

  async getMealCalories(meal_id: number | string): Promise<number> {
    try {
      const query = "SELECT calories FROM meals WHERE id = ?";

      const [meal] = await connection.execute(query, [meal_id]) as any[];

      return meal[0].calories;
    } catch (e: any) {
      console.error(e.message);
      throw e;
    }
  }
}
