import type { Request, Response } from 'express';
import { TokenService } from '../../common/service/token.service';
import { UserRepository } from '../user/user.repository';
import { HashService } from '@common/service/hash.service';
import { loginDtoSchema } from './dto/login.dto';
import { AuthService } from './auth.service';

export class LoginController {
  private authService: AuthService = new AuthService(
    new UserRepository(),
    new HashService(),
    new TokenService(),
  );

  public async login(req: Request, res: Response) {
    try {
      const loginDto = loginDtoSchema.parse(req.body);

      return res.status(200).json(await this.authService.login(loginDto));
    } catch (e) {
      console.error(e);
      return res.status(500).json({ Status: 'Internal server Error!' });
    }
  }
}

// export const loginController = ;
