#!/bin/bash

#==============================================================================
#
# Define location & path vars
#
#==============================================================================

export HOMEBREW="/usr/local"
export HOMEBREW_BASH="$HOMEBREW/etc/bash_completion.d"
export HOMEBREW_NO_ANALYTICS=true
export HOMEBREW_NO_GOOGLE_ANALYTICS=true
export HOMEBREW_NO_INSTALL_CLEANUP=true
[ -e "$HOMEBREW/etc/profile.d/bash_completion.sh" ] && source "$HOMEBREW/etc/profile.d/bash_completion.sh"
[ -e "$HOMEBREW_BASH/brew" ] && source "$HOMEBREW_BASH/brew"

[ -e "$HOMEBREW_BASH/node" ] && source "$HOMEBREW_BASH/node"
[ -e "$HOMEBREW_BASH/deno" ] && source "$HOMEBREW_BASH/deno"
[ -e "$HOMEBREW_BASH/npm" ]  && source "$HOMEBREW_BASH/npm"
[ -e "$HOMEBREW_BASH/yarn" ] && source "$HOMEBREW_BASH/yarn"
[ -e "$HOMEBREW_BASH/pnpm" ] && source "$HOMEBREW_BASH/pnpm"

[ -e "$HOMEBREW_BASH/docker" ]    && source "$HOMEBREW_BASH/docker"
[ -e "$HOMEBREW_BASH/whalebrew" ] && source "$HOMEBREW_BASH/whalebrew"

[ -e "$HOMEBREW_BASH/tmux" ] && source "$HOMEBREW_BASH/tmux"

export PATH="$WASMER_DIR/globals/wapm_packages/.bin:$PATH"
export PATH="$WASMER_DIR/bin:$PATH"
export PATH="$CARGO_HOME/bin:$PATH"
export PATH="$HOMEBREW/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$HOMEBREW/opt/binutils/libexec/gnubin:$PATH"
export PATH="$HOMEBREW/opt/inetutils/libexec/gnubin:$PATH"
export PATH="$HOMEBREW/opt/findutils/libexec/gnubin:$PATH"
export PATH="$HOMEBREW/opt/diffutils/libexec/gnubin:$PATH"
export PATH="$HOMEBREW/opt/moreutils/libexec/gnubin:$PATH"
export PATH="$HOMEBREW/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$HOMEBREW/bin:$PATH"
export PATH="$HOMEBREW/sbin:$PATH"

export SHELL="bash"
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"

alias list="exa --all --group-directories-first --long --no-user --octal-permissions --no-permissions --extended --git --ignore-glob .git"

#==============================================================================
#
# Define shell prompt && git vars
#
#==============================================================================

[ -e "$HOMEBREW_BASH/git-prompt.sh" ]       && source "$HOMEBREW_BASH/git-prompt.sh"
[ -e "$HOMEBREW_BASH/git-completion.bash" ] && source "$HOMEBREW_BASH/git-completion.bash"

[ -e "$HOMEBREW_BASH/gh" ]   && source "$HOMEBREW_BASH/gh"
[ -e "$HOMEBREW_BASH/glab" ] && source "$HOMEBREW_BASH/glab"
[ -e "$HOMEBREW_BASH/tea" ]  && source "$HOMEBREW_BASH/tea"

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_STATESEPARATOR=" "
GIT_PS1_COMPRESSSPARSESTATE=true
GIT_PS1_SHOWCONFLICTSTATE="yes"
GIT_PS1_DESCRIBE_STYLE="default"
GIT_PS1_SHOWCOLORHINTS=true

GIT_COMPLETION_CHECKOUT_NO_GUESS=1
GIT_COMPLETION_SHOW_ALL_COMMANDS=1
GIT_COMPLETION_SHOW_ALL=1
GIT_COMPLETION_IGNORE_CASE=1

PROMPT_TEXT="\[\033[01;34m\]\W\[\033[00m\]"
PROMPT_COMMAND='__git_ps1 "$PROMPT_TEXT" " "'

