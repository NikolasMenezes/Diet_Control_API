import { app } from './app';
import { env } from '@common/config/env';

const PORT = env.APP_PORT || 3000;

app.listen(PORT, async () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
