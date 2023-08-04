# Setup base taps
echo -e "\n\t# Tapping the Brew\n"
brew tap "homebrew/bundle"
brew tap "homebrew/services"
brew tap "petere/postgresql"
brew tap "mongodb/brew"
brew tap "aws/tap"

# Brewing the formulae
echo -e "\n\t# Brewing the system\n"
brew install        \
  coreutils         \
  moreutils         \
  findutils         \
  diffutils         \
  binutils          \
  inetutils         \
  gawk              \
  gnu-tar           \
  gnu-sed           \
  gnu-which         \
  bash              \
  bash-completion@2 \
  gcc               \
  make              \
  curl              \
  wget              \
  openssh           \
  gnupg             \
  git               \
  git-delta         \
  lazygit           \
  tmux              \
  neovim            \
  emacs             \
  htop              \
  ctop              \
  ranger            \
  broot             \
  fzf               \
  tree              \
  exa               \
  bat               \
  duf               \
  dust              \
  openjdk           \
  gradle            \
  node              \
  yarn              \
  pnpm

if [ "$(uname)" == "Linux" ]; then
  echo -e "\n\t# Brewing the penguin's beer\n"
  brew tap "homebrew/linux-fonts"
  brew install                          \
    elfutils                            \
    atop                                \
    docker                              \
    docker-compose                      \
    homebrew/linux-fonts/font-fira-code \
    homebrew/linux-fonts/font-fira-code-nerd-font
fi

if [ "$(uname)" == "Darwin" ]; then
  echo -e "\n\t# Brewing the cask\n"
  brew tap "homebrew/cask-fonts"
  brew install --cask \
    firefox           \
    iterm2            \
    raycast           \
    docker            \
    jetbrains-toolbox \
    openvpn-connect   \
    protonvpn         \
    steam             \
    epic-games        \
    gzdoom            \
    font-fira-code    \
    font-fira-code-nerd-font
fi

# Setting up bash from homebrew
echo -e "\n\t# Configuring Bash binary\n"
if ! fgrep -q "$HOMEBREW_PREFIX/bin/bash" /etc/shells; then
  echo "$HOMEBREW_PREFIX/bin/bash" | sudo tee -a /etc/shells
  chsh -s "$HOMEBREW_PREFIX/bin/bash"
fi

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
