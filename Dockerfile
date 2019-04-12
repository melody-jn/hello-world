FROM alpine:3.4

RUN apk update && apk add -u nginx php5-fpm curl wget vim && \
    mkdir -p /run/nginx
#FROM index.alauda.cn/library/ubuntu:16.04
#RUN apt-get update && \
#        apt-get -y install curl vim nginx php5-fpm && \
#        mkdir -p /run/nginx

ADD www /www
ADD nginx.conf /etc/nginx/
ADD php-fpm.conf /etc/php5/php-fpm.conf
ADD run.sh /run.sh
RUN chmod +x /run.sh
RUN adduser -h /home/norootuser -s /bin/sh -D norootuser
RUN adduser -h /home/nopasswduser -s /bin/sh  -u 2001 -D  nopasswduser
RUN sed -ie 's/^nopasswduser:x:2001/nopasswduser:x:0/' /etc/passwd
RUN adduser -h /home/mynewuser -s /bin/sh  -u 2002 -D mynewuser
RUN echo -e "mynewpassword\nmynewpassword"|passwd mynewuser
RUN sed -ie 's/^mynewuser:x:2002/mynewuser:x:0/' /etc/passwd

ENV LISTEN_PORT=80

EXPOSE 80
CMD /run.sh
