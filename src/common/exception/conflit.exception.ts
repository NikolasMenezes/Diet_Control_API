import { HttpException } from './http.exception';

export class ConflictException extends HttpException {
  constructor(public message: string) {
    super(409, message);
  }
}
