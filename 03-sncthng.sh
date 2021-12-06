docker create \
  --name=syncthing \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Chicago \
  -e UMASK_SET=022 \
  -p 8384:8384 \
  -p 22000:22000 \
  -p 21027:21027/udp \
  -v /server/syncthing/:/config \
  -v /server/:/server \
  -v /library/media/:/library \
  linuxserver/syncthing
