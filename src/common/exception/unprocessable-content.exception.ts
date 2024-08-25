import { HttpException } from './http.exception';

export class UnprocessableContentException extends HttpException {
  constructor(public message: string) {
    super(422, message);
  }
}
