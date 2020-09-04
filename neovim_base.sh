#!/bin/bash

sudo apt install -y neovim

# Add the config file and directories for neovim
mkdir -p ~/.config/nvim
cp "$PWD/init.vim" "$HOME/.config/nvim/init.vim"

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

# nodejs
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs

pushd "$HOME" || return
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo /bin/sh "$HOME/aws/install"
rm -rf "$HOME/aws" "$HOME/awscliv2.zip"
popd || return

# yarn packages
cp "$PWD/package.json" "$HOME"
pushd "$HOME" || return
yarn global add package.json --prefix "$HOME/.local"
popd || return

# plugin directory
mkdir -p .local/share/nvim/site/pack/pogopolice/{start,opt}

# plugin config directory
mkdir -p ~/.config/nvim/plug-config
