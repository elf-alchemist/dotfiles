#!/usr/bin/bash

source "$HOME/.dotfiles/bash/bash.sh"
source "$HOME/.dotfiles/bash/util.sh"
source "$HOME/.dotfiles/bash/deno.sh"
source "$HOME/.dotfiles/bash/supa.sh"
source "$HOME/.dotfiles/bash/rustup.sh"
source "$HOME/.dotfiles/bash/cargo.sh"
source "$HOME/.dotfiles/sh/git.sh"
source "$HOME/.cargo/env"

export DENO_INSTALL="$HOME/.deno"
export DVM_DIR="$HOME/.dvm"
export NVM_DIR="$HOME/.nvm"

export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="$DVM_DIR/bin:$PATH"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

PS1='\[\033[01;34m\]\W\[\033[00m\]$(__git_ps1 " (%s)") → '

