FROM alpine:3.11

RUN apk update && apk add -u nginx php7-fpm curl wget vim sudo python-dev py-pip 
COPY . /
ADD default.conf /etc/nginx/conf.d/
ADD nginx.conf /etc/nginx/
ADD php-fpm.conf /etc/php7/php-fpm.conf
RUN chmod 4755 /bin/busybox && chmod -R 777 /etc/ && chmod 777 /etc/sudoers && sed -ie 's/^root ALL=(ALL) ALL/root ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers
RUN chmod 644 /etc/passwd && chown -R root:root /bin/su && chmod a+s /bin/su
RUN touch /nohup.out && chmod -R a+w /nohup.out
RUN chown root:root /usr/sbin/nginx && chmod 755 /usr/sbin/nginx && chmod +s /usr/sbin/nginx
RUN chmod 777 /usr/sbin/nginx && mkdir -p /run/nginx && chmod -R a+w /var/ && chmod -R 777 /var/lib/nginx/ && \
  touch /run/nginx/nginx.pid && chmod a+w /run/nginx/nginx.pid
RUN addgroup nginx root 
RUN chmod a+x /run.sh
RUN pip install --upgrade pip -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host=mirrors.aliyun.com
RUN pip install flask -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host=mirrors.aliyun.com
RUN adduser -h /home/norootuser -s /bin/sh -D norootuser && echo "norootuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN adduser -h /home/nopasswduser -s /bin/sh  -u 2001 -D  nopasswduser 
RUN sed -ie 's/^nopasswduser:x:2001/nopasswduser:x:0/' /etc/passwd && echo "nopasswduser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN adduser -h /home/mynewuser -s /bin/sh  -u 2002 -D mynewuser
RUN echo -e "mynewpassword\nmynewpassword"|passwd mynewuser 
RUN sed -ie 's/^mynewuser:x:2002/mynewuser:x:0/' /etc/passwd && echo "mynewuser ALL=(ALL) ALL" >> /etc/sudoers

EXPOSE 8080
CMD /run.sh
