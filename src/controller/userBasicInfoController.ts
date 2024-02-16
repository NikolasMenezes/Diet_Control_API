import UserBasicInfoModel from '../models/userBasicInfoModel';
import { Request, Response } from 'express';
import { UserInfo } from '../interfaces/iUser';

const userBasicInfoModel = new UserBasicInfoModel();

class UserBasicInfoController {

  public async storeUserBasics(req: Request, res: Response) {
    try {
      const id = req.params.id
      const info: UserInfo = req.body

      await userBasicInfoModel.insert(id, info)

      return res.status(200).json([])
    } catch (e) {
      return res.status(500).json({ 'Status': "Internal server Error!" })
    }
  }

  public async getUserBasicInfo(req: Request, res: Response) {
    try {
      const id = req.params.id
      const user = await userBasicInfoModel.get(id)

      return res.status(200).json(user)
    } catch (e) {
      return res.status(500).json({ 'Status': "Internal server Error!" })
    }
  }

  public async updateUserBasicInfo(req: Request, res: Response) {
    try {
      const id = req.params.id
      const data: UserInfo = req.body
      await userBasicInfoModel.update(id, data)

      return res.status(200).json([])

    } catch (e) {
      return res.status(500).json({ 'Status': "Internal server Error!" })
    }
  }

}

export const userBasicInfoController = new UserBasicInfoController()