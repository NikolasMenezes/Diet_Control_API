import { HttpException } from './http.exception';

export class BadRequestException extends HttpException {
  constructor(public message: string) {
    super(400, message);
  }
}
