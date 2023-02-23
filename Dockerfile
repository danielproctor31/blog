FROM node:18-alpine as build

WORKDIR /build

COPY . .

RUN npm ci
RUN npm run build

FROM nginx:latest as publish

COPY --from=build /build/public /usr/share/nginx/html