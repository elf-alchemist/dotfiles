#!/usr/bin/env bash
export BASH_SILENCE_DEPRECATION_WARNING=1

# Homebrew is very nice
case "$(uname -s -m)" in
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

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH="$HOMEBREW_PREFIX/sbin:$HOMEBREW_PREFIX/bin:$PATH"

# ECMAScript is pain, it is stupid, it is dumb and I can't stop using it
[ -s "$HOMEBREW_OPT/nvm/nvm.sh" ] && source "$HOMEBREW_OPT/nvm/nvm.sh"
[ -s "$HOMEBREW_OPT/nvm/etc/bash_completion.d/nvm" ] && source "$HOMEBREW_OPT/nvm/etc/bash_completion.d/nvm"

export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export PATH="$PNPM_HOME:$PATH"

export PNPM_COMPLETION="$XDG_CONFIG_HOME/tabtab/bash"
[ -e "$PNPM_COMPLETION" ] && source "$PNPM_COMPLETION/pnpm.bash"

# Lua
if command -v luarocks > /dev/null; then
	eval "$(luarocks path --bin)"
fi

[ -e "$HOMEBREW_BASH/luarocks" ] && source "$HOMEBREW_BASH/luarocks"

# Container
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME/docker-machine"

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
