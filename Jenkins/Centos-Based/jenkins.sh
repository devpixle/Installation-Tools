#! /bin/bash

echo "
--------------------------------------------------
Jenkins Installation in Progress
-------------------------------------------------
"

echo "
--------------------------------------------------
Setting Up Repository
-------------------------------------------------
"

#sudo wget -O /etc/yum.repos.d/jenkins.repo \
    #https://pkg.jenkins.io/redhat-stable/jenkins.repo
#sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key


curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo

sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key

sudo yum upgrade -y

cat /etc/yum.repos.d/jenkins.repo

echo "
--------------------------------------------------
Add Java Dependency for Jenkins 
-------------------------------------------------
"

sudo yum install java-11-openjdk -y

echo "
--------------------------------------------------
Jenkins Installation Begins
-------------------------------------------------
"

sudo yum install jenkins -y
sudo systemctl daemon-reload


echo "
--------------------------------------------------
Setting Up Jenkins
-------------------------------------------------
"
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

echo "
------------------------------------------------------
Jenkins in Ready. Open port 8080 to access on browser
Use the Initial Admin Password below to Unlock Jenkins
------------------------------------------------------
"


sudo cat /var/lib/jenkins/secrets/initialAdminPassword
Footer
