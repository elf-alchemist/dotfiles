#!/usr/bin/env bash

# Apple made a mistake
export BASH_SILENCE_DEPRECATION_WARNING=1

source "$HOME/dotfiles/config/bash/home.sh"

# Why Homebrew, why
export PATH="$HOME/.docker/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
