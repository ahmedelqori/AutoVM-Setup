#!/bin/bash

BOLD_ITALIC_RED="\033[1;3;31m"
BOLD_ITALIC_GREEN="\033[1;3;32m"
BOLD_ITALIC_YELLOW="\033[1;3;33m"
BOLD_ITALIC_BLUE="\033[1;3;34m"
BOLD_ITALIC_CYAN="\033[1;3;36m"
RESET="\033[0m"

handle_error() {
    echo -e "\t\t${BOLD_ITALIC_RED}Error: $1${RESET}"
}

handle_success() {
    echo -e "\t\t${BOLD_ITALIC_GREEN}$1${RESET}"
}

echo -e "${BOLD_ITALIC_BLUE}Updating and upgrading system packages...${RESET}"
sudo apt update -y > /dev/null 2>&1 && handle_success "System packages updated successfully." || handle_error "Failed to update system packages."
sudo apt upgrade -y > /dev/null 2>&1 && handle_success "System packages upgraded successfully." || handle_error "Failed to upgrade system packages."

echo -e "${BOLD_ITALIC_BLUE}Installing build-essential and net-tools...${RESET}"
sudo apt install -y build-essential net-tools > /dev/null 2>&1 && handle_success "Installed build-essential and net-tools." || handle_error "Failed to install build-essential and net-tools."

echo -e "${BOLD_ITALIC_BLUE}Installing wget, curl, git, vim, zsh...${RESET}"
sudo apt install -y wget curl git vim zsh > /dev/null 2>&1 && handle_success "Installed wget, curl, git, vim, zsh." || handle_error "Failed to install wget, curl, git, vim, zsh."

echo -e "${BOLD_ITALIC_BLUE}Installing htop, ubuntu-gnome-desktop...${RESET}"
sudo apt install -y htop ubuntu-gnome-desktop > /dev/null 2>&1 && handle_success "Installed htop and ubuntu-gnome-desktop." || handle_error "Failed to install htop and ubuntu-gnome-desktop."

echo -e "${BOLD_ITALIC_BLUE}Installing gnome-tweaks and gnome-shell-extensions...${RESET}"
sudo apt install -y gnome-tweaks gnome-shell-extensions > /dev/null 2>&1 && handle_success "Installed gnome-tweaks and gnome-shell-extensions." || handle_error "Failed to install gnome-tweaks and gnome-shell-extensions."

echo -e "${BOLD_ITALIC_BLUE}Installing Python3 and dependencies...${RESET}"
sudo apt install -y python3 python3-pip python3-venv python3-dev > /dev/null 2>&1 && handle_success "Installed Python3 and dependencies." || handle_error "Failed to install Python3 and dependencies."

echo -e "${BOLD_ITALIC_BLUE}Installing OpenJDK, Clang, nginx, apache2...${RESET}"
sudo apt install -y openjdk-11-jdk clang nginx apache2 > /dev/null 2>&1 && handle_success "Installed OpenJDK, Clang, nginx, apache2." || handle_error "Failed to install OpenJDK, Clang, nginx, apache2."

echo -e "${BOLD_ITALIC_BLUE}Installing Docker and dependencies...${RESET}"
sudo apt install -y docker.io docker-compose > /dev/null 2>&1 && handle_success "Installed Docker and dependencies." || handle_error "Failed to install Docker and dependencies."

echo -e "${BOLD_ITALIC_BLUE}Installing multimedia and graphics tools...${RESET}"
sudo apt install -y gimp vlc ffmpeg inkscape > /dev/null 2>&1 && handle_success "Installed multimedia and graphics tools." || handle_error "Failed to install multimedia and graphics tools."

echo -e "${BOLD_ITALIC_BLUE}Installing networking tools...${RESET}"
sudo apt install -y openssh-server openssh-client nfs-common samba ftp telnet nmap traceroute > /dev/null 2>&1 && handle_success "Installed networking tools." || handle_error "Failed to install networking tools."

echo -e "${BOLD_ITALIC_BLUE}Installing security and cryptography tools...${RESET}"
sudo apt install -y ufw fail2ban cryptsetup gpg openssl > /dev/null 2>&1 && handle_success "Installed security and cryptography tools." || handle_error "Failed to install security and cryptography tools."

