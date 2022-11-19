#Ansible Installation 
#Pre-requisites : Check Python is Installed Or Not , If Installed then check pip is installed or Not ..

#1 Update The System 
yum update -y

#2 Install Ansible using EPEL Repository
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

#3 Install epel repository using yum.
yum install epel-release-latest-7.noarch.rpm

#4Update epel repository as follows,
yum update -y

#5 Now install all individual packages inside the repository along with ansible
yum install python python-devel python-pip openssl ansible -y

#6 Check Ansible version 

ansible --version
