FROM nginx

# install build dependencies
RUN apt update && \
    apt --assume-yes install letsencrypt certbot python-certbot-nginx

COPY ./default_pre.conf /etc/nginx/conf.d/default.conf