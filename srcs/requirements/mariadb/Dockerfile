FROM debian:buster

RUN apt-get -y update
 
RUN apt-get -y upgrade

RUN apt install mariadb-server -y

COPY /tools/mariadb.sh /

COPY /conf/mariadb.conf etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /mariadb.sh

CMD [ "/mariadb.sh" ]
