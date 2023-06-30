#!/usr/bin/bash

# Setup base taps
echo -e "\n\t# Tapping the Brew\n"
brew tap "homebrew/bundle"
brew tap "homebrew/core"

# Main utilities
echo -e "\n\t# Brewing the Base System\n"
brew install \
	coreutils moreutils \
	findutils diffutils \
	binutils inetutils \
	recutils gnu-sed \
	bash bash-completion@2

if ! fgrep -q "$HOMEBREW/bin/bash" /etc/shells; then
	echo "$HOMEBREW/bin/bash" | sudo tee -a /etc/shells;
	chsh -s "$HOMEBREW/bin/bash";
fi;

# Actual programs I want
echo -e "\n\t# Setting up the System\n"
brew install \
	gcc make \
	wasmer wapm rust \
	node yarn pnpm deno \
	curl wget openssh gnupg \
	docker docker-compose \
	whalebrew \
	git gh \
	tmux neovim htop ranger \
	tree exa fzf \

# Terminal programs
echo -e "\n\t# Setting up terminal tools\n"

rm -rf $HOME/.config/tmux/plugins/tpm
rm -rf $HOME/.config/nvim
rm -rf $HOME/.local/state/nvim
rm -rf $HOME/.local/share/nvim

git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
git clone https://github.com/NvChad/NvChad    ~/.config/nvim --depth 1

tmux source-file $HOME/.config/tmux/tmux.conf
