# Grafana Installation 

# Disable SELinux For CentOS 

swapoff -a

sed -i '/swap/d' /etc/fstab

setenforce 0

sed -i --follow-symlinks 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux

# Create a repo file.

vi /etc/yum.repos.d/grafana.repo

# Add the following contents to file: 

[grafana]
name=grafana
baseurl=https://packages.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packages.grafana.com/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt

# Enter the following command for Installation 

yum install grafana 

# Install additional font packages

yum install fontconfig && yum install freetype* && yum install urw-fonts

# Start and enable The Grafana Service 

systemctl start grafana-server
systemctl enable grafana-server 
systemctl status grafana-server

# Browse The Grafana Server With IP-Address/Localhost Of Your Machine with 3000 Port No. 
# To Login to the Dashboard username and password is admin / admin 
