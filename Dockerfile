FROM node:latest AS build

WORKDIR /app

COPY app/ /app
# COPY app/docs ./docs
# COPY app/public ./public
# COPY app/src ./src

RUN ls

RUN yarn install 

RUN yarn build

# EXPOSE 3000
EXPOSE 80

FROM nginx:latest AS server
COPY --from=build ./app/build/ /usr/share/nginx/html

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
