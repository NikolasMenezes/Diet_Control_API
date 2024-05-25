FROM ubuntu
FROM node:20

WORKDIR /app

RUN apt update && apt upgrade -y

COPY package*.json ./

RUN npm install

COPY . .

CMD [ "npm", "run", "dev"]