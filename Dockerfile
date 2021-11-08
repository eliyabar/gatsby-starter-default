FROM node:14-buster as build
RUN npm install -g gatsby-cli
WORKDIR /app
COPY package.json package-lock.json ./
RUN yarn
COPY . .
RUN gatsby build

FROM nginx:alpine
COPY --from=build /app/public /usr/share/nginx/html
