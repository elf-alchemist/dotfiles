#!/bin/usr/bash

source "$HOME/.dotfiles/git.sh"
source "$HOME/.dotfiles/bash/deno.sh"
source "$HOME/.dotfiles/bash/rustup.sh"
source "$HOME/.dotfiles/bash/cargo.sh"
source "$HOME/.cargo/env"

export DENO_INSTALL="$HOME/.deno"
export DVM_DIR="$HOME/.dvm"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="$DVM_DIR/bin:$PATH"

alias conf-ed='ln ~/.dotfiles/.editorconfig .'
alias conf-vs='ln ~/.dotfiles/.vscode/settings.json .vscode/'
alias conf-gi='touch .gitignore'
alias conf-all='conf-ed && conf-vs && conf-gi'
alias conf-init='mkdir .vscode && conf-all'

function gi() { curl -sL https://www.toptal.com/developers/gitignore/api/$@ ;}

PS1='\[\033[01;34m\]\W\[\033[00m\]$(__git_ps1 " (%s)") → '
