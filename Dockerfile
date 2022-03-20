FROM node:dubnium-alpine3.11
WORKDIR /usr/src/app
COPY . .
RUN npm install 
RUN npm install sequelize-cli -g
EXPOSE 5000
CMD ["npm", "start"]
