import { SECRET_KEY } from '../../../src/constants'
import TokenService from '../../../src/service/tokenService'

describe('Validate token information', () => {
  it("Should return user's correct identity", async () => {
    const _tokenService = new TokenService()

    const example = {
      _token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFkYVdvbmdAZ21haWwuY29tIiwicGFzc3dvcmQiOiJhZG1pbiIsImlhdCI6MTcwNTM2OTcwNSwiZXhwIjozNjAwMDAwMDAwMDE3MDU0MDAwMDB9.knfmeynaZCrd3In2h7GsiVlXslZwg2ljCxGJwdbFGiU"
    }

    const result = _tokenService.getTokenInfo(example._token, SECRET_KEY)
    const expected = {
      email: 'adaWong@gmail.com',
      password: 'admin',
      iat: 1705369705,
      exp: +'360000000001705400000'
    }

    expect(expected).toStrictEqual(result)
  })
})