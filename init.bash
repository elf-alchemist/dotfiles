#!/usr/bin/env bash

name="$(uname -a)"

source "$HOME/dotfiles/bash/home.bash"

if [[ $name == Darwin* ]]; then
	source "$HOME/dotfiles/bash/darwin.bash"
fi

