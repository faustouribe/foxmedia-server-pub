docker run -d \
  --name=duckdns \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Chicago \
  -e SUBDOMAINS=subdomain1,subdomain2 \
  -e TOKEN=token \
  -e LOG_FILE=true  \
  -v /home/mrfox/duckdns:/config \
  --restart unless-stopped \
  linuxserver/duckdns
