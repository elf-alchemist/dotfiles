# Base xdg dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

[ -e "$HOMEBREW_BASH/systemctl"   ] && source "$HOMEBREW_BASH/systemctl"
[ -e "$HOMEBREW_BASH/journalctl"  ] && source "$HOMEBREW_BASH/journalctl"
[ -e "$HOMEBREW_BASH/hostnamectl" ] && source "$HOMEBREW_BASH/hostnamectl"

[ -e "$HOMEBREW_BASH/lscpu" ] && source "$HOMEBREW_BASH/lscpu"
[ -e "$HOMEBREW_BASH/lsmem" ] && source "$HOMEBREW_BASH/lsmem"
[ -e "$HOMEBREW_BASH/lsblk" ] && source "$HOMEBREW_BASH/lsblk"

[ -e "$HOMEBREW_BASH/dmesg" ] && source "$HOMEBREW_BASH/dmesg"

source "$HOME/dotfiles/shell/home.sh"
