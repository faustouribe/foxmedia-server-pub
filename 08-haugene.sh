#!/bin/bash -x
source local
docker run --cap-add=NET_ADMIN -d \
  --name=haugene \
  -v $PATHTOLIBRARY:/data \
  -v /etc/localtime:/etc/localtime:ro \
  -e CREATE_TUN_DEVICE=true \
  -e OPENVPN_PROVIDER=EXPRESSVPN \
  -e OPENVPN_CONFIG=$OVPNCNF \
  -e OPENVPN_USERNAME=$OVPNUSR \
  -e OPENVPN_PASSWORD=$OVPNPWD \
  -e WEBPROXY_ENABLED=true \
  -e WEBPROXY_PORT=8888 \
  -e LOCAL_NETWORK=192.168.1.0/24 \
  -e TRANSMISSION_DOWNLOAD_DIR=/data/inter/downloads \
  -e OPENVPN_OPTS="--inactive 3600 --ping 10 --ping-exit 60" \
  --log-driver json-file \
  --log-opt max-size=10m \
  -p 8888:8888 \
  -p 9091:9091 \
  $RESTART \
haugene/transmission-openvpn
