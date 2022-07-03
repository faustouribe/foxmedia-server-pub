#!/bin/bash -x
source local
docker create \
  --name=syncthing \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=$TIMEZONE \
  -e UMASK_SET=022 \
  -p 8384:8384 \
  -p 22000:22000 \
  -p 21027:21027/udp \
  -v $PATHTOCONFIG/syncthing/:/config \
  -v $PATHTOLIBRARY/:/library \
  $RESTART \
linuxserver/syncthing
