#!/bin/bash

sudo apt install -y neovim

# Add the config file and directories for neovim
mkdir -p ~/.config/nvim
touch .config/nvim/init.vim
# let g:python3_host_prog = '/usr/bin/python3'

# clipboard app
sudo apt install -y xclip

# tmux app
sudo apt install -y tmux

# copy the tmux config into the home directory
cp "$PWD/.tmux.conf" "$HOME"

# python prereqs
sudo apt install -y python3-neovim python3-pip

# ruby prereqs
sudo apt install -y ruby ruby-dev
sudo apt install -y build-essential
sudo gem install neovim

# node prereqs
sudo apt install -y nodejs npm
npm install -g neovim

# plugin directory
mkdir -p .local/share/nvim/site/pack/pogopolice/{start,opt}

# plugin config directory
mkdir -p ~/.config/nvim/plug-config
