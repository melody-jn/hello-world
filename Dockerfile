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
RUN useradd --create-home --no-log-init --shell /bin/bash norootuser
RUN useradd --create-home --no-log-init --shell /bin/bash nopasswduser
RUN echo 'nopasswduser ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
RUN useradd --create-home --no-log-init --shell /bin/bash mynewuser
RUN adduser mynewuser sudo
RUN echo 'mynewuser:mynewpassword' | chpasswd

ENV LISTEN_PORT=80

EXPOSE 80
CMD /run.sh
