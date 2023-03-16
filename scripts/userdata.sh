#!/bin/bash

# Enabling admin rights
sudo su

# send script output to /tmp so we can debug boot failures
exec > /tmp/userdata.log 2>&1 

# Update all packages
yum -y update
yum -y install ruby
yum -y install wget

# Downloading and Installing NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
. ~/.nvm/nvm.sh

# Adding the nvm environmental variable to path
export NVM_DIR="$HOME/.nvm"	
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Installing Node
nvm install 16

# Installing the CodeDeploy agent
cd /home/ec2-user
wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install
chmod +x ./install
./install auto