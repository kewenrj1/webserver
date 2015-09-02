FROM ubuntu:14.04
MAINTAINER Rickie Kewene <kewenrj1@student.op.ac.nz>
ENV REFRESHED_AT 2015-08-27

RUN apt-get -yqq update
RUN apt-get -yqq upgrade

RUN apt-get -yqq install openssh-server

RUN apt-get -yqq install apache2

RUN apt-get -yqq install supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisor/conf.d/

VOLUME ["/var/www/html"]

WORKDIR /var/www/html

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

RUN mkdir -p $APACHE_RUN_DIR $APACHE_LOCK_DIR $APACHE_LOG_DIR

EXPOSE 80

CMD ["/usr/sbin/Ssupervisord"]

## Ref: https://docs.docker.com/articles/using_supervisord/ ##
