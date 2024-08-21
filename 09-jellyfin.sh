#!/bin/bash -x
source local
docker run -d \
          --name=jellyfin \
          -e PUID=1000 \
          -e PGID=1000 \
          -e TZ=$TIMEZONE \
          -e JELLYFIN_PublishedServerUrl=$SERVERIP \
          -p 8096:8096 \
          -p 8920:8920 \
          -p 7359:7359/udp \
          -p 1900:1900/udp \
          -v $PATHTOCONFIG/jellyfin:/config \
          -v $PATHTOLIBRARY:/data \
          $RESTART \
lscr.io/linuxserver/jellyfin:latest
