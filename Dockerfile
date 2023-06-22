FROM node:20-alpine as base

WORKDIR /app/
COPY package*.json /app/

FROM base as start

RUN npm ci
COPY . .
CMD ["sh", "./scripts/entrypoint-start.sh"]

FROM base AS dev

RUN npm i
COPY . .
CMD ["sh", "./scripts/entrypoint-dev.sh"]

FROM base AS prod

RUN npm ci
COPY . .
CMD ["sh", "./scripts/entrypoint-prod.sh"]