import { UserRepository } from '@modules/user/user.repository';
import { LoginDto } from './dto/login.dto';

export class AuthService {
  constructor(private readonly userRepository: UserRepository) {
    this.userRepository = userRepository;
  }

  public async login({ email }: LoginDto) {
    const [user] = await this.userRepository.findByEmail(email);

    console.log(user);

    return { status: 'ok' };

    //   if (!userInfo[0]) return res.status(401).json({ status: 'Unauthorized' });

    //   const { id, name, email, isPremium, password } =
    //     userInfo[0] as unknown as User;

    //   const passwordIsCorrect = await hashService.verifyPassword(
    //     body.password,
    //     password,
    //   );

    //   if (!passwordIsCorrect) {
    //     return res.status(401).json({ status: 'Unauthorized' });
    //   }
    //   const payload = {
    //     id,
    //     name,
    //     email,
    //     isPremium: new Boolean(isPremium),
    //   };

    //   const token = await tokenService.generate(payload, String(env.SECRET_KEY));
    //   const tokenExpiration = new Date(
    //     new Date().getTime() + 24 * 60 * 60 * 1000,
    //   ).getTime();

    //   return res
    //     .status(200)
    //     .json({ status: 'success', token, expiresIn: tokenExpiration });
  }
}
