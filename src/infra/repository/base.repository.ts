import { db } from '@infra/database/connection';

db.on('connection', () => console.log('conectou ao banco de dados'));

export abstract class BaseRepository {
  protected async execute<T>(query: string, ...params: any): Promise<T[]> {
    const [data] = await db.execute(query, params);
    return data as T[];
  }
}
