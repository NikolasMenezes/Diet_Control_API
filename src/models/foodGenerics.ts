import connection from '../database/connection'
import { FoodGenerics } from '../interfaces/iFoodGenerics'
import { ResultSetHeader } from 'mysql2'

export default class FoodGenericsModel {

  async getAll(): Promise<ResultSetHeader[]> {

    const query = "SELECT * FROM food_generics"

    const food_generics = await connection.execute(query)

    return food_generics as ResultSetHeader[]
  }

  async getByGroup(group: string): Promise<FoodGenerics[]> {

    const query = "SELECT * FROM food_generics WHERE grupo = ?"

    const [food_generics] = await connection.execute(query, [group])

    return food_generics as FoodGenerics[]
  }

  async getbyId(id: number | string): Promise<any> {

    const query = "SELECT * FROM food_generics WHERE id = ?"

    const [food_generics] = await connection.execute(query, [id])

    return food_generics
  }

}