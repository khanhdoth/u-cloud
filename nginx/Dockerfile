FROM nginx

# install build dependencies
RUN apt update && \
    apt --assume-yes install letsencrypt

# COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf
# COPY ./httpd-ssl.conf /usr/local/apache2/conf/extra/httpd-ssl.conf
# COPY ./cert/ca_bundle.crt /usr/local/apache2/conf/ca_bundle.crt
# COPY ./cert/certificate.crt /usr/local/apache2/conf/certificate.crt
# COPY ./cert/private.key /usr/local/apache2/conf/private.key