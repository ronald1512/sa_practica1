FROM node:12.8.1 as node

# set working directory
WORKDIR /app
COPY ./ /app/       
RUN npm install

RUN npm run build

# Stage 1, Con esto copiamos el compilado en node hacia el espacio de archivos de Nginx
FROM nginx:alpine
COPY --from=node /app/build /usr/share/nginx/html
COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf

EXPOSE 4200 8081
ENTRYPOINT ["nginx", "-g", "daemon off;"]



