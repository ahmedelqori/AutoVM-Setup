#!/bin/bash

BOLD_ITALIC_RED="\033[1;3;31m"
BOLD_ITALIC_GREEN="\033[1;3;32m"
BOLD_ITALIC_YELLOW="\033[1;3;33m"
BOLD_ITALIC_BLUE="\033[1;3;34m"
BOLD_ITALIC_CYAN="\033[1;3;36m"
RESET="\033[0m"
BACKGROUND_URL="https://images.unsplash.com/photo-1555117746-a7c449e5d0ff?ixlib=rb-4.0.3&q=85&fm=jpg&crop=entropy&cs=srgb&dl=ethan-dow-dWaBkAWCxsA-unsplash.jpg"
BACKGROUND_PATH="$HOME/Pictures/background.jpg"

handle_error() {
    echo -e "\t\t${BOLD_ITALIC_RED}Error: $1${RESET}"
}

handle_success() {
    echo -e "\t\t${BOLD_ITALIC_GREEN}$1${RESET}"
}

echo -e "${BOLD_ITALIC_BLUE}Setting dock position to bottom...${RESET}"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM' && handle_success "Dock position set to bottom." || handle_error "Failed to set dock position."

echo -e "${BOLD_ITALIC_BLUE}Setting favorite apps...${RESET}"
gsettings set org.gnome.shell favorite-apps "['google-chrome.desktop', 'code.desktop', 'discord.desktop']" && handle_success "Apps to favorites" || handle_error "Failed to set apps"

echo -e "${BOLD_ITALIC_BLUE}Setting dock icon size...${RESET}"
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size "24" && handle_success "Dock icon size set to ${ICON_SIZE}px." || handle_error "Failed to set dock icon size."

echo -e "${BOLD_ITALIC_BLUE}Setting GNOME to dark theme...${RESET}"
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark' && handle_success "Dark theme set." || handle_error "Failed to set dark theme."

echo -e "${BOLD_ITALIC_BLUE}Downloading background image...${RESET}"
wget -O "$BACKGROUND_PATH" "$BACKGROUND_URL" > /dev/null 2>&1 && handle_success "Background image downloaded." || handle_error "Failed to download background image."
echo -e "${BOLD_ITALIC_BLUE}Setting background image as wallpaper...${RESET}"
gsettings set org.gnome.desktop.background picture-uri "file://$BACKGROUND_PATH" && handle_success "Background set as wallpaper." || handle_error "Failed to set background as wallpaper."

echo -e "${BOLD_ITALIC_BLUE}Installing Oh My Zsh...${RESET}"
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && handle_success "Oh My Zsh installed." || handle_error "Failed to install Oh My Zsh."

echo -e "${BOLD_ITALIC_BLUE}Installing Powerlevel10k theme...${RESET}"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k" && handle_success "Powerlevel10k installed." || handle_error "Failed to install Powerlevel10k."

echo -e "${BOLD_ITALIC_BLUE}Setting Powerlevel10k as default theme...${RESET}"
sed -i 's/^ZSH_THEME=".*"/ZSH_THEME="powerlevel10k/powerlevel10k"/' ~/.zshrc && handle_success "Powerlevel10k set as default theme." || handle_error "Failed to set Powerlevel10k theme."

echo -e "${BOLD_ITALIC_BLUE}Setting up Powerlevel10k auto configuration...${RESET}"
yes | p10k configure && handle_success "Powerlevel10k auto-configuration completed." || handle_error "Failed to configure Powerlevel10k."

echo -e "${BOLD_ITALIC_GREEN}Setup complete. Please restart your terminal or source ~/.zshrc to apply the changes.${RESET}"