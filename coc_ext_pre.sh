#!/bin/bash -
#===============================================================================
#
#          FILE: coc_ext_pre.sh
#
#         USAGE: ./coc_ext_pre.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 08/21/2020 03:05:34 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  cloudformation_linter
#   DESCRIPTION: install cfn-lint 
#-------------------------------------------------------------------------------

cloudformation_linter ()
{
	pip3 install cfn-lint
}	# ----------  end of function cloudformation_linter  ----------


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  bash_linter
#   DESCRIPTION: install shellcheck 
#-------------------------------------------------------------------------------

bash_linter ()
{
	sudo apt install -y shellcheck
}	# ----------  end of function bash_linter  ----------


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  bash_deps
#   DESCRIPTION: Install a dependency for the bash linter 
#-------------------------------------------------------------------------------

bash_deps ()
{
	sudo snap install shfmt
}	# ----------  end of function bash_deps  ----------


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  main
#   DESCRIPTION: execute these functions in sequence 
#-------------------------------------------------------------------------------

main ()
{
	cloudformation_linter
	bash_linter
	bash_deps
}	# ----------  end of function main  ----------

main
