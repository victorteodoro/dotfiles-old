#!/bin/bash

# Update registries and upgrade current programs
sudo apt update && sudo apt upgrade -y

# Install my basic apps
sudo apt install vlc chromium-browser git build-essential fish tmux curl python3-pip python3 steam calibre gnome-tweak-tool

# Install snap apps
sudo snap install spotify
sudo snap install code --classic
