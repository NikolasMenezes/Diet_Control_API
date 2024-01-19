import connection from "../database/connection";

import { Meal } from "../interfaces/iMeals";
import { ResultSetHeader } from "mysql2/promise";

export default class MealModel {
  async createMealAndAddFood(user_id: number, meal: Meal, foods_id: number[]) {
    try {
      const { name, description, calories } = meal;

      const createMealQuery = "INSERT INTO meals(name, description, calories) VALUES (?, ?, ?)";
      const addFoodToMealQuery = "INSERT INTO user_meals_foods(user_id, meal_id, food_id) VALUES (?, ?, ?)";

      const newMeal = await connection.execute(createMealQuery, [
        name,
        description,
        calories,
      ]) as ResultSetHeader[];

      const meal_id = newMeal[0].insertId;

      for (const id of foods_id) {
        await connection.execute(addFoodToMealQuery, [user_id, meal_id, id]);
      }

      return meal_id;
    } catch (e: any) {
      console.error(e.message);
      throw e;
    }
  }

  async getMealsByUserId(user_id: number) {

  }

}
