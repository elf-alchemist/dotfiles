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

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_STATESEPARATOR=" "
GIT_PS1_COMPRESSSPARSESTATE=true
GIT_PS1_SHOWCONFLICTSTATE="yes"
GIT_PS1_DESCRIBE_STYLE="default"
GIT_PS1_SHOWCOLORHINTS=true

PROMPT_TEXT="\[\033[01;34m\]\W\[\033[00m\]"
PS1='$PROMPT_TEXT$(__git_ps1 " (%s)") → '
PROMPT_COMMAND='__git_ps1 "$PROMPT_TEXT" " "'
