FROM php:7.4-apache-bullseye

RUN apt-get update && apt-get install -y \
        libldap2-dev \
        gettext \
        openssl \
        ca-certificates \
        && docker-php-ext-configure ldap \
        && docker-php-ext-install ldap \
        && docker-php-ext-install gettext \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# remove apache warning about servername
RUN echo "ServerName example.com" >> /etc/apache2/apache2.conf

# for LDAPS
COPY ./ldap-cacert.pem /etc/ssl/certs/ldap-cacert.pem
RUN update-ca-certificates
COPY ./src/ /var/www/html/
COPY ./ldap.conf /etc/ldap/ldap.conf

RUN chown -R www-data:www-data /var/www/html

# enabling verbose
RUN echo "log_errors = On" >> /usr/local/etc/php/php.ini \
    && echo "error_log = /var/log/php_errors.log" >> /usr/local/etc/php/php.ini \
    && echo "display_errors = On" >> /usr/local/etc/php/php.ini \
    && echo "error_reporting = E_ALL" >> /usr/local/etc/php/php.ini
RUN echo "LogLevel debug" >> /etc/apache2/apache2.conf

EXPOSE 80

CMD ["apache2-foreground"]
