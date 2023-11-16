export BASH_SILENCE_DEPRECATION_WARNING=1
source "$HOME/dotfiles/shell/home.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

export PATH="$HOME/.docker/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
