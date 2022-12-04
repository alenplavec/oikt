#!/bin/bash
mkdir /home/{Desktop,Documents,Downloads,Videos,Pictures}
for i in {1..5} ; do mkdir "Dir${i}" ; done
while read user ; do useradd -m --groups sudo $user ; done < users.txt
apt update
apt -y dist-upgrade
apt autoclean
apt -y autoremove
apt install nginx git ufw net-tools ca-certificates curl gnupg lsb-release -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo docker run hello-world
