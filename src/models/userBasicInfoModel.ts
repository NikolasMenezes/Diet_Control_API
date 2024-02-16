import BaseModel from './baseModel'
import type { UserInfo } from '../interfaces/iUser'
import type { ResultSetHeader } from 'mysql2/promise'

export default class UserBasicInfoModel extends BaseModel {
  public async insert(id: string, { age, gender, height, weight }: UserInfo) {
    return await this.execute(
      'INSERT INTO usersBasic(age, gender, height, weight, user_id) VALUES (?, ?, ?, ?, ?)',
      age, gender, height, weight, id
    )
  }

  public async get(id: string): Promise<ResultSetHeader[]> {
    return await this.execute('SELECT * FROM usersBasic WHERE user_id = ?', id)
  }

  public async update(id: string, { height, weight, age, gender }: UserInfo) {
    return await this.execute(
      `UPDATE usersBasic SET
       age = IFNULL(?, age),
       gender = IFNULL(?, gender),
       height = IFNULL(?, height),
       weight = IFNULL(?, weight)
       WHERE user_id = ?`,
      age ?? null,
      gender ?? null,
      height ?? null,
      weight ?? null,
      id)
  }
}