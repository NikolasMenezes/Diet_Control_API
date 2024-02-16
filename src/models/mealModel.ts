import BaseModel from "./baseModel";
import type { Meal } from "../interfaces/iMeal";
import type { ResultSetHeader } from "mysql2/promise";

export default class MealModel extends BaseModel {

  public async addFoodToMeal(meal_id: number | string, food_id: number[]): Promise<void> {
    try {
      for (const food of food_id) {
        await this.execute("INSERT INTO meals_foods(meal_id, food_id) VALUES (?, ?)", meal_id, food);
      }
    } catch (e: any) {
      throw e;
    }
  }

  private async getFoodsFromMeal(meal_id: number | string): Promise<ResultSetHeader[]> {
    try {
      const query = `
        SELECT fg.*
        FROM meals_foods mf
        INNER JOIN food_generics fg ON mf.food_id = fg.id
        WHERE mf.meal_id = ?
      `;

      return await this.execute(query, meal_id);
    } catch (e: any) {
      console.error(e.message);
      throw e;
    }
  }

  public async createMeal({ name, description, calories, user_id }: Meal, foods_id: number[]): Promise<void> {
    try {
      const newMeal = await this.execute(
        "INSERT INTO meals(name, description, calories, user_id) VALUES (?, ?, ?, ?)",
        name,
        description,
        calories,
        user_id
      );

      const meal_id = newMeal[0].insertId;

      await this.addFoodToMeal(meal_id, foods_id);
    } catch (e: any) {
      throw e;
    }
  }

  public async getMealsByUserId(user_id: number | string): Promise<ResultSetHeader[]> {
    try {
      const query = "SELECT id, name, description, calories FROM meals WHERE user_id = ?";
      const meals = await this.execute(query, user_id) as any[];

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


  public async getMealById(meal_id: number | string): Promise<ResultSetHeader[]> {
    const query = "SELECT name, description, calories FROM meals WHERE id = ?";

    const meal = await this.execute(query, meal_id) as any[];

    const foods = await this.getFoodsFromMeal(meal_id);
    meal[0].foods = foods;

    return meal[0];
  }

  public async deleteMeal(meal_id: number | string): Promise<ResultSetHeader[]> {
    return await this.execute("DELETE FROM meals WHERE id = ?", meal_id);
  }

  public async deleteFoodFromMeal(meal_id: number | string, food_id: number | string): Promise<ResultSetHeader[]> {
    return await this.execute("DELETE FROM meals_foods WHERE meal_id = ? AND food_id = ?", meal_id, food_id);
  }

  public async updateMealById(meal_id: number | string, meal: Partial<Meal>): Promise<ResultSetHeader[]> {
    return await this.execute(
      "UPDATE meals SET ? name = IFNULL(? , name), description = IFNULL(?, description) WHERE id = ?"
      , meal, meal_id);
  }

  public async upadteMealCalories(meal_id: number | string, calories: number): Promise<ResultSetHeader[]> {
    return await this.execute("UPDATE meals SET calories = ? WHERE id = ?", calories, meal_id);
  }

  public async getMealCalories(meal_id: number | string): Promise<ResultSetHeader[]> {
    return await this.execute("SELECT calories FROM meals WHERE id = ?", meal_id);
  }
}
