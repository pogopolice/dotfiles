#!/bin/bash -
#===============================================================================
#
#          FILE: neovim5_install.sh
#
#         USAGE: ./neovim5_install.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 09/07/2020 01:04:48 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

mkdir "$HOME/.appimages"

pushd "$HOME/.appimages" || return
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x nvim.appimage
popd || return
echo "alias nvim = $HOME/.appimages/nvim.appimage"
