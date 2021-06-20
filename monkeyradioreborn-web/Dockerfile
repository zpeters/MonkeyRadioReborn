FROM node:latest AS builder
WORKDIR /working
COPY . /working
RUN yarn
RUN yarn build

FROM nginx:latest as web
COPY --from=builder /working/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
