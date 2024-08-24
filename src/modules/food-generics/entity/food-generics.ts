import { RowDataPacket } from 'mysql2';

export interface FoodGenerics extends RowDataPacket {
  id: number;
  grupo: string;
  descricao: string;
  kcal: number;
  proteina: number;
  carboidratos: number;
}
