import { Request, Response } from 'express';

export default class BaseController {

  protected async handleRequest(req: Request, res: Response, callback: () => Promise<any>) {
    try {
      const result = await callback();
      return res.status(200).json(result);
    } catch (e: any) {
      return res.status(500).json({ status: "Internal server Error!" });
    }
  }
}