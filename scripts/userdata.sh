#!/bin/bash -xe

# Enabling admin rights
sudo su

# send script output to /tmp so we can debug boot failures
exec > /tmp/userdata.log 2>&1 

# Update all packages
yum -y update
yum -y install ruby
yum -y install aws-cli

# Installing node
curl --silent --location https://rpm.nodesource.com/setup_15.x | bash -
yum -y install nodejs
npm i cross-env -g

# Clearing and updating cache of any previous CodeDeploy Agent
CODEDEPLOY_BIN="/opt/codedeploy-agent/bin/codedeploy-agent"
$CODEDEPLOY_BIN stop
yum erase codedeploy-agent -y

# Installing the CodeDeploy agent
cd /home/ec2-user
aws s3 cp s3://aws-codepipeline-lab-arham/latest/install . --region us-east-2
chmod +x ./install
./install auto