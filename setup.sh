#!/bin/bash

set -e

echo "🚀 Setting up dotfiles..."

# Update package list
echo "📦 Updating package list..."
sudo apt-get update

# Install btop
echo "📊 Installing btop..."
sudo apt-get install -y btop

# Install other common tools
echo "🛠️  Installing additional tools..."

sudo apt-get install -y \
    curl \
    wget \
    git \
    neovim \
    zsh \
    tree \
    jq \
    unzip

# I use ghostty, so the term value is not standard. Need to standardize it.
export TERM=xterm-256color

echo "✅ Dotfiles setup complete!"
