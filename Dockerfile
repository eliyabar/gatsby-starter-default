FROM node:16-buster as build
RUN npm install -g gatsby-cli
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn
COPY . .
RUN yarn build
RUN echo 'ttttt'
RUN echo 'GATSBY_A'
RUN echo $GATSBY_A
RUN echo ${GATSBY_A}
RUN echo 'ttttt'

FROM nginx:alpine
COPY --from=build /app/public /usr/share/nginx/html