# [ Download base image ]
FROM debian:buster

MAINTAINER Sebastien Labelle <slabelle@student.42.fr>

# [ Copy config/script files to image ]
COPY srcs/nginx.conf /etc/nginx/sites-available/localhost
COPY srcs/start.sh .

# [ Install packages ]
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install libnss3-tools
RUN apt-get -y install nginx
RUN apt-get -y install wget
RUN apt-get -y install vim

# [ Nginx configuration ]
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
RUN rm /etc/nginx/sites-enabled/default

# [ Start! ]
CMD bash start.sh
