FROM node:16-buster as build
# ARG GATSBY_A check with static
ARG GATSBY_A
RUN npm install -g gatsby-cli
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn
COPY . .
RUN yarn build
RUN echo 'GATSBY_A'
RUN echo $GATSBY_A
RUN echo ${GATSBY_A}

FROM nginx:alpine
COPY --from=build /app/public /usr/share/nginx/html