FROM node:14-alpine3.14

ENV CONTAINER_PATH /var/www/vuejs

WORKDIR $CONTAINER_PATH

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 8080

CMD ["npm", "run", "serve"]