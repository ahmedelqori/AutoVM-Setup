#!/bin/bash

# Update package list
sudo apt-get update
sudo apt-get update

# Install wget and curl
sudo apt-get -y install wget curl

# Install the latest version of Node.js
sudo curl -sL https://deb.nodesource.com/setup_current.x | bash -
sudo apt-get install -y nodejs

# Install NestJS globally
sudo npm install -g @nestjs/cli

# Install MongoDB server
sudo wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -
echo 'deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse' | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org

# Start MongoDB service
sudo systemctl start mongod
sudo systemctl enable mongod

# Install MongoDB Compass
sudo wget https://downloads.mongodb.com/compass/mongodb-compass_1.35.3_amd64.deb -O /tmp/mongodb-compass.deb
sudo dpkg -i /tmp/mongodb-compass.deb
sudo apt-get -f -y install

# Install Google Chrome
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome-stable.deb
sudo dpkg -i /tmp/google-chrome-stable.deb
sudo apt-get -f -y install

# Install Visual Studio Code
sudo wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo wget -q https://packages.microsoft.com/repos/vscode stable main
sudo apt-get update
sudo apt-get -y install code

# Install Discord
sudo wget https://discord.com/api/download?platform=linux&format=deb -O /tmp/discord.deb
sudo dpkg -i /tmp/discord.deb
sudo apt-get -f -y install

# Install Postman
sudo wget https://dl.pstmn.io/download/latest/linux64 -O /tmp/Postman.tar.gz
sudo tar -xvzf /tmp/Postman.tar.gz -C /opt
sudo ln -s /opt/Postman/Postman /usr/local/bin/postman

# Set screen resolution to 1920x1080
sudo xrandr --output Virtual1 --mode 1920x1080

# Clear taskbar favorites and set VSCode and Chrome
sudo gnome-shell-extension-tool --remove-extension
sudo gnome-shell-extension-tool --add-extension=apps-menu
sudo gnome-shell-extension-tool --add-extension=launchers

# Add VSCode and Chrome to favorites
sudo gnome-shell-extension-tool --add-extension=code
sudo gnome-shell-extension-tool --add-extension=google-chrome

# Set dock position to bottom
sudo gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'

