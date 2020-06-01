#!/bin/sh
nohup php-fpm7 -d variables_order="EGPCS" && exec nginx -g "daemon off;" &
echo "logglogloglog"
echo "logglogloglog"
echo "logglogloglog"
echo "logglogloglog"
echo "aaaaaaa" > /var/hchan.txt
while true
do
  echo "`hostname`: `date`" >> /var/hehe.txt
  sleep 1
  ls -l /var/hehe.txt
done
