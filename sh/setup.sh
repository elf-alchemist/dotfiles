# Setup base taps
echo -e "\n\t# Tapping the Brew\n"
brew tap "homebrew/bundle"
brew tap "homebrew/services"
brew tap "petere/postgres"
brew tap "mongodb/brew"
brew tap "aws/brew"

# Brewing the formulae
echo -e "\n\t# Brewing the system\n"
brew install \
  coreutils \
  moreutils \
  findutils \
  diffutils \
  binutils \
  inetutils \
  gnu-tar \
  gnu-sed \
  gcc \
  make \
  curl \
  wget \
  openssh \
  gnupg \
  bash \
  bash-completion@2 \
  git \
  lazygit \
  tmux \
  neovim \
  htop \
  ranger \
  list \
  exa \
  bat \
  fzf \
  openjdk \
  gradle \
  node \
  yarn \
  pnpm \
  deno \

  if [ "$(uname)" == "Linux" ] then
  echo -e "\n\t# Brewing the penguin's beer\n"
  brew tap homebrew/linuxfonts
  brew install \
    elfutils \
    docker \
    docker-compose
fi;

if [ "$(uname)" == "Darwin" ] then
  echo -e "\n\t# Brewing the cask\n"
  brew tap homebrew/cask
  brew tap homebrew/cask-fonts
  brew install --cask \
    firefox \
    iterm2 \
    raycast \
    docker \
    jetbrains-toolbox \
    openvpn-connect \
    protonvpn \
    steam \
    epic-games \
    gzdoom \
fi;

# Setting up bash from homebrew
echo -e "\n\t# Configuring Bash binary\n"
if ! fgrep -q "$HOMEBREW_PREFIX/bin/bash" /etc/shells; then
	echo "$HOMEBREW_PREFIX/bin/bash" | sudo tee -a /etc/shells;
	chsh -s "$HOMEBREW_PREFIX/bin/bash";
fi;

# Terminal programs
echo -e "\n\t# Cleaning up terminal tools\n"
rm -rf $HOME/.config/tmux/plugins/tpm
rm -rf $HOME/.config/nvim
rm -rf $HOME/.local/state/nvim
rm -rf $HOME/.local/share/nvim

echo -e "\n\t# Setting up neovim and tmux config\n"
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
git clone https://github.com/NvChad/NvChad    ~/.config/nvim --depth 1

tmux source-file $HOME/.config/tmux/tmux.conf

