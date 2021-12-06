docker create \
  --name=heimdall \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Chicago \
  -p 80:80 \
  -p 443:443 \
  -v /hard/heimdall:/config \
  --restart unless-stopped \
linuxserver/heimdall
