FROM node:18-buster as build
RUN npm install -g gatsby-cli
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn
COPY . .
RUN yarn build

FROM nginx:alpine
COPY --from=build /app/public /usr/share/nginx/html