import connection from "./connection";

import { User } from "../interfaces/iUsers";
import { ResultSetHeader } from "mysql2/promise";

export default class UserModel {
  async createUser(user: User) {
    const { name, password, email, isPremium } = user;

    const query =
      "INSERT INTO users(name, email, password, isPremium) VALUES (?, ?, ?, ?)";

    const [newUser] = await connection.execute(query, [
      name,
      email,
      password,
      isPremium,
    ]);
    console.log(newUser)
    return newUser;
  }

  async selectUsers(): Promise<ResultSetHeader[]> {
    const query = "SELECT id, name, email, isPremium FROM users ";

    const [users] = await connection.execute(query);

    console.log(users)

    return users as ResultSetHeader[];
  }

  async findById(id: string): Promise<ResultSetHeader[]> {
    const query = "SELECT id, name, email, isPremium FROM users WHERE id = ?";

    const [user] = await connection.execute(query, [id]);

    return user as ResultSetHeader[];
  }

  async updateUser(id: string, user: User): Promise<ResultSetHeader> {
    const { email, name, password, isPremium } = user;

    const query =
      "UPDATE users SET name = ?, email = ?, password = ?, isPremium = ? WHERE id = ?";

    const [userUpdated] = await connection.execute(query, [
      name,
      email,
      password,
      isPremium,
      id,
    ]);

    const affectedRows = (userUpdated as ResultSetHeader).affectedRows;

    if (affectedRows <= 0) {
      throw new Error("User not found");
    }

    return userUpdated as ResultSetHeader;
  }

  async removeUser(id: string) {
    const query = "DELETE FROM users WHERE id = ?";

    const [user] = await connection.execute(query, [id]);

    return user;
  }
}
