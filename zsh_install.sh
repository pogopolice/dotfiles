#!/bin/bash


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  install_prerequisites
#   DESCRIPTION: install packages for setting up zsh
#-------------------------------------------------------------------------------

install_prerequisites ()
{
  sudo apt install -y \
	  wget \
	  curl \
	  git
}	# ----------  end of function install_prerequisites  ----------


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  install_zsh
#   DESCRIPTION:  install the zsh package
#-------------------------------------------------------------------------------

install_zsh ()
{
  sudo apt install -y \
	  zsh
}	# ----------  end of function install_zsh  ----------


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  set_shell
#   DESCRIPTION: change the user's shell to zsh
#-------------------------------------------------------------------------------

set_shell ()
{
  usermod -s "$(command -v zsh)" "$1"
  chsh -s "$(command -v zsh)"
}	# ----------  end of function set_shell  ----------


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  completed_message
#   DESCRIPTION: Print instructions for activating Z Shell
#-------------------------------------------------------------------------------

completed_message ()
{
	printf "%s\\n" "
	Log out to activate Z Shell.
	You may need to close the terminal.
	"
	shutdown -rf 0
}	# ----------  end of function completed_message  ----------



#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  main
#   DESCRIPTION: execute the functions in sequence
#-------------------------------------------------------------------------------

main ()
{
	install_prerequisites
	install_zsh
	set_shell "$USER"
	completed_message
}	# ----------  end of function main  ----------

main "$@"
