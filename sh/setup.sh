# Setup base taps
echo -e "\n\t# Tapping the Brew\n"
brew tap "homebrew/bundle"
brew tap "homebrew/services"

brew_list="coreutils moreutils findutils diffutils binutils inetutils gnu-sed"
brew_list="${brew_list} bash bash-completion@2 curl wget openssh gnupg"
brew_list="${brew_list} gcc make openjdk node yarn pnpm deno"
brew_list="${brew_list} git tmux neovim htop ranger tree exa fzf"

case "$(uname)" in
Linux*)
    brew_list="${brew_list} elfutils docker docker-compose"
    ;;
Darwin*)
    cask_list="--cask epic-games steam gzdoom iterm2 raycast docker"
    ;;
esac


# Main utilities
echo -e "\n\t# Brewing the system\n"
brew install $brew_list

echo -e "\n\t# Casking the system\n"
brew install $cask_list


if ! fgrep -q "$HOMEBREW/bin/bash" /etc/shells; then
	echo "$HOMEBREW/bin/bash" | sudo tee -a /etc/shells;
	chsh -s "$HOMEBREW/bin/bash";
fi;

# Terminal programs
echo -e "\n\t# Setting up terminal tools\n"

rm -rf $HOME/.config/tmux/plugins/tpm
rm -rf $HOME/.config/nvim
rm -rf $HOME/.local/state/nvim
rm -rf $HOME/.local/share/nvim

git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
git clone https://github.com/NvChad/NvChad    ~/.config/nvim --depth 1

tmux source-file $HOME/.config/tmux/tmux.conf
