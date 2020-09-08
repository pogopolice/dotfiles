#!/bin/bash


# Install these common packages for fetching the files used in this script
install_prerequisites ()
{
  sudo apt install -y \
	  wget \
	  curl \
	  git
}	# ----------  end of function install_prerequisites  ----------


# Download & run the ohmyzsh install script
ohmyzsh_install ()
{
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}	# ----------  end of function ohmyzsh_install  ----------


# Download the Meslo fonts for powerlevel
# The .fonts directory will be recognized by default
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


# Install & enable the powerlevel10 theme
powerlevel_theme ()
{
  git clone --depth=1 \
	  https://github.com/romkatv/powerlevel10k.git \
	  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"


  # Set the theme to powerlevel10k in .zshrc
  sed -i -e \
	  's#^ZSH_THEME=.*#ZSH_THEME=\"powerlevel10k/powerlevel10k\"#g' \
	  "${ZDOTDIR:-$HOME}/.zshrc"
}	# ----------  end of function powerlevel_theme  ----------


#  Download the highlighting & autosuggestions plugins for zsh
zsh_plugins ()
{

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
}	# ----------  end of function zsh_plugins  ----------


#  Post instructions for enabling plugins in ~/.zshrc
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


#  Execute the functions in sequence
main ()
{
  install_prerequisites
	ohmyzsh_install
	ohmyzsh_fonts
	powerlevel_theme
  zsh_plugins
	print_instructions
}	# ----------  end of function main  ----------

main "$@"
