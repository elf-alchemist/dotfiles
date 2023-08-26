[ -e "$HOMEBREW_BASH/systemctl"   ] && source "$HOMEBREW_BASH/systemctl"
[ -e "$HOMEBREW_BASH/journalctl"  ] && source "$HOMEBREW_BASH/journalctl"
[ -e "$HOMEBREW_BASH/hostnamectl" ] && source "$HOMEBREW_BASH/hostnamectl"

[ -e "$HOMEBREW_BASH/lscpu" ] && source "$HOMEBREW_BASH/lscpu"
[ -e "$HOMEBREW_BASH/lsmem" ] && source "$HOMEBREW_BASH/lsmem"
[ -e "$HOMEBREW_BASH/lsblk" ] && source "$HOMEBREW_BASH/lsblk"

[ -e "$HOMEBREW_BASH/dmesg" ] && source "$HOMEBREW_BASH/dmesg"

source "$HOME/dotfiles/shell/home.sh"
