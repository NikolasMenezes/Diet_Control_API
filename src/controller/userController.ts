import UserModel from "../models/userModel";
import AuthService from "../service/authService";
import { Request, Response } from "express";
import { User } from "../interfaces/iUser";

const userModel = new UserModel();
const authService = new AuthService();

class UserController {
  async postUser(req: Request, res: Response) {
    try {
      const { email, isPremium, name, password }: User = req.body;

      const hashPassword = await authService.generateHashPassword(password);

      await userModel.createUser({ email, isPremium, name, password: hashPassword } as User);

      return res.status(201).json([]);
    } catch (e: any) {
      if (e["code"] === "ER_DUP_ENTRY") {
        return res.status(400).json({ error: "email already registred" });
      }
      return res.status(500).json({ 'Status': "Internal server Error!" });
    }
  }

  async getUsers(req: Request, res: Response) {
    try {
      const users = await userModel.selectUsers();

      return res.status(200).json(users);
    } catch (e: any) {
      return res.status(500).json({ error: e.message });
    }
  }
  async getUserById(req: Request, res: Response) {
    try {
      const id = req.params.id;
      const users = await userModel.findById(id);

      return res.status(200).json(users);
    } catch (e: any) {
      return res.status(500).json({ error: e.message });
    }
  }

  async updateUser(req: Request, res: Response) {
    try {
      const id = req.params.id;
      const userData: Partial<User> = req.body;

      const user = await userModel.updateUser(id, userData);

      return res.status(200).json(user);
    } catch (e: any) {
      console.log(e.message)
      return res.status(500).json({ 'Status': "Internal server Error!" });
    }
  }

  async deleteUser(req: Request, res: Response) {
    try {
      const id = req.params.id;

      await userModel.deleteUser(id);

      return res.status(200).json([]);
    } catch (e: any) {
      return res.status(500).json({ 'Status': "Internal server Error!" });
    }
  }
}

export const userController = new UserController();
