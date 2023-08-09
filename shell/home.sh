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
  *)
    export HOMEBREW_PREFIX="$(brew --prefix)"
    ;;
esac

export HOMEBREW_NO_ANALYTICS=true
export HOMEBREW_NO_INSTALL_CLEANUP=true

export HOMEBREW_BASH="$HOMEBREW_PREFIX/etc/bash_completion.d"
export HOMEBREW_OPT="$HOMEBREW_PREFIX/opt"
[ -e "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ] && source "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
[ -e "$HOMEBREW_BASH/brew"          ] && source "$HOMEBREW_BASH/brew"
[ -e "$HOMEBREW_BASH/brew-services" ] && source "$HOMEBREW_BASH/brew-services"

# Define location & path
export PATH="$HOMEBREW_OPT/openjdk/bin:$PATH"
export PATH="$HOMEBREW_OPT/man-db/gnubin:$PATH"
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
[ -e "$HOMEBREW_BASH/node" ] && source "$HOMEBREW_BASH/node"
[ -e "$HOMEBREW_BASH/deno" ] && source "$HOMEBREW_BASH/deno"
[ -e "$HOMEBREW_BASH/npm"  ] && source "$HOMEBREW_BASH/npm"
[ -e "$HOMEBREW_BASH/yarn" ] && source "$HOMEBREW_BASH/yarn"
[ -e "$HOMEBREW_BASH/pnpm" ] && source "$HOMEBREW_BASH/pnpm"

# Container env
export DOCKER_CONFIG="$HOME/.config/docker"
[ -e "$HOMEBREW_BASH/docker"         ] && source "$HOMEBREW_BASH/docker"
[ -e "$HOMEBREW_BASH/docker-compose" ] && source "$HOMEBREW_BASH/docker-compose"
[ -e "$HOMEBREW_BASH/whalebrew"      ] && source "$HOMEBREW_BASH/whalebrew"

# Misc
export RANGER_LOAD_DEAFULT_RC=true
export HTOPRC="$HOME/.config/htop/htoprc"
export FFMPEG_DATADIR="$HOME/.config/ffmpeg"

[ -e "$HOMEBREW_BASH/tmux"       ] && source "$HOMEBREW_BASH/tmux"
[ -e "$HOMEBREW_BASH/more"       ] && source "$HOMEBREW_BASH/more"
[ -e "$HOMEBREW_BASH/br.bash"    ] && source "$HOMEBREW_BASH/br.bash"
[ -e "$HOMEBREW_BASH/broot.bash" ] && source "$HOMEBREW_BASH/broot.bash"

[ -e "$HOMEBREW_BASH/tldr"      ] && source "$HOMEBREW_BASH/tldr"
[ -e "$HOMEBREW_BASH/exa"       ] && source "$HOMEBREW_BASH/exa"
[ -e "$HOMEBREW_BASH/bat"       ] && source "$HOMEBREW_BASH/bat"
[ -e "$HOMEBREW_BASH/dust.bash" ] && source "$HOMEBREW_BASH/dust.bash"
[ -e "$HOMEBREW_BASH/httpie"    ] && source "$HOMEBREW_BASH/httpie"
[ -e "$HOMEBREW_BASH/delta"     ] && source "$HOMEBREW_BASH/delta"

# Define shell prompt && git vars
[ -e "$HOMEBREW_BASH/git-prompt.sh"       ] && source "$HOMEBREW_BASH/git-prompt.sh"
[ -e "$HOMEBREW_BASH/git-completion.bash" ] && source "$HOMEBREW_BASH/git-completion.bash"

[ -e "$HOMEBREW_BASH/gh"   ] && source "$HOMEBREW_BASH/gh"
[ -e "$HOMEBREW_BASH/glab" ] && source "$HOMEBREW_BASH/glab"
[ -e "$HOMEBREW_BASH/tea"  ] && source "$HOMEBREW_BASH/tea"

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

# TODO: finish this later
#PROMPT_COLOR="\[$(tput setf 0)\]"
#PROMPT_COLOR="\[$(tput setf 1)\]"
#PROMPT_COLOR="\[$(tput setf 2)\]"
#PROMPT_COLOR="\[$(tput setf 3)\]"
#PROMPT_COLOR="\[$(tput setf 4)\]"
#PROMPT_COLOR="\[$(tput setf 5)\]"
#PROMPT_COLOR="\[$(tput setf 6)\]"
#PROMPT_COLOR="\[$(tput setf 7)\]"
#PROMPT_COLOR="\[$(tput setb 0)\]"
#PROMPT_COLOR="\[$(tput setb 1)\]"
#PROMPT_COLOR="\[$(tput setb 2)\]"
#PROMPT_COLOR="\[$(tput setb 3)\]"
#PROMPT_COLOR="\[$(tput setb 4)\]"
#PROMPT_COLOR="\[$(tput setb 5)\]"
#PROMPT_COLOR="\[$(tput setb 6)\]"
#PROMPT_COLOR="\[$(tput setb 7)\]"

export TIME_STYLE="long-iso"

alias lsl="ls -blahs --time-style=long-iso --color=auto"
alias lst="tree --dirsfirst -aCLI 2 .git"
alias lse="exa --group-directories-first --no-user --octal-permissions --no-permissions --git -@laI .git"

alias __list_brew_caveats="brew info --json --installed | jq 'map(select(.caveats) | [.name, .caveats])'"

PS1='\[\033[01;34m\]\W\[\033[00m\] $(__git_ps1 "(%s) ")'

