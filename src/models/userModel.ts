import connection from "./connection";

import { User } from '../interfaces/iUsers'

export default class UserModel {

  async createUser(user: User) {
    const { name, password, email, isPremium } = user;
    isPremium === undefined && false;

    const query = 'INSERT INTO users(name, email, password, isPremium) VALUES (?, ?, ?, ?)'

    const [newUser] = await connection.execute(query, [name, email, password, isPremium])

    return newUser
  }

  async selectUsers(): Promise<User[]> {

    const query = 'SELECT id, name, email, isPremium FROM users ';

    const [users] = await connection.execute(query)

    return users as User[]

  }

  async selectUserById(id: string): Promise<User[]> {

    const query = 'SELECT id, name, email, isPremium FROM users WHERE id = ?';

    const [user] = await connection.execute(query, [id])

    return user as User[]

  }

  async updateUser(id: string, user: User) {

    const { email, name, password, isPremium } = user;

    const query = 'UPDATE users SET name = ?, email = ?, password = ?, isPremium = ? WHERE id = ?';

    const userUpadted = await connection.execute(query, [name, email, password, isPremium, id])

    console.log(userUpadted as ResultSetHeader)
    console.log([userUpadted])

    // if (userUpadted > 0) {
    //   throw new Error('User not found')
    // }


    return [userUpadted]
  }

  async removeUser(id: string) {

    const query = 'DELETE FROM users WHERE id = ?';

    const [user] = await connection.execute(query, [id])

    return user

  }

}

