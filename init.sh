#!/usr/bin/env bash

case "$(uname --all)" in
  Linux*Debian*) source "$HOME/dotfiles/bash/home.sh" ;;
  Darwin*) source "$HOME/dotfiles/bash/debian.sh" ;;
  *) source "$HOME/dotfiles/bash/darwin.sh" ;;
esac

