#!/bin/bash


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  install_packages
#   DESCRIPTION:  install nodejs & npm
#-------------------------------------------------------------------------------

install_packages ()
{
	sudo apt install -y nodejs npm
}	# ----------  end of function install_packages  ----------


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  global_directory
#   DESCRIPTION:  make & set a directory for global installations
#-------------------------------------------------------------------------------

global_directory ()
{
	mkdir -p "$HOME/.npm-global"
	npm config set prefix "$HOME/.npm-global"
}	# ----------  end of function global_directory  ----------


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  npm_path
#   DESCRIPTION:  add a local directory for installing global npm packages
#-------------------------------------------------------------------------------

npm_path ()
{
	export PATH="$HOME/.npm-global/bin:$PATH"
	sed -i "/# export PATH=.*/a export PATH=$PATH" ~/.zshrc
	
}	# ----------  end of function npm_path  ----------


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  print message
#   DESCRIPTION: print a message for exiting the terminal 
#-------------------------------------------------------------------------------

print_message ()
{
	printf "%s\\n" "
	log out and log back in to apply path changes
	"
}	# ----------  end of function print message  ----------


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  main
#   DESCRIPTION: run the functions in sequence 
#-------------------------------------------------------------------------------


main ()
{
	install_packages
	global_directory
	npm_path
	print_message
}	# ----------  end of function main  ----------

main
