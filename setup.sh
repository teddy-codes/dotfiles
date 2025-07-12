#!/bin/bash

set -e

echo "🚀 Setting up dotfiles..."

# Update package list
echo "📦 Updating package list..."
sudo apt-get update

# Install common tools
echo "🛠️  Installing common tools..."

sudo apt-get install -y \
    btop \
    curl \
    wget \
    git \
    neovim \
    zsh \
    tree \
    jq \
    unzip

curl -sS https://starship.rs/install.sh | sh

# I use ghostty, so the term value is not standard. Need to standardize it.
export TERM=xterm-256color

echo "🔗 Creating symlinks..."
DOTFILES_DIR="$HOME/dotfiles"

# Create .config directory if it doesn't exist
mkdir -p "$HOME/.config"

[ -f "$DOTFILES_DIR/.zshrc" ] && ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
[ -d "$DOTFILES_DIR/.config/nvim" ] && ln -sf "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"

echo "✅ Dotfiles setup complete!"
