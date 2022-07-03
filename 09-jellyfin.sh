#!/bin/bash
source local \
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
          -v $PATHTOLIBRARY/tv:/data/tv \
          -v $PATHTOLIBRARY/f-tv:/data/f-tv \
          -v $PATHTOLIBRARY/inter/tv:/data/inter-tv \
          -v $PATHTOLIBRARY/movies:/data/movies \
          -v $PATHTOLIBRARY/f-movies:/data/f-movies \
          -v $PATHTOLIBRARY/inter/movies:/data/inter-movies \
          $RESTART \
lscr.io/linuxserver/jellyfin:latest
