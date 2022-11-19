#! /bin/bash

echo "
--------------------------------------------------
Docker Installation in Progress
-------------------------------------------------
"

yum update -y
yum install -y yum-utils
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin
systemctl enable docker
systemctl start docker


echo "
--------------------------------------------------
Docker ind Docker Compose nstallation complete
--------------------------------------------------
Setting Up Docker Compose
--------------------------------------------------
"

curl -L "https://github.com/docker/compose/releases/download/2.10.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

echo "
------------------------------------------------
Installed Versions
-----------------------------------------------
"
docker --version
docker compose version
