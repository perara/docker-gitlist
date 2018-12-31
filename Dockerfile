FROM trafex/alpine-nginx-php7:latest
RUN apk add --no-cache git php7-tokenizer composer

# Download Gitlist
RUN rm -rf /var/www/html
RUN git clone https://github.com/klaussilveira/gitlist.git /var/www/html

# Create cache according to install specs
RUN mkdir -p /var/www/html/cache
RUN chmod 777 /var/www/html/cache

# Update Configuration file for gitlist
RUN mv /var/www/html/config.ini-example /var/www/html/config.ini
RUN sed -i 's/^repositories\[\].*$/repositories\[\] = "\/git" /' /var/www/html/config.ini

# Install gitlist dependencies
RUN cd /var/www/html/ && php /usr/bin/composer install


EXPOSE 80 443
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
