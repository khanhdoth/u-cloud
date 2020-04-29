FROM nginx

# install build dependencies
RUN apt update && \
    apt --assume-yes install letsencrypt certbot python-certbot-nginx

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./letsencrypt /etc/letsencrypt