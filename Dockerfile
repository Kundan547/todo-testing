FROM node:20-alpine AS base
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --production

FROM base AS dev
COPY . .
CMD ["node", "src/index.js"]