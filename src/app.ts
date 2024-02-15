import 'dotenv/config'
import express from 'express'
import cors from 'cors'

const app = express();

import router from './router'

app.use(cors())
app.use(express.json())
app.use('/api', router)

export default app;