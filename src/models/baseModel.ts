import { ResultSetHeader } from "mysql2";
import connection from "../database/connection";

export default abstract class BaseModel {

  protected async execute(query: string, ...params: any): Promise<ResultSetHeader[]> {
    try {
      const [data] = await connection.execute(query, params);
      return data as ResultSetHeader[];
    } catch (error: any) {
      throw error;
    }
  }

}