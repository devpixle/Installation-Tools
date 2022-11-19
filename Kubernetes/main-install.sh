#!/bin/bash

export VAR=$(cat /usr/lib/os-release | grep "PRETTY_NAME")

echo $VAR

case "$VAR" in
  *Ubuntu*) cat << comment
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

cat << comment
GENERATE JOINING LINK FOR WORKER NODES
comment

#Generate Worker Join Link
kubeadm init

cat << comment
SETTING UP FILE PERMISSIONS
comment

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

cat << comment
SETTING UP NETWORK BY WEAVE NET
comment

#Weave net installation
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s-1.11.yaml
 ;;
*CentOS*)  # INSTALLATION OF KUBERNETES IN CENTOS 7

#PREREQUISITES REQUIRED
#FOR MASTER: 2VCPU's and 4-12 GB RAM
#FOR NODE: 1VCPU's and 2-4 GB RAM

#NOTE : THESE COMMANDS ARE FOR AWS BASED INSTALLATION

swapoff -a

sed -i '/swap/d' /etc/fstab

setenforce 0

sed -i --follow-symlinks 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux

cat >>/etc/sysctl.d/kubernetes.conf<<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sysctl --system

yum install -y docker
systemctl start docker
systemctl enable docker
systemctl status docker

cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
enabled=1
gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kubelet kubeadm kubectl
EOF

yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes

systemctl enable --now kubelet ;;

  *)        echo "unknown: $VAR" ;;
esac
