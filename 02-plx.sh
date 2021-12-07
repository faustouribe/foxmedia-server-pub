docker create \
  --name=plex \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e VERSION=docker \
  -e UMASK_SET=022 \
  -v /home/mrfox/plex/config/:/config \
  -v /home/mrfox/plex/transcode/:/transcode \
  -v /library/media/:/library \
  --restart unless-stopped \
  ghcr.io/linuxserver/plex:latest
