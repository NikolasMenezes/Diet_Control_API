import { Request, Response } from 'express';
import UserBasicInfoRepository from './user-basic-info.repository';
import { UserInfo } from './entity/user-info';

const userBasicInfoRepository = new UserBasicInfoRepository();

class UserBasicInfoController {
  public async storeUserBasics(req: Request, res: Response) {
    try {
      const id = req.params.id;
      const info: UserInfo = req.body;

      await userBasicInfoRepository.insert(id, info);

      return res.status(200).json([]);
    } catch (e) {
      return res.status(500).json({ Status: 'Internal server Error!' });
    }
  }

  public async getUserBasicInfo(req: Request, res: Response) {
    try {
      const id = req.params.id;
      const user = await userBasicInfoRepository.get(id);

      return res.status(200).json(user);
    } catch (e) {
      return res.status(500).json({ Status: 'Internal server Error!' });
    }
  }

  public async updateUserBasicInfo(req: Request, res: Response) {
    try {
      const id = req.params.id;
      const data: UserInfo = req.body;
      await userBasicInfoRepository.update(id, data);

      return res.status(200).json([]);
    } catch (e) {
      return res.status(500).json({ Status: 'Internal server Error!' });
    }
  }
}

export const userBasicInfoController = new UserBasicInfoController();
