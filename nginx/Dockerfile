FROM nginx

# install build dependencies
RUN apt update && \
    apt --assume-yes install letsencrypt certbot python-certbot-nginx && \
    certbot --nginx --non-interactive --agree-tos -m khanh.do@sulof.com -d im.sulof.com

COPY ./default.conf /etc/nginx/conf.d/default.conf