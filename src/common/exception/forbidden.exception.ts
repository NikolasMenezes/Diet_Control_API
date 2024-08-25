import { HttpException } from './http.exception';

export class ForbiddenException extends HttpException {
  constructor(public message: string) {
    super(403, message);
  }
}
