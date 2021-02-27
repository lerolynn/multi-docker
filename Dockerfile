FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run builder

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /sur/share/nginx/html