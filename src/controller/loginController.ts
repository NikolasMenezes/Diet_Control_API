import LoginModel from '../models/loginModel';
import AuthService from '../service/authService';
import TokenService from '../service/tokenService';
import { Request, Response } from 'express';

import { SECRET_KEY } from '../constants';

const loginModel = new LoginModel()
const authService = new AuthService()
const tokenService = new TokenService()

type Login = { email: string, password: string }

class LoginController {

  async authenticate(req: Request, res: Response) {
    try {
      const body: Login = req.body;

      const userCredentials = await loginModel.getUserInfo(body.email)

      if (!userCredentials[0].password) {
        return res.status(401).json({ status: "Unauthorized" })
      }

      const passwordIsCorrect =
        await authService.verifyPassword(body.password, userCredentials[0].password)

      if (!passwordIsCorrect) {
        return res.status(401).json({ status: "Unauthorized" })
      }

      const token = await tokenService.generate(body, String(SECRET_KEY))
      const tokenExpiration = new Date((new Date().getTime() + (24 * 60 * 60 * 1000))).getTime()

      const response = { status: "success", token: token, expiresIn: tokenExpiration }

      return res.status(200).json(response)
    } catch (e: any) {
      return res.status(500).json({ 'Status': "Internal server Error!" })
    }

  }


}

export const loginController = new LoginController()