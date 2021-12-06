sudo apt update \
&& sudo apt upgrade \
&& sudo apt install python3 python3-pip python3-distro python3-netifaces procps dnsutils lm-sensors pciutils wmctrl lynx speedtest-cli \
&& sudo pip3 install archey4 \
&& sudo mkdir /etc/archey4 \
&& sudo cp config.json /etc/archey4/config.json
