#!/bin/bash

# Providing complete permissions to the web-app folder
sudo chmod -R 777 /home/ec2-user/web-app

# Navigating to the web application folder
cd /home/ec2-user/web-app

# Installing node modules for the web application
npm install

# Starting web application in the background
node web-app/index.js > app.out.log 2> app.err.log < /dev/null & 