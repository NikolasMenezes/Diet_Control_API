import 'dotenv/config'
import express from 'express'

const app = express();

import router from './router'

app.use(express.json())
app.use('/api', router)

export default app;