#!/bin/bash

# Enabling admin rights
sudo su

# send script output to /tmp so we can debug boot failures
exec > /tmp/userdata.log 2>&1 

# Update all packages
yum -y update
yum -y install ruby
yum -y install wget

# Installing the CodeDeploy agent
cd /home/ec2-user
wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install
chmod +x ./install
./install auto