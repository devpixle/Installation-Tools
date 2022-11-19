cat << comment
STEPS FOR INSTALLING MONGODB ON UBUNTU
LET'S FIRST UPDATE THE MACHINE

sudo apt-get update 

comment 

cat << comment
  INSTALL GNUPG 
comment

sudo apt-get install gnupg -y 

cat << comment 
  Once Instllation is done run the following command 
comment 

sudo wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -

cat << comment 
  Create /etc/apt/sources.list.d/mongodb-org-5.0.list. I am adding this by using the touch command, you can create this file using your favorite editor.
comment 

sudo cd /etc/apt/sources.list.d/

sudo touch mongodb-org-5.0.list

# Now add the following repo by the echo command.

echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list

cat << comment 
 Finally, update the system after adding the repo and installing MongoDB.
comment 

sudo apt-get update 

sudo apt install -y mongodb-org

cat << comment 
 Start The Mongo Service 
comment 

systemctl start mongod

systemctl enable mongod 

systemctl status mongod
