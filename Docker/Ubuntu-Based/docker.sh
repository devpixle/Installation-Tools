#! /bin/bash

echo "
--------------------------------------------------
Installation in Progress
--------------------------------------------------
"
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
#install docker engine
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
systemctl enable docker
systemctl start docker


echo "
--------------------------------------------------
Docker and Docker Compose installation complete
--------------------------------------------------
------------------------------------------------
Installed Versions
-----------------------------------------------
"
docker --version
docker compose version
