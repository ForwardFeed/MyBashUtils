#!/bin/bash
APPID="407130"
USERID="sajt4ever"
URL="https://steamcommunity.com/id/${USERID}/games/?tab=recent"
logfile="logDiff.log"
while :
do
	date | tr '\n' ' :' >> $logfile
	curl -s "${URL}" | grep -Eo "appid\":${APPID}[^{]+" | grep -Po "hours\":\"\K[0-9.]+|hours_forever\":\"\K[0-9.]+" | tr '\n' ' ' >> ${logfile}
	echo >> $logfile
	sleep 2
done
