#!/bin/bash


# Install Zsh
install_zsh ()
{
	sudo apt install -y \
		zsh
}	# ----------  end of function install_zsh  ----------


# Change the user's shell to zsh
set_shell ()
{
	sudo usermod -s "$(command -v zsh)" "$1"
	sudo chsh -s "$(command -v zsh)"
}	# ----------  end of function set_shell  ----------


# Print instructions for activating Z Shell
completed_message ()
{
	printf "%s\\n" "
	Log out to activate Z Shell.
	You may need to close the terminal.
	"
}	# ----------  end of function completed_message  ----------


# Execute the functions in sequence
main ()
{
	install_zsh
	set_shell "$USER"
	completed_message
}	# ----------  end of function main  ----------

main "$@"
