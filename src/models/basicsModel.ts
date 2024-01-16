import connection from '../database/connection'
import { UserBasics } from '../interfaces/iUsers'

export default class UserBasicsModel {
  async insertUserBasics(id: string, userBasics: UserBasics) {

    const { age, gender, height, weight } = userBasics

    const query = 'INSERT INTO usersBasic(age, gender, height, weight, user_id) VALUES (?, ?, ?, ?, ?) '

    const info = await connection.execute(query, [age, gender, height, weight, id])

    return info

  }

  async selectUserBasics(id: string): Promise<UserBasics[]> {
    const query = 'SELECT * FROM usersBasic WHERE user_id = ?'

    const [user] = await connection.execute(query, [id])

    return user as UserBasics[]
  }

  async updateUserBasics(id: string, userBasics: UserBasics) {
    const { height, weight, age, gender } = userBasics

    const query = 'UPDATE usersBasic SET age = ?, gender = ?, height = ?, weight = ? WHERE user_id = ?'

    const [user] = await connection.execute(query, [age, gender, height, weight, id])

    return user

  }
}