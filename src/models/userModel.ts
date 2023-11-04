import connection from "./connection";

import { User } from '../interfaces/iUsers'
import { ResultSetHeader } from "mysql2/promise";

export default class UserModel {

  async createUser(user: User): Promise<ResultSetHeader> {
    const { name, password, email, isPremium } = user;
    isPremium === undefined && false;

    const query = 'INSERT INTO users(name, email, password, isPremium) VALUES (?, ?, ?, ?)'

    const [newUser] = await connection.execute(query, [name, email, password, isPremium])

    return newUser as ResultSetHeader
  }

  async selectUsers(): Promise<ResultSetHeader> {

    const query = 'SELECT id, name, email, isPremium FROM users ';

    const [users] = await connection.execute(query)

    return users as ResultSetHeader

  }

  async selectUserById(id: string): Promise<ResultSetHeader> {

    const query = 'SELECT id, name, email, isPremium FROM users WHERE id = ?';

    const [user] = await connection.execute(query, [id])

    return user as ResultSetHeader

  }

  async updateUser(id: string, user: User): Promise<ResultSetHeader> {

    const { email, name, password, isPremium } = user;

    const query = 'UPDATE users SET name = ?, email = ?, password = ?, isPremium = ? WHERE id = ?';

    const [userUpadted] = await connection.execute(query, [name, email, password, isPremium, id])

    return userUpadted as ResultSetHeader

  }

  async removeUser(id: string): Promise<ResultSetHeader> {

    const query = 'DELETE FROM users WHERE id = ?';

    const [user] = await connection.execute(query, [id])

    return user as ResultSetHeader

  }

}

