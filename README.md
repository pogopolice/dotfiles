# dotfiles
neovim setup for development on ubuntu

## ZSH Installation & Configuration

Authenticate with sudo

```
sudo -l
```

Install the Z Shell

```
/bin/bash zsh_install.sh
```

Log out & back in to use the Z Shell

Install fonts & plugins for Z Shell

```
/bin/bash zsh_setup.sh
```

Add the newly installed plugins to the zshrc config file

```
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
```

Log out & back in.
Follow the routine to set up the zsh prompt

## Neovim Installation & Configuration

Install Yarn and add the global directory to $PATH

```
/bin/bash neovim_prereq.sh
```

Install either the nightly or stable version of neovim

```
/bin/bash neovim_install.sh nightly
or
/bin/bash neovim_install.sh stable
```

Install packges and add directories for running neovim

```
/bin/bash neovim_base.sh
```

Log out & back in to use the Z Shell

Open neovim & check the health status

```
tmux
nvim
:checkhealth
```

## COC Plugin

Install the COC vim plugin and apply the standard config

```
/bin/bash coc_setup.sh
```
## COC Extensions

Extension prerequisites

```
/bin/bash coc_ext_pre.sh
```

Install extensions

```
nvim
:CocInstall coc-diagnostic coc-json coc-python coc-snippets coc-tsserver coc-eslint coc-vimlsp
```

Add COC settings for extensions

```
/bin/bash coc_settings.sh
```

## Personal COC Setup

Steps for completing my personal COC setup

```
:CocInstall coc-cfn-lint coc-docker coc-sh
/bin/bash personal_setup.sh
```
