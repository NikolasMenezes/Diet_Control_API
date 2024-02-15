import { RowDataPacket } from "mysql2"

export interface User extends RowDataPacket {
  id?: number,
  name: string | null,
  password: any,
  email: string,
  isPremium: boolean,
  created_at?: string,
  updated_at?: string
}

export interface UserBasics extends RowDataPacket {
  id?: number,
  user_id?: number,
  height: number,
  weight: number,
  age: number,
  gender: "masculino" | "feminino" | "não-binário"
}