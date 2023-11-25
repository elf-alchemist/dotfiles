#!/usr/bin/env sh

# Homebrew is very nice
case "$(uname -s -m)" in
  Linux*)
    export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
    ;;
  Darwin*arm*)
    export HOMEBREW_PREFIX="/opt/homebrew"
    ;;
  Darwin*)
    export HOMEBREW_PREFIX="/usr/local"
    ;;
esac

export HOMEBREW_OPT="$HOMEBREW_PREFIX/opt"
export HOMEBREW_ETC="$HOMEBREW_PREFIX/etc"
export HOMEBREW_BASH="$HOMEBREW_PREFIX/etc/bash_completion.d"

export HOMEBREW_NO_ANALYTICS=true
export HOMEBREW_NO_INSTALL_CLEANUP=true

alias __list_brew_formulae="brew tap-info --json --installed | jq -r '.[]|(.formula_names[])'"
alias __list_brew_casks="brew tap-info --json --installed | jq -r '.[]|(.cask_tokens[])'"
alias __list_brew_caveats="brew info --json --installed | jq 'map(select(.caveats) | [.name, .caveats])'"
alias __list_brew_manually_installed="brew info --json=v2 --installed | jq -r '.formulae[]|select(any(.installed[]; .installed_on_request)).full_name'"

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:="$HOME/.config"}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:="$HOME/.cache"}"
export XDG_DATA_HOME="${XDG_DATA_HOME:="$HOME/.local/share"}"
export XDG_STATE_HOME="${XDG_STATE_HOME:="$HOME/.local/state"}"
export XDG_DATA_DIRS="${XDG_DATA_DIRS:="/usr/local/share:/usr/share"}"
export XDG_CONFIG_DIRS="${XDG_CONFIG_DIRS:="/etc/xdg"}"

[ -e "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ] && . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
[ -e "$HOMEBREW_BASH/brew"          ] && . "$HOMEBREW_BASH/brew"
[ -e "$HOMEBREW_BASH/brew-services" ] && . "$HOMEBREW_BASH/brew-services"

# Define location & path
# TODO: somehow . util-linux bash completion
export PATH="$HOMEBREW_OPT/make/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_OPT/gawk/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_OPT/gnu-tar/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_OPT/gnu-sed/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_OPT/gnu-which/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_OPT/binutils/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_OPT/inetutils/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_OPT/findutils/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_OPT/diffutils/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_OPT/moreutils/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_OPT/coreutils/libexec/gnubin:$PATH"
export PATH="$HOMEBREW_OPT/man-db/libexec/bin:$PATH"
export PATH="$HOMEBREW_OPT/util-linux/bin:$PATH"
export PATH="$HOMEBREW_OPT/util-linux/sbin:$PATH"
export PATH="$HOMEBREW_PREFIX/bin:$PATH"
export PATH="$HOMEBREW_PREFIX/sbin:$PATH"

# ECMAScript is pain, We should only need NPM... should;
# But it is a very bad, no good, package manager;
# Yarn improved things, PNPM is even better;
# A person may be smart, but people are stupid;
# A new tool is created to solve a problem that an
# established tool has, but not everyone uses the new one,
# And so cycle moves on... an ever rotating cycle
# of badness and hatred that can only only be fixed
# when Node/NPM devs realise that their software
# is complete garbage and they need to copy
# Deno's and Bun's highly integrated style of
# feature implementation... or atleast, one can hope...
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

export NVM_DIR="$XDG_DATA_HOME/nvm"
[ -s "$HOMEBREW_OPT/nvm/nvm.sh" ] && . "$HOMEBREW_OPT/nvm/nvm.sh"
[ -s "$HOMEBREW_OPT/nvm/etc/bash_completion.d/nvm" ] && . "$HOMEBREW_OPT/nvm/etc/bash_completion.d/nvm"

export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export PATH="$PNPM_HOME/pnpm:$PATH"
[ -e "$HOMEBREW_BASH/pnpm" ] && . "$HOMEBREW_BASH/pnpm"

# Container env
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME/docker-machine"

[ -e "$HOMEBREW_BASH/docker"         ] && . "$HOMEBREW_BASH/docker"
[ -e "$HOMEBREW_BASH/docker-compose" ] && . "$HOMEBREW_BASH/docker-compose"

# Cloud stuff
export SAM_CLI_TELEMETRY=0
export GOOGLE_APPLICATION_CREDENTIALS="$XDG_CONFIG_HOME/gcloud/application_default_credentials.json"

# Misc
alias lsl="ls -blahs --time-style=long-iso --color=auto"
alias lst="tree --dirsfirst -aCLI 2 .git"

alias wget="wget --hsts-file='\$XDG_DATA_HOME/wget-hsts'"

export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export RANGER_LOAD_DEAFULT_RC=true
export HTOPRC="$XDG_CONFIG_HOME/htop/htoprc"
export FFMPEG_DATADIR="$XDG_CONFIG_HOME/ffmpeg"
export TERMINFO="$XDG_DATA_HOME/terminfo"
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"

[ -e "$HOMEBREW_BASH/tmux" ] && . "$HOMEBREW_BASH/tmux"
[ -e "$HOMEBREW_BASH/more" ] && . "$HOMEBREW_BASH/more"

[ -e "$HOMEBREW_BASH/bat"    ] && . "$HOMEBREW_BASH/bat"
[ -e "$HOMEBREW_BASH/httpie" ] && . "$HOMEBREW_BASH/httpie"

# Define shell prompt && git vars
[ -e "$HOMEBREW_BASH/git-prompt.sh"       ] && . "$HOMEBREW_BASH/git-prompt.sh"
[ -e "$HOMEBREW_BASH/git-completion.bash" ] && . "$HOMEBREW_BASH/git-completion.bash"

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

PS_CLEAR="\[$(tput sgr0)\]"
PS_FG_RED="\[$(tput setaf 1)\]"
PS_BG_RED="\[$(tput setab 1)\]"
PS_FG_GREEN="\[$(tput setaf 2)\]"
PS_BG_GREEN="\[$(tput setab 2)\]"
PS_FG_YELLOW="\[$(tput setaf 3)\]"
PS_BG_YELLOW="\[$(tput setab 3)\]"
PS_FG_BLUE="\[$(tput setaf 4)\]"
PS_BG_BLUE="\[$(tput setab 4)\]"
PS_FG_MAGENTA="\[$(tput setaf 5)\]"
PS_BG_MAGENTA="\[$(tput setab 5)\]"
PS_FG_CYAN="\[$(tput setaf 6)\]"
PS_BG_CYAN="\[$(tput setab 6)\]"
PS_FG_WHITE="\[$(tput setaf 7)\]"
PS_BG_WHITE="\[$(tput setab 7)\]"

export TIME_STYLE="long-iso"

# PS1="$PS_FG_BLUE\W$PS_CLEAR $(__git_ps1 "(%s) ")"
PS1='\[\033[01;34m\]\W\[\033[00m\] $(__git_ps1 "(%s) ")'
