FROM node:20-alpine3.20

WORKDIR /app

COPY package.json /app/

RUN npm install -g pnpm

COPY pnpm-lock.yaml /app/

RUN pnpm install

COPY . .

RUN chown -R node:node /app

USER node

EXPOSE 3000

CMD [ "pnpm", "dev"]