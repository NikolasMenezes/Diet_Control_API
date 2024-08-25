import 'dotenv/config';
import 'express-async-errors';
import express from 'express';
import cors from 'cors';
import { router } from './router';
import { exceptionHandler } from './middleware/exception-handler.middleware';

const app = express();

app.use(cors());
app.use(express.json());
app.use('/api', router);
app.use(exceptionHandler);

export { app };
