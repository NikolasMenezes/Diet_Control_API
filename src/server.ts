import app from "./app";
import { env } from "./config/env";

const PORT = env.APP_PORT || 3000;

app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
