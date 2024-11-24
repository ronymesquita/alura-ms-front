FROM node:20 as build

COPY . /app/build

WORKDIR /app/build

ENV NODE_OPTIONS=--openssl-legacy-provider

RUN npm install && npm run build

RUN mv /app/build/dist/front-end/* /app && rm -rf /app/build

RUN ls /app

FROM nginx

COPY --from=build /app /usr/share/nginx/html