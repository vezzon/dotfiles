#!/bin/bash
set -e

# Update and install basic tools
sudo apt update && sudo apt upgrade -y
sudo apt install -y git curl wget build-essential

# Install Zsh and set it as default
sudo apt install -y zsh
chsh -s $(which zsh)

# Install Oh My Zsh (unattended)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install tmux
sudo apt install -y tmux
curl -fsSL -o ~/.tmux.conf https://raw.githubusercontent.com/vezzon/dotfiles/refs/heads/master/.tmux.conf2

# Install latest Neovim from source
sudo apt remove -y neovim
sudo apt install -y ninja-build gettext cmake unzip build-essential
cd /tmp
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install

echo "Setup complete! Restart your terminal."
