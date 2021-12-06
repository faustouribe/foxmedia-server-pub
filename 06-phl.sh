#!/bin/bash

# https://github.com/pi-hole/docker-pi-hole/blob/master/README.md

# Set password at the end  
# docker exec -it pihole /bin/bash
# pihole -a -p _BJh2BQQ
# exit

docker run -d \
    --name pihole \
    -p 53:53/tcp -p 53:53/udp \
    -p 81:80 \
    -p 444:443 \
    -e TZ="America/Chicago" \
    -v /home/mrfox/etc-pihole:/etc/pihole \
    -v /home/mrfox/etc-dnsmasq.d:/etc/dnsmasq.d \
    --dns=1.1.1.1 \
    --restart=unless-stopped \
    --hostname pi.hole \
    -e VIRTUAL_HOST="pi.hole" \
    -e PROXY_LOCATION="pi.hole" \
    -e ServerIP="192.168.1.10" \
    pihole/pihole:latest

printf 'Starting up pihole container '
for i in $(seq 1 20); do
    if [ "$(docker inspect -f "{{.State.Health.Status}}" pihole)" == "healthy" ] ; then
        printf ' OK'
        echo -e "\n$(docker logs pihole 2> /dev/null | grep 'password:') for your pi-hole: https://${IP}/admin/"
        exit 0
    else
        sleep 3
        printf '.'
    fi

    if [ $i -eq 20 ] ; then
        echo -e "\nTimed out waiting for Pi-hole start, consult your container logs for more info (\`docker logs pihole\`)"
        exit 1
    fi
done;
