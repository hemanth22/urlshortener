# urlshortener

__CI Status:__ [![Docker Image CI](https://github.com/hemanth22/urlshortener/actions/workflows/docker-image.yml/badge.svg)](https://github.com/hemanth22/urlshortener/actions/workflows/docker-image.yml)

# How to run url shortener docker

__docker-compose.yml__
```
version: '3.1'
services:
    nginx:
        image: nginx:1.13.7
        container_name: nginx
        depends_on:
            - flask
        volumes:
            - ./nginx.conf:/etc/nginx/conf.d/default.conf
        networks:
            - my-network
        ports:
            - 80:80
    flask:
        image: bitroid/urlshortener:v1
        container_name: flask
        networks:
            my-network:
                aliases:
                    - flask-app
        ports:
            - 8000:8000

networks:
    my-network:
```
__nginx.conf__
```
server {
    listen 80;
    server_name localhost;

    location / {
        proxy_pass http://flask-app:8000/;
        proxy_set_header Host "localhost";
    }
}
```

## Command to launch docker

```
docker-compose up -d
```
