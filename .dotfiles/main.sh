#!/usr/bin/bash

source "$HOME/.dotfiles/bash/bash.sh"
source "$HOME/.dotfiles/bash/deno.sh"
source "$HOME/.dotfiles/bash/dvm.sh"
source "$HOME/.dotfiles/bash/nvm.sh"
source "$HOME/.dotfiles/bash/supa.sh"
source "$HOME/.dotfiles/bash/rustup.sh"
source "$HOME/.dotfiles/bash/cargo.sh"
source "$HOME/.dotfiles/sh/git.sh"
source "$HOME/.dotfiles/sh/nvm.sh"
source "$HOME/.dotfiles/sh/util.sh"

export NVM_DIR="$HOME/.nvm"
export DVM_DIR="$HOME/.dvm"
export DENO_INSTALL="$HOME/.deno"

export PATH="$DENO_INSTALL/bin:$DVM_DIR/bin:$PATH"

PS1='\[\033[01;34m\]\W\[\033[00m\]$(__git_ps1 " (%s)") → '
