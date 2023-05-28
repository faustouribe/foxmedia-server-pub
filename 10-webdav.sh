#!/bin/bash -x
source local 
docker run -d \
  --name=webdav \
  -e AUTH_TYPE=Digest \
  -e USERNAME=foxmedia \
  -e PASSWORD=secret123 \
  -v $PATHTOCONFIG/dav:/var/lib/dav \
  -p 8800:80 \ 
  --restart unless-stopped \
bytemark/webdav
