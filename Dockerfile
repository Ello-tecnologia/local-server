FROM php:7.4-apache

RUN apt-get update && \
    apt-get install -y \
      libfbclient2 \
      libapache2-mod-wsgi \
      python \
      python-fdb \
      python-pip
RUN apt-get install -y python-certbot-apache
RUN pip install fdb telepot bottle pymongo

RUN a2enmod cgi && \
    a2enmod rewrite && \
    a2enmod ssl && \
    a2enmod proxy && \
    a2enmod proxy_http

COPY virtualhosts.conf /etc/apache2/sites-enabled
COPY wsgi-ssl.conf /etc/apache2/sites-enabled
