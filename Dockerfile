# 'build' phase
#FROM node:alpine as builder
#WORKDIR '/app'
#COPY package.json .
#RUN npm install
#COPY . .
#RUN npm run build

# 'run' phase
#FROM nginx
#COPY --from=builder /app/build /usr/share/nginx/html

# alternative configuration:

FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html