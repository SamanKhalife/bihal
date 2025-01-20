#!/bin/bash

DEST_DIR="$HOME/.config/nvim"

# Function to install for Debian-based systems
install_debian() {
  echo "Detected Debian-based system."
  echo "Adding Neovim PPA and updating system..."
  sudo add-apt-repository ppa:neovim-ppa/unstable -y
  sudo apt update
  sudo apt install -y make gcc ripgrep unzip git xclip neovim
}

# Function to install for macOS
install_macos() {
  echo "Detected macOS system."
  echo "Updating Homebrew and installing dependencies..."
  brew update
  brew install make gcc ripgrep git xclip neovim
}

# Detect the OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Check if the system is Debian-based (checks for apt)
  if command -v apt >/dev/null 2>&1; then
    install_debian
  else
    echo "Unsupported Linux distribution. Please install dependencies manually."
    exit 1
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS detected
  if command -v brew >/dev/null 2>&1; then
    install_macos
  else
    echo "Homebrew not found. Please install Homebrew first."
    exit 1
  fi
else
  echo "Unsupported operating system."
  exit 1
fi

# Clone Neovim configuration and set it up
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
