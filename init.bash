#!/usr/bin/env bash

name="$(uname -a)"

if [[ $name == Linux*Debian* ]]; then
	source "$HOME/dotfiles/bash/debian.bash"
fi

if [[ $name == Darwin* ]]; then
	source "$HOME/dotfiles/bash/darwin.bash"
fi

source "$HOME/dotfiles/bash/home.bash"

