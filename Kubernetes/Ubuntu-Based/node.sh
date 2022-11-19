cat << comment
STEPS FOR INSTALLING KUBERNETES ON UBUNTU
REQUIREMENTS: Master Node (2GB, 2CPU), Slave (1GB, 1CPU), Open PORT: 6443 ON BOTH NODES
LET'S FIRST UPDATE THE MACHINE
comment

#Update Ubuntu Package
apt-get update
apt-get upgrade

cat << comment
INSTALL HTTPS for Node to Node communication.
comment

#Install HTTPS and Curl
apt-get update
apt-get install -y apt-transport-https ca-certificates curl

cat << comment
INSTAL DOCKER CONTAINER ENGINE
comment

#Install Docker
apt install docker.io
cat << comment
INSTALL KUBEADM, KUBELET AND KUBECTL
comment


#Kubeadm Installation
curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y kubelet kubeadm kubectl
#apt-mark hold kubelet kubeadm kubectl
