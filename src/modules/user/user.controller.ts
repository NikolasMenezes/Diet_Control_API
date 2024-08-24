import { Request, Response } from 'express';
import { User } from './entity/user';
import { UserRepository } from './user.repository';
import { TokenService } from '@common/service/token.service';
import { HashService } from '@common/service/hash.service';

const userRepository = new UserRepository();
const authService = new HashService();
const tokenService = new TokenService();

class UserController {
  async postUser(req: Request, res: Response) {
    try {
      const { email, isPremium, name, password }: User = req.body;

      const hashPassword = await authService.generateHashPassword(password);

      await userRepository.createUser({
        email,
        isPremium,
        name,
        password: hashPassword,
      } as User);

      return res.status(201).json([]);
    } catch (e) {
      if (e['code'] === 'ER_DUP_ENTRY') {
        return res.status(400).json({ error: 'email already registred' });
      }
      return res.status(500).json({ Status: 'Internal server Error!' });
    }
  }

  async getUsers(req: Request, res: Response) {
    try {
      const users = await userRepository.selectUsers();

      return res.status(200).json(users);
    } catch (e) {
      return res.status(500).json({ error: e.message });
    }
  }
  async getUserById(req: Request, res: Response) {
    try {
      const id = req.params.id;
      const users = await userRepository.findById(id);

      return res.status(200).json(users);
    } catch (e) {
      return res.status(500).json({ error: e.message });
    }
  }

  async updateUser(req: Request, res: Response) {
    try {
      const id = req.params.id;
      const userData: Partial<User> = req.body;

      const user = await userRepository.updateUser(id, userData);

      return res.status(200).json(user);
    } catch (e) {
      console.log(e.message);
      return res.status(500).json({ Status: 'Internal server Error!' });
    }
  }

  async deleteUser(req: Request, res: Response) {
    try {
      const id = req.params.id;

      await userRepository.deleteUser(id);

      return res.status(200).json([]);
    } catch (e) {
      return res.status(500).json({ Status: 'Internal server Error!' });
    }
  }

  public async getUserInfo(req: Request, res: Response) {
    try {
      const token = req.headers.authorization?.split(' ')[1];

      if (!token) return res.status(401).json({ Status: 'Unauthorized!' });

      return res.status(200).json(tokenService.getTokenInfo(token));
    } catch (e) {
      return res.status(500).json({ Status: 'Internal server Error!' });
    }
  }
}

export const userController = new UserController();
