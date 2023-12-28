#!/usr/bin/env bash

case "$(uname --all)" in
  Linux*Debian*)
    source "$HOME/dotfiles/config/bash/home.sh"
    ;;
  Darwin*)
    source "$HOME/dotfiles/config/bash/debian.sh"
    ;;
  *)
    source "$HOME/dotfiles/config/bash/darwin.sh"
    ;;
esac

