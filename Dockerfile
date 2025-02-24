FROM node:16.15.1-alpine AS builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN ["npm", "run", "build"]

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html