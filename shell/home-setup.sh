
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
