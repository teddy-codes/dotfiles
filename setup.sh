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
    vim \
    zsh \
    tree \
    jq \
    unzip

echo "✅ Dotfiles setup complete!"
