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
chown root:root /data/transmission-home/autoremove.sh \
chmod 774 /data/transmission-home/autoremove.sh
```

### Copy autoremove-external.sh to /usr/local/bin
### Change peermissions

```
sudo cp autoremove-external /usr/local/bin/ && \
sudo chmod +x /usr/local/bin/autoremove-external
```

### Create a cron job to execute it every 5 minutes
```
crontab -e
```
```
*/5 * * * * /usr/local/bin/autoremove-external>/library/transmission-home/autoremove.log
```
