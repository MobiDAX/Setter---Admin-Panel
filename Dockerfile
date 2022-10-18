FROM node:12.13.1 AS builder

WORKDIR /home/node
COPY --chown=node:node ./setter-app .

RUN npm install
RUN ./scripts/build.sh
RUN pwd && ls -lha

FROM nginx:mainline-alpine
RUN mkdir /usr/share/nginx/html/setter
COPY --from=builder /home/node/build /usr/share/nginx/html/setter
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 3000
