#!/bin/bash


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  npm_path
#   DESCRIPTION:  add a local directory for installing global npm packages
#-------------------------------------------------------------------------------


npm_path ()
{
	path+=("$HOME/.npm-global/bin")
	#path+=("$HOME/.node/bin")
	export PATH="$PATH"
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
	npm_path
	print_message
}	# ----------  end of function main  ----------

main
