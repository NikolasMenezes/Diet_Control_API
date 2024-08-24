import { env } from '@common/config/env';
import { type Secret, sign, verify } from 'jsonwebtoken';

export class TokenService {
  static generate(payload: object, secretKey: string) {
    return sign(payload, secretKey, { expiresIn: '72h' });
  }

  static getTokenInfo(token: string, secretKey: Secret = env.SECRET_KEY) {
    return verify(token, secretKey, (err, decoded) => {
      if (err) {
        throw err;
      }

      return decoded;
    });
  }
}
