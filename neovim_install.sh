#!/bin/bash -


# Install the nightly neovim for use with LSP
install_neovim_nightly ()
{
  
  mkdir "$HOME/.appimages"
  pushd "$HOME/.appimages" || return
  wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
  chmod u+x nvim.appimage
  popd || return
  echo "alias nvim=\"$HOME/.appimages/nvim.appimage\"" >> "$HOME/.zshrc"

}	# ----------  end of function install_neovim_nightly  ----------


# Install the stable release of neovim from the standard repo
install_neovim_stable ()
{
  sudo apt install -y neovim  
}	# ----------  end of function install_neovim_stable  ----------


# Output instructions to specify which version of neovim
output_message ()
{
 printf "%s\\n" "
 Specify either nightly or stable version of neovim
 ie:
   $0 stable
 or
   $0 nigthly
 " 
}	# ----------  end of function output_message  ----------


# Execute the functions in sequence
main ()
{
  
  if $1 === "nightly"; then
    install_neovim_nightly
  elif $1 === "stable"; then 
    install_neovim_stable
  else
    output_message
  fi
}	# ----------  end of function main  ----------
printf "%s\\n" "Log out/in to coplete the cpan configuration."

main "$@"
