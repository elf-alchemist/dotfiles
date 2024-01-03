#!/usr/bin/env bash

case "$(uname -a)" in
  Linux*Debian*) source "$HOME/dotfiles/bash/debian.bash" ;;
  Darwin*) source "$HOME/dotfiles/bash/darwin.bash" ;;
  *) source "$HOME/dotfiles/bash/home.bash" ;;
esac

