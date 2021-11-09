FROM node:16-buster as build
RUN npm install -g gatsby-cli
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn
COPY . .
RUN yarn build
RUN echo *****
RUN echo GATSBY_A: 
RUN echo GATSBY_A: $GATSBY_A ${GATSBY_A}
RUN echo *****
FROM nginx:alpine
COPY --from=build /app/public /usr/share/nginx/html