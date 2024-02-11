FROM wordpress:latest


RUN apt-get update && apt-get install -y \
    unzip \
    && rm -rf /var/lib/apt/lists/*


RUN curl -o /tmp/woocommerce.zip -SL https://downloads.wordpress.org/plugin/woocommerce.latest-stable.zip \
    && unzip /tmp/woocommerce.zip -d /usr/src/wordpress/wp-content/plugins/ \
    && rm /tmp/woocommerce.zip


RUN chown -R www-data:www-data /usr/src/wordpress/wp-content/plugins/woocommerce



WORKDIR /var/www/html


CMD ["apache2-foreground"]
