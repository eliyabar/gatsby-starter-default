FROM node:16-buster as build
RUN npm install -g gatsby-cli
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn
COPY . .
RUN yarn build
FROM nginx:alpine
COPY --from=build /app/public /usr/share/nginx/html
WORKDIR /usr/share/nginx/html
COPY ./env.sh .
# Add bash
RUN apk add --no-cache bash
# Make our shell script executable
RUN chmod +x env.sh\
CMD ["/bin/bash", "-c", "/usr/share/nginx/html/env.sh && nginx -g \"daemon off;\""]