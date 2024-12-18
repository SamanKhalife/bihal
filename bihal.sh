#!/bin/bash

DEST_DIR="$HOME/.config/nvim"

# Update and install necessary dependencies
echo "Adding Neovim PPA and updating system..."
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install -y make gcc ripgrep unzip git xclip neovim

echo "Cloning Neovim configuration from GitHub..."
git clone https://github.com/SamanKhalife/bihal.git /tmp/bihal

if [ ! -d "$DEST_DIR" ]; then
  echo "Creating Neovim configuration directory..."
  mkdir -p "$DEST_DIR"
fi

echo "Copying configuration files to $DEST_DIR..."
cp -r /tmp/bihal/* "$DEST_DIR"

rm -rf /tmp/bihal

echo "Neovim has been installed, and your configuration has been applied successfully!"


