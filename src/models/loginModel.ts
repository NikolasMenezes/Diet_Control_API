import { User } from "../interfaces/iUsers";
import connection from "../database/connection";

export default class LoginModel {

  async getUserInfo(email: string): Promise<Partial<User>[]> {

    const query = "SELECT password FROM users WHERE email = ?"

    const [password] = await connection.execute(query, [email])

    return password as Partial<User>[]

  }


}