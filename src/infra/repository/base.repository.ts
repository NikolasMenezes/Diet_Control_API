import { db } from '@infra/database/connection';

export abstract class BaseRepository {
  protected async execute<T>(query: string, ...params: any): Promise<T[]> {
    const [data] = await db.execute(query, params);
    return data as T[];
  }
}
