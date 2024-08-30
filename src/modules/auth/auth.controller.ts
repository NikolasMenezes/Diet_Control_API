import type { Request, Response } from 'express';
import { UserRepository } from '../user/user.repository';
import { loginDtoSchema } from './dto/login.dto';
import { AuthService } from './auth.service';
import { ZodError } from 'zod';
import { BadRequestException } from '@common/exception/bad-request.exception';

export class LoginController {
  private authService: AuthService = new AuthService(new UserRepository());

  public login = async (req: Request, res: Response) => {
    try {
      const loginDto = loginDtoSchema.parse(req.body);

      return res.status(200).json(await this.authService.login(loginDto));
    } catch (error) {
      if (error instanceof ZodError) {
        const requiredFields = error.issues.map((field) => field.path);
        // TODO: create global zod error filter
        throw new BadRequestException(
          `the field(s) ${requiredFields.join(' ')} is/are required`,
        );
      }
      throw error;
    }
  };
}

export const loginController = new LoginController();
