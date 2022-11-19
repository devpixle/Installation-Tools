# Ansible Installation 
# Pre-requisites : Check Python is Installed Or Not , If Installed then check pip is installed or Not .. 

#1 Update The system 

apt-get update 

#2 Install Software Properties 

sudo apt install software-properties-common

#3 Add the Ansible Repository 

sudo apt-add-repository ppa:ansible/ansible

  #Update To List Ansible 

  sudo apt-get update 

#4 Install Ansible 

 sudo apt-get install ansible 

#5 Check the Version 

ansible --version 

