import { genSalt, hash, compare } from 'bcryptjs';

export class HashService {
  static async generateHashPassword(password: string): Promise<string> {
    const sal = await genSalt(10);
    const hashedPassword = await hash(password, sal);
    return hashedPassword;
  }

  static async verifyPassword(
    password: string,
    hashPassword: string,
  ): Promise<boolean> {
    return await compare(password, hashPassword);
  }
}
