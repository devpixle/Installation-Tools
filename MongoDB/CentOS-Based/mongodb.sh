# Install MongoDB Community Edition On CentOS/Ami-linux

#1 Configure the package management system (yum)

touch /etc/yum.repos.d/mongodb-org-6.0.repo

# COPY Given Code In mongodb-org-6.0.repo File

#[mongodb-org-6.0]
#name=MongoDB Repository
#baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/6.0/x86_64/
#gpgcheck=1
#enabled=1
#gpgkey=https://www.mongodb.org/static/pgp/server-6.0.asc

# Update The System 

yum update -y 

# Install The Mongodb

sudo yum install -y mongodb-org

