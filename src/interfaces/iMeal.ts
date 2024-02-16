import { FoodGenerics } from "./iFoodGenerics";

export interface Meal {
  id?: number;
  name: string;
  description: string;
  calories: number;
  user_id?: number | string;
  foods?: FoodGenerics[];
}
