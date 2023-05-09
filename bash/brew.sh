#!/usr/bin/bash

#==============================================================================
#
# Setup base taps
#
#==============================================================================
brew tap "homebrew/bundle"
brew tap "homebrew/core"
brew tap "homebrew/linux-fonts"

#==============================================================================
#
# Main Utilities of the OS
#
#==============================================================================
brew install coreutils moreutils findutils gnu-sed
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
brew install curl wget openssh gnupg

brew install wasmer wapm rust

brew install node deno nvm yarn pnpm

brew install docker docker-compose whalebrew

brew install git gh glab tea

brew install tmux neovim htop ranger tree fzf ffmpeg

brew install font-fira-code font-fira-code-nerd-font
