docker create \
  --name=plex \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e VERSION=docker \
  -e UMASK_SET=022 \
  -v $PATHTOCONFIG/plex/config/:/config \
  -v $PATHTOCONFIG/plex/transcode/:/transcode \
  -v $PATHTOLIBRARY/:/library \
  --restart unless-stopped \
  ghcr.io/linuxserver/plex:latest
