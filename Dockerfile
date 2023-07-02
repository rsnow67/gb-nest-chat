FROM node:18-alpine

WORKDIR /usr/src/app

ENV PATH /usr/src/app/node_modules/.bin:$PATH
RUN adduser --disabled-password chat

COPY . .

COPY package*.json ./

RUN chown -R chat:chat /usr/src/app
USER chat

RUN npm cache clean --force
RUN npm i

EXPOSE 3000
CMD [ "npm", "run", "start:dev" ]