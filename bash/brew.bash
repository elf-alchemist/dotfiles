#!/usr/bin/env bash

# Homebrew is very nice
case "$(uname -s -m)" in
	Linux*)
		export   HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
		;;
	Darwin*arm*)
		export   HOMEBREW_PREFIX="/opt/homebrew"
		;;
	Darwin*)
		export   HOMEBREW_PREFIX="/usr/local"
		;;
esac

export HOMEBREW_BIN="$HOMEBREW_PREFIX/bin"
export HOMEBREW_OPT="$HOMEBREW_PREFIX/opt"
export HOMEBREW_ETC="$HOMEBREW_PREFIX/etc"
export HOMEBREW_BASH="$HOMEBREW_PREFIX/etc/bash_completion.d"

export HOMEBREW_NO_ANALYTICS=true
export HOMEBREW_NO_INSTALL_CLEANUP=true

alias __list_brew_formulae="brew tap-info --json --installed | jq -r '.[]|(.formula_names[])'"
alias __list_brew_casks="brew tap-info --json --installed | jq -r '.[]|(.cask_tokens[])'"
alias __list_brew_caveats="brew info --json --installed | jq 'map(select(.caveats) | [.name, .caveats])'"
alias __list_brew_manually_installed="brew info --json=v2 --installed | jq -r '.formulae[]|select(any(.installed[]; .installed_on_request)).full_name'"

[ -e "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ] && source "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
[ -e "$HOMEBREW_BASH/brew"          ] && source "$HOMEBREW_BASH/brew"
[ -e "$HOMEBREW_BASH/brew-services" ] && source "$HOMEBREW_BASH/brew-services"

# Define location & path
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:="$HOME/.config"}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:="$HOME/.cache"}"
export XDG_DATA_HOME="${XDG_DATA_HOME:="$HOME/.local/share"}"
export XDG_STATE_HOME="${XDG_STATE_HOME:="$HOME/.local/state"}"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOMEBREW_PREFIX/bin:$PATH"
export PATH="$HOMEBREW_PREFIX/sbin:$PATH"
export PATH="$HOMEBREW_OPT/util-linux/bin:$PATH"
export PATH="$HOMEBREW_OPT/util-linux/sbin:$PATH"
export PATH="$HOMEBREW_OPT/coreutils/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_OPT/moreutils/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_OPT/diffutils/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_OPT/findutils/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_OPT/inetutils/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_OPT/binutils/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_OPT/man-db/libexec/bin:$PATH"
export PATH="$HOMEBREW_OPT/gnu-which/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_OPT/gnu-sed/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_OPT/gnu-tar/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_OPT/gawk/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_OPT/make/libexec/gnubin:$PATH"

# ECMAScript is pain, it is stupid, it is dumb and I can't stop using it
export NVM_DIR="$XDG_DATA_HOME/nvm"
[ -s "$HOMEBREW_OPT/nvm/nvm.sh" ] && source "$HOMEBREW_OPT/nvm/nvm.sh"
[ -s "$HOMEBREW_OPT/nvm/etc/bash_completion.d/nvm" ] && source "$HOMEBREW_OPT/nvm/etc/bash_completion.d/nvm"

export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export PATH="$PNPM_HOME:$PATH"

export PNPM_COMPLETION="$XDG_CONFIG_HOME/tabtab/bash"
[ -e "$PNPM_COMPLETION" ] && source "$PNPM_COMPLETION/pnpm.bash"

# Lua
if command -v "$HOMEBREW_BIN/luarocks" > /dev/null; then
	eval "$("$HOMEBREW_BIN/luarocks" path --bin)"
fi

[ -e "$HOMEBREW_BASH/luarocks" ] && source "$HOMEBREW_BASH/luarocks"

# Container
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME/docker-machine"

[ -e "$HOMEBREW_BASH/docker"         ] && source "$HOMEBREW_BASH/docker"
[ -e "$HOMEBREW_BASH/docker-compose" ] && source "$HOMEBREW_BASH/docker-compose"

# Misc
alias lsl="ls -blahs --time-style=long-iso --color=auto"

alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."

export HTOPRC="$XDG_CONFIG_HOME/htop/htoprc"

export GNUPGHOME="$XDG_DATA_HOME/gnupg"

export HISTFILE="$XDG_STATE_HOME/bash/history"
export TERMINFO="$XDG_DATA_HOME/terminfo"
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"

[ -e "$HOMEBREW_BASH/tmux" ]     && source "$HOMEBREW_BASH/tmux"
[ -e "$HOMEBREW_BASH/more" ]     && source "$HOMEBREW_BASH/more"

[ -e "$HOMEBREW_BASH/pandoc" ]   && source "$HOMEBREW_BASH/pandoc"

# Linux Only Stuff
[ -e "$HOMEBREW_BASH/systemctl"   ] && source "$HOMEBREW_BASH/systemctl"
[ -e "$HOMEBREW_BASH/journalctl"  ] && source "$HOMEBREW_BASH/journalctl"
[ -e "$HOMEBREW_BASH/hostnamectl" ] && source "$HOMEBREW_BASH/hostnamectl"

[ -e "$HOMEBREW_BASH/lscpu" ] && source "$HOMEBREW_BASH/lscpu"
[ -e "$HOMEBREW_BASH/lsmem" ] && source "$HOMEBREW_BASH/lsmem"
[ -e "$HOMEBREW_BASH/lsblk" ] && source "$HOMEBREW_BASH/lsblk"

[ -e "$HOMEBREW_BASH/dmesg" ] && source "$HOMEBREW_BASH/dmesg"

# Define shell prompt && git vars
[ -e "$HOMEBREW_BASH/git-prompt.sh"       ] && source "$HOMEBREW_BASH/git-prompt.sh"
[ -e "$HOMEBREW_BASH/git-completion.bash" ] && source "$HOMEBREW_BASH/git-completion.bash"

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_STATESEPARATOR=" "
export GIT_PS1_COMPRESSSPARSESTATE=true
export GIT_PS1_SHOWCONFLICTSTATE="yes"
export GIT_PS1_DESCRIBE_STYLE="default"
export GIT_PS1_SHOWCOLORHINTS=true

export GIT_COMPLETION_CHECKOUT_NO_GUESS=1
export GIT_COMPLETION_SHOW_ALL_COMMANDS=1
export GIT_COMPLETION_SHOW_ALL=1
export GIT_COMPLETION_IGNORE_CASE=1

function git-ignore
{
	curl -fsSL https://www.toptal.com/developers/gitignore/api/$@ > .gitignore
}

function git-license
{
	curl -fsSL https://api.github.com/licenses/$1 | jq -r '.body' > LICENSE
}

PS1='\[\e[1;34m\]\W\[\e[1;0m\] '
PS1+='$(__git_ps1 "(%s) ")'
