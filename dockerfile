# build stage
FROM node:lts-alpine3.12 as build-stage
WORKDIR /usr/src/anime-database
COPY package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build

# production stage
FROM nginx:alpine as production-stage
COPY --from=build-stage /usr/src/anime-database/dist/ /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

