# Grafana Installation 

#1 Update System 

apt-get update -y 

#2 First, install all required dependencies using the following command 

apt-get install wget curl gnupg2 apt-transport-https software-properties-common -y

#3 Next, download and add the Grafana GPG key with the following command

wget -q -O - https://packages.grafana.com/gpg.key | apt-key add -

#4 Next, add the Grafana repository to APT using the following command:

echo "deb https://packages.grafana.com/oss/deb stable main" | tee -a /etc/apt/sources.list.d/grafana.list

#5 Update System 

apt-get update -y 

#6 Now, you can install the Grafana by running the following command:

apt-get install grafana -y 
 
#7 Checking Version and Starting Grafana Server

grafana-server -v

#8 Starting The Server
 
systemctl start grafana-server
systemctl enable grafana-server
systemctl status grafana-server
 
