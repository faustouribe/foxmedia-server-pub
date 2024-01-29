#!/bin/bash
echo "cron ran @: $(date)" >> /data/transmission-home/autoremove.log
transmission-remote --auth $tmpUser:$tmpPass -l | awk '$2 == "100%" && (( $9 == "Stopped" || $9 == "Finished" )){ system("transmission-remote --auth $tmpUser:$tmpPass -t " $1 " --remove") }' >> /data/transmission-home/autoremove.log
