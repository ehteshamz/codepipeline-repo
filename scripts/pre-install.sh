#!/bin/bash

# Downloading and Installing NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.nvm/nvm.sh

# Installing Node
nvm install node