FROM node:22-alpine AS builder

ARG API_BASE_URL
ENV VITE_API_BASE_URL=${API_BASE_URL} 

WORKDIR /src
COPY package.json .
COPY package-lock.json .
RUN npm ci
COPY . .
RUN npm run build

FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /src/dist /usr/share/nginx/html