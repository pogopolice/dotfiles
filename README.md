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

Install packges and add directories for running neovim

```
/bin/bash neovim_base.sh
```

Log out & back in to use the Z Shell

Open neovim & check the health status

```
nvim
:checkhealth
```
