# #!/bin/bash
sudo apt update -y
sudo apt upgrade -y

sudo apt -y install wget curl

sudo curl -sL https://deb.nodesource.com/setup_current.x | bash -
sudo apt install -y nodejs

sudo apt install -y libssl3 build-essential libssl-dev

sudo npm install -g @nestjs/cli

sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome-stable.deb
sudo dpkg -i /tmp/google-chrome-stable.deb
sudo apt-get -f -y install

sudo apt install -y wget gpg
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt -y install code

sudo wget -O /tmp/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo dpkg -i /tmp/discord.deb
sudo apt-get -f -y install
