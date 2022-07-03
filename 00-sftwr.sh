# Docker
sudo apt install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
&& curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
&& echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null \
&& sudo apt update && sudo apt install docker-ce docker-ce-cli containerd.io && sudo usermod -aG docker $USER \
# Extip installation
&& sudo apt install figlet \
&& sudo cp extip /usr/bin/ && sudo chmod +x /usr/bin/extip && cp plrename /usr/bin/ && sudo chmod +x /usr/bin/plrename && cp plretrieve /usr/bin/ && sudo chmod +x /usr/bin/plretrieve \
# Create services directory
&& mkdir ~/services \
# Protect ENV files
git update-index --skip-worktree ./services.env
