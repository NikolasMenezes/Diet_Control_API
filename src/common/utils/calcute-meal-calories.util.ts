import { FoodGenerics } from '@modules/food-generics/entity/food-generics';

export function calculateMealCalories(foods: FoodGenerics[]): number {
  let totalCalories = 0;

  for (let i = 0; i < foods.length; i++) {
    totalCalories += foods[i].kcal;
  }
  return Number(totalCalories.toFixed(2));
}
