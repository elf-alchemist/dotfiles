# Setup base taps
echo -e "\n\t# Tapping the Brew\n"
brew tap "homebrew/bundle"
brew tap "homebrew/services"
brew tap "petere/postgres"
brew tap "mongodb/brew"
brew tap "aws/brew"

# Setup base formulae
brew_list="coreutils moreutils findutils diffutils binutils inetutils"
brew_list="${brew_list} gnu-sed gnu-tar curl wget openssh gnupg"
brew_list="${brew_list} bash bash-completion@2 gcc make"
brew_list="${brew_list} openjdk gradle node yarn pnpm deno"
brew_list="${brew_list} git lazygit tmux neovim"
brew_list="${brew_list} htop ranger tree exa fzf recutils"

# Why are there formulae exclusive on linux?
# Even worse, the fact that I need docker-desktop on Darwin
case "$(uname)" in
Linux*)
    brew_list="${brew_list} elfutils docker docker-compose"
    ;;
Darwin*)
    cask_list="--cask steam epic-games gzdoom iterm2 raycast docker"
    ;;
esac

# Brewing the formulae
echo -e "\n\t# Brewing the system\n"
brew install $brew_list

# Brewing the casks
if [ "$(uname)" == "Darwin" ] then
	echo -e "\n\t# Casking the system\n"
	brew install $cask_list
fi;

# Setting up bash from homebrew
if ! fgrep -q "$HOMEBREW/bin/bash" /etc/shells; then
	echo "$HOMEBREW/bin/bash" | sudo tee -a /etc/shells;
	chsh -s "$HOMEBREW/bin/bash";
fi;

# Terminal programs
echo -e "\n\t# Cleaning up terminal tools\n"

rm -rf $HOME/.config/tmux/plugins/tpm
rm -rf $HOME/.config/nvim
rm -rf $HOME/.local/state/nvim
rm -rf $HOME/.local/share/nvim

echo -e "\n\t# Cloning neovim and tmux config\n"
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
git clone https://github.com/NvChad/NvChad    ~/.config/nvim --depth 1

tmux source-file $HOME/.config/tmux/tmux.conf

