#!/bin/usr/bash

source "$HOME/.dotfiles/bash/bash.sh"
source "$HOME/.dotfiles/bash/deno.sh"
source "$HOME/.dotfiles/bash/rustup.sh"
source "$HOME/.dotfiles/bash/cargo.sh"
source "$HOME/.dotfiles/sh/git.sh"
source "$HOME/.cargo/env"

export DENO_INSTALL="$HOME/.deno"
export DVM_DIR="$HOME/.dvm"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="$DVM_DIR/bin:$PATH"

function curl_deno() { curl -fsSL https://dvm.deno.dev | sh }
function curl_dvm() { curl -fsSL https://deno.land/x/install/install.sh | sh }
alias curl-init='bash -c "curl-init"'

function repo_ed() { ln ~/.dotfiles/.editorconfig . }
function repo_vs() { ln ~/.dotfiles/.vscode/settings.json .vscode/ }
function repo_gi() { touch .gitignore }
function repo_all() { repo_ed; repo_vs; repo_gi; }
function repo_init() { mkdir .vscode; repo_all }
alias repo_init='bash -c "repo-init"'

function gi() { curl -sL https://www.toptal.com/developers/gitignore/api/$@ ;}
PS1='\[\033[01;34m\]\W\[\033[00m\]$(__git_ps1 " (%s)") → '
