FROM node:20-alpine AS buildx

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:alpine

COPY --from=buildx /app/dist /usr/share/nginx/html


