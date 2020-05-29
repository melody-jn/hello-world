#!/bin/sh
echo "logglogloglog"
echo "aaaaaaa" > /var/hchan.txt
echo "logglogloglog"
echo "logglogloglog"
echo "logglogloglog"
CONF_FILE=/etc/nginx/conf.d/default.conf
mkdir -p /var/lib/nginx/logs
mkdir -p /var/lib/nginx/tmp
sed -i "s/#LISTEN_PORT#/${LISTEN_PORT}/" ${CONF_FILE}

nohup php-fpm7 -d variables_order="EGPCS" && exec nginx -g "daemon off;" &
while true
do
  echo "`hostname`: `date`" >> /var/hehe.txt
  sleep 1
  ls -l /var/hehe.txt
done
