#!/bin/bash -


# Install CloudFormation linter
cf_linter_prereq ()
{
	pip3 install cfn-lint
}	# ----------  end of function cf_linter_prereq  ----------


# Install bash linter prerequisites
bash_linter_prereq ()
{
	sudo apt install -y shellcheck
	sudo snap install shfmt
}	# ----------  end of function bash_linter_prereq  ----------

# Install additional vim plugins
install_plugin ()
{
  mkdir -p ~/.local/share/nvim/site/pack/pogopolice/start
  pushd ~/.local/share/nvim/site/pack/pogopolice/start || return
  git clone https://github.com/WolfgangMehner/bash-support.git
  git clone https://github.com/vim-airline/vim-airline.git
  git clone https://github.com/tpope/vim-fugitive.git
  popd || return

}  # ----------  end of function install_plugin  ----------


# Install AWS cli v2 
install_awscli_v2 ()
{
  pushd "$HOME" || return
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo /bin/sh "$HOME/aws/install"
  rm -rf "$HOME/aws" "$HOME/awscliv2.zip"
  popd || return
}	# ----------  end of function install_awscli_v2  ----------


# Install nodejs packages for AWS CDK development
install_node_packages ()
{
  cp "$PWD/package.json" "$HOME"
  pushd "$HOME" || return
  yarn install --prefix "$HOME/.local"
  yarn global add typescript --prefix "$HOME/.local"
  yarn global add aws-cdk --prefix "$HOME/.local"
  popd || return
}	# ----------  end of function install_node_packages  ----------







