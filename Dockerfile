FROM homebrew/brew:latest as builder
RUN brew install hugo
COPY . .
RUN hugo -D

FROM nginx:stable-alpine
RUN mv /usr/share/nginx/html/index.html /usr/share/nginx/html/old-index.html
COPY --from=builder /home/linuxbrew/public/ /usr/share/nginx/html/
EXPOSE 80
