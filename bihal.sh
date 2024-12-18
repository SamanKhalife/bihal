#!/bin/bash

# Define the destination directory for Neovim configuration
DEST_DIR="$HOME/.config/nvim"

# Update and install necessary dependencies
echo "Updating system and installing dependencies..."
sudo apt update && sudo apt install -y neovim git curl

# Clone the configuration repository from GitHub
echo "Cloning Neovim configuration from GitHub..."
git clone https://github.com/SamanKhalife/bihal.git /tmp/Bi-Hali

# Check if the destination directory exists
if [ ! -d "$DEST_DIR" ]; then
  echo "Creating Neovim configuration directory..."
  mkdir -p "$DEST_DIR"
fi

# Copy the configuration files to the destination
echo "Copying configuration files to $DEST_DIR..."
cp -r /tmp/Bi-Hali/* "$DEST_DIR"

# Clean up the temporary repository
rm -rf /tmp/Bi-Hali

# Print success message
echo "Neovim has been installed, and your configuration has been applied successfully!"
