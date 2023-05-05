#!/usr/bin/bash

# Make sure we are on latest
brew update
brew upgrade
brew cleanup
brew tap "homebrew/bundle"
brew tap "homebrew/core"
brew tap "homebrew/linux-fonts"

# Main Utilities of the OS
brew install coreutils
brew install moreutils
brew install findutils
brew install gnu-sed

# Make sure to use HOMEBREW_PREFIX on install
brew install bash
brew install bash-completion@2
if ! fgrep -q "${HOMEBREW}/bin/bash" /etc/shells; then
  echo "${HOMEBREW}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${HOMEBREW}/bin/bash";
fi;

# Actual programs I want
brew install curl
brew install wget
brew install openssh
brew install gnupg

brew install wasmer
brew install wapm
brew install nvm
brew install dvm
brew install rust

brew install docker
brew install whalebrew

brew install git
brew install gh
brew install glab
brew install tea

brew install tmux
brew install neovim
brew install htop
brew install ffmpeg
brew install ranger
brew install tree
brew install fzf
