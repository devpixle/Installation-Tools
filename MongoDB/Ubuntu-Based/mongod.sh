# STEPS FOR INSTALLING MONGODB ON UBUNTU
# Updating The System 

sudo apt-get update

#INSTALL GNUPG 

sudo apt-get install gnupg -y 

# Once Instllation is done run the following command  

wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -

# Create /etc/apt/sources.list.d/mongodb-org-5.0.list. I am adding this by using the touch command, you can create this file using your favorite editor.

sudo cd /etc/apt/sources.list.d/

sudo touch mongodb-org-6.0.list

# Now add the following repo by the echo command.

echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

# After Adding Repository Run These Commands as Mongodb Version 6 Does'nt Have This Package 

wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb

dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb 

# Finally, update the system after adding the repo and installing MongoDB.

sudo apt-get update 

sudo apt install -y mongodb-org
 
# Start The Mongo Service 

systemctl start mongod

systemctl enable mongod 

systemctl status mongod
