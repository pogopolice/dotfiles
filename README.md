# dotfiles
neovim setup for development on ubuntu

## Installation

Authenticate with sudo

```
sudo -l
```

Install the Z Shell

```
/bin/bash zsh_install.sh
```

Install fonts & plugins for Z Shell

```
/bin/bash zsh_setup.sh
```

Add an local directory for installing packages with NPM

```
/bin/bash neovim_prereq.sh
```

Install packges and add directories for running neovim

```
/bin/bash neovim_base.sh
```
