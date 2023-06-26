FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install curl -y
RUN apt-get install wget -y
RUN apt-get install php-fpm -y
RUN apt-get install php-mysql -y
#php-mysql is a PHP extension that allows PHP to communicate with MySQL databases.

COPY /tools/wordpress.sh /
RUN chmod +x /wordpress.sh

CMD [ "./wordpress.sh" ]