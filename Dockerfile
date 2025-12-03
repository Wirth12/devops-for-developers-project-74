FROM node:20.12.2

WORKDIR /app

COPY app/package.json package.json
COPY app/package-lock.json package-lock.json

COPY app/. .

WORKDIR /app/app

RUN npm install

CMD make start
