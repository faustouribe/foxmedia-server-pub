# Autoremove

### Copy autoremove.sh to the shared directory
### Change ownership and permissions
(inside container) /data/transmission-home/ 
(host OS) /liibray/transmission-home/

```
cp autoremove.sh /library/transmission-home/autoremove.sh
```
```
docker exec -it haugene /bin/bash
```
```
chown root:root /data/transmission-home/autoremove.sh && \
chmod 774 /data/transmission-home/autoremove.sh
```

### stop container and edit settings.json
```
"script-torrent-done-enabled": true,
"script-torrent-done-filename": "/data/transmission-home/autoremove.sh",
```
