FROM nginx:stable-alpine

ADD docker/nginx/nginx.conf /etc/nginx/conf.d/default.conf

ADD docker/nginx/502.html /var/www/errors/502.html
ADD docker/nginx/503.html /var/www/errors/503.html