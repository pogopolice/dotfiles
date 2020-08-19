#!/bin/bash

sudo apt install neovim

# Add the config file and directories for neovim
mkdir -p ~/.config/nvim
touch .config/nvim/init.vim
# let g:python3_host_prog = '/usr/bin/python3'

# clipboard app
sudo apt install xclip

# python prereqs
sudo apt install python3-neovim python3-pip

# ruby prereqs
sudo apt install ruby ruby-dev
sudo apt install build-essential
sudo gem install neovim

# node prereqs
sudo apt install nodejs npm
sudo npm install -g neovim

# plugin directory
mkdir -p .local/share/nvim/site/pack/pogopolice/{start,opt}

# plugin config directory
mkdir -p ~/.config/nvim/plug-config
