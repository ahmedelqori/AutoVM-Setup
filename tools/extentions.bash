#!/bin/bash

handle_error() {
    echo -e "\t\t${BOLD_ITALIC_RED}Error: $1${RESET}"
}

handle_success() {
    echo -e "\t\t${BOLD_ITALIC_GREEN}$1${RESET}"
}
# Add VSCode extensions
echo -e "${BOLD_ITALIC_BLUE}Installing VSCode extensions...${RESET}"

install_vscode_extension() {
    code --install-extension "$1" > /dev/null 2>&1 && handle_success "$1 installed." || handle_error "Failed to install $1."
}

install_vscode_extension "sdras.night-owl"
install_vscode_extension "formulahendry.auto-rename-tag" 
install_vscode_extension "ms-vscode.vscode-typescript-tslint-plugin" 
install_vscode_extension "dsznajder.es7-react-js-snippets" 
install_vscode_extension "styled-components.vscode-styled-components"
install_vscode_extension "bradlc.vscode-tailwindcss" 
install_vscode_extension "ms-vscode.cpptools"
install_vscode_extension "esbenp.prettier-vscode"

echo -e "${BOLD_ITALIC_BLUE}Setting Prettier as the default formatter...${RESET}"
code --file-write-settings '{"editor.defaultFormatter": "esbenp.prettier-vscode"}' > /dev/null 2>&1 && handle_success "Prettier set as default formatter." || handle_error "Failed to set Prettier as default formatter."

echo -e "${BOLD_ITALIC_BLUE}Enabling autosave...${RESET}"
code --file-write-settings '{"files.autoSave": "afterDelay", "files.autoSaveDelay": 1000}' > /dev/null 2>&1 && handle_success "Autosave enabled." || handle_error "Failed to enable autosave."

echo -e "${BOLD_ITALIC_BLUE}VSCode extensions and settings updated.${RESET}"
