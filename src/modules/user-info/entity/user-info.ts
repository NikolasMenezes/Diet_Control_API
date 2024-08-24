import { RowDataPacket } from 'mysql2';

export interface UserInfo extends RowDataPacket {
  id?: number;
  user_id?: number;
  height: number;
  weight: number;
  age: number;
  gender: 'masculino' | 'feminino' | 'não-binário';
}
