#INSTALLATION OF JENKINS ON UBUNTU 

#STEP 1

apt-get update -y 

#STEP 2 (Installation of Java For jenkins Java 8 and Java 11 you can take any one of this ) 

apt install openjdk-11-jdk -y

# STEP 3  (To Check If java is installed Properly or not) 

java --version

# STEP 4 
#Jenkins can easily be installed on Ubuntu by importing and adding the GPG keys to the system.
#Now you got to add GPG keys:

wget -p -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

#STEP 5
#After adding GPG keys, add the Jenkins package address to the sources list by typing the command given below:

sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# STEP 6 
# After enabling the Jenkins repository, simply update the system’s APT cache once.
apt-get update

# STEP 7 Let’s move forward and do the real work of installing Jenkins.

apt install jenkins -y

# STEP 8 

#Start the Jenkins Server
#The Jenkins service should automatically start on the installation of Jenkins. To verify the status of Jenkins service, type the below command.

systemctl status jenkins

# STEP 9 Configure the Firewall for the Jenkins Server 


ufw allow 8080 

# And check the status of UFW by typing the command given below:

  ufw status
  ufw enable
  ufw status

# STEP 10 Set Up Jenkins

# <IP-ADDRESS>:<PORT NO> FOR Accessing Jenkins 

# STEP 11

# This command will print the password straight out and you can copy and paste it into the password field on the Jenkins Unlock screen and click on the “Continue” button.

cat /var/lib/jenkins/secrets/initialAdminPassword 
