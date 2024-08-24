import { RowDataPacket } from 'mysql2';

export interface User extends RowDataPacket {
  id: number;
  name: string;
  password: string;
  email: string;
  isPremium: boolean;
  created_at: Date;
  updated_at?: Date;
}
