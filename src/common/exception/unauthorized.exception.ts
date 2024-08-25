import { HttpException } from './http.exception';

export class UnauthorizedException extends HttpException {
  constructor(public message: string) {
    super(401, message);
  }
}
