import { BaseRepository } from '@infra/repository/base.repository';
import type { ResultSetHeader } from 'mysql2/promise';

export default class FoodGenericsRepository extends BaseRepository {
  public async findAll(): Promise<ResultSetHeader[]> {
    return await this.execute('SELECT * FROM food_generics');
  }

  public async findByGroup(group: string): Promise<ResultSetHeader[]> {
    return await this.execute(
      'SELECT * FROM food_generics WHERE group = ?',
      group,
    );
  }

  public async findbyId(id: number | string): Promise<any> {
    return await this.execute('SELECT * FROM food_generics WHERE id = ?', id);
  }
}
