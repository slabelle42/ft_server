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
RUN mkdir -p /var/www/localhost
COPY srcs/nginx.conf /etc/nginx/sites-available/localhost
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
RUN rm /etc/nginx/sites-enabled/default

# [ phpMyAdmin configuration ]
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-english.tar.gz
RUN tar -xvzf phpMyAdmin-4.9.0.1-english.tar.gz
RUN rm phpMyAdmin-4.9.0.1-english.tar.gz
RUN mv phpMyAdmin-4.9.0.1-english /var/www/localhost/phpmyadmin
COPY srcs/config.inc.php /var/www/localhost/phpmyadmin/
RUN rm /var/www/localhost/phpmyadmin/config.sample.inc.php

# [ WordPress (website) configuration ]
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz
RUN rm latest.tar.gz
RUN mv wordpress /var/www/localhost/
COPY srcs/wp-config.php /var/www/localhost/wordpress/
RUN rm /var/www/localhost/wordpress/wp-config-sample.php
#RUN mv /var/www/localhost/phpmyadmin /var/www/localhost/wordpress/
COPY srcs/wordpress.sql /var/www/localhost/

# [ Allow user ]
RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*

# [ Start! ]
COPY srcs/start.sh .
CMD bash start.sh
