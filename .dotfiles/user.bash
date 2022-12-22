#!/bin/usr/bash

source "$HOME/.dotfiles/git.sh"
source "$HOME/.dotfiles/comp/deno.bash"
source "$HOME/.dotfiles/comp/rustup.bash"
source "$HOME/.cargo/env"
export DENO_INSTALL="$HOME/.deno"
export DVM_DIR="$HOME/.dvm"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="$DVM_DIR/bin:$PATH"


alias edconf='ln ~/.dotfiles/.editorconfig .'
function gi() { curl -sL https://www.toptal.com/developers/gitignore/api/$@ ;}

PS1='\[\033[01;34m\]\W\[\033[00m\]$(__git_ps1 " (%s)") → '
