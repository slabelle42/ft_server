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

# [ SSL certificate generation ]
RUN mkdir ~/mkcert
RUN cd ~/mkcert
RUN wget https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-linux-amd64
RUN mv mkcert-v1.1.2-linux-amd64 mkcert
RUN chmod +x mkcert
RUN ./mkcert -install
RUN ./mkcert localhost

# [ Start! ]
CMD bash start.sh