echo -e "${BOLD_ITALIC_BLUE}Installing terminal and utility tools...${RESET}"
sudo apt install -y tmux wget unzip tar > /dev/null 2>&1 && handle_success "Installed terminal and utility tools." || handle_error "Failed to install terminal and utility tools."

echo -e "${BOLD_ITALIC_BLUE}Installing Snap and Flatpak...${RESET}"
sudo apt install -y snapd flatpak > /dev/null 2>&1 && handle_success "Installed Snap and Flatpak." || handle_error "Failed to install Snap and Flatpak."

echo -e "${BOLD_ITALIC_BLUE}Installing fonts...${RESET}"
sudo apt install -y fonts-dejavu fonts-noto > /dev/null 2>&1 && handle_success "Installed fonts." || handle_error "Failed to install fonts."

echo -e "${BOLD_ITALIC_BLUE}Installing language packs...${RESET}"
sudo apt install -y language-pack-en language-pack-gnome-en aspell-en > /dev/null 2>&1 && handle_success "Installed language packs." || handle_error "Failed to install language packs."

# echo -e "${BOLD_ITALIC_BLUE}Installing LibreOffice, Evince, Calibre, KeepassXC...${RESET}"
# sudo apt install -y libreoffice evince calibre keepassxc > /dev/null 2>&1 && handle_success "Installed LibreOffice, Evince, Calibre, KeepassXC." || handle_error "Failed to install LibreOffice, Evince, Calibre, KeepassXC."

echo -e "${BOLD_ITALIC_BLUE}Installing Node.js...${RESET}"
sudo curl -sL https://deb.nodesource.com/setup_current.x | bash - > /dev/null 2>&1 && handle_success "Node.js setup completed." || handle_error "Failed to install Node.js."
sudo apt install -y nodejs > /dev/null 2>&1 && handle_success "Node.js installed successfully." || handle_error "Failed to install Node.js."

echo -e "${BOLD_ITALIC_BLUE}Installing libssl3 and libssl-dev...${RESET}"
sudo apt install -y libssl3 build-essential libssl-dev > /dev/null 2>&1 && handle_success "Installed libssl3 and libssl-dev." || handle_error "Failed to install libssl3 and libssl-dev."

echo -e "${BOLD_ITALIC_BLUE}Installing NestJS CLI globally...${RESET}"
sudo npm install -g @nestjs/cli > /dev/null 2>&1 && handle_success "NestJS CLI installed." || handle_error "Failed to install NestJS CLI."

echo -e "${BOLD_ITALIC_BLUE}Installing Google Chrome...${RESET}"
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome-stable.deb > /dev/null 2>&1 && handle_success "Google Chrome downloaded." || handle_error "Failed to download Google Chrome."
sudo dpkg -i /tmp/google-chrome-stable.deb > /dev/null 2>&1 && handle_success "Google Chrome installed." || handle_error "Failed to install Google Chrome."
sudo apt-get -f -y install > /dev/null 2>&1 && handle_success "Fixed Google Chrome dependencies." || handle_error "Failed to fix dependencies for Google Chrome."

echo -e "${BOLD_ITALIC_BLUE}Installing Visual Studio Code...${RESET}"
sudo apt install -y wget gpg > /dev/null 2>&1 && handle_success "Installed wget and gpg for VSCode." || handle_error "Failed to install wget and gpg for VSCode."
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add - > /dev/null 2>&1 && handle_success "Microsoft GPG key added." || handle_error "Failed to add Microsoft GPG key."
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null 2>&1 && handle_success "VSCode repository added." || handle_error "Failed to add VSCode repository."
sudo apt update > /dev/null 2>&1 && handle_success "VSCode repositories updated." || handle_error "Failed to update VSCode repositories."
sudo apt -y install code > /dev/null 2>&1 && handle_success "Visual Studio Code installed." || handle_error "Failed to install Visual Studio Code."

echo -e "${BOLD_ITALIC_BLUE}Installing Discord...${RESET}"
sudo wget -O /tmp/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb" > /dev/null 2>&1 && handle_success "Discord downloaded." || handle_error "Failed to download Discord."
sudo dpkg -i /tmp/discord.deb > /dev/null 2>&1 && handle_success "Discord installed." || handle_error "Failed to install Discord."
sudo apt-get -f -y install > /dev/null 2>&1 && handle_success "Fixed dependencies for Discord." || handle_error "Failed to fix dependencies for Discord."
