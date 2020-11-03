FROM node:10-alpine as build-step

RUN mkdir /app

WORKDIR /app

COPY package.json /app

RUN npm install --silent

COPY . /app

RUN npm run build --silent

FROM nginx:1.17.1-alpine

COPY --from=build-step /app/build /usr/share/nginx/html


