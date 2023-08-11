# Base xdg dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

# Lang setup
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PNPM_HOME="$XDG_DATA_HOME/pnpm"

# Container env
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME/docker-machine"

# Misc
export TERMINFO="$XDG_DATA_HOME/terminfo"
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"

# Define path & bin
export PATH="$XDG_DATA_HOME/npm/bin:$PATH"
export PATH="$XDG_DATA_HOME/yarn/global/node_modules/.bin:$PATH"
export PATH="$XDG_DATA_HOME/pnpm:$PATH"

source "$HOME/.dotfiles/shell/home.sh"

[ -e "$HOMEBREW_BASH/systemctl"   ] && source "$HOMEBREW_BASH/systemctl"
[ -e "$HOMEBREW_BASH/journalctl"  ] && source "$HOMEBREW_BASH/journalctl"
[ -e "$HOMEBREW_BASH/hostnamectl" ] && source "$HOMEBREW_BASH/hostnamectl"

[ -e "$HOMEBREW_BASH/lscpu" ] && source "$HOMEBREW_BASH/lscpu"
[ -e "$HOMEBREW_BASH/lsmem" ] && source "$HOMEBREW_BASH/lsmem"
[ -e "$HOMEBREW_BASH/lsblk" ] && source "$HOMEBREW_BASH/lsblk"

[ -e "$HOMEBREW_BASH/dmesg" ] && source "$HOMEBREW_BASH/dmesg"
