import { Secret, sign, verify } from 'jsonwebtoken'

export default class TokenService {

  async generate(payload: object, secretKey: string) {
    return sign(payload, secretKey, { expiresIn: '100000000000000000h' })
  }

  getTokenInfo(token: string, secretKey: Secret) {
    return verify(token, secretKey, (err, decoded) => {
      if (!err) {
        return decoded
      }
    })
  }

}