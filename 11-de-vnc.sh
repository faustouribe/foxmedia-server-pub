docker run -d \
  -p 6080:80 \
  -v /dev/shm:/dev/shm \
  -v /library:/mnt \
dorowu/ubuntu-desktop-lxde-vnc
