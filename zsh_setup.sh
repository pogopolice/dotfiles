#!/bin/bash

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
#          NAME:  print_instructions
#   DESCRIPTION:  post run instructions for the zshrc
#-------------------------------------------------------------------------------

print_instructions ()
{
	printf "%s\\\n" "
	Add the zsh plugins to your ~/.zshrc

        plugins=(
          git
          zsh-autosuggestions
          zsh-syntax-highlighting
        )

	"
}	# ----------  end of function print_instructions  ----------

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  main
#   DESCRIPTION: execute the functions in sequence
#-------------------------------------------------------------------------------

main ()
{
	ohmyzsh_install
	ohmyzsh_fonts
	powerlevel_theme
	print_instructions
}	# ----------  end of function main  ----------

main "$@"
