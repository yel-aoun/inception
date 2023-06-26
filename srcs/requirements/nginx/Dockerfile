FROM debian:buster

# MAINTAINER youssef youssef.elaouny1010@gmail.com

RUN apt-get -y update 
RUN apt-get -y upgrade
RUN apt-get -y install nginx 
RUN apt-get -y install openssl


RUN mkdir -p /etc/nginx/ssl

#crating a folder to stor our ssl sertificat and key 

#-p flag indicate that if (we dont have the parents folders etc and nginx) they will be created befor creating ssl folder


RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MA/ST=./L=RABAT/O=42/OU=42/CN=yel-aoun.42.fr/UID=yel-aoun"

# -out save the certificate as /etc/nginx/ssl/inception.crt
# -keyout save the private key as /etc/nginx/ssl/inception.key

# -nodes: This option indicates that the private key should not be encrypted with a passphrase, 
# meaning it will be generated without password protection.

# -subj"..." flag, specifying various attributes such as country, state, organization, common name, etc.

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

#COPY it copy the config file from our working directory to our container file destination provided in the second argument.

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]