# Openshift Installation On Ubuntu 18.04/20.04/22.04

# Pre-requisites For Installation : Docker 

# Installation Of Docker 

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

# Add The User To Docker Group 

usermod -aG docker $USER

# Fetch The Openshift Repository 

wget https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz

# Uncompress downloaded file.

tar xvf openshift-origin-client-tools*.tar.gz

# Switch to created folder and copy kubectl and oc binaries to the /usr/local/bin directory. 

cd openshift-origin-client*/

sudo mv  oc kubectl  /usr/local/bin/

# Check the OC version 

oc version

# Allow use of Insecure Docker registry.

cat << EOF | sudo tee /etc/docker/daemon.json 
 {
     "insecure-registries" : [ "172.30.0.0/16" ]
 }
EOF

# Reload The Docker Daemon 

systemctl daemon-reload 
systemctl restart docker 

# Start The Openshift Cluster 
# On Successfull Installation You Will Get Output With Login ID and Link To The Console 

oc cluster up


