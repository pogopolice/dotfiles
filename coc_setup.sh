#!/bin/bash -
#===============================================================================
#
#          FILE: coc_setup.sh
#
#         USAGE: ./coc_setup.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 08/19/2020 02:22:37 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

pushd ~/.local/share/nvim/site/pack/pogopolice/start || return
git clone https://github.com/neoclide/coc.nvim.git
popd || return

cp ./coc.vim ~/.config/nvim/plug-config/coc.vim
