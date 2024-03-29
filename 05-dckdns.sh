#!/bin/bash -x
source local 
docker run -d \
  --name=duckdns \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=$TIMEZONE \
  -e SUBDOMAINS=$DCKDNSSUBDOMAIN \
  -e TOKEN=$DCKDNSTOKEN \
  -e LOG_FILE=true  \
  -v $PATHTOCONFIG/duckdns:/config \
  --restart unless-stopped \
linuxserver/duckdns
