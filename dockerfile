FROM node:latest AS builder

WORKDIR /app

COPY package.json  .

RUN yarn install

COPY .  .

RUN yarn build 

FROM nginx:latest

COPY --from=builder /app/dist /usr/share/nginx/html

COPY nginx.conf /etc/nginx/nginx.conf