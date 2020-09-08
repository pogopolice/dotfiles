#!/bin/bash -


# Install COC using vim's native package manager
install_plugin ()
{
  mkdir -p ~/.local/share/nvim/site/pack/pogopolice/start
  pushd ~/.local/share/nvim/site/pack/pogopolice/start || return
  curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz|tar xzfv -
  popd || return

}  # ----------  end of function install_plugin  ----------


# Copy the coc config file to the nvim plug conig directory
copy_config ()
{
  cp "$PWD/coc.vim" "$HOME/.config/nvim/plug-config/coc.vim"
}  # ----------  end of function copy_config  ----------


# Add a source call to the coc config in the neovim config
source_config ()
{
printf "%s\\n" "
\" COC config
source \$HOME/.config/nvim/plug-config/coc.vim
" | tee -a "$HOME/.config/nvim/init.vim"
}  # ----------  end of function source_config  ----------


# Execute these functions in sequence
main ()
{
  install_plugin
  copy_config
  source_config
}  # ----------  end of function main  ----------

main
