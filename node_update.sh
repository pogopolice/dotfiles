#!/bin/bash -
#===============================================================================
#
#          FILE: node_update.sh
#
#         USAGE: ./node_update.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 09/04/2020 04:08:36 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  remove_old_node
#   DESCRIPTION:  Uninstall default nodejs version
#-------------------------------------------------------------------------------

remove_old_node ()
{
 sudo apt remove -y nodejs 
}	# ----------  end of function remove_old_node  ----------


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  add_node_repo
#   DESCRIPTION:  
#-------------------------------------------------------------------------------

add_node_repo ()
{
 curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
}	# ----------  end of function add_node_repo  ----------


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  install_updated_node
#   DESCRIPTION:  Install node from the new repo
#-------------------------------------------------------------------------------

install_updated_node ()
{
 sudo apt-get install -y nodejs 
}	# ----------  end of function install_updated_node  ----------


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  main
#   DESCRIPTION:  run functions in sequence
#-------------------------------------------------------------------------------

main ()
{
 remove_old_node
 add_node_repo
 install_updated_node
}	# ----------  end of function main  ----------

main
