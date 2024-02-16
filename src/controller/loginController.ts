import type { Request, Response } from 'express';

import AuthService from '../service/authService';
import TokenService from '../service/tokenService';
import UserModel from '../models/userModel';

import { SECRET_KEY } from '../constants';
import type { User } from '../interfaces/iUser';

const userModel = new UserModel()
const authService = new AuthService()
const tokenService = new TokenService()
type Login = { email: string, password: string }

class LoginController {
  public async login(req: Request, res: Response) {
    try {
      const { email, password }: Login = req.body;
      const userInfo = await userModel.findByEmail(email);

      if (!userInfo) {
        return res.status(401).json({ status: "Unauthorized" });
      }
      const hashPassword = (userInfo[0] as unknown as User).password;

      const passwordIsCorrect = await authService.verifyPassword(password, hashPassword);

      if (!passwordIsCorrect) {
        return res.status(401).json({ status: "Unauthorized" });
      }
      const token = await tokenService.generate({ email, password }, String(SECRET_KEY));
      const tokenExpiration = new Date(new Date().getTime() + 24 * 60 * 60 * 1000).getTime();


      return res.status(200).json({ status: "success", token, expiresIn: tokenExpiration });
    } catch (e: any) {
      console.error(e);
      return res.status(500).json({ 'Status': "Internal server Error!" });
    }
  }
}

export const loginController = new LoginController()