#!/bin/bash
sleep 30
echo "settings-torrent-done -> ran @: $(date)" >> /data/transmission-home/autoremove.log
transmission-remote --auth $tmpUser:$tmpPass -l | awk '{print $2,$9,$10}' >> /data/transmission-home/autoremove.log
transmission-remote --auth $tmpUser:$tmpPass -l | awk '$2 == "100%" && (( $9 == "Stopped" || $9 == "Finished" || $9 == "Seeding" )){ system("transmission-remote --auth $tmpUser:$tmpPass -t " $1 " --remove") }' >> /data/transmission-home/autoremove.log
~
