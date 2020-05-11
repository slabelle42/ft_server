# [ Download base image ]
FROM debian:buster

MAINTAINER Sebastien Labelle <slabelle@student.42.fr>

# [ Install packages ]
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install php7.3-fpm php7.3-mbstring php7.3-mysql
RUN apt-get -y install mariadb-server
RUN apt-get -y install libnss3-tools
RUN apt-get -y install nginx
RUN apt-get -y install wget
RUN apt-get -y install vim

# [ Nginx configuration ]
COPY srcs/nginx.conf /etc/nginx/sites-available/localhost
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
RUN rm /etc/nginx/sites-enabled/default

# [ phpMyAdmin configuration ]
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-english.tar.gz
RUN tar -xvzf phpMyAdmin-4.9.0.1-english.tar.gz
RUN rm phpMyAdmin-4.9.0.1-english.tar.gz
RUN mv phpMyAdmin-4.9.0.1-english /var/www/html/phpmyadmin
COPY srcs/config.inc.php /var/www/html/phpmyadmin/
RUN rm /var/www/html/phpmyadmin/config.sample.inc.php

# [ WordPress (website) configuration ]
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz
RUN rm latest.tar.gz
RUN mv wordpress /var/www/html/
COPY srcs/wp-config.php /var/www/html/wordpress/
RUN rm /var/www/html/wordpress/wp-config-sample.php
COPY srcs/wordpress.sql /var/www/html/

# [ Allow user ]
RUN chown -R www-data:www-data /var/www/html/*
RUN chmod -R 755 /var/www/html/*

# [ Start! ]
COPY srcs/start.sh .
CMD bash start.sh
