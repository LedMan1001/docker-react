FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
RUN npm install terser@3.14
COPY . . 
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/index/html

