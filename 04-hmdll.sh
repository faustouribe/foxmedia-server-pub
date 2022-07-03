#!/bin/bash -x
source local 
docker create \
  --name=heimdall \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=$TIMEZONE \
  -p 80:80 \
  -p 443:443 \
  -v $PATHTOCONFIG/heimdall:/config \
  --restart unless-stopped \
linuxserver/heimdall
