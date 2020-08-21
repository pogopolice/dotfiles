#!/bin/bash -
#===============================================================================
#
#          FILE: coc_settings.sh
#
#         USAGE: ./coc_settings.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 08/21/2020 03:42:24 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  copy_coc_settings
#   DESCRIPTION: copy the coc settings file into the nvim config directory 
#-------------------------------------------------------------------------------
copy_coc_settings ()
{
	cp "$PWD/coc-settings.json" "$HOME/.config/nvim"
}	# ----------  end of function copy_coc_settings  ----------

copy_coc_settings
