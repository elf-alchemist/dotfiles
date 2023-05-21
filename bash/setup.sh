#!/usr/bin/bash

#==============================================================================
#
# Setup base taps
#
#==============================================================================

echo -e "\n\t# Tapping the Brew\n"
brew tap "homebrew/bundle"
brew tap "homebrew/core"
brew tap "homebrew/linux-fonts"

#==============================================================================
#
# Main Utilities of the OS
#
#==============================================================================

echo -e "\n\t# Brewing the Base System\n"
brew install \
	coreutils moreutils \
	findutils diffutils \
	binutils elfutils \
	gnu-sed inetutils \
	bash bash-completion@2

if ! fgrep -q "${HOMEBREW}/bin/bash" /etc/shells; then
	echo "${HOMEBREW}/bin/bash" | sudo tee -a /etc/shells;
	chsh -s "${HOMEBREW}/bin/bash";
fi;

#==============================================================================
#
# Actual programs I want
#
#==============================================================================

echo -e "\n\t# Setting up the System\n"
brew install \
	curl wget openssh gnupg \
	glibc gcc \
	make cmake ctags \
	wasmer wapm rust \
	node yarn pnpm deno \
	lua luajit luarocks stylua \
	docker podman whalebrew \
	docker-compose podman-compose \
	git gh glab tea \
	tmux neovim htop ranger lynx \
	tree exa fzf ffmpeg \
	font-fira-code font-fira-code-nerd-font

#==============================================================================
#
# Node binaries
#
#==============================================================================

echo -e "\n\t# Setting Node globals\n"
pnpm add --global @antfu/ni

#==============================================================================
#
# Terminal programs
#
#==============================================================================

echo -e "\n\t# Setting up terminal tools\n"

rm -rf $XDG_CONFIG_HOME/tmux/plugins/tpm
rm -rf $XDG_CONFIG_HOME/nvim
rm -rf $XDG_STATE_HOME/nvim
rm -rf $XDG_DATA_HOME/nvim

git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
git clone https://github.com/NvChad/NvChad    ~/.config/nvim --depth 1

tmux source-file $XDG_CONFIG_HOME/tmux/tmux.conf

