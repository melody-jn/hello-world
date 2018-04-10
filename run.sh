#!/bin/sh
echo "logglogloglog"
echo "aaaaaaa" > /var/hchan.txt
echo "logglogloglog"
echo "logglogloglog"
echo "logglogloglog"
CONF_FILE=/etc/nginx/nginx.conf
mkdir -p /var/lib/nginx/logs
mkdir -p /var/lib/nginx/tmp
sed -i "s/#LISTEN_PORT#/${LISTEN_PORT}/" ${CONF_FILE}

php-fpm -d variables_order="EGPCS" && exec nginx -g "daemon off;"
