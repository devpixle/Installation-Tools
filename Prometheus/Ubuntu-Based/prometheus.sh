#Prometheus Installation On Ubuntu 22.04,20.04,18.04

#Step 1: Create Prometheus system group

sudo groupadd --system prometheus

sudo useradd -s /sbin/nologin --system -g prometheus prometheus

#Step 2: Create data & configs directories for Prometheus

mkdir /var/lib/prometheus

for i in rules rules.d files_sd; do sudo mkdir -p /etc/prometheus/${i}; done

#Step 3: Download Prometheus on Ubuntu 22.04/20.04/18.04

apt -y install wget curl vim

mkdir -p /tmp/prometheus && cd /tmp/prometheus

curl -s https://api.github.com/repos/prometheus/prometheus/releases/latest | grep browser_download_url | grep linux-amd64 | cut -d '"' -f 4 | wget -qi -

tar xvf prometheus*.tar.gz

cd prometheus*/

mv prometheus promtool /usr/local/bin/

	#Check Version 

prometheus --version

mv prometheus.yml /etc/prometheus/prometheus.yml

mv consoles/ console_libraries/ /etc/prometheus/

# Step 4: Configure Prometheus on Ubuntu 22.04/20.04/18.04

 #Create a Prometheus systemd Service unit file

 sudo tee /etc/systemd/system/prometheus.service<<EOF
[Unit]
Description=Prometheus
Documentation=https://prometheus.io/docs/introduction/overview/
Wants=network-online.target
After=network-online.target

[Service]
Type=simple
User=prometheus
Group=prometheus
ExecReload=/bin/kill -HUP \$MAINPID
ExecStart=/usr/local/bin/prometheus \
  --config.file=/etc/prometheus/prometheus.yml \
  --storage.tsdb.path=/var/lib/prometheus \
  --web.console.templates=/etc/prometheus/consoles \
  --web.console.libraries=/etc/prometheus/console_libraries \
  --web.listen-address=0.0.0.0:9090 \
  --web.external-url=

SyslogIdentifier=prometheus
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Change directory permissions.

for i in rules rules.d files_sd; do sudo chown -R prometheus:prometheus /etc/prometheus/${i}; done
for i in rules rules.d files_sd; do sudo chmod -R 775 /etc/prometheus/${i}; done
sudo chown -R prometheus:prometheus /var/lib/prometheus/

# Reload systemd daemon and start the service:

sudo systemctl daemon-reload 

sudo systemctl start prometheus

sudo systemctl enable prometheus

sudo systemctl status prometheus

# Allow The Port 9090 for Service 

ufw allow 9090
