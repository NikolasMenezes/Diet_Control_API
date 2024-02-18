import { Secret, sign, verify } from 'jsonwebtoken'
import { SECRET_KEY } from '../constants'

export default class TokenService {

  async generate(payload: object, secretKey: string) {
    return sign(payload, secretKey, { expiresIn: '100000000000000000h' })
  }

  getTokenInfo(token: string, secretKey: Secret = SECRET_KEY) {
    return verify(token, secretKey, (err, decoded) => {
      if (!err) {
        return decoded
      }
    })
  }

}