FROM alpine:3.11

RUN apk update && apk add -u nginx php7-fpm curl wget vim python-dev py-pip && \
    mkdir -p /run/nginx
#FROM index.alauda.cn/library/ubuntu:16.04
#RUN apt-get update && \
#        apt-get -y install curl vim nginx php5-fpm && \
#        mkdir -p /run/nginx
ADD default.conf /etc/nginx/conf.d/
ADD www /www
ADD nginx.conf /etc/nginx/
ADD php-fpm.conf /etc/php7/php-fpm.conf
ADD entrypoint.py /entrypoint.py
ADD run.sh /run.sh
ADD alb_metrics_server.py /alb_metrics_server.py
RUN chmod +x /run.sh
RUN pip install --upgrade pip -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host=mirrors.aliyun.com
RUN pip install flask -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host=mirrors.aliyun.com
RUN adduser -h /home/norootuser -s /bin/sh -D norootuser
RUN adduser -h /home/nopasswduser -s /bin/sh  -u 2001 -D  nopasswduser
RUN sed -ie 's/^nopasswduser:x:2001/nopasswduser:x:0/' /etc/passwd
RUN adduser -h /home/mynewuser -s /bin/sh  -u 2002 -D mynewuser
RUN echo -e "mynewpassword\nmynewpassword"|passwd mynewuser
RUN sed -ie 's/^mynewuser:x:2002/mynewuser:x:0/' /etc/passwd

ENV LISTEN_PORT=80

EXPOSE 80
CMD /run.sh
