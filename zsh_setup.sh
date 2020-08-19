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
#          NAME:  system_reboot
#   DESCRIPTION: Reboot the system
#-------------------------------------------------------------------------------

system_reboot ()
{
	shutdown -rf 0
}	# ----------  end of function system_reboot  ----------


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  ohmyzsh_install
#   DESCRIPTION: run the oh my zsh install script
#-------------------------------------------------------------------------------

ohmyzsh_install ()
{
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}	# ----------  end of function ohmyzsh_install  ----------


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  ohmyzsh_fonts
#   DESCRIPTION: download the Meslo fonts for powerlevel
#-------------------------------------------------------------------------------

ohmyzsh_fonts ()
{
	mkdir -p ~/.fonts
	pushd ~/.fonts || return
	wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
	wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
	wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
	wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
	popd || return
}	# ----------  end of function ohmyzsh_fonts  ----------


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  powerlevel_theme
#   DESCRIPTION: install the powerlevel theme
#-------------------------------------------------------------------------------

powerlevel_theme ()
{
  git clone --depth=1 \
	  https://github.com/romkatv/powerlevel10k.git \
	  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"


  # Set the theme in .zshrc
  sed -i -e \
	  's#^ZSH_THEME=.*#ZSH_THEME=\"powerlevel10k/powerlevel10k\"#g' \
	  "${ZDOTDIR:-$HOME}/.zshrc"

  # zsh syntax highlighting
  git clone \
	  https://github.com/zsh-users/zsh-syntax-highlighting.git \
	  "${ZSH_CUSTOM:-$HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
  # add zsh-syntax-highlighting to the plugins in the ~/.zshrc

  # zsh autosuggestions
  git clone \
	  https://github.com/zsh-users/zsh-autosuggestions \
	  "${ZSH_CUSTOM:-$HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
  # add zsh-autosuggestions to the plugins in the ~/.zshrc
}	# ----------  end of function powerlevel_theme  ----------


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  main
#   DESCRIPTION: execute the functions in sequence
#-------------------------------------------------------------------------------

main ()
{
	install_prerequisites
	install_zsh
	set_shell "$USER"
	system_reboot
	ohmyzsh_install
	ohmyzsh_fonts
	powerlevel_theme
}	# ----------  end of function main  ----------

main "$@"
