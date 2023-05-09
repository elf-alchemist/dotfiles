#!/usr/bin/bash

#==============================================================================
#
# Setup base taps
#
#==============================================================================

echo -e "\n# Tapping the Brew"
brew tap "homebrew/bundle"
brew tap "homebrew/core"
brew tap "homebrew/linux-fonts"

#==============================================================================
#
# Main Utilities of the OS
#
#==============================================================================

echo -e "\n# Tapping the Brew"
brew install coreutils moreutils findutils gnu-sed binutils
brew install bash bash-completion@2
if ! fgrep -q "${HOMEBREW}/bin/bash" /etc/shells; then
  echo "${HOMEBREW}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${HOMEBREW}/bin/bash";
fi;

#==============================================================================
#
# Actual programs I want
#
#==============================================================================

echo -e "\n# Setting up the System"
brew install curl wget openssh gnupg
brew install gcc make cmake ctags
brew install lua luajit stylua

echo -e "\n# Setting up langs and env"
brew install wasmer wapm rust
brew install node deno nvm yarn pnpm
brew install docker docker-compose whalebrew

echo -e "\n# Setting up Git and other tools"
brew install git gh glab tea
brew install tmux neovim htop ranger lynx tree fzf ffmpeg
brew install font-fira-code font-fira-code-nerd-font

#==============================================================================
#
# Node binaries
#
#==============================================================================

echo -e "\n# Setting Node binaries"
npm  install --global @antfu/ni eslint prettier
yarn global  add      @antfu/ni eslint prettier
pnpm add     --global @antfu/ni eslint prettier

#==============================================================================
#
# Terminal programs
#
#==============================================================================

echo -e "\n# Setting up terminal tools"
rm -rf $XDG_CONFIG_HOME/tmux/plugins/tpm
rm -rf $XDG_CONFIG_HOME/nvim
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
git clone https://github.com/NvChad/NvChad    ~/.config/nvim --depth 1

tmux source-file $XDG_CONFIG_HOME/tmux/tmux.conf
