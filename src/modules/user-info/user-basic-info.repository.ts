import { UserInfo } from './entity/user-info';
import { BaseRepository } from '../../infra/repository/base.repository';
import type { ResultSetHeader } from 'mysql2/promise';

export default class UserBasicInfoRepository extends BaseRepository {
  public async insert(id: string, { age, gender, height, weight }: UserInfo) {
    return await this.execute(
      'INSERT INTO users_basic(age, gender, height, weight, user_id) VALUES (?, ?, ?, ?, ?)',
      age,
      gender,
      height,
      weight,
      id,
    );
  }

  public async get(id: string): Promise<ResultSetHeader[]> {
    return await this.execute(
      'SELECT * FROM users_basic WHERE user_id = ?',
      id,
    );
  }

  public async update(id: string, { height, weight, age, gender }: UserInfo) {
    return await this.execute(
      `UPDATE users_basic SET
       age = IFNULL(?, age),
       gender = IFNULL(?, gender),
       height = IFNULL(?, height),
       weight = IFNULL(?, weight)
       WHERE user_id = ?`,
      age ?? null,
      gender ?? null,
      height ?? null,
      weight ?? null,
      id,
    );
  }
}
