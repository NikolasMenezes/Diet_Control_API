import UserBasicsModel from '../models/basicsModel';
import { Request, Response } from 'express';
import { UserBasics } from '../interfaces/iUsers';

const basicsModel = new UserBasicsModel();

class BasicsController {

  async storeUserBasics(req: Request, res: Response) {

    try {
      const id = req.params.id
      const data: UserBasics = req.body

      await basicsModel.insertUserBasics(id, data)

      return res.status(200).json([])

    } catch (e) {
      return res.status(500).json({ 'error': e })
    }

  }

  async getUserBasics(req: Request, res: Response) {

    try {
      const id = req.params.id

      const user = await basicsModel.selectUserBasics(id)

      return res.status(200).json(user)

    } catch (e) {
      return res.status(500).json({ 'error': e })
    }

  }

  async putUserBasics(req: Request, res: Response) {

    try {

      const id = req.params.id
      const data: UserBasics = req.body

      await basicsModel.updateUserBasics(id, data)

      return res.status(200).json([])

    } catch (e) {
      return res.status(500).json({ 'error': e })
    }

  }

}

export const basicsController = new BasicsController()