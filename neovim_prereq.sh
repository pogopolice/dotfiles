#!/bin/bash


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  add_repository
#   DESCRIPTION:  Add the yarn repo to the sources list
#-------------------------------------------------------------------------------

add_repository ()
{
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
	sudo apt update
}	# ----------  end of function add_repository  ----------


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  install_packages
#   DESCRIPTION:  install yarn
#-------------------------------------------------------------------------------

install_packages ()
{
	sudo apt install -y yarn
}	# ----------  end of function install_packages  ----------


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  update_path
#   DESCRIPTION:  add a local directory for installing global npm packages
#-------------------------------------------------------------------------------

update_path ()
{
	sed -i "s/# export PATH=\$HOME/PATH=\$HOME/" "$HOME/.zshrc"
	export yarn_path="\$HOME/.config/yarn/global:\$HOME/.local/bin:\$PATH"
	sed -i "/^PATH=.*/a export PATH=$yarn_path" "$HOME/.zshrc"
}	# ----------  end of function update_path  ----------


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
	add_repository
	install_packages
	update_path
	print_message
}	# ----------  end of function main  ----------

main
