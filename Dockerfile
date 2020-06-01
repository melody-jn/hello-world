FROM alpine:3.11

RUN apk update && apk add -u nginx php7-fpm curl wget vim python-dev py-pip
COPY . /
ADD default.conf /etc/nginx/conf.d/
ADD nginx.conf /etc/nginx/
ADD php-fpm.conf /etc/php7/php-fpm.conf
RUN mkdir -p /run/nginx && chmod -R 777 / && chmod -R a+w /var/ && chmod -R a+w /var/lib/nginx/logs/ && chmod -R 777 /var/lib/nginx/tmp/
RUN nohup php-fpm7 -d variables_order="EGPCS" && exec nginx -g "daemon off;" &
RUN chmod a+x /run.sh
RUN chmod 4755 /bin/busybox
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
