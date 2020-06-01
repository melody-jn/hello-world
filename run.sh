#!/bin/sh
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
