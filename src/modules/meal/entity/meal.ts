import { FoodGenerics } from '@modules/food-generics/entity/food-generics';

export interface Meal {
  id?: number;
  name: string;
  description: string;
  calories: number;
  user_id?: number | string;
  foods?: FoodGenerics[];
}
