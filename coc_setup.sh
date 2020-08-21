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

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  install_plugin
#   DESCRIPTION:  Install COC using vim's native package manager
#-------------------------------------------------------------------------------

install_plugin ()
{
	mkdir -p ~/.local/share/nvim/site/pack/pogopolice/start
	pushd ~/.local/share/nvim/site/pack/pogopolice/start || return
	curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz|tar xzfv -
	popd || return

}	# ----------  end of function install_plugin  ----------

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  copy_config
#   DESCRIPTION: copy the coc config file to the nvim plug conig directory
#-------------------------------------------------------------------------------

copy_config ()
{
	cp "$PWD/coc.vim" "$HOME/.config/nvim/plug-config/coc.vim"
}	# ----------  end of function copy_config  ----------


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  source_config
#   DESCRIPTION:  add a source call to the coc config in the neovim config
#-------------------------------------------------------------------------------

source_config ()
{
printf "%s\\n" "
\" COC config
source \$HOME/.config/nvim/plug-config/coc.vim
" | tee -a "$HOME/.config/nvim/init.vim"
}	# ----------  end of function source_config  ----------


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  main
#   DESCRIPTION: execute these functions in sequence
#-------------------------------------------------------------------------------


main ()
{
	install_plugin
	copy_config
	source_config
}	# ----------  end of function main  ----------

main
