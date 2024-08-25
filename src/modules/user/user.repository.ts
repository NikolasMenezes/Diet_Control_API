import { BaseRepository } from '@infra/repository/base.repository';
import type { ResultSetHeader } from 'mysql2/promise';
import { User } from './entity/user';

export class UserRepository extends BaseRepository {
  public async selectUsers() {
    return await this.execute('SELECT id, name, email, isPremium FROM users');
  }

  public async findById(id: string) {
    return await this.execute(
      'SELECT id, name, email, isPremium FROM users where id = ?',
      id,
    );
  }

  public async findByEmail(email: string) {
    return await this.execute<User>(
      'SELECT id, name, email, isPremium, password FROM users where email = ?',
      email,
    );
  }

  public async createUser({ name, email, password, isPremium }: User) {
    return await this.execute(
      'INSERT INTO users(name, email, password, isPremium) VALUES (?, ?, ?, ?)',
      name,
      email,
      password,
      isPremium,
    );
  }

  public async deleteUser(id: string): Promise<ResultSetHeader[]> {
    return await this.execute('DELETE FROM users WHERE id = ?', id);
  }

  public async updateUser(
    id: string,
    { email, name, isPremium }: Partial<User>,
  ) {
    return await this.execute(
      'UPDATE users SET name = IFNULL(?, name), email = IFNULL(?, email), isPremium = IFNULL(?, isPremium) WHERE id = ?',
      name ?? null,
      email ?? null,
      isPremium ?? null,
      id,
    );
  }
}
