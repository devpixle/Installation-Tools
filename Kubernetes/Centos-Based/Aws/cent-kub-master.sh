# INSTALLATION OF KUBERNETES IN CENTOS 7 

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

systemctl enable --now kubelet

# AFTER INSTALLATION 

kubeadm init 

# RUN THESE COMMANDS ACCORDING TO THE USER YOU ARE USING 

#To start using your cluster, you need to run the following as a regular user:

  #mkdir -p $HOME/.kube
  #sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  #sudo chown $(id -u):$(id -g) $HOME/.kube/config

#Alternatively, if you are the root user, you can run:

  #export KUBECONFIG=/etc/kubernetes/admin.conf

# APPLY THE CNI FOR MASTER-NODE COMMUNICATION 

kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml

# TO PRINT THE JOIN COMMAND

kubeadm token create --print-join-command 
