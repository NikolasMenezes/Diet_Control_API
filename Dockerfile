FROM node:20-alpine

WORKDIR /app

ENV DATABASE_URL=mysql://root:root@localhost:3306/diet_control
ENV SECRET_KEY=mysecret_PAssword
ENV APP_PORT=3408

COPY package*.json ./

RUN npm install

COPY . .

CMD [ "npm", "run", "dev"]